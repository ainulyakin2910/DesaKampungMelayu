<!DOCTYPE html>
<html>

<head>
    <?php $this->load->view('admin/v_meta') ?>
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="<?php echo base_url() . 'assets/bootstrap/css/bootstrap.min.css' ?>">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<?php echo base_url() . 'assets/font-awesome/css/font-awesome.min.css' ?>">
    <!-- DataTables -->
    <link rel="stylesheet" href="<?php echo base_url() . 'assets/plugins/datatables/dataTables.bootstrap.css' ?>">

    <!-- Theme style -->
    <link rel="stylesheet" href="<?php echo base_url() . 'assets/dist/css/AdminLTE.min.css' ?>">
    <link rel="stylesheet" href="<?php echo base_url() . 'assets/plugins/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css' ?>">
    <link rel="stylesheet" href="<?php echo base_url() . 'assets/plugins/datetimepicker/css/bootstrap-datetimepicker.min.css' ?>">

    <!-- bootstrap datepicker -->
    <!-- AdminLTE Skins. Choose a skin from the css/skins
  	folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="<?php echo base_url() . 'assets/dist/css/skins/_all-skins.min.css' ?>">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url() . 'assets/plugins/toast/jquery.toast.min.css' ?>" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
</head>

<body class="hold-transition skin-red sidebar-mini fixed skin-red-light">
    <div class="wrapper">
        <!--Header-->
        <?php
        $this->load->view('admin/v_header');
        $this->load->view('admin/v_menu');
        ?>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Data Pengguna Layanan Surat
                    <small></small>
                </h1>
                <!-- <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
          <li class="active">Agenda</li>
      </ol> -->
                <?php
                $this->load->view('admin/v_bread');
                ?>
            </section>

            <!-- Main content -->
            <section class="content">
                <?php
                if ($this->session->flashdata('success')) {
                    echo '<div class="alert alert-success alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <h4><i class="icon fa fa-check"></i> Berhasil!</h4>
                        ' . $this->session->flashdata('success') . '
                        </div>';
                }
                ?>

                <?php
                if ($this->session->flashdata('error')) {
                    echo '<div class="alert alert-danger alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <h4><i class="icon fa fa-ban"></i> Error!</h4>
                            ' . $this->session->flashdata('error') . '
                        </div>';
                }
                ?>

                <div class="row">
                    <div class="col-xs-12">
                        <div class="box">
                            <div class="box">
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example1" class="table table-striped" style="font-size:12px;">
                                        <thead>
                                            <tr>
                                                <th style="width:70px;">No</th>
                                                <th>Nama Lengkap</th>
                                                <th>No KTP</th>
                                                <th style="text-align:center;">Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $no = 0;
                                            foreach ($data->result_array() as $i) :
                                                $no++;
                                                $layanan_surat_id = $i['id'];
                                                $nama_lengkap = $i['nama_lengkap'];
                                                $no_ktp = $i['no_ktp'];
                                            ?>
                                                <tr>
                                                    <td><?php echo $no; ?></td>
                                                    <td><?php echo $nama_lengkap; ?></td>
                                                    <td><?php echo $no_ktp; ?></td>
                                                    <td style="text-align:center;">
                                                      <a class="btn" data-toggle="modal" data-target="#ModalEdit<?= $i['id']; ?>"><span class="fa fa-pencil"></span></a>
                                                    </td>
                                                </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        <?php $this->load->view('admin/v_footer'); ?>

    </div>
    <!-- ./wrapper -->
    <?php foreach ($data->result_array() as $i): ?>
<!--Modal Edit Pengguna-->
<div class="modal fade" id="ModalEdit<?= $i['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><span class="fa fa-close"></span></span></button>
        <h4 class="modal-title" id="myModalLabel">Edit Password User Penduduk</h4>
      </div>
      <form class="form-horizontal" action="<?php echo base_url() . 'admin/penggunalayanansurat/changepassword' ?>" method="post">
        <div class="modal-body">
        <input type="hidden" value="<?= $i['no_ktp'] ?>" name="no_ktp" class="form-control" required>
          <div class="form-group">
            <label class="col-sm-3 control-label">New Password</label>
            <div class="col-sm-8">
              <input type="password" name="new_password" class="form-control" required>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label">New Password Confirmation</label>
            <div class="col-sm-8">
              <input type="password" name="new_password_confirmation" class="form-control" required>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary btn-flat" id="update">Update</button>
        </div>
      </form>
    </div>
  </div>
</div>
<?php endforeach;?>

    <?php foreach ($data->result_array() as $i) :
        $layanan_surat_id = $i['id'];
        $nama_lengkap = $i['nama_lengkap'];
    ?>
        <!--Modal Hapus Pengguna-->
        <div class="modal fade" id="ModalHapus<?php echo $layanan_surat_id; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><span class="fa fa-close"></span></span></button>
                        <h4 class="modal-title" id="myModalLabel">Hapus Pengguna Layanan Surat</h4>
                    </div>
                    <form class="form-horizontal" action="<?php echo base_url() . 'admin/layanansurat/hapus_layanansurat' ?>" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <input type="hidden" name="kode" value="<?php echo $layanan_surat_id; ?>" />
                            <p>Apakah Anda yakin mau menghapus Pengguna Layanan Surat <b><?php echo $nama_lengkap; ?></b> ?</p>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary btn-flat" id="simpan">Hapus</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    <?php endforeach; ?>




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
    <script src="<?php echo base_url() . 'assets/plugins/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js' ?>">
    </script>
    <script src="<?php echo base_url() . 'assets/plugins/datetimepicker/js/moment-with-locales.js' ?>"></script>
    <script src="<?php echo base_url() . 'assets/plugins/datetimepicker/js/bootstrap-datetimepicker.min.js' ?>">
    </script>


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
                bgColor: '#FF4859'
            });
        </script>
    <?php elseif ($this->session->flashdata('msg') == 'success-hapus') : ?>
        <script type="text/javascript">
            $.toast({
                heading: 'Success',
                text: "Pengguna Layanan Surat Berhasil dihapus.",
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