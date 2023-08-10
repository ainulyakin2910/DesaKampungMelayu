<!DOCTYPE html>
<html>

<head>
  <?php

  use Sabberworm\CSS\Value\Value;

  $this->load->view('admin/v_meta') ?>
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
          Data Layanan Surat
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
                        <th>Foto KTP</th>
                        <th>Nama</th>
                        <th>Kategori Surat</th>
                        <th>No HP</th>
                        <th>Penanda Tangan</th>
                        <th>Opsi Tanda Tangan</th>
                        <th>Tanda Tangan</th>
                        <th>Status</th>
                        <th>File</th>
                        <th>Tanggal & Waktu</th>
                        <th style="text-align: right;">Aksi</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      $no = 0;
                      foreach ($data->result_array() as $i) :
                        $no++;
                        $layanan_surat_id = $i['id'];
                        $layanan_surat_name = $i['name'];
                        $layanan_surat_photo = $i['photo'];
                        $layanan_surat_no_hp = $i['no_hp'];
                        $layanan_surat_penandatangan = $i['penandatangan'];
                        $status = $i['status'];
                        $layanan_surat_created_at = $i['created_at'];
                      ?>
                        <tr>
                          <td><?php echo $no; ?></td>
                          <td>
                            <img src="<?= base_url() . 'uploads/' . $i['photo'] ?>" alt="" style="width: 100px;">
                          </td>
                          <td><?php echo $layanan_surat_name; ?></td>
                          <td><?= ucwords(str_replace('_', ' ', $i['letter_category'])) ?></td>
                          <td><?php echo $layanan_surat_no_hp; ?></td>
                          <td><?php echo $layanan_surat_penandatangan; ?></td>
                          <td>
                            <?php
                            if ($i['opsi_ttd'] == 'asli') :
                              echo '<span class="badge alert-success">' . $i['opsi_ttd'] . '</span>';
                            else :
                              echo '<span class="badge alert-danger">' . $i['opsi_ttd'] . '</span>';
                            endif;
                            ?>
                          </td>
                          <td>
                            <img src="<?= base_url() . 'uploads/' . $i['ttd'] ?>" alt="" style="width: 100px;">
                          </td>
                          <td>
                            <?php
                            if ($status == 'Menunggu Persetujuan') :
                              echo '<span class="badge badge-info">' . $status . '</span>';
                            elseif ($status == 'Di Setujui') :
                              echo '<span class="badge alert-success">' . $status . '</span>';
                            elseif ($status == 'Di Tolak') :
                              echo '<span class="badge alert-danger">' . $status . '</span>';
                            endif;
                            ?>
                          </td>
                          <td>
                            <?php
                            if ($status == 'Di Setujui') :
                              echo '<a href="' . base_url() . 'form/downloadsurat?kode=' . $i['id'] . '" class="btn btn-success btn-sm">Download PDF</a>';
                            else :
                              echo '-';
                            endif;
                            ?>
                          </td>
                          <td><?php echo $layanan_surat_created_at; ?></td>
                          <td style="text-align:right;">
                            <a class="btn" data-toggle="modal" data-target="#ModalLihat<?php echo $layanan_surat_id; ?>"><span class="fa fa-eye"></span></a>
                            <a class="btn" data-toggle="modal" data-target="#ModalUbah<?php echo $layanan_surat_id; ?>"><span class="fa fa-pencil"></span></a>
                            <a class="btn" data-toggle="modal" data-target="#ModalHapus<?php echo $layanan_surat_id; ?>"><span class="fa fa-trash"></span></a>
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

  <?php foreach ($data->result_array() as $i) :
    $layanan_surat_id = $i['id'];
    $layanan_surat_name = $i['name'];
    $layanan_surat_nik = $i['nik'];
    $layanan_surat_pekerjaan = $i['job'];
  ?>
    <!--Modal Lihat Pengguna-->
    <div class="modal fade" id="ModalLihat<?php echo $layanan_surat_id; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><span class="fa fa-close"></span></span></button>
            <h4 class="modal-title" id="myModalLabel">Lihat Layanan Surat</h4>
          </div>
          <div class="modal-body">
            <table class="table">
              <tr>
                <td>NIK</td>
                <td>: <?= $i['nik'] ?></td>
              </tr>
              <tr>
                <td>Nama</td>
                <td>: <?= $i['name'] ?></td>
              </tr>
              <tr>
                <td>Agama</td>
                <td>: <?= $i['religion'] ?></td>
              </tr>
              <tr>
                <td>Jenis Kelamin</td>
                <td>: <?= $i['gender'] ?></td>
              </tr>
              <tr>
                <td>Tempat Lahir</td>
                <td>: <?= $i['pob'] ?></td>
              </tr>
              <tr>
                <td>Tanggal Lahir</td>
                <td>: <?= $i['dob'] ?></td>
              </tr>
              <tr>
                <td>Pekerjaan</td>
                <td>: <?= $i['job'] ?></td>
              </tr>
              <tr>
                <td>Alamat</td>
                <td>: <?= $i['address'] ?></td>
              </tr>
              <tr>
                <td>Digunakan Untuk</td>
                <td>: <?= $i['melengkapi_persyaratan'] ?></td>
              </tr>
              <tr>
                <td>Foto Ktp</td>
                <td>: <img src="<?= base_url() . 'uploads/' . $i['photo'] ?>" alt="" style="width: 100px;"></td>
              </tr>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
  <?php endforeach; ?>

  <?php foreach ($data->result_array() as $i) :
    $layanan_surat_id = $i['id'];
    $layanan_surat_name = $i['name'];
    $layanan_surat_nik = $i['nik'];
    $layanan_surat_pekerjaan = $i['job'];
  ?>
    <!--Modal Ubah Pengguna-->
    <div class="modal fade" id="ModalUbah<?php echo $layanan_surat_id; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><span class="fa fa-close"></span></span></button>
            <h4 class="modal-title" id="myModalLabel">Ubah Layanan Surat</h4>
          </div>
          <form class="form-horizontal" action="<?php echo base_url() . 'admin/layanansurat/ubah_layanansurat' ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="kode" value="<?php echo $layanan_surat_id; ?>" />
            <div class="modal-body px-3">
              <div class="row mb-3">
                <div class="col-lg-3">
                  <div style="text-align: left;">
                    <label for="status">Status</label>
                  </div>
                </div>
                <div class="col-lg-8">
                  <div class="form-group">
                    <select name="status" id="status" class="form-control">
                      <option value="Menunggu Persetujuan" <?= $i['status'] == 'Menunggu Persetujuan' ? 'selected' : '' ?>>Menunggu Persetujuan</option>
                      <option value="Di Setujui" <?= $i['status'] == 'Di Setujui' ? 'selected' : '' ?>>Di Setujui</option>
                      <option value="Di Tolak" <?= $i['status'] == 'Di Tolak' ? 'selected' : '' ?>>Di Tolak</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="row mb-3">
                <div class="col-lg-3">
                  <div style="text-align: left;">
                    <label for="penandatangan">Penandatangan</label>
                  </div>
                </div>
                <div class="col-lg-8">
                  <div class="form-group">
                    <input type="text" class="form-control" id="penandatangan" name="penandatangan" required value="<?= $i['penandatangan'] ?>">
                  </div>
                </div>
              </div>
              <?php if ($i['opsi_ttd'] == 'scan') { ?>
                <div class="row mb-3">
                  <div class="col-lg-3">
                    <div style="text-align: left;">
                      <label for="ttd">Foto Tanda Tangan</label>
                    </div>
                  </div>
                  <div class="col-lg-8">
                    <div class="form-group">
                      <input type="file" class="form-control" id="ttd" name="ttd">
                    </div>
                  </div>
                </div>
              <?php } ?>
              <div class="row mb-3">
                <div class="col-lg-3">
                  <div style="text-align: left;">
                    <label for="pesan_admin">Pesan Admin</label>
                  </div>
                </div>
                <div class="col-lg-8">
                  <div class="form-group">
                    <textarea name="pesan_admin" id="pesan_admin" class="form-control"><?= $i['pesan_admin'] ?></textarea>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary btn-flat" id="simpan">Ubah</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  <?php endforeach; ?>

  <?php foreach ($data->result_array() as $i) :
    $layanan_surat_id = $i['id'];
    $layanan_surat_name = $i['name'];
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