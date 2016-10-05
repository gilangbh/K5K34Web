<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Banyak.aspx.cs" Inherits="SMS.Web.Admin.Banyak" %>

<asp:Content ID="ContentPlaceHolderAdditionalSendPageHead" ContentPlaceHolderID="ContentPlaceHolderAdditionalPageHead" runat="server">
    
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top:20px">
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
                <textarea type="text" id="TextAreaMessageContent" class="md-textarea" length="140" runat="server"></textarea>
                <label for="TextAreaMessageContent">Isi Pesan</label>
            </div>
            <div class="md-form">
                <asp:LinkButton runat="server" ID="LinkButtonSendMessage" OnClick="LinkButtonSendMessage_Click">
                    <div class="btn btn-primary btn-block"><i class="fa fa-inbox" style="margin-right:10px;"></i>Kirim</div>
                </asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>