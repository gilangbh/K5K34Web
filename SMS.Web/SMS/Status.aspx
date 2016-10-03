<%@ Page Title="Status" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Status.aspx.cs" Inherits="SMS.Web.SMS.Status" %>

<asp:Content ID="ContentPlaceHolderAdditionalSendPageHead" ContentPlaceHolderID="ContentPlaceHolderAdditionalPageHead" runat="server">
    <meta http-equiv="Refresh" content="5" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top: 20px">
        <h1 class="text-center">Status</h1>
        <hr />
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="col-lg-12">
            <asp:ListView runat="server" ID="ListViewSentSMS">
                <LayoutTemplate>
                    <table class="table">
                        <thead class="thead-default">
                            <tr>
                                <th>Nomor</th>
                                <th>Waktu Kirim</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr runat="server" id="ItemPlaceHolder"></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
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
                </EmptyDataTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
