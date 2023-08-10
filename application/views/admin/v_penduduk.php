<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <?php $this->load->view('admin/v_meta') ?>

  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<?php echo base_url() . 'assets/bootstrap/css/bootstrap.min.css' ?>">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?php echo base_url() . 'assets/font-awesome/css/font-awesome.min.css' ?>">
  <!-- DataTables -->
  <link rel="stylesheet" href="<?php echo base_url() . 'assets/plugins/datatables/dataTables.bootstrap.css' ?>">
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
          Master Data Penduduk
          <small></small>
        </h1>
        <?php $this->load->view('admin/v_bread') ?>

      </section>

      <!-- Main content -->
      <section class="content">
        <div class="row">
          <div class="col-xs-12">
            <div class="box">
              <div class="box">
                <div class="box-header">
                  <a class="btn btn-success btn-flat" data-toggle="modal" data-target="#myModal"><span class="fa fa-user-plus"></span> Add Penduduk</a>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                  <div class="table-responsive">
                    <table id="example1" class="table table-striped" style="font-size:13px;">
                      <thead>
                        <tr>
                          <th>No KTP</th>
                          <th>Nama</th>
                          <th>Tempat Lahir</th>
                          <th>Tanggal Lahir</th>
                          <th>Jenis Kelamin</th>
                          <th>Alamat</th>
                          <th>Agama</th>
                          <th>Status Perkawinan</th>
                          <th>Pekerjaan</th>
                          <th>Kewarganegaraan</th>
                          <th>No HP</th>
                          <th>Foto KTP</th>
                          <th style="text-align:center;">Aksi</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php foreach ($data->result_array() as $i) : ?>
                          <tr>
                            <td><?= $i['nik']; ?></td>
                            <td><?= $i['nama']; ?></td>
                            <td><?= $i['tempat_lahir']; ?></td>
                            <td><?= $i['tanggal_lahir']; ?></td>
                            <td><?= $i['jenis_kelamin']; ?></td>
                            <td><?= $i['alamat']; ?></td>
                            <td><?= $i['agama']; ?></td>
                            <td><?= $i['status']; ?></td>
                            <td><?= $i['pekerjaan']; ?></td>
                            <td><?= $i['kewarganegaraan']; ?></td>
                            <td><?= $i['no_hp']; ?></td>
                            <td>
                              <?php
                              if ($i['foto_ktp']) {
                              ?>
                                <img src="<?= base_url() . 'uploads/' . $i['foto_ktp'] ?>" alt="" style="width: 100px;">
                              <?php } ?>
                            </td>
                            <td style="text-align:right;">
                              <a class="btn" data-toggle="modal" data-target="#ModalEdit<?= $i['id']; ?>"><span class="fa fa-pencil"></span></a>
                              <a class="btn" data-toggle="modal" data-target="#ModalHapus<?= $i['id']; ?>"><span class="fa fa-trash"></span></a>
                            </td>
                          </tr>
                        <?php endforeach; ?>
                      </tbody>
                    </table>
                  </div>
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
    <!-- Control Sid</div>-->
    <!-- ./wrapper -->

    <!--Modal Add Pengguna-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><span class="fa fa-close"></span></span></button>
            <h4 class="modal-title" id="myModalLabel">Add Penduduk</h4>
          </div>
          <form class="form-horizontal" action="<?php echo base_url() . 'admin/penduduk/simpan' ?>" method="post">
            <div class="modal-body">
              <div class="form-group">
                <label class="col-sm-3 control-label">NIK</label>
                <div class="col-sm-8">
                  <input type="text" name="nik" class="form-control" required>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">Nama</label>
                <div class="col-sm-8">
                  <input type="text" name="nama" class="form-control" required>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">Tempat Lahir</label>
                <div class="col-sm-8">
                  <input type="text" name="tempat_lahir" class="form-control" required>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">Tanggal Lahir</label>
                <div class="col-sm-8">
                  <input type="date" name="tanggal_lahir" class="form-control" required>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">Jenis Kelamin</label>
                <div class="col-sm-8">
                  <div class="radio radio-info radio-inline">
                    <input type="radio" id="inlineRadio1" value="L" name="jenis_kelamin" checked>
                    <label for="inlineRadio1">Laki-Laki</label>
                  </div>
                  <div class="radio radio-info radio-inline">
                    <input type="radio" id="inlineRadio2" value="P" name="jenis_kelamin">
                    <label for="inlineRadio2">Perempuan</label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">Alamat</label>
                <div class="col-sm-8">
                  <input type="text" name="alamat" class="form-control" required>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">Agama</label>
                <div class="col-sm-8">
                  <input type="text" name="agama" class="form-control" required>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">Status Perkawinan</label>
                <div class="col-sm-8">
                  <div class="radio radio-info radio-inline">
                    <input type="radio" id="st1" value="BELUM MENIKAH" name="status">
                    <label for="st1">BELUM MENIKAH</label>
                  </div>
                  <div class="radio radio-info radio-inline">
                    <input type="radio" id="st2" value="SUDAH MENIKAH" name="status">
                    <label for="st2">SUDAH MENIKAH</label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">Pekerjaan</label>
                <div class="col-sm-8">
                  <input type="text" name="pekerjaan" class="form-control" required>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">Kewarganegaraan</label>
                <div class="col-sm-8">
                  <input type="text" name="kewarganegaraan" class="form-control" required>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">No HP</label>
                <div class="col-sm-8">
                  <input type="text" name="no_hp" class="form-control" required>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary btn-flat" id="simpan">Simpan</button>
            </div>
          </form>
        </div>
      </div>
    </div>


    <?php foreach ($data->result_array() as $i) : ?>
      <!--Modal Edit Pengguna-->
      <div class="modal fade" id="ModalEdit<?= $i['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><span class="fa fa-close"></span></span></button>
              <h4 class="modal-title" id="myModalLabel">Edit Penduduk</h4>
            </div>
            <form class="form-horizontal" action="<?php echo base_url() . 'admin/penduduk/update' ?>" method="post">
              <input type="hidden" name="id" value="<?= $i['id']; ?>" />
              <div class="modal-body">
                <div class="form-group">
                  <label class="col-sm-3 control-label">NIK</label>
                  <div class="col-sm-8">
                    <input type="text" value="<?= $i['nik']; ?>" name="nik" class="form-control" required>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Nama</label>
                  <div class="col-sm-8">
                    <input type="text" value="<?= $i['nama']; ?>" name="nama" class="form-control" required>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Tempat Lahir</label>
                  <div class="col-sm-8">
                    <input type="text" value="<?= $i['tempat_lahir']; ?>" name="tempat_lahir" class="form-control" required>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Tanggal Lahir</label>
                  <div class="col-sm-8">
                    <input type="date" value="<?= $i['tanggal_lahir']; ?>" name="tanggal_lahir" class="form-control" required>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Jenis Kelamin</label>
                  <div class="col-sm-8">
                    <div class="radio radio-info radio-inline">
                      <input type="radio" id="jk1<?= $i['id']; ?>" value="L" name="jenis_kelamin" <?= $i['jenis_kelamin'] == 'Laki-Laki' ? 'checked' : '' ?>>
                      <label for="jk1<?= $i['id']; ?>">Laki-Laki</label>
                    </div>
                    <div class="radio radio-info radio-inline">
                      <input type="radio" id="jk2<?= $i['id']; ?>" value="P" name="jenis_kelamin" <?= $i['jenis_kelamin'] == 'Perempuan' ? 'checked' : '' ?>>
                      <label for="jk2<?= $i['id']; ?>">Perempuan</label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Alamat</label>
                  <div class="col-sm-8">
                    <input type="text" value="<?= $i['alamat']; ?>" name="alamat" class="form-control" required>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Agama</label>
                  <div class="col-sm-8">
                    <input type="text" value="<?= $i['agama']; ?>" name="agama" class="form-control" required>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Status Perkawinan</label>
                  <div class="col-sm-8">
                    <div class="radio radio-info radio-inline">
                      <input type="radio" id="st1<?= $i['id']; ?>" value="BELUM MENIKAH" name="status" <?= $i['status'] == 'BELUM MENIKAH' ? 'checked' : '' ?>>
                      <label for="st1<?= $i['id']; ?>">BELUM MENIKAH</label>
                    </div>
                    <div class="radio radio-info radio-inline">
                      <input type="radio" id="st2<?= $i['id']; ?>" value="SUDAH MENIKAH" name="status" <?= $i['status'] == 'SUDAH MENIKAH' ? 'checked' : '' ?>>
                      <label for="st2<?= $i['id']; ?>">SUDAH MENIKAH</label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Pekerjaan</label>
                  <div class="col-sm-8">
                    <input type="text" value="<?= $i['pekerjaan']; ?>" name="pekerjaan" class="form-control" required>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Kewarganegaraan</label>
                  <div class="col-sm-8">
                    <input type="text" value="<?= $i['kewarganegaraan']; ?>" name="kewarganegaraan" class="form-control" required>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">No HP</label>
                  <div class="col-sm-8">
                    <input type="text" value="<?= $i['no_hp']; ?>" name="no_hp" class="form-control" required>
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
    <?php endforeach; ?>

    <?php foreach ($data->result_array() as $i) : ?>
      <!--Modal Hapus Pengguna-->
      <div class="modal fade" id="ModalHapus<?= $i['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><span class="fa fa-close"></span></span></button>
              <h4 class="modal-title" id="myModalLabel">Hapus Pengguna</h4>
            </div>
            <form class="form-horizontal" action="<?php echo base_url() . 'admin/penduduk/hapus' ?>" method="post">
              <div class="modal-body">
                <input type="hidden" name="id" value="<?= $i['id']; ?>" />
                <p>Apakah Anda yakin mau menghapus data <b><?= $i['nama']; ?></b> ?</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary btn-flat">Hapus</button>
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
          text: "NIK sudah terdaftar.",
          showHideTransition: 'slide',
          icon: 'error',
          hideAfter: false,
          position: 'bottom-right',
          bgColor: '#FF4859'
        });
      </script>
    <?php elseif ($this->session->flashdata('msg') == 'success') : ?>
      <script type="text/javascript">
        $.toast({
          heading: 'Success',
          text: "Penduduk berhasil disimpan ke database.",
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
          text: "Penduduk berhasil di update",
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
          text: "Pengguna Berhasil dihapus.",
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