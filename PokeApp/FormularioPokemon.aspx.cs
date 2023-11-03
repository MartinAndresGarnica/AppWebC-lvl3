using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace PokeApp
{
    public partial class FormularioPokemon : System.Web.UI.Page
    {
        public bool ConfirmaEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            txtID.Enabled = false;
            ConfirmaEliminacion = false;
            try
            {

                //Configuracion inicial de la pantalla
                if (!IsPostBack)
                {
                    ElementoNegocio negocio = new ElementoNegocio();
                    List<Elemento> lista = negocio.listar();

                    ddlTipo.DataSource = lista;
                    ddlTipo.DataValueField = "Id";
                    ddlTipo.DataTextField = "Descripcion";
                    ddlTipo.DataBind();

                    ddlDebilidad.DataSource = lista;
                    ddlDebilidad.DataValueField = "Id";
                    ddlDebilidad.DataTextField = "Descripcion";
                    ddlDebilidad.DataBind();
                }

                //Configuracion de modificacion
                string id = Request.QueryString["Id"] != null ? Request.QueryString["Id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    PokemonNegocio negocio = new PokemonNegocio();
                    List<Pokemon> lista = negocio.listar(id);
                    Pokemon seleccionado = lista[0];

                    //guardo pokemon seleccionado en session
                    Session.Add("pokeSeleccionado", seleccionado);

                    //precargar todos los campos
                    txtID.Text = id;
                    txtNombre.Text = seleccionado.Nombre;
                    txtNumero.Text = seleccionado.Numero.ToString();
                    txtUrlImagen.Text = seleccionado.UrlImagen;
                    txtDescripcion.Text = seleccionado.Descripcion;

                    ddlTipo.SelectedValue = seleccionado.Tipo.Id.ToString();
                    ddlDebilidad.SelectedValue = seleccionado.Debilidad.Id.ToString();
                    txtUrlImagen_TextChanged(sender, e);

                    //Configurar acciones
                    if (!seleccionado.Activo)
                        btnDesactivar.Text = "Reactivar";
                }

            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
                throw;
                //redireccion pantalla de error
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Pokemon nuevo = new Pokemon();
                PokemonNegocio negocio = new PokemonNegocio();

                nuevo.Numero = int.Parse(txtNumero.Text);
                nuevo.Nombre = txtNombre.Text;
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.UrlImagen = txtUrlImagen.Text;

                nuevo.Tipo = new Elemento();
                nuevo.Tipo.Id = int.Parse(ddlTipo.SelectedValue);
                nuevo.Debilidad = new Elemento();
                nuevo.Debilidad.Id = int.Parse(ddlDebilidad.SelectedValue);

                if (Request.QueryString["Id"] != null)
                {
                    nuevo.Id = int.Parse(Request.QueryString["Id"].ToString());
                    negocio.modificarConSP(nuevo);
                }
                else
                    negocio.agregarConSp(nuevo);

                Response.Redirect("PokemonLista.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                throw;
            }
        }
        protected void txtUrlImagen_TextChanged(object sender, EventArgs e)
        {
            imgPokemon.ImageUrl = txtUrlImagen.Text;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmaEliminacion = true;
        }

        protected void btnConfirmaEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkConfirmaEliminacion.Checked)
                {
                    PokemonNegocio negocio = new PokemonNegocio();
                    negocio.eliminar(int.Parse(txtID.Text));
                    Response.Redirect("PokemonLista.aspx");

                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            try
            {
                PokemonNegocio negocio = new PokemonNegocio();
                Pokemon seleccionado = (Pokemon)Session["pokeSeleccionado"];

                negocio.eliminarLogico(seleccionado.Id, !seleccionado.Activo);
                Response.Redirect("PokemonLista.aspx");
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }
    }
}