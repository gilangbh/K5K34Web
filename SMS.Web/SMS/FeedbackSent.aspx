<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FeedbackSent.aspx.cs" Inherits="SMS.Web.SMS.FeedbackSent" %>

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
            <h1 class="text-center">Terima kasih</h1>
            <p class="text-center">Kritik dan saran Anda telah kami terima. Kami sangat menghargai masukan Anda untuk perbaikan aplikasi ini!</p>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12" style="margin-top: 20px;">
            <a href="Send" class="btn btn-primary btn-block"><i class="fa fa-inbox" style="margin-right: 10px;"></i>Kirim SMS lagi</a>
        </div>
    </div>
</asp:Content>
