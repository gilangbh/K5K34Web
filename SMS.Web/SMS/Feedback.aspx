<%@ Page Title="Feedback" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="SMS.Web.SMS.Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderAdditionalPageHead" runat="server">
    <style>
        .rating {
            unicode-bidi: bidi-override;
            direction: rtl;
            font-size: 30px;
        }

            .rating span.star {
                font-family: FontAwesome;
                font-weight: normal;
                font-style: normal;
                display: inline-block;
            }

                .rating span.star:hover {
                    cursor: pointer;
                }

                .rating span.star:before {
                    content: "\f006";
                    padding-right: 5px;
                    color: #777;
                }

                .rating span.star:hover:before, .rating span.star:hover ~ span.star:before {
                    content: "\f005";
                    color: #e3cf7a;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top: 20px">
        <h1 class="text-center">Kritik dan Saran</h1>
        <hr />
    </div>
    <div class="row" style="margin-top: 20px;">
        <%--<div class="col-md-12">
            <div class="md-form">
                <span class="rating">
                    <span class="star"></span><span class="star"></span><span class="star"></span><span class="star"></span><span class="star"></span>
                </span>
            </div>
        </div>--%>
        <div class="col-md-12">
            <div class="md-form">
                <textarea type="text" id="TextAreaFeedback" class="md-textarea" runat="server" placeholder="Mohon tuliskan pertanyaan, kritik, dan saran untuk perbaikan aplikasi."></textarea>
                <label for="TextAreaFeedback">Apa yang ingin Anda sampaikan?</label>
            </div>
            <div class="md-form">
                <input type="text" id="TextBoxName" class="form-control" runat="server" />
                <label for="TextBoxName" class="">Nama Anda</label>
            </div>
            <div class="md-form">
                <br />
                <asp:LinkButton runat="server" ID="LinkButtonSendMessage" OnClick="LinkButtonSendMessage_Click">
                    <div class="btn btn-primary btn-block"><i class="fa fa-send" style="margin-right:10px;"></i>Kirim</div>
                </asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>
