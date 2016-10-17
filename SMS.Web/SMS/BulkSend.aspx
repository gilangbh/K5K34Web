<%@ Page Title="Bulk Send" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BulkSend.aspx.cs" Inherits="SMS.Web.SMS.BulkSend" %>

<asp:Content ID="ContentPlaceHolderAdditionalSendPageHead" ContentPlaceHolderID="ContentPlaceHolderAdditionalPageHead" runat="server">
        <script src="https://www.google.com/recaptcha/api.js?hl=id"></script>
    <script>
      function countChar(val) {
          var len = val.value.length;
          $('#charNum').text(len + "/135 total karakter");

          if (len >= 135) {
              $('#charNum').toggleClass("text-danger", true);
              $('[id*=TextAreaMessageContent]').toggleClass("invalid", true);
        } else {
              $('#charNum').toggleClass("text-danger", false);
              $('[id*=TextAreaMessageContent]').toggleClass("invalid", false);
        }
      };
    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top: 20px">
        <h1 class="text-center">Kirim Banyak SMS</h1>
        <h6 runat="server" id="H6ServerStatus" class="text-center" style="font-weight:bold">Server: <asp:Literal runat="server" ID="LiteralServerStatus"></asp:Literal></h6>
        <hr />
    </div>
    <asp:Panel runat="server" ID="PanelError" CssClass="row">
        <blockquote class="blockquote bq-danger">
            <p class="bq-title">Error</p>
            <p>Anda hanya dapat mengirim ke 5 nomor telepon saja. Silakan kirim ke 5 nomor telepon terlebih dahulu, kemudian kirimkan lagi ke 5 nomor berikutnya.</p>
        </blockquote>
    </asp:Panel>
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
                <textarea type="text" id="TextAreaMessageContent" class="md-textarea" length="140" runat="server" onkeyup="countChar(this)"></textarea>
                <label for="TextAreaMessageContent">Isi Pesan</label>
            </div>
            <div class="md-form">
                <h6 id="charNum" style="font-weight:bold;">0/135 total karakter</h6>
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
