﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRM_3.aspx.cs" Inherits="INOLAB_OC.CRM_3" %>


<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title></title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="CSS/EstiloVista.css" />
    <link rel="stylesheet" href="CSS/Encabezado.css" />
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
        $.datepicker.regional['es'] = {
            closeText: 'Cerrar',
            prevText: '< Ant',
            nextText: 'Sig >',
            currentText: 'Hoy',
            monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
            dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
            dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
            dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
            weekHeader: 'Sm',
            dateFormat: 'dd/mm/yy',
            firstDay: 1,
            isRTL: false,
            showMonthAfterYear: false,
            yearSuffix: ''
        };
        $.datepicker.setDefaults($.datepicker.regional['es']);
        $(function () {
            $("#fecha").datepicker();
        });

        $(function () {
            $("#datepicker2").datepicker();
        });
        $.datepicker.regional['es'] = {
            closeText: 'Cerrar',
            prevText: '< Ant',
            nextText: 'Sig >',
            currentText: 'Hoy',
            monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
            dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
            dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
            dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
            weekHeader: 'Sm',
            dateFormat: 'dd/mm/yy',
            firstDay: 1,
            isRTL: false,
            showMonthAfterYear: false,
            yearSuffix: ''
        };
        $.datepicker.setDefaults($.datepicker.regional['es']);
        $(function () {
            $("#fecha2").datepicker();
        });
    </script>

    <style type="text/css">
        .auto-style2 {
            width: 95%;
            max-width: 100%;
            margin: auto;
            height: 75px;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style5 {
            left: 0px;
            top: 0px;
        }
        .auto-style6 {
            height: 18px;
        }
        .auto-style7 {
            height: 17px;
        }
        </style>

    </head>
<body>
    <form id="form1" runat="server">

     <header class="header2">
        <div class="auto-style2">
        <div class="logo" style="height: 70px"><img src="Imagenes/LOGO_Blanco_Lineas.png" class="logo"/></div>
            <asp:Label ID="Label1" runat="server" Text="Usuario: " Font-Bold="True" ForeColor="White"  class="logo" Width="65px" Height="68px" ></asp:Label>
            <asp:Label ID="lbluser" runat="server" Text="usuario" Font-Bold="True" ForeColor="White" class="logo" Height="69px"></asp:Label>
            <asp:Label ID="lbliduser" runat="server" Text="id" Font-Bold="True" ForeColor="White" class="logo" Height="69px" Visible="false" ></asp:Label>
            
            <nav>
                <asp:Button ID="btnPlan" runat="server" Text="Plan de Trabajo" class="boton"  visible="True" OnClick="btnPlan_Click" /> 
                <asp:Button ID="btnInforme_A" runat="server" Text="Estadisticas" class="boton" visible="True"  Target="_blank" OnClick="btnInforme_A_Click" />     
                <asp:Button ID="Button1" runat="server" Text="Cotizaciones" class="boton" OnClick="Button1_Click"  />
            </nav>                

        </div>
        

    </header>
        <section class="contenido2" >           
                <div class="form-style-2 " >
                <div class="form-style-2-heading">Registro de Funnel</div>
                    <table class="auto-style3">
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="Label2" runat="server" Text="Cliente"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:Label ID="Label3" runat="server" Text="Clasificación"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:Label ID="Label4" runat="server" Text="Fecha de Cierre"></asp:Label>
                            </td>
                            <td colspan="2">
                                &nbsp;</td>
                            <td colspan="2">
                                <asp:Label ID="Label6" runat="server" Text="Última Actualización"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:TextBox ID="txtcliente" class="mercado" runat="server" Width="430px"></asp:TextBox>
                            </td>
                            <td colspan="2">
                                <asp:DropDownList ID="ddlClas_save" class="mercado" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True" Width="135px">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>Prospecto</asp:ListItem>
                                    <asp:ListItem>Oportunidad</asp:ListItem>
                                    <asp:ListItem>Lead</asp:ListItem>
                                    <asp:ListItem>Proyecto</asp:ListItem>
                                    <asp:ListItem>Forecast</asp:ListItem>
                                    <asp:ListItem>Orden Compra</asp:ListItem>  
                                    <asp:ListItem>No Relacionado</asp:ListItem>
                                    <asp:ListItem>Perdido</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="datepicker" class="mercado" runat="server"></asp:TextBox>
                                <asp:Label ID="lblresistro" Visible="false" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td colspan="2">
                                &nbsp;</td>
                            <td colspan="2">
                                <asp:TextBox ID="txtf_actualiza" class="mercado" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" class="auto-style7">
                                <asp:Label ID="Label13" runat="server" Text="Contacto"></asp:Label>
                            </td>
                            <td colspan="2" class="auto-style7">
                                <asp:Label ID="Label14" runat="server" Text="Localidad"></asp:Label>
                            </td>
                            <td colspan="2" class="auto-style7">
                                <asp:Label ID="Label15" runat="server" Text="Origen"></asp:Label>
                            </td>
                            <td colspan="2" class="auto-style7">
                                </td>
                            <td colspan="2" class="auto-style7">
                                <asp:Label ID="Label16" runat="server" Text="Tipo de Venta"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" class="auto-style6">
                                <asp:TextBox ID="TXTcONTACTO" class="mercado" runat="server" Width="430px"></asp:TextBox>
                            </td>
                            <td colspan="2" class="auto-style6">
                                <asp:DropDownList ID="ddLocalidad" class="mercado" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True" Width="135px">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>Aguascalientes</asp:ListItem>
                                        <asp:ListItem>Baja California</asp:ListItem>
                                        <asp:ListItem>Baja California Sur</asp:ListItem>
                                        <asp:ListItem>Campeche</asp:ListItem>
                                        <asp:ListItem>Chiapas</asp:ListItem>
                                        <asp:ListItem>Chihuahua</asp:ListItem>
                                        <asp:ListItem>CDMX</asp:ListItem>
                                        <asp:ListItem>Coahuila</asp:ListItem>
                                        <asp:ListItem>Colima</asp:ListItem>
                                        <asp:ListItem>Durango</asp:ListItem>
                                        <asp:ListItem>Guanajuato</asp:ListItem>
                                        <asp:ListItem>Guerrero</asp:ListItem>
                                        <asp:ListItem>Hidalgo</asp:ListItem>
                                        <asp:ListItem>Jalisco</asp:ListItem>
                                        <asp:ListItem>Estado de México</asp:ListItem>
                                        <asp:ListItem>Michoacán</asp:ListItem>
                                        <asp:ListItem>Morelos</asp:ListItem>
                                        <asp:ListItem>Nayarit</asp:ListItem>
                                        <asp:ListItem>Nuevo León</asp:ListItem>
                                        <asp:ListItem>Oaxaca</asp:ListItem>
                                        <asp:ListItem>Puebla</asp:ListItem>
                                        <asp:ListItem>Querétaro</asp:ListItem>
                                        <asp:ListItem>Quintana Roo</asp:ListItem>
                                        <asp:ListItem>San Luis Potosí</asp:ListItem>
                                        <asp:ListItem>Sinaloa</asp:ListItem>
                                        <asp:ListItem>Sonora</asp:ListItem>
                                        <asp:ListItem>Tabasco</asp:ListItem>
                                        <asp:ListItem>Tamaulipas</asp:ListItem>
                                        <asp:ListItem>Tlaxcala</asp:ListItem>
                                        <asp:ListItem>Veracruz</asp:ListItem>
                                        <asp:ListItem>Yucatán</asp:ListItem>
                                        <asp:ListItem>Zacatecas</asp:ListItem>
                                        <asp:ListItem>Panama</asp:ListItem>
                                        <asp:ListItem>Costa Rica</asp:ListItem>
                                        <asp:ListItem>Guatemala</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td colspan="2" class="auto-style6">
                                <asp:DropDownList ID="ddOrigen" class="mercado" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True" Width="135px">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>Correo</asp:ListItem>
                                    <asp:ListItem>Garantía</asp:ListItem>
                                    <asp:ListItem>Llamada</asp:ListItem>
                                    <asp:ListItem>Marca</asp:ListItem>
                                    <asp:ListItem>Prospección</asp:ListItem>
                                    <asp:ListItem>Renovación</asp:ListItem>
                                    <asp:ListItem>Servicio</asp:ListItem>
                                    <asp:ListItem>WhatsApp</asp:ListItem>                                                                
                                </asp:DropDownList>
                            </td>
                            <td colspan="2" class="auto-style6">
                                &nbsp;</td>
                            <td colspan="2" class="auto-style6">
                                <asp:DropDownList ID="ddTipoVenta" class="mercado" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True" Width="135px">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>Equipo</asp:ListItem>
                                    <asp:ListItem>Servicio</asp:ListItem>
                                    <asp:ListItem>Consumible</asp:ListItem>                                                             
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text="Equipo"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:Label ID="Label8" runat="server" Text="Marca"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:Label ID="Label9" runat="server" Text="Modelo"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:Label ID="Label10" runat="server" Text="Valor USD"></asp:Label>
                            </td>
                            <td colspan="2">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtequipo" class="mercado" runat="server" Width="428px"></asp:TextBox>
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="txtmarca" class="mercado" runat="server" Width="176px"></asp:TextBox>
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtmodelo" class="mercado" runat="server" Width="195px"></asp:TextBox>
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtvalor" class="mercado" runat="server">0</asp:TextBox>
                            </td>
                            <td colspan="2">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="11">
                                <asp:Label ID="Label11" runat="server" Text="Estatus"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="11">
                                <asp:TextBox ID="txtestatus" class="mercado" runat="server" Height="99px" Width="1035px" TextMode="MultiLine"></asp:TextBox>
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar Registro" class="boton"  visible="True" CssClass="auto-style5" OnClick="btnGuardar_Click" /> 
                <asp:Button ID="btnactualiza" runat="server" Text="Actualizar Registro" class="boton"  visible="False" CssClass="auto-style5" OnClick="btnactualiza_Click"/>             
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar Registros" class="boton"  visible="True" CssClass="auto-style5" OnClick="btnLimpiar_Click" /> 
                            </td>
                        </tr>
                        <tr>
                            <td colspan="11">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:DropDownList ID="ddlClasificacion" class="mercado" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>Prospecto</asp:ListItem>
                                    <asp:ListItem>Oportunidad</asp:ListItem>
                                    <asp:ListItem>Lead</asp:ListItem>
                                    <asp:ListItem>Proyecto</asp:ListItem>
                                    <asp:ListItem>Forecast</asp:ListItem>
                                    <asp:ListItem>Orden Compra</asp:ListItem>
                                    <asp:ListItem>No Relacionado</asp:ListItem>
                                    <asp:ListItem>Perdido</asp:ListItem>
                                    <asp:ListItem>Todo</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="Label12" runat="server" Text="Total de Registros:  " Font-Bold="True"></asp:Label>
                                <asp:Label ID="lblcontador" runat="server" Text="0" Font-Bold="True"></asp:Label>
                            </td>
                            <td colspan="9">
                                <asp:Label ID="lblfecha1" runat="server" Text="Filtrar Fecha de Cierre de:   " Font-Bold="True" Visible="false"></asp:Label>
                                &nbsp;
                                <asp:TextBox ID="txtfecha1" runat="server" TextMode="Date" Visible="false">01/01/2023</asp:TextBox>
                                &nbsp;<asp:Label ID="lblfecha2" runat="server" Text="   a   " Font-Bold="True" Visible="false"></asp:Label>
                                &nbsp;<asp:TextBox ID="txtfecha2" runat="server" TextMode="Date" Visible="false">31/12/2090</asp:TextBox>
                                <asp:Button ID="btnfiltrar" runat="server" Text="Filtrar" class="boton"  visible="False" CssClass="auto-style5" OnClick="btnfiltrar_Click" /> 
                            </td>
                        </tr>
                        <tr>
                            <td colspan="11">
                    <asp:GridView ID="GridView1" AutoPostBack="False" runat="server"  AutoGenerateColumns="False" Width="100%" Font-Size="9pt"  DataKeyNames="NoRegistro" CellPadding="4"  ForeColor="#333333" GridLines="None" Font-Bold="False" CssClass="auto-style7" style="margin-top: 0" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>   
                        <asp:CommandField ButtonType="Button"  ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                        </asp:CommandField>
                        <asp:BoundField DataField="NoRegistro"  HeaderText="#Registro" SortExpression="Registro" ItemStyle-Width="10%">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle></asp:BoundField>
                        <asp:BoundField DataField="Clasificacion"  HeaderText="Clasificacion" SortExpression="Clasificacion" ItemStyle-Width="10%">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle></asp:BoundField>
                        <asp:BoundField DataField="Cliente"  HeaderText="Cliente" SortExpression="Cliente" ItemStyle-Width="10%">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle></asp:BoundField>
                         <asp:BoundField DataField="Equipo"  HeaderText="Equipo" SortExpression="Equipo" ItemStyle-Width="10%">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle></asp:BoundField>
                        <asp:BoundField DataField="Marca"  HeaderText="Marca" SortExpression="Marca" ItemStyle-Width="10%">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle></asp:BoundField>
                        <asp:BoundField DataField="Modelo"  HeaderText="Modelo" SortExpression="Modelo" ItemStyle-Width="10%">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle></asp:BoundField>
                        <asp:BoundField DataField="Valor"  HeaderText="Valor USD" SortExpression="valor" ItemStyle-Width="10%">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle></asp:BoundField>
                        <asp:BoundField DataField="FechaCierre"  HeaderText="Fecha Cierre" SortExpression="FechaCierre" ItemStyle-Width="10%" DataFormatString="{0:d}">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle></asp:BoundField>
                        <asp:BoundField DataField="Estatus"  HeaderText="Estatus" SortExpression="Estatus" ItemStyle-Width="30%">
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle></asp:BoundField>
                    </Columns>

                    <EditRowStyle BackColor="#999999" HorizontalAlign="Center" VerticalAlign="Middle"  />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerSettings Position="TopAndBottom" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" Height="60px" ForeColor="#333333"/>
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
               
                            </td>
                        </tr>
                    </table>
            </div>

     <%--       <script>
                $('#<%=cmbEmpresa.ClientID%>').chosen();
            </script>--%>
            </section>
        <%-- </ContentTemplate>
                    </asp:UpdatePanel>--%>
        
        <asp:Label ID="lblrol" runat="server" class="logo" Font-Bold="True" ForeColor="White" Text="rol" Visible="False"></asp:Label>
            <asp:Label ID="lblidarea" runat="server" Text="area" Font-Bold="True" ForeColor="White" Visible="False" class="logo"></asp:Label>
          
        
   <div>
        
    </div>
                                <asp:SqlDataSource ID="comercial" runat="server" ConnectionString="<%$ ConnectionStrings:ComercialCS %>" SelectCommand="SELECT * FROM [Funnel]"></asp:SqlDataSource>
    </form>
 
    
</body>
</html>
