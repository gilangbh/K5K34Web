<%@ Page Title="Kirim" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Send.aspx.cs" Inherits="SMS.Web.SMS.Send" %>

<asp:Content ID="ContentPlaceHolderAdditionalSendPageHead" ContentPlaceHolderID="ContentPlaceHolderAdditionalPageHead" runat="server">
    <script src="https://www.google.com/recaptcha/api.js?hl=id"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top:20px">
        <h1 class="text-center">Kirim SMS</h1>
        <hr />
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="md-form">
                        <input type="text" id="TextBoxNomorHP" class="form-control" placeholder="08xxxxxxxxx" runat="server"/>
                        <label for="TextBoxNomorHP" class="">Nomor Handphone Tujuan</label>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="md-form">
                        <a href="Contact" class="btn btn-primary pull-right"><i class="fa fa-users" style="margin-right: 10px;"></i>Buku Telepon</a>
                    </div>
                </div>
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
        </div>
    </div>
</asp:Content>