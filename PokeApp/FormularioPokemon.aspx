<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormularioPokemon.aspx.cs" Inherits="PokeApp.FormularioPokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtId" class="form-label">Id</label>
                <asp:TextBox runat="server" ID="txtID" CssClass="form-control border-dark" />
            </div>
            <div class="mb-3">
                <label for="txtNumero" class="form-label">Numero</label>
                <asp:TextBox runat="server" ID="txtNumero" CssClass="form-control border-dark" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control border-dark" />
            </div>
            <div class="mb-3">
                <label for="txtDescripcion" class="form-label">Descripcion</label>
                <asp:TextBox runat="server" TextMode="MultiLine" ID="txtDescripcion" CssClass="form-control border-dark" />
            </div>
            <div class="mb-3">
                <label for="txtUrlImagen" class="form-label">Url Imagen</label>
                <asp:TextBox runat="server" ID="txtUrlImagen" CssClass="form-control border-dark"/>
            </div>
            <div class="mb-3">
                <label for="ddlTipo" class="form-label">Tipo</label>
                <div class="mb-3">
                    <asp:DropDownList ID="ddlTipo" CssClass="dropdown-toggle form-select border-dark" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="mb-3">
                <label for="ddlDebilidad" class="form-label">Debilidad</label>
                <div class="mb-3">
                    <asp:DropDownList ID="ddlDebilidad" CssClass="dropdown-toggle form-select border-dark" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="mb-3">
                <asp:Button Text="Aceptar" CssClass="btn btn-primary" runat="server" />
                <a href="Default.aspx" class="btn btn-danger">Cancelar</a>
            </div>
        </div>
    </div>
</asp:Content>
