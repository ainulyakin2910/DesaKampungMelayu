<!DOCTYPE html>
<html>

<head>
    <?php $this->load->view('admin/v_meta') ?>

    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="<?php echo base_url() . 'assets/bootstrap/css/bootstrap.min.css' ?>">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<?php echo base_url() . 'assets/font-awesome/css/font-awesome.min.css' ?>">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?php echo base_url() . 'assets/dist/css/AdminLTE.min.css' ?>">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
    folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="<?php echo base_url() . 'assets/dist/css/skins/_all-skins.min.css' ?>">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url() . 'assets/plugins/toast/jquery.toast.min.css' ?>" />

</head>

<body class="hold-transition skin-red sidebar-mini fixed skin-red-light">
    <div class="wrapper">

        <?php
        $this->load->view('admin/v_header');
        $this->load->view('admin/v_menu');

        ?>
        <!-- Left side column. contains the logo and sidebar -->
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Pengaturan Layanan Surat
                    <small></small>
                </h1>
                <?php $this->load->view('admin/v_bread') ?>

            </section>

            <?php
            if ($this->session->flashdata('success')) {
                echo '</br>  <div class="alert alert-success alert-dismissible show" role="alert">
                        <strong>Success!</strong> ' . $this->session->flashdata('success') . '
                        </div>';
            }
            ?>

            <?php
            if ($this->session->flashdata('error')) {
                echo '</br>  <div class="alert alert-danger alert-dismissible show" role="alert">
                        <strong>Error!</strong> ' . $this->session->flashdata('error') . '
                        </div>';
            }
            ?>

            <!-- Main content -->
            <section class="content">
                <div class="row">

                    <div class="box">
                        <div class="box-header">
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">

                            <?php
                            $i = $data->row_array();

                            ?>
                            <form class="form-horizontal" action="<?php echo base_url() . 'admin/pengaturanlayanansurat/update' ?>" method="post">
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="form-group">
                                            <label for="nama_penandatangan_surat" class="col-md-4 control-label">Nama Penandatangan Surat</label>

                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="nama_penandatangan_surat" name="nama_penandatangan_surat" value="<?php echo $i['nama_penandatangan_surat']; ?>" placeholder="Nama Penandatangan Surat" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="jabatan_penandatangan_surat" class="col-md-4 control-label">Jabatan Penandatangan Surat</label>

                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="jabatan_penandatangan_surat" name="jabatan_penandatangan_surat" value="<?php echo $i['jabatan_penandatangan_surat']; ?>" placeholder="Nama Penandatangan Surat" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="nomor_nip_penandatangan_surat" class="col-md-4 control-label">Nomor NIP Penandatangan Surat</label>

                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="nomor_nip_penandatangan_surat" name="nomor_nip_penandatangan_surat" value="<?php echo $i['nomor_nip_penandatangan_surat']; ?>" placeholder="Nama Penandatangan Surat" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-4 col-sm-6">
                                                <button type="submit" class="btn btn-primary btn-flat" id="simpan">Update</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>
                <!-- /.box -->
        </div>
        <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <?php $this->load->view('admin/v_footer'); ?>
    <!--Modal Edit-->





    <!-- jQuery 2.2.3 -->
    <script src="<?php echo base_url() . 'assets/plugins/jQuery/jquery-2.2.3.min.js' ?>"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="<?php echo base_url() . 'assets/bootstrap/js/bootstrap.min.js' ?>"></script>
    <!-- DataTables -->
    <script src="<?php echo base_url() . 'assets/plugins/datatables/jquery.dataTables.min.js' ?>"></script>
    <script src="<?php echo base_url() . 'assets/plugins/datatables/dataTables.bootstrap.min.js' ?>"></script>
    <!-- SlimScroll -->
    <script src="<?php echo base_url() . 'assets/plugins/slimScroll/jquery.slimscroll.min.js' ?>"></script>
    <!-- FastClick -->
    <script src="<?php echo base_url() . 'assets/plugins/fastclick/fastclick.js' ?>"></script>
    <!-- AdminLTE App -->
    <script src="<?php echo base_url() . 'assets/dist/js/app.min.js' ?>"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="<?php echo base_url() . 'assets/dist/js/demo.js' ?>"></script>
    <script type="text/javascript" src="<?php echo base_url() . 'assets/plugins/toast/jquery.toast.min.js' ?>"></script>
    <!-- page script -->
    <script>
        $(function() {
            $("#example1").DataTable();
            $('#example2').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "info": true,
                "autoWidth": false
            });
        });
    </script>
    <?php if ($this->session->flashdata('msg') == 'error') : ?>
        <script type="text/javascript">
            $.toast({
                heading: 'Error',
                text: "Password dan Ulangi Password yang Anda masukan tidak sama.",
                showHideTransition: 'slide',
                icon: 'error',
                hideAfter: false,
                position: 'bottom-right',
                bgColor: '#FF6859'
            });
        </script>

    <?php elseif ($this->session->flashdata('msg') == 'success') : ?>
        <script type="text/javascript">
            $.toast({
                heading: 'Success',
                text: "identitas Berhasil disimpan ke database.",
                showHideTransition: 'slide',
                icon: 'success',
                hideAfter: false,
                position: 'bottom-right',
                bgColor: '#7EC857'
            });
        </script>
    <?php elseif ($this->session->flashdata('msg') == 'info') : ?>
        <script type="text/javascript">
            $.toast({
                heading: 'Info',
                text: "identitas berhasil di update",
                showHideTransition: 'slide',
                icon: 'info',
                hideAfter: false,
                position: 'bottom-right',
                bgColor: '#00C9E6'
            });
        </script>
    <?php elseif ($this->session->flashdata('msg') == 'success-hapus') : ?>
        <script type="text/javascript">
            $.toast({
                heading: 'Success',
                text: "identitas Berhasil dihapus.",
                showHideTransition: 'slide',
                icon: 'success',
                hideAfter: false,
                position: 'bottom-right',
                bgColor: '#7EC857'
            });
        </script>
    <?php else : ?>

    <?php endif; ?>
</body>

</html>