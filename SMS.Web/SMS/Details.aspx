<%@ Page Title="Lacak SMS" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="SMS.Web.SMS.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderAdditionalPageHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top: 20px">
        <h1 class="text-center">Lacak SMS</h1>
        <hr />
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="md-form">
                        <input type="text" id="TextBoxKodeSMS" class="form-control" placeholder="(6 digit kode lacak)" runat="server" />
                        <label for="TextBoxKodeSMS" class="">Kode Lacak</label>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="md-form">
                        <asp:LinkButton runat="server" ID="LinkButtonTrackSMS" CssClass="btn btn-primary pull-right" OnClick="LinkButtonTrackSMS_Click"><i class="fa fa-search" style="margin-right: 10px;"></i>Lacak</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12" id="DivTrackContent" runat="server">
            <div class="form-group">
                <div class="md-form">
                    <textarea type="text" id="TextAreaMessageContent" class="md-textarea" length="140" runat="server"></textarea>
                    <label for="TextAreaMessageContent">Isi Pesan</label>
                </div>
            </div>
            <div class="form-group">
                <h3>Daftar Penerima SMS</h3>
                <asp:ListView runat="server" ID="ListViewRecipients">
                    <LayoutTemplate>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Nomor</th>
                                    <th>Waktu Kirim</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr id="itemPlaceholder" runat="server"></tr>
                            </tbody>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr id="itemPlaceholder">
                            <td><%# Eval("SendToTrimmed") %></td>
                            <td><%# Eval("RequestTime") %></td>
                            <td>
                                <asp:PlaceHolder runat="server" ID="PlaceholderStatusSuccess" Visible='<%# (string)Eval("Status") == "Sent" %>'>
                                    <span class="label label-success label-mini"><i class="fa fa-check" style="margin-right: 10px"></i>Sukses</span>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="PlaceholderStatusPending" Visible='<%# (string)Eval("Status") == "Pending" %>'>
                                    <span class="label label-success label-info"><i class="fa fa-hourglass" style="margin-right: 10px"></i>Pending</span>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="PlaceholderStatusFailed" Visible='<%# (string)Eval("Status") == "Failed" %>'>
                                    <span class="label label-success label-danger"><i class="fa fa-times" style="margin-right: 10px"></i>Gagal</span>
                                </asp:PlaceHolder>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <p>Tidak ada data</p>
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>
