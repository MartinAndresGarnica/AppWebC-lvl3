<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PokeApp.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Hola!</h1>
    <p>Llegaste al pokedex, tu lugar Pokemon</p>
    <div class="row row-cols-1 row-cols-md-3 g-4">

        <%--<%foreach (dominio.Pokemon poke in listaPokemon)
            {

        %>
                <div class="col">
                    <div class="card h-100">
                        <img src="<%: poke.UrlImagen %>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%: poke.Nombre %></h5>
                            <p class="card-text"><%:poke.Descripcion  %></p>
                            <a href="DetallePokemon.aspx?id=<%:poke.Id %>&nombre=<%:poke.Nombre %>">Ver detalle</a>
                        </div>
                    </div>
                </div>

        <%  }  %>--%>

        <asp:Repeater ID="Repetidor" runat="server">
           <ItemTemplate>
               <div class="col">
                    <div class="card h-100">
                        <img src="<%# Eval("UrlImagen")%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("Nombre")%></h5>
                            <p class="card-text"><%# Eval("Descripcion")%></p>
                            <a href="DetallePokemon.aspx?id=<%# Eval("Id") %>&nombre=<%# Eval("Nombre")%>">Ver detalle</a>
                            <asp:Button Text="Ejemplo" CssClass=" btn btn-primary" ID="btnEjemplo" runat="server" CommandArgument='<%# Eval("Id")%>' CommandName="PokemonId" OnClick="btnEjemplo_Click"/>
                        </div>
                    </div>
                </div>
           </ItemTemplate>
        </asp:Repeater>

    </div>
</asp:Content>
