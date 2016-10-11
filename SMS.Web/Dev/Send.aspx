<%@ Page Title="Kirim" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Send.aspx.cs" Inherits="SMS.Web.Dev.Send" %>

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
        <h1 class="text-center">Kirim SMS</h1>
        <hr />
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="col-md-12">
            <div class="md-form">
                <input type="text" id="TextBoxSender" class="form-control" placeholder="(Tidak wajib)" runat="server" style="max-width:none;" />
                <label for="TextBoxSender" class="">Nomor Pengirim</label>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="md-form">
                        <input type="text" id="TextBoxNomorHP" class="form-control" placeholder="08xxxxxxxxx" runat="server"  style="max-width:none;" />
                        <label for="TextBoxNomorHP" class="">Nomor Tujuan</label>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="md-form">
                        <a href="Contact" class="btn btn-primary pull-right"><i class="fa fa-users" style="margin-right: 10px;"></i>Buku Telepon</a>
                    </div>
                </div>
            </div>
            <div class="md-form">
                <textarea type="text" id="TextAreaMessageContent" class="md-textarea" length="140" runat="server" onkeyup="countChar(this)"></textarea>
                <label for="TextAreaMessageContent">Isi Pesan</label>
            </div>
            <div class="md-form">
                <h6 id="charNum" style="font-weight: bold;">0/135 total karakter</h6>
            </div>
            <div class="md-form">
                <div class="g-recaptcha" data-sitekey="6LcZ2QcUAAAAAHHYsFdevyqJO673LawLsGyUGvHI"></div>
                <br />
                <asp:LinkButton runat="server" ID="LinkButtonSendMessage" OnClick="LinkButtonSendMessage_Click">
                    <div class="btn btn-primary btn-block"><i class="fa fa-inbox" style="margin-right:10px;"></i>Kirim</div>
                </asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>
