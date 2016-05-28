using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace controlVacaciones
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        static int idUsuarioActual = 0;
        static int tipoUsuarioActual = 0;

        SqlConnection con = new SqlConnection("Data Source=MARIO\\SQLEXPRESS;Initial Catalog=controlVacaciones;Integrated Security=True");
        // SqlConnection con = new SqlConnection("Data Source=PC\\SQLEXPRESS;Initial Catalog=controlVacaciones;Integrated Security=True");
        //SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=controlVacaciones;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try {
                    llenarFechas();
                    llenarPuestos();
                    llenarJefes();
                }
                catch (Exception exp) {
                    Response.Write("<script>window.alert('No hay datos catálogo' "+" + "+ exp +");</script>");

                }
                

            }

        }

        //MÉTODOS DE CONFIGURACIÓN DEL SISTEMA


        protected void ocultarPaneles(){

            PnlInicioSesion.Visible = false;
            pnlRegistroEmpleados.Visible = false;
            pnlOpciones.Visible = false;
            pnlSoliVacaciones.Visible = false;
            pnlSoliEmpleados.Visible = false;
            pnlMovEmpleados.Visible = false;
            pnlConsultas.Visible = false;
            pnlMenu.Visible = false;
        }

        protected void llenarFechas() {
            String[] meses = { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Setiembre", "Octubre", "Noviembre", "Diciembre" };
            DateTime hoy = DateTime.Now;
            int anio = hoy.Year;
            int mes = hoy.Month;
            int dia = hoy.Day;
            for (int i = anio; i > 1910; i-- )  {
                ddlAnio.Items.Add(i.ToString());
                
            }
            for (int i = 0; i < meses.Count(); i++) {
                ddlMes.Items.Add(meses[i]);
                ddlMes0.Items.Add(meses[i]);
                ddlMes1.Items.Add(meses[i]);
            }
            for (int i = 1; i <= 31; i++) {
                ddlDia.Items.Add(i.ToString());
                ddlDia0.Items.Add(i.ToString());
                ddlDia1.Items.Add(i.ToString());
            }

            //llenar fechas a partir del año actual.
            for (int i = anio; i <= anio + 30; i++)
            {
                ddlAnio0.Items.Add(i.ToString());
                ddlAnio1.Items.Add(i.ToString());
            }


        }

        protected void llenarPuestos() {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;
            cmd.CommandText = "obtenerRegistrosPuestos";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ddlPuestosID.Items.Add( reader.GetInt32(0).ToString() );
                ddlPuestos.Items.Add( reader.GetValue(1).ToString() );
            }
            reader.Close();
            con.Close();
        }

        protected void llenarJefes() {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;
            cmd.CommandText = "obtenerRegistrosJefes";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ddlJefesID.Items.Add( reader.GetInt32(0).ToString() );
                ddlJefes.Items.Add( reader.GetValue(1).ToString() + " " + reader.GetValue(2).ToString() );
            }
            reader.Close();
            con.Close();
        }
    
        protected void llenarSolicitudes(int filtro)
        {
            ddlSolicitudes.Items.Clear();

            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;
            cmd.CommandText = "obtenerSolicitudes";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@IDJefe", idUsuarioActual);
            cmd.Parameters.AddWithValue("@estado", filtro);
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ddlSolicitudes.Items.Add(reader.GetValue(0).ToString());
            }
            reader.Close();
            con.Close();

        }

        protected void limpiarCamposRegistro() {

            txtBxNombre.Text = "";
            String apellido = txtBxApellido.Text = "";
            String email = txtBxEmail.Text = "";
            String cedula = txtBxCedula.Text = "";
            String usuario = txtBxUsuario.Text = "";
            String clave = txtBxClave.Text = "";
            ddlJefesID.SelectedIndex = 0;
            ddlJefes.SelectedIndex = 0;
            ddlPuestosID.SelectedIndex = 0;
            ddlAnio.SelectedIndex = 0;
            ddlMes.SelectedIndex = 0;
            ddlDia.SelectedIndex = 0;
        }

        //FIN DE MÉTODOS DE CONFIGURACIÓN DEL SISTEMA

        protected void bttnIniciarSe_Click(object sender, EventArgs e)
        {
            System.Data.SqlTypes.SqlNullValueException exp;
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;
            cmd.CommandText = "ingresoUsuario";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@usuario", txtBxUserName.Text);
            cmd.Parameters.AddWithValue("@clave", txtBxUserKey.Text);
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                try
                {
                    tipoUsuarioActual = reader.GetInt32(0);
                    idUsuarioActual = reader.GetInt32(1);
                }
                catch (System.Data.SqlTypes.SqlNullValueException ex)
                {
                    exp = ex;
                    tipoUsuarioActual = 0;
                    idUsuarioActual = 0;
                }

            }
            reader.Close();
            con.Close();

            if (tipoUsuarioActual == 0 || idUsuarioActual == 0)
            {
                Response.Write("<script>window.alert('Usuario/clave incorrectas');</script>");
            }
            else {
                ocultarPaneles();
                pnlOpciones.Visible = true;
                pnlMenu.Visible = true;
                imgBttnHome.Visible = true;
                habilitarOpciones(tipoUsuarioActual);
                txtBxUserName.Text = "";
            }
            System.Diagnostics.Debug.WriteLine("AQUIII   " +tipoUsuarioActual);
            System.Diagnostics.Debug.WriteLine("AQUIII_2  " + idUsuarioActual);
        }

        protected void habilitarOpciones(int tipo) {
            switch (tipo) {

                case 1://Admin
                    imgBttnVacaciones.Enabled = false;
                    imgSolicitudes.Enabled = false; 
                    imgBttnMovEmpleados.Enabled = true; 
                    imgBttnConsultas.Enabled = true; 
                    break;

                case 2://Jefe
                    imgBttnVacaciones.Enabled = true;
                    imgSolicitudes.Enabled = true;
                    imgBttnMovEmpleados.Enabled = false;
                    imgBttnConsultas.Enabled = true;

                    break;

                case 3://Empleado
                    imgBttnVacaciones.Enabled = true;
                    imgSolicitudes.Enabled = false;
                    imgBttnMovEmpleados.Enabled = false;
                    imgBttnConsultas.Enabled = false;

                    break;

            }
        }

        protected void bttnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                String nombre = txtBxNombre.Text;
                String apellido = txtBxApellido.Text;
                String email = txtBxEmail.Text;
                String cedula = txtBxCedula.Text;
                String usuario = txtBxUsuario.Text;
                String clave = txtBxClave.Text;
                ddlJefesID.SelectedIndex = ddlJefes.SelectedIndex - 1;//no borrar el -1. , por el place holder el index cambia.
                int jefe = Int32.Parse(ddlJefesID.SelectedValue) - 1;
                System.Diagnostics.Debug.WriteLine("AQUIII   " + jefe);
                if (ddlJefesID.Items.Count == 0 || ddlJefes.Items.Count == 0)
                {
                    jefe = 0;
                }
                ddlPuestosID.SelectedIndex = ddlPuestos.SelectedIndex - 1;//no borrar el -1. , por el place holder el index cambia.
                int puesto = Int32.Parse(ddlPuestosID.SelectedValue);
                if (ddlPuestosID.Items.Count == 0 || ddlPuestos.Items.Count == 0)
                {
                    puesto = 0;
                }
                //String fechaContratacion = ddlAnio.Text + "/" + ddlMes.Text + "/" + ddlDia.Text + " " +DateTime.Now.Hour.ToString() + ":" + DateTime.Now.Minute.ToString() + ":" + DateTime.Now.Second.ToString() ;
                String fechaContratacion = ddlAnio.Text + "/" + ddlMes.Text + "/" + ddlDia.Text;
                DateTime dateFecha = Convert.ToDateTime(fechaContratacion);
                int valorDevuelto = 0;

                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;
                cmd.CommandText = "insertarEmpleados";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;

                cmd.Parameters.AddWithValue("@FK_Jefe", jefe);
                cmd.Parameters.AddWithValue("@FK_Puesto", puesto);
                cmd.Parameters.AddWithValue("@nombreUsuario", usuario);
                cmd.Parameters.AddWithValue("@clave", clave);
                cmd.Parameters.AddWithValue("@cedula", cedula);
                cmd.Parameters.AddWithValue("@nombreCompleto", nombre);
                cmd.Parameters.AddWithValue("@apellidoCompleto", apellido);
                cmd.Parameters.AddWithValue("@fechaContratacion", dateFecha);
                cmd.Parameters.AddWithValue("@email", email);

                con.Open();
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {

                    valorDevuelto = reader.GetInt32(0);

                }
                reader.Close();
                con.Close();

                if (valorDevuelto < 0)
                {
                    Response.Write("<script>window.alert('Por favor vuelva a introducir \n la fecha es incorrecta');</script>");
                }
                else
                {
                    Response.Write("<script>window.alert('Se registro un empleado');</script>");
                }

                limpiarCamposRegistro();
            }
            catch (Exception expt)
            {
                Response.Write("<script>window.alert('Llene los campos en blanco.');</script>");
                Console.WriteLine(expt);
            }

        }

        protected void imgBttnHome_Click(object sender, ImageClickEventArgs e)
        {
            ocultarPaneles();
            pnlOpciones.Visible = true;
            pnlMenu.Visible = true;
        }

        protected void imgBttnVacaciones_Click(object sender, ImageClickEventArgs e)
        {
            ocultarPaneles();
            pnlOpciones.Visible = true;
            pnlSoliVacaciones.Visible = true;
        }

        protected void imgSolicitudes_Click(object sender, ImageClickEventArgs e)
        {
            ocultarPaneles();
            pnlOpciones.Visible = true;
            pnlSoliEmpleados.Visible = true;
            bttnSoliPendientes_Click(sender, e);
        }

        protected void imgBttnMovEmpleados_Click(object sender, ImageClickEventArgs e)
        {
            ocultarPaneles();
            pnlOpciones.Visible = true;
            pnlMovEmpleados.Visible = true;
        }

        protected void imgBttnConsultas_Click(object sender, ImageClickEventArgs e)
        {
            ocultarPaneles();
            pnlOpciones.Visible = true;
            pnlConsultas.Visible = true;
        }

        protected void bttnEnviarSoli_Click(object sender, EventArgs e)
        {
            String fechaInicio = ddlAnio0.Text + "/" + ddlMes0.Text + "/" + ddlDia0.Text;
            DateTime dateFechaInicio = Convert.ToDateTime(fechaInicio);
            String fechaFin = ddlAnio1.Text + "/" + ddlMes1.Text + "/" + ddlDia1.Text;
            DateTime dateFechaFin = Convert.ToDateTime(fechaFin);

            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;
            cmd.CommandText = "insertarSolicitudes";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;

            cmd.Parameters.AddWithValue("@FK_Empleado", idUsuarioActual);
            cmd.Parameters.AddWithValue("@fechaInicio", dateFechaInicio);
            cmd.Parameters.AddWithValue("@fechaFin", dateFechaFin);
            cmd.Parameters.AddWithValue("@descripcion", TextBox3.Text);

            
            con.Open();

            reader = cmd.ExecuteReader();
            int estadoEjecucion = 0;
            while (reader.Read())
            {
                estadoEjecucion = reader.GetInt32(0);

            }
            
            con.Close();

            if (estadoEjecucion < 0) {
                Response.Write("<script>window.alert('Error: Fecha inválida');</script>");
            }
            else {
                Response.Write("<script>window.alert('Solicitud enviada');</script>");
                ddlAnio0.SelectedIndex = 0;
                ddlAnio1.SelectedIndex = 0;
                ddlMes0.SelectedIndex = 0;
                ddlMes1.SelectedIndex = 0;
                ddlDia0.SelectedIndex = 0;
                ddlDia1.SelectedIndex = 0;
                TextBox3.Text = "";
            }

            
        }

        protected void ddlSolicitud_SelectedIndexChanged(object sender, EventArgs e)
        {
            int estado = 0;
            TableRow row = new TableRow();
            TablaSoli.Rows.Add(row);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;
            cmd.CommandText = "obtenerSolicitudValor";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;

            cmd.Parameters.AddWithValue("@IDSolicitud", ddlSolicitudes.SelectedValue);

            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                TableCell cel = new TableCell();
                cel.Text = reader.GetValue(0).ToString();
                row.Cells.Add(cel);

                estado = reader.GetInt32(1); //Estado es int.
                cel = new TableCell();
                switch (estado)
                {
                    case 0:
                        cel.Text = "Pendiente";
                        break;
                    case 1:
                        cel.Text = "Aprobado";
                        break;
                    case 2:
                        cel.Text = "Rechazado";
                        break;
                }
                row.Cells.Add(cel);

                cel = new TableCell();
                cel.Text = reader.GetValue(2).ToString();
                row.Cells.Add(cel);

                cel = new TableCell();
                cel.Text = reader.GetValue(3).ToString();
                row.Cells.Add(cel);

                cel = new TableCell();
                cel.Text = reader.GetValue(4).ToString();
                row.Cells.Add(cel);

                cel = new TableCell();
                cel.Text = reader.GetValue(5).ToString();
                row.Cells.Add(cel);
            }
            reader.Close();
            con.Close();

            if (estado == 0)
            {
                bttnAprobar.Enabled = true;
                bttnRechazar.Enabled = true;
            }
            else
            {
                bttnAprobar.Enabled = false;
                bttnRechazar.Enabled = false;
            }
        }

        protected void bttnAprobar_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "cambiarEstadoSolicitud";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;

            cmd.Parameters.AddWithValue("@IDSolicitud", ddlSolicitudes.SelectedValue);
            cmd.Parameters.AddWithValue("@Estado", "1");

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ddlSolicitud_SelectedIndexChanged(sender, e);
            Response.Write("<script>window.alert('Solicitud aprobada');</script>");
        }

        protected void bttnRechazar_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "cambiarEstadoSolicitud";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;

            cmd.Parameters.AddWithValue("@IDSolicitud", ddlSolicitudes.SelectedValue);
            cmd.Parameters.AddWithValue("@Estado", "2");

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ddlSolicitud_SelectedIndexChanged(sender, e);
            Response.Write("<script>window.alert('Solicitud rechazada');</script>");
        }

        protected void bttnCrearCuenta_Click(object sender, EventArgs e)
        {
            ocultarPaneles();
            pnlRegistroEmpleados.Visible = true;
        }

        protected void bttnSoliPendientes_Click(object sender, EventArgs e)
        {
            Color color1 = System.Drawing.ColorTranslator.FromHtml("#00B98B");
            Color color2 = System.Drawing.ColorTranslator.FromHtml("#EAEAEA");
            bttnSoliPendientes.ForeColor = Color.White;
            bttnSoliPendientes.BackColor = color1;
            bttnSoliAprobadas.ForeColor = color1;
            bttnSoliAprobadas.BackColor = color2;
            bttnSoliRechazadas.ForeColor = color1;
            bttnSoliRechazadas.BackColor = color2;

            llenarSolicitudes(0);
            ddlSolicitud_SelectedIndexChanged(sender, e);
        }

        protected void bttnSoliAprobadas_Click(object sender, EventArgs e)
        {
            Color color1 = System.Drawing.ColorTranslator.FromHtml("#00B98B");
            Color color2 = System.Drawing.ColorTranslator.FromHtml("#EAEAEA");
            bttnSoliPendientes.ForeColor = color1;
            bttnSoliPendientes.BackColor = color2;
            bttnSoliAprobadas.ForeColor = Color.White;
            bttnSoliAprobadas.BackColor = color1;
            bttnSoliRechazadas.ForeColor = color1;
            bttnSoliRechazadas.BackColor = color2;

            llenarSolicitudes(1);
            ddlSolicitud_SelectedIndexChanged(sender, e);
        }

        protected void bttnSoliRechazadas_Click(object sender, EventArgs e)
        {
            Color color1 = System.Drawing.ColorTranslator.FromHtml("#00B98B");
            Color color2 = System.Drawing.ColorTranslator.FromHtml("#EAEAEA");
            bttnSoliPendientes.ForeColor = color1;
            bttnSoliPendientes.BackColor = color2;
            bttnSoliAprobadas.ForeColor = color1;
            bttnSoliAprobadas.BackColor = color2;
            bttnSoliRechazadas.ForeColor = Color.White;
            bttnSoliRechazadas.BackColor = color1;

            llenarSolicitudes(2);
            ddlSolicitud_SelectedIndexChanged(sender, e);
        }

        protected void bttnMostrar_Click(object sender, EventArgs e)
        {
            ddlEmpleadosMovimiento.Visible = true;
            ddlTipoMovimiento.Visible = true;
            txtBxMonto.Visible = true;
            Label8.Visible = true;
            txtBxMotivoAjuste.Visible = true;
            bttnAplicarMovimiento.Visible = true;

            ddlEmpleadosMovimiento.Items.Clear();

            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;
            cmd.CommandText = "obtenerEmpleadosBusqueda";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@nombre", txtBxBuscar.Text);
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ddlEmpleadosMovimiento.Items.Add(reader.GetValue(0).ToString());
            }
            reader.Close();
            con.Close();
        }

        protected void bttnAplicarMovimiento_Click(object sender, EventArgs e)
        {
            int valorDevuelto = 0;
            decimal monto = decimal.Parse(txtBxMonto.Text);
            String motivo = "";
            if (ddlTipoMovimiento.SelectedIndex>2) //Debito
            {
                monto = -monto;
            }
            if (ddlTipoMovimiento.SelectedIndex==1 || ddlTipoMovimiento.SelectedIndex==4) //Ajuste
            {
                motivo = txtBxMotivoAjuste.Text;
            }

            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;
            cmd.CommandText = "insertarMovimientos";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@FK_TipoMovimiento", ddlTipoMovimiento.SelectedIndex + 1);
            cmd.Parameters.AddWithValue("@FK_Admin", idUsuarioActual);
            cmd.Parameters.AddWithValue("@FK_Empleado", ddlEmpleadosMovimiento.SelectedValue);
            cmd.Parameters.AddWithValue("@nuevoSaldo", monto);
            cmd.Parameters.AddWithValue("@motivo", motivo);
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                valorDevuelto = reader.GetInt32(0);
            }
            reader.Close();
            con.Close();

            if (valorDevuelto < 0)
            {
                Response.Write("<script>window.alert('Error: El monto es incorrecto');</script>");
            }
            else
            {
                Response.Write("<script>window.alert('Se agregó el movimiento');</script>");
                ddlEmpleadosMovimiento.SelectedIndex = 0;
                ddlTipoMovimiento.SelectedIndex = 0;
                txtBxMotivoAjuste.Enabled = false;
                txtBxMonto.Text = "";
                txtBxMotivoAjuste.Text = "";
            }
        }

        protected void ddlTipoMovimiento_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTipoMovimiento.SelectedIndex == 1 || ddlTipoMovimiento.SelectedIndex == 4) //Ajuste
            {
                txtBxMotivoAjuste.Enabled = true;
            }
            else
            {
                txtBxMotivoAjuste.Enabled = false;
            }
        }

        

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ocultarPaneles();
            PnlInicioSesion.Visible = true;

        }

        
    }
}