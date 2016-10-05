<%@ Page Title="Sukses" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="SMS.Web.SMS.Success" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderAdditionalPageHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top: 20px;">
        <div class="col-lg-12">
            <center><i class="fa fa-check-circle-o text-success" style="font-size:80px"></i></center>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="text-center">Berhasil!</h1>
            <h3 class="text-center">Kode SMS: <asp:Literal runat="server" ID="LiteralUniqueID"></asp:Literal></h3>
            <p class="text-center">SMS Anda sedang diproses oleh sistem kami. Mohon tunggu beberapa saat hingga SMS anda terkirim.</p>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12" style="margin-top: 20px;">
            <a href="Send" class="btn btn-primary btn-block"><i class="fa fa-inbox" style="margin-right: 10px;"></i>Kirim SMS lagi</a>
        </div>
    </div>
</asp:Content>