<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PokemonLista.aspx.cs" Inherits="PokeApp.PokemonLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <h2>Lista de Pokemons</h2>

    <div class="row g-2 align-items-center mb-3">
        <div class="col-auto">
            <label for="txtFiltro" class="form-label">Filtro</label>
        </div>

        <div class="col-auto">
            <asp:TextBox runat="server" ID="txtFiltro" AutoPostBack="true" CssClass="form-control border-dark" OnTextChanged="txtFiltro_TextChanged" />
        </div>
    </div>
    <div class="col-6 mb-3" style="display:flex; flex-direction:column; justify-content:flex-end">
        <asp:CheckBox Text="Filtro Avanzado"
            CssClass="" ID="chkAvanzado" runat="server"
            AutoPostBack="true"
            OnCheckedChanged="chkAvanzado_CheckedChanged"/>
    </div>

    <% if (FiltroAvanzado)
        { %>
    <div class="row mb-3">
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Campo" runat="server" />
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCampo" AutoPostBack="true" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                    <asp:ListItem Text="Nombre" />
                    <asp:ListItem Text="Tipo" />
                    <asp:ListItem Text="Numero" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="text" runat="server" />
                <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Filtro" runat="server" />
                <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Estado" runat="server" />
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlEstado">
                    <asp:ListItem Text="Todos" />
                    <asp:ListItem Text="Activo" />
                    <asp:ListItem Text="Inactivo" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Button Text="Buscar" ID="btnBuscar" CssClass="btn btn-primary" runat="server" OnClick="btnBuscar_Click" />
            </div>
        </div>
    </div>
   <%} %>





    <asp:GridView ID="dgvPokemons" runat="server" DataKeyNames="Id"
        CssClass="table table-dark" AutoGenerateColumns="false"
        OnSelectedIndexChanged="dgvPokemons_SelectedIndexChanged"
        OnPageIndexChanging="dgvPokemons_PageIndexChanging"
        AllowPaging="true" PageSize="5">
        <Columns>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Numero" DataField="Numero" />
            <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
            <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
            <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" HeaderText="Accion" />
        </Columns>
    </asp:GridView>

    <a href="FormularioPokemon.aspx" class="btn btn-primary">Agregar</a>
</asp:Content>
