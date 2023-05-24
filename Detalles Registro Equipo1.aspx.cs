﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data;

namespace INOLAB_OC
{
    public partial class Detalles_Registro_Equipo1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string valor = Request.QueryString["valor"];
            if (Request.Params["valor"] != null)
            {
                lblID.Text = Request.Params["valor"];
            }
            Consulta();
        }

        SqlConnection con = new SqlConnection(@"Data Source=INOLABSERVER03;Initial Catalog=Browser;Persist Security Info=True;User ID=ventas;Password=V3ntas_17");

        public void Consulta()
        {
            SqlCommand cmd = new SqlCommand("Select *from EquipoOC where IdOC_E=" + lblID.Text, con);
            con.Open();

            SqlDataReader leer;
            leer = cmd.ExecuteReader();
            if (leer.Read())
            {
                txtCliente.Text = Convert.ToString(leer["Cliente"]);
                txtImporte.Text = Convert.ToString(leer["Importe"]);
                txtMoneda.Text = Convert.ToString(leer["Moneda"]);
                txtOC.Text = Convert.ToString(leer["OC"]);
                txtServicio.Text = Convert.ToString(leer["Equipo"]);
                txtFecha_R.Text = Convert.ToString(leer["FechaRecepcion"]);
                txtFecha_OC.Text = Convert.ToString(leer["FechaOC_C"]);
                txtFecha_Creacion.Text = Convert.ToString(leer["FechaCreacion"]);
                txtAsesor.Text = Convert.ToString(leer["Asesor"]);
                txtNota.Text = Convert.ToString(leer["Nota"]);
                adjunto1.Text = Convert.ToString(leer["Adjunto1"]);
                adjunto2.Text = Convert.ToString(leer["Adjunto2"]);
                adjunto3.Text = Convert.ToString(leer["Adjunto3"]);
                adjunto4.Text = Convert.ToString(leer["Adjunto4"]);
                adjunto5.Text = Convert.ToString(leer["Adjunto5"]);

            }

            con.Close();
        }

        protected void adjunto1_Click(object sender, EventArgs e)
        {
            Response.Write("<script> window.open('Adjuntos/" + adjunto1.Text + "','_blank'); </script>");

        }

        protected void adjunto2_Click(object sender, EventArgs e)
        {
            Response.Write("<script> window.open('Adjuntos/" + adjunto2.Text + "','_blank'); </script>");
        }

        protected void adjunto3_Click(object sender, EventArgs e)
        {
            Response.Write("<script> window.open('Adjuntos/" + adjunto3.Text + "','_blank'); </script>");
        }

        protected void adjunto4_Click(object sender, EventArgs e)
        {
            Response.Write("<script> window.open('Adjuntos/" + adjunto4.Text + "','_blank'); </script>");
        }

        protected void adjunto5_Click(object sender, EventArgs e)
        {
            Response.Write("<script> window.open('Adjuntos/" + adjunto5.Text + "','_blank'); </script>");
        }
    }
}