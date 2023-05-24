﻿
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using Microsoft.Reporting.WebForms;
using System.Data;
using System.Configuration;
using System.Net;
using System.Security.Principal;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.IO;


namespace INOLAB_OC
{
    public partial class FirmarFolio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUsuario"] == null)
            {
                Response.Redirect("./Sesion.aspx");
            }
            else
            {
                lbluser.Text = Session["nameUsuario"].ToString();
            }
        }

        SqlConnection con = new SqlConnection(@"Data Source=INOLABSERVER03;Initial Catalog=Browser;Persist Security Info=True;User ID=ventas;Password=V3ntas_17");


        protected void Page_Init(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                firma.Style.Add("display", "block");
                headerid.Style.Add("display", "none");
                sectionreport.Style.Add("display", "none");
                footerid.Style.Add("display", "none");
                string script = "startFirma();";
                ClientScript.RegisterStartupScript(this.GetType(), "Star", script, true);
            }
        }

        [Serializable]
        public sealed class MyReportServerCredentials :
            IReportServerCredentials
        {//Inicializa el Reporteador
            public WindowsIdentity ImpersonationUser
            {
                get
                {
                    // Use the default Windows user.  Credentials will be
                    // provided by the NetworkCredentials property.
                    return null;
                }
            }

            public ICredentials NetworkCredentials
            {
                get
                {
                    /* Read the user information from the Web.config file.  
                     By reading the information on demand instead of 
                     storing it, the credentials will not be stored in 
                     session, reducing the vulnerable surface area to the
                     Web.config file, which can be secured with an ACL.

                     User name */
                    string userName =
                        ConfigurationManager.AppSettings
                            ["MyReportViewerUser"];

                    if (string.IsNullOrEmpty(userName))
                        throw new Exception(
                            "Missing user name from web.config file");

                    // Password
                    string password =
                        ConfigurationManager.AppSettings
                            ["MyReportViewerPassword"];

                    if (string.IsNullOrEmpty(password))
                        throw new Exception(
                            "Missing password from web.config file");

                    // Domain
                    string domain =
                        ConfigurationManager.AppSettings
                            ["MyReportViewerDomain"];

                    return new NetworkCredential(userName, password, domain);
                }
            }

            public bool GetFormsCredentials(out Cookie authCookie,
                        out string userName, out string password,
                        out string authority)
            {
                authCookie = null;
                userName = null;
                password = null;
                authority = null;

                // Not using form credentials
                return false;
            }
        }

        protected void firmarbtn_Click(object sender, EventArgs e)
        {
            //Muestra la pantalla para firmar el documento que le es requerido
            Response.Redirect("VistaPrevia.aspx");
        }

        protected void hidebutton_Click(object sender, EventArgs e)
        {//Ejecuta la acción de almacenar la firma 
            string image = hidValue.Value;
            string nombre = textboxnombre.Text;
            firma.Style.Add("display", "none");
            headerid.Style.Add("display", "block");
            sectionreport.Style.Add("display", "block");
            footerid.Style.Add("display", "flex");
            if (nombre.Length < 1)
            {
                nombre = "N/A";
            }
            if (insertFirma(nombre, image))
            {
                ReportViewer1.ServerReport.Refresh();
            }
        }

        protected void updateFSR(string nombre)
        {//Actualiza el nombre del cliente y la fecha en la que el cliente realiza la firma 
            try
            {
                con.Open();
                SqlCommand comando = new SqlCommand(" UPDATE FSR SET NombreCliente='" + nombre + "', FechaFirmaCliente=" +
                    "CAST('" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "' AS DATETIME) where Folio=" + Session["folio_p"] + " and Id_Ingeniero =" + Session["idUsuario"] + ";", con);
                comando.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
                con.Close();
            }
        }

        protected bool insertFirma(string nombre, string image)
        {//Actualiza la firma actual en el documento y le indica cual es la fffirma actual 
            try
            {
                string[] images = image.Split(',');
                string pattern = @"[^:\s*]\w+\/[\w-+\d.]+(?=[;| ])";
                string mimetype = "";
                string img1 = images[0];
                string img2 = images[1];
                Regex rx = new Regex(pattern);
                Match m = rx.Match(img1);
                if (m.Success)
                    mimetype = m.Value;

                con.Open();
                SqlCommand firma = new SqlCommand("Insert into FirmaImg_ING(ImageName,MimeType,ImageBits)" +
                    " values(@nombre,@mime,@image);" +
                    "SELECT CAST(scope_identity() AS int)", con);
                firma.Parameters.Add("@nombre", SqlDbType.VarChar);
                firma.Parameters.Add("@mime", SqlDbType.VarChar);
                firma.Parameters.Add("@image", SqlDbType.VarBinary);
                firma.Parameters["@nombre"].Value = nombre;
                firma.Parameters["@mime"].Value = mimetype;
                firma.Parameters["@image"].Value = Convert.FromBase64String(img2);
                int c = (int)firma.ExecuteScalar();
                if (c != 0)
                {
                    SqlCommand datofirma = new SqlCommand("update FSR set IDFirmaIng=" + c + " where Folio=" + Session["folio_p"] + ";", con);
                    datofirma.ExecuteNonQuery();
                    con.Close();
                    return true;
                }
                else
                {
                    con.Close();
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error al cargar la información');</script>");
                Console.Write(ex.ToString());
                con.Close();
                return false;
            }
        }

        protected void finalizarbtn_Click(object sender, EventArgs e)
        {//Realiza el update de los datos en FSR y sollicita la creación del PDF para mandarlo por correo electrónico 
            try
            {
                con.Open();
                SqlCommand comprobarfirma = new SqlCommand("select Mail from FSR where Folio = " + Session["folio_p"].ToString() + " and IdFirmaImg is not null;", con);
                SqlDataReader sqldr = comprobarfirma.ExecuteReader();
                if (sqldr.Read())
                {
                    string mail = sqldr.GetValue(0).ToString();
                    con.Close();
                    con.Open();
                    SqlCommand comando = new SqlCommand(" UPDATE F SET F.IdHorasServicio=A.TotalHoras, " +
                        "F.Fin_Servicio=CAST('" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "' AS DATETIME) FROM FSR as F INNER JOIN(" +
                    "select idFolioFSR, idUsuario, SUM(HorasAccion) as TotalHoras from FSRAccion GROUP BY idFolioFSR, idUsuario) A" +
                     " ON A.idFolioFSR = F.Folio and A.idUsuario = F.Id_Ingeniero WHERE F.Folio = @folio and F.Id_Ingeniero = @usuario;", con);
                    comando.Parameters.Add("@folio", SqlDbType.Int);
                    comando.Parameters.Add("@usuario", SqlDbType.Int);
                    comando.Parameters["@folio"].Value = Session["folio_p"];
                    comando.Parameters["@usuario"].Value = Session["idUsuario"];
                    comando.ExecuteNonQuery();
                    con.Close();
                    con.Open();
                    SqlCommand updatestatus = new SqlCommand("UPDATE FSR SET IdStatus = 3 WHERE Folio = " + Session["folio_p"].ToString() + " and IdStatus = 2;", con);
                    updatestatus.ExecuteNonQuery();
                    con.Close();
                    ReportViewer1.ServerReport.Refresh();
                    SendMail(CreatePDF(Session["folio_p"].ToString()), mail);
                    Response.Redirect("ServiciosAsignados.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Falta realizar la firma del reporte');</script>");
                    con.Close();
                    firma.Style.Add("display", "block");
                    headerid.Style.Add("display", "none");
                    sectionreport.Style.Add("display", "none");
                    footerid.Style.Add("display", "none");
                    string script = "startFirma();";
                    ClientScript.RegisterStartupScript(this.GetType(), "Star", script, true);
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
                con.Close();
            }
        }

        private void SendMail(string filepath, string mail)
        {//Envía el correo electrónico con la información del FSR y adjunto el archivo
            try
            {
                string to, bcc, from, subject;
                Console.Write(mail);
                to = "";
                con.Open();
                SqlCommand getemails = new SqlCommand("select * from MailNotification;", con);
                SqlDataReader sqldr = getemails.ExecuteReader();

                if (sqldr.HasRows)
                {
                    List<String> mails = new List<string>();
                    while (sqldr.Read())
                    {
                        mails.Add(sqldr.GetValue(2).ToString());
                    }
                    bcc = String.Join(", ", mails);
                }
                else
                {
                    bcc = "carlosflores@inolab.com";
                }

                con.Close();
                from = "notificaciones@inolab.com";
                subject = "FSR folio " + Session["folio_p"];
                MailMessage message = new MailMessage();
                message.Bcc.Add(bcc);
                message.From = new MailAddress(from);
                message.Body = PopulateBody(Session["folio_p"].ToString(), "cliente");
                message.IsBodyHtml = true;
                message.Subject = subject;

                Attachment attach = new Attachment(filepath);
                message.Attachments.Add(attach);

                SmtpClient client = new SmtpClient();
                client.Port = 1025;
                client.Host = "smtp.inolab.com";
                client.EnableSsl = false;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential("notificaciones@inolab.com", "Notificaciones2021*");
                client.Send(message);
                message.Dispose();
                client.Dispose();
            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
            }
        }

        private string CreatePDF(string fileName)
        {//Realiza la creación del PDF 
         // Variables  
            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;

            byte[] bytes = ReportViewer1.ServerReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

            string filepath = HttpRuntime.AppDomainAppPath + "Docs\\" + fileName + ".pdf";
            if (File.Exists(filepath))
            {
                File.Delete(filepath);
            }
            using (FileStream fs = new FileStream(filepath, FileMode.Create))
            {
                fs.Write(bytes, 0, bytes.Length);
                Console.Write(fs.Name);
                fs.Dispose();
            }
            return filepath;
        }

        private string PopulateBody(string folio, string cliente)
        {//Realiza el replace en HTML para la creación del correo
            string body = string.Empty;

            using (StreamReader reader = new StreamReader(Server.MapPath("./HTML/index2.html")))
            {
                body = reader.ReadToEnd();
                reader.Dispose();
            }

            body = body.Replace("{folio}", folio);
            body = body.Replace("{cliente}", cliente);
            body = body.Replace("{slogan}", "data:image/png;base64," + GetBase64StringForImage(Server.MapPath("./Imagenes/slogan.png")));
           return body;
        }

        protected static string GetBase64StringForImage(string imgPath)
        {//Convierte la imagen en base64
            byte[] imageBytes = System.IO.File.ReadAllBytes(imgPath);
            string base64String = Convert.ToBase64String(imageBytes);
            return base64String;
        }

        protected void firmaing_Click(object sender, EventArgs e)
        {
            //Muestra la pantalla para firmar el documento que le es requerido
            Response.Redirect("VistaPrevia.aspx");
        }
    }
}