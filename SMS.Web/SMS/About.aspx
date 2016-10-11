<%@ Page Title="About us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SMS.Web.SMS.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderAdditionalPageHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top: 20px">
        <h1 class="text-center">SMS Gratis PRO</h1>
        <hr />
    </div>
    <div class="row" style="margin-top: 20px;">
        <p class="text-center">Developed by Team Azure Pro</p>
        <p class="text-center">Design style from md-bootstrap</p>
        <hr />
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="col-md-12"><a href="Feedback" class="btn btn-success btn-block"><i class="fa fa-star" style="margin-right: 10px;"></i>Kirim pertanyaan, kritik & saran</a></div>
    </div>
    <div class="row" style="margin-top: 20px;">
        <div class="col-md-12">
            <h3>Tanya-Jawab</h3>
            <p>
                1. Berapa biaya kirim SMS dengan aplikasi SMS Gratis PRO?<br />
                Tidak ada biaya kirim SMS, hanya perlu menggunakan koneksi Internet
            <br />
                <br />
                2. Apakah ada jaminan sms saya akan 100% terkirim?<br />
                Aplikasi kami memproses SMS dengan sistem antrian dengan batasan 1000 SMS terkirim per detik, jadi kami tidak berani menjamin 100% tingkat kesuksesan pengiriman.
            <br />
                <br />
                3. Berapa lama sms saya akan terkirim?<br />
                Normalnya, SMS Anda akan terkirim dalam waktu 1 s.d. 5 menit.
            <br />
                <br />
                4. Apakah akan ada info jika sms saya gagal terkirim?<br />
                Ya, silakan masuk ke halaman "Status SMS". Jika SMS gagal terkirim, silakan kirimkan ulang
            <br />
                <br />
                5. Apakah aplikasi ini aman?<br />
                Kami menjamin transaksi antara aplikasi dengan server SMS ter-enkripsi agar SMS yang Anda kirim tidak dapat dibaca oleh hacker
            <br />
                <br />
                6. Apakah aplikasi ini ada iklannya?<br />
                Ya, hingga 50%nya penghasilan dari iklan ini akan disumbangkan ke Yayasan Pendidikan Anak Usia Dini Insan Mulia, sisanya untuk biaya operasional server SMS. Dengan menggunakan aplikasi ini, Anda juga berjasa dalam membantu memajukan pendidikan Indonesia
            </p>
            <br />
            <br />
            <h3>Syarat & Ketentuan</h3>
            <p>
                1. Pengguna SMS Gratis PRO tidak akan menyalahgunakan aplikasi dan/atau server SMS Gratis PRO untuk kegiatan yaitu:<br />
                a. Penipuan<br />
                b. Pemalsuan data<br />
                c. Tindakan intimidasi<br />
                d. Pencurian data<br />
                e. Mama minta pulsa<br />
                f. Hal-hal lainnya yang melanggar hukum dan/atau merugikan suatu pihak atau publik<br />
                <br />

                2. Pihak SMS Gratis PRO tidak bertanggung jawab atas konten SMS yang dikirim oleh pengguna.<br />
                <br />

                3. Jika terbukti ada tindak penyalahgunaan aplikasi dan/atau server SMS Gratis PRO, Pihak SMS Gratis PRO berhak untuk mem-block/ban pengguna
            </p>
        </div>
    </div>
</asp:Content>
