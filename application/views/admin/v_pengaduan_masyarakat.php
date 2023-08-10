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
                    Data Pengaduan Masyarakat
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
                                                <th>Nama</th>
                                                <th>Judul</th>
                                                <th>Isi</th>
                                                <th>Kategori Laporan</th>
                                                <th>Lokasi Kejadian</th>
                                                <th>Tanggal Kejadian</th>
                                                <th>Dikirim Pada</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $no = 0;
                                            foreach ($data->result_array() as $i) :
                                                $no++;
                                                $judul = $i['judul'];
                                                $isi = $i['isi'];
                                                $kategori_laporan = $i['kategori_laporan'];
                                                $lokasi_kejadian = $i['lokasi_kejadian'];
                                                $tanggal_kejadian = $i['tgl_kejadian'];
                                                $created_at = $i['created_at'];

                                            ?>
                                                <tr>
                                                    <td><?php echo $no; ?></td>
                                                    <td><?php echo $i['nama']; ?></td>
                                                    <td><?php echo $judul; ?></td>
                                                    <td><?php echo $isi; ?></td>
                                                    <td><?php echo $kategori_laporan; ?></td>
                                                    <td><?php echo $lokasi_kejadian; ?></td>
                                                    <td><?php echo $tanggal_kejadian; ?></td>
                                                    <td><?php echo $created_at; ?></td>
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

    <?php foreach ($data->result_array() as $i) :
        $layanan_surat_id = $i['id'];
        $layanan_surat_name = $i['name'];
        $layanan_surat_jenissurat = $i['letter_type'];
        $layanan_surat_no_hp = $i['email'];
        $layanan_surat_nik = $i['nik'];
        $layanan_surat_pekerjaan = $i['job'];
    ?>
        <!--Modal Hapus Pengguna-->
        <div class="modal fade" id="ModalHapus<?php echo $layanan_surat_id; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><span class="fa fa-close"></span></span></button>
                        <h4 class="modal-title" id="myModalLabel">Hapus Layanan Surat</h4>
                    </div>
                    <form class="form-horizontal" action="<?php echo base_url() . 'admin/layanansurat/hapus_layanansurat' ?>" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <input type="hidden" name="kode" value="<?php echo $layanan_surat_id; ?>" />
                            <p>Apakah Anda yakin mau menghapus Layanan Surat <b><?php echo $layanan_surat_name; ?></b> ?</p>

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
                text: "Layanan Surat Berhasil dihapus.",
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