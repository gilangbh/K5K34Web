<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Banned.aspx.cs" Inherits="SMS.Web.SMS.Banned" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderAdditionalPageHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top: 20px;">
        <div class="col-lg-12">
            <center><i class="fa fa-exclamation-circle text-danger" style="font-size:80px"></i></center>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="text-center">Banned</h1>
            <p class="text-center">Perangkat yang Anda gunakan melanggar syarat dan ketentuan aplikasi kami.</p>
            <p class="text-center">Silakan email ke smsgratispro@gmail.com untuk mendapatkan bantuan.</p>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12" style="margin-top: 20px;">
            <a href="Send.aspx" class="btn btn-primary btn-block"><i class="fa fa-inbox" style="margin-right: 10px;"></i>Kirim SMS lagi</a>
            <asp:LinkButton runat="server" ID="LinkButtonSend" Text="Test" OnClick="LinkButtonSend_Click"></asp:LinkButton>
        </div>
    </div>
</asp:Content>
