<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Bulk.aspx.cs" Inherits="SMS.Web.Dev.Bulk" %>

<asp:Content ID="ContentPlaceHolderAdditionalSendPageHead" ContentPlaceHolderID="ContentPlaceHolderAdditionalPageHead" runat="server">
    <script src="https://www.google.com/recaptcha/api.js?hl=id"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" ID="PanelError" CssClass="row">
        <blockquote class="blockquote bq-danger">
            <p class="bq-title">Error</p>
            <p>Saat ini jumlah SMS yang dapat dikirim dalam satu waktu hanya sampai ke 5 nomor telepon saja. Silakan kirim ke 5 nomor telepon terlebih dahulu, kemudian kirimkan lagi ke 5 nomor berikutnya.</p>
        </blockquote>
    </asp:Panel>
    <div class="row" style="margin-top: 20px">
        <h1 class="text-center">Kirim Banyak SMS</h1>
        <hr />
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="col-md-12">
            <div class="md-form">
                <textarea type="text" id="TextAreaNomorHP" class="md-textarea" runat="server"></textarea>
                <label for="TextAreaNomorHP">Daftar Nomor HP</label>
            </div>
            <div class="md-form">
                <h6>*1 nomor per baris, max 5 nomor handphone</h6>
            </div>
            <div class="md-form">
                <textarea type="text" id="TextAreaMessageContent" class="md-textarea" length="140" runat="server"></textarea>
                <label for="TextAreaMessageContent">Isi Pesan</label>
            </div>
            <div class="md-form">
                <div class="g-recaptcha" data-sitekey="6LcZ2QcUAAAAAHHYsFdevyqJO673LawLsGyUGvHI"></div>
                <br />
                <asp:LinkButton runat="server" ID="LinkButtonSendMessage" OnClick="LinkButtonSendMessage_Click">
                    <div class="btn btn-primary btn-block"><i class="fa fa-inbox" style="margin-right:10px;"></i>Kirim</div>
                </asp:LinkButton>
            </div>
            <div class="md-form">
                <asp:Label runat="server" ID="LabelUserAgent" CssClass="md-form"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
