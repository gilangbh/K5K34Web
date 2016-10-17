<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BulkSent.aspx.cs" Inherits="SMS.Web.SMS.BulkSent" %>

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
            <h3 class="text-center">Kode SMS:
                <code>
                    <asp:Literal runat="server" ID="LiteralUniqueID"></asp:Literal></code></h3>
            <p class="text-center">SMS Anda sedang diproses oleh sistem kami. Mohon tunggu beberapa saat hingga SMS anda terkirim.</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6" style="margin-top: 10px;">
            <a href="Send" class="btn btn-primary btn-block"><i class="fa fa-inbox" style="margin-right: 10px;"></i>Kirim Banyak SMS lagi</a>
        </div>
        <div class="col-md-6" style="margin-top: 10px;"><a href="Feedback" class="btn btn-success btn-block"><i class="fa fa-star" style="margin-right: 10px;"></i>Kirim pertanyaan, kritik & saran</a></div>
    </div>
</asp:Content>