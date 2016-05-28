<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Interfaz.aspx.cs" Inherits="controlVacaciones.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            width: 1339px;
            margin-right: 95px;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="PnlTitulo" runat="server" BackColor="#EAEAEA" Font-Names="Helvetica" Font-Size="Smaller" Height="144px" HorizontalAlign="Left">
            &nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton1" runat="server" Height="105px" ImageUrl="~/Resources/noun_62558_cc.png" Width="96px" OnClick="ImageButton1_Click" />
            &nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="Label1" runat="server" Font-Names="Futura SC T OT Book" Font-Size="XX-Large" Text="Control de vacaciones" Font-Bold="False"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="imgBttnHome" runat="server" Height="52px" ImageUrl="~/Resources/homepage.png" OnClick="imgBttnHome_Click" Width="58px" ToolTip="Inicio" Visible="False" />
            <asp:Button ID="bttnCrearCuenta" runat="server" BackColor="#EAEAEA" BorderColor="#999999" BorderStyle="None" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#00B98B" Height="28px" OnClick="bttnCrearCuenta_Click" Text="Crear cuenta" Width="121px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <br />
            <br />
        </asp:Panel>
        <asp:Panel ID="pnlOpciones" runat="server" BackColor="#002040" Font-Size="Smaller" Height="73px" HorizontalAlign="Center" Visible="False">
            <br />
            <asp:ImageButton ID="imgBttnVacaciones" runat="server" Height="53px" ImageUrl="~/Resources/vacaciones.png" OnClick="imgBttnVacaciones_Click" ToolTip="Vacaciones" Width="55px" />
            &nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="imgSolicitudes" runat="server" Height="53px" ImageUrl="~/Resources/solicitudes.png" OnClick="imgSolicitudes_Click" ToolTip="Solicitudes" Width="65px" />
            &nbsp;
            <asp:ImageButton ID="imgBttnMovEmpleados" runat="server" Height="53px" ImageUrl="~/Resources/movimientos.png" OnClick="imgBttnMovEmpleados_Click" ToolTip="Movimientos" Width="57px" />
            &nbsp;
            <asp:ImageButton ID="imgBttnConsultas" runat="server" Height="53px" ImageUrl="~/Resources/consultas.png" OnClick="imgBttnConsultas_Click" ToolTip="Consultas" Width="55px" />
        </asp:Panel>
        <asp:Panel ID="PnlInicioSesion" runat="server" BackColor="#002040" Font-Names="Futura T OT" Font-Size="Large" ForeColor="White" Height="547px" HorizontalAlign="Center" style="margin-left: 0px" Width="275px">
                <br />
                <br />
                Usuario<br /> <br />
                <asp:TextBox ID="txtBxUserName" runat="server" BackColor="#002040" Font-Names="Futura T OT" Font-Size="Medium" ForeColor="#EAEAFF" Height="18px" Width="172px"></asp:TextBox>
                <br />
                <br />
                Contraseña<br /> <br />
                <asp:TextBox ID="txtBxUserKey" runat="server" BackColor="#002040" Font-Names="Futura T OT" Font-Size="Medium" ForeColor="#EAEAFF" Height="18px" Width="172px" TextMode="Password"></asp:TextBox>
                <br />
                <br />
                <br />
                <asp:Button ID="bttnIniciarSe" runat="server" Text="Iniciar sesión" BackColor="#00B98B" BorderStyle="None" Font-Names="Futura T OT" Font-Size="Medium" ForeColor="White" Height="25px" OnClick="bttnIniciarSe_Click" Width="121px" />
                <br />
                <br />
                <br />
            </asp:Panel>
        <asp:Panel ID="pnlRegistroEmpleados" runat="server" BackColor="#EAEAEA" Height="500px" HorizontalAlign="Center" Visible="False">
            <br />
            &nbsp;
            <asp:Label ID="Label2" runat="server" Font-Names="Futura SC T OT Book" Font-Size="X-Large" Text="Registrar empleados" Font-Bold="False"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="txtBxNombre" runat="server" Font-Names="Futura T OT" placeholder="Nombre completo" Font-Size="Large" Height="27px" Width="220px" ForeColor="#999999" AutoCompleteType="Enabled"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="txtBxApellido" runat="server" Font-Names="Futura T OT" placeholder="Apellido completo" Font-Size="Large" ForeColor="#999999" Height="27px" Width="220px" AutoCompleteType="Enabled"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            &nbsp;&nbsp;
            <asp:TextBox ID="txtBxCedula" runat="server" Font-Names="Futura T OT" placeholder="Cédula" Font-Size="Large" ForeColor="#999999" Height="27px"  Width="220px" AutoCompleteType="Enabled"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="txtBxEmail" runat="server" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#999999" Height="27px" placeholder="Correo electrónico" TextMode="Email" Width="220px" AutoCompleteType="Enabled"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="txtBxUsuario" runat="server" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#999999" Height="27px" placeholder="Usuario" Width="220px" AutoCompleteType="Enabled"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="txtBxClave" runat="server" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#999999" Height="27px" placeholder="Contraseña" Width="220px" TextMode="Password" AutoCompleteType="Enabled"></asp:TextBox>
            &nbsp;&nbsp; 
            <br />
            <br />
            &nbsp;&nbsp;<asp:DropDownList ID="ddlJefes" runat="server" AsyncPostBack="True" DataTextField="Jefe" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#999999" Height="27px" Width="220px">
                <asp:ListItem>Jefe</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlPuestos" runat="server" AsyncPostBack="True" DataTextField="Puesto laboral" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#999999" Height="27px" Width="220px">
                <asp:ListItem>Puesto laboral</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:DropDownList ID="ddlJefesID" runat="server" AsyncPostBack="True" Visible="False">
            </asp:DropDownList>
            <asp:DropDownList ID="ddlPuestosID" runat="server" AsyncPostBack="True" Visible="False">
            </asp:DropDownList>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Names="Futura T OT" Font-Size="Large" Text="Fecha contratación"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:DropDownList ID="ddlDia" runat="server" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#999999" Height="27px" Width="65px">
                <asp:ListItem>Día</asp:ListItem>
            </asp:DropDownList>
            &nbsp;<asp:DropDownList ID="ddlMes" runat="server" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#999999" Height="27px" Width="65px">
                <asp:ListItem>Mes</asp:ListItem>
            </asp:DropDownList>
            &nbsp;<asp:DropDownList ID="ddlAnio" runat="server" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#999999" Height="27px" Width="65px">
                <asp:ListItem>Año</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <br />
            <asp:Button ID="bttnRegistrar" runat="server" BackColor="#00B98B" BorderStyle="None" Font-Names="Futura T OT" Font-Size="Large" ForeColor="White" Height="33px" OnClick="bttnRegistrar_Click" Text="Registrar" Width="175px" />
            <br />
            <br />
        </asp:Panel>
        <asp:Panel ID="pnlSoliVacaciones" runat="server" BackColor="#EAEAEA" Font-Names="Futura T OT" Font-Size="Large" Height="431px" HorizontalAlign="Center" Visible="False">
            <br />
            <asp:Label ID="Label4" runat="server" Font-Names="Futura SC T OT Book" Font-Size="X-Large" Text="Solicitud de vacaciones" Font-Bold="False"></asp:Label>
            <br />
            <br />
            Porfavor llene el formulario para solicitar vacaciones<br />
            <br />
            <br />
            Fecha Inicio:&nbsp;
            <asp:DropDownList ID="ddlDia0" runat="server" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#999999" Height="27px" Width="65px">
                <asp:ListItem>Día</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlMes0" runat="server" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#999999" Height="27px" Width="65px">
                <asp:ListItem>Mes</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlAnio0" runat="server" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#999999" Height="27px" Width="65px">
                <asp:ListItem>Año</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Fecha Fin:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlDia1" runat="server" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#999999" Height="27px" Width="65px">
                <asp:ListItem>Día</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlMes1" runat="server" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#999999" Height="27px" Width="65px">
                <asp:ListItem>Mes</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlAnio1" runat="server" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#999999" Height="27px" Width="65px">
                <asp:ListItem>Año</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Describa el motivo de sus vacaciones<br />
            <br />
            <asp:TextBox ID="TextBox3" runat="server" Height="53px" Width="285px" TextMode="MultiLine" Font-Names="Futura T OT" Font-Size="Medium"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="bttnEnviarSoli" runat="server" BackColor="#00B98B" BorderStyle="None" Font-Names="Futura T OT" Font-Size="Large" ForeColor="White" Height="33px" OnClick="bttnEnviarSoli_Click" Text="Enviar" Width="175px" />
        </asp:Panel>
        <asp:Panel ID="pnlSoliEmpleados" runat="server" BackColor="#EAEAEA" Font-Names="Futura T OT" Font-Size="Large" Height="320px" HorizontalAlign="Center" Visible="False">
            <br />
            <asp:Label ID="Label5" runat="server" Font-Names="Futura SC T OT Book" Font-Size="X-Large" Text="Solicitudes de empleados" Font-Bold="False"></asp:Label>
            <br />
            Consulta de los formularios para vacaciones de empleados<br />
            <asp:Button ID="bttnSoliPendientes" runat="server" BackColor="#EAEAEA" BorderStyle="None" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#00B98B" Height="20px" OnClick="bttnSoliPendientes_Click" Text="Pendientes" Width="120px" />
            &nbsp;<asp:Button ID="bttnSoliAprobadas" runat="server" BackColor="#EAEAEA" BorderStyle="None" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#00B98B" Height="20px" OnClick="bttnSoliAprobadas_Click" Text="Aprobadas" Width="120px" />
            &nbsp;<asp:Button ID="bttnSoliRechazadas" runat="server" BackColor="#EAEAEA" BorderStyle="None" Font-Names="Futura T OT" Font-Size="Large" ForeColor="#00B98B" Height="20px" OnClick="bttnSoliRechazadas_Click" Text="Rechazadas" Width="120px" />
            <br />
            <br />
            <asp:DropDownList ID="ddlSolicitudes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSolicitud_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <asp:Table ID="TablaSoli" runat="server" GridLines="Both" HorizontalAlign="Center">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Empleado</asp:TableCell>
                    <asp:TableCell runat="server">Estado</asp:TableCell>
                    <asp:TableCell runat="server">Fecha solicitud</asp:TableCell>
                    <asp:TableCell runat="server">Fecha inicio</asp:TableCell>
                    <asp:TableCell runat="server">Fecha fin</asp:TableCell>
                    <asp:TableCell runat="server">Motivo</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />
            <asp:Button ID="bttnAprobar" runat="server" BackColor="#00B98B" BorderStyle="None" Font-Names="Futura T OT" Font-Size="Large" ForeColor="White" Height="33px" OnClick="bttnAprobar_Click" Text="Aprobar" Width="100px" />
            &nbsp;<asp:Button ID="bttnRechazar" runat="server" BackColor="#00B98B" BorderStyle="None" Font-Names="Futura T OT" Font-Size="Large" ForeColor="White" Height="33px" OnClick="bttnRechazar_Click" Text="Rechazar" Width="100px" />
            <br />
        </asp:Panel>
        <asp:Panel ID="pnlMovEmpleados" runat="server" BackColor="#EAEAEA" Font-Names="Futura T OT" Font-Size="Large" Height="412px" HorizontalAlign="Center" Visible="False">
            <br />
            <asp:Label ID="Label6" runat="server" Font-Names="Futura SC T OT Book" Font-Size="X-Large" Text="Movimientos para  empleados" Font-Bold="False"></asp:Label>
            <br />
            <br />
            Realice débitos o créditos para los empleados<br /> <br />
            <asp:TextBox ID="txtBxBuscar" placeholder="Buscar" runat="server" Width="200px" Font-Names="Futura T OT" Font-Size="Medium"></asp:TextBox>
            &nbsp;<asp:Button ID="bttnMostrar" runat="server" BackColor="#00B98B" BorderStyle="None" Font-Names="Futura T OT" Font-Size="Large" ForeColor="White" Text="Mostrar" Width="100px" OnClick="bttnMostrar_Click" />
            <br />
            <br />
            <asp:DropDownList ID="ddlEmpleadosMovimiento" runat="server" Visible="False" Font-Names="Futura SC T OT Book" Font-Size="Medium">
            </asp:DropDownList>
            &nbsp;<asp:DropDownList ID="ddlTipoMovimiento" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTipoMovimiento_SelectedIndexChanged" Visible="False" Font-Names="Futura T OT" Font-Size="Medium">
                <asp:ListItem>Bono vacacional</asp:ListItem>
                <asp:ListItem>Ajuste +</asp:ListItem>
                <asp:ListItem>Devolución de débito</asp:ListItem>
                <asp:ListItem>Venta</asp:ListItem>
                <asp:ListItem>Ajuste -</asp:ListItem>
                <asp:ListItem>Devolución de crédito</asp:ListItem>
            </asp:DropDownList>
            &nbsp;<asp:TextBox ID="txtBxMonto" placeholder="Monto" runat="server" Width="200px" Visible="False" Font-Names="Futura T OT" Font-Size="Medium"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Font-Names="Futura T OT" Font-Size="Large" Text="Describa el motivo del ajuste" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtBxMotivoAjuste" runat="server" Enabled="False" Height="53px" TextMode="MultiLine" Visible="False" Width="285px" Font-Names="Futura T OT" Font-Size="Medium"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="bttnAplicarMovimiento" runat="server" BackColor="#00B98B" BorderStyle="None" Font-Names="Futura T OT" Font-Size="Large" ForeColor="White" Height="33px" OnClick="bttnAplicarMovimiento_Click" Text="Aplicar" Visible="False" Width="175px" />
        </asp:Panel>
        <asp:Panel ID="pnlConsultas" runat="server" BackColor="#EAEAEA" Font-Names="Futura T OT" Font-Size="Large" Height="320px" HorizontalAlign="Center" Visible="False">
            <br />
            <asp:Label ID="Label7" runat="server" Font-Names="Futura SC T OT Book" Font-Size="X-Large" Text="Consultas" Font-Bold="False"></asp:Label>
            <br />
            Visualice los diferentes procesos masivos, así como algunas estadísticas<br />
        </asp:Panel>
        <asp:Panel ID="pnlMenu" runat="server" BackColor="#EAEAEA" Height="402px" Visible="False">
        </asp:Panel>
        <asp:Panel ID="pnlPie" runat="server" BackColor="#002040" Font-Names="Futura T OT" Font-Size="Large" ForeColor="White" Height="91px">
            <br />
            &nbsp;
            <asp:ImageButton ID="bttnFaceLink" runat="server" Height="38px" ImageUrl="~/Resources/Facebook_icon.png" PostBackUrl="https://www.facebook.com/QuickDemand/?ref=aymt_homepage_panel" ToolTip="Facebook" Width="42px" />
            <br /> &nbsp;powered by quick demand</asp:Panel>
    </form>
</body>
</html>
