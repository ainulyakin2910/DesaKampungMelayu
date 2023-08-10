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

		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					List Pegawai
					<small></small>
				</h1>
				<?php $this->load->view('admin/v_bread') ?>
			</section>

			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">

							<div class="box">
								<div class="box-header">
									<a class="btn btn-success btn-flat" data-toggle="modal" data-target="#myModal"><span class="fa fa-plus"></span> Add Pegawai</a>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<table id="example1" class="table table-striped" style="font-size:13px;">
										<thead>
											<tr>
												<th>No.</th>
												<th>Photo</th>
												<th>Nama</th>
												<th>Posisi</th>
												<th style="text-align:right;">Aksi</th>
											</tr>
										</thead>
										<tbody>
											<?php
											$no = 0;
											foreach ($pegawai->result_array() as $i) :
												$no++;
												$id = $i['id'];
												$photo = $i['photo'];
												$name = $i['name'];
												$position = $i['position'];

											?>
												<tr>
													<td><?php echo $no; ?></td>
													<td><img src="<?php echo base_url() . 'assets/images/pegawai/' . $photo; ?>" style="width:80px;"></td>
													<td><?php echo $name; ?></td>
													<td><?php echo $position; ?></td>
													<td style="text-align:right;">
														<a class="btn" data-toggle="modal" data-target="#ModalEdit<?php echo $id; ?>"><span class="fa fa-pencil"></span></a>
														<a class="btn" data-toggle="modal" data-target="#ModalHapus<?php echo $id; ?>"><span class="fa fa-trash"></span></a>


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
		</div>
	</div>

	<?php $this->load->view('admin/v_footer'); ?>

	<!--Modal Add Pengguna-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><span class="fa fa-close"></span></span></button>
					<h4 class="modal-title" id="myModalLabel">Add Pegawai</h4>
				</div>
				<form class="form-horizontal" action="<?php echo base_url() . 'admin/pegawai_c/insert' ?>" method="post" enctype="multipart/form-data">
					<div class="modal-body">

						<div class="form-group">
							<label for="inputUserName" class="col-sm-4 control-label">Nama Pegawai</label>
							<div class="col-sm-7">
								<input type="text" name="xnama_pegawai" class="form-control" id="inputUserName" placeholder="Nama Pegawai" required>
							</div>
						</div>
						<div class="form-group">
							<label for="inputUserName" class="col-sm-4 control-label">Posisi</label>
							<div class="col-sm-7">
								<input type="text" name="xposition" class="form-control" id="inputUserName" placeholder="Posisi Pegawai" required>
							</div>
						</div>
						<div class="form-group">
							<label for="inputUserName" class="col-sm-4 control-label">Photo Pegawai</label>
							<div class="col-sm-7">
								<input type="file" name="filefoto" required />
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

	<?php
	$no = 0;
	foreach ($pegawai->result_array() as $i) :
		$no++;
		$id = $i['id'];
		$photo = $i['photo'];
		$name = $i['name'];
		$position = $i['position'];
	?>
		<!--Modal edit Pengguna-->
		<div class="modal fade" id="ModalEdit<?php echo $id; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><span class="fa fa-close"></span></span></button>
						<h4 class="modal-title" id="myModalLabel">Update Pegawai</h4>
					</div>
					<form class="form-horizontal" action="<?php echo base_url() . 'admin/pegawai_c/update' ?>" method="post" enctype="multipart/form-data">
						<div class="modal-body">
							<input type="hidden" name="xcode" class="form-control" id="inputUserName" placeholder="code" required value="<?php echo $id; ?>">
							<div class="form-group">
								<label for="inputUserName" class="col-sm-4 control-label">Nama Pegawai</label>
								<div class="col-sm-7">
									<input type="text" name="xnama_pegawai" class="form-control" id="inputUserName" placeholder="Nama Pegawai" required value="<?php echo $name; ?>">
								</div>
							</div>
							<div class="form-group">
								<label for="inputUserName" class="col-sm-4 control-label">Posisi</label>
								<div class="col-sm-7">
									<input type="text" name="xposition" class="form-control" id="inputUserName" placeholder="Posisi Pegawai" required value="<?php echo $position; ?>">
								</div>
							</div>
							<div class="form-group">
								<label for="inputUserName" class="col-sm-4 control-label">Photo Pegawai</label>
								<div class="col-sm-7">
									<input type="file" name="filefoto" required />
								</div>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary btn-flat" id="simpan">Update</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	<?php endforeach; ?>

	<?php
	$no = 0;
	foreach ($pegawai->result_array() as $i) :
		$no++;
		$id = $i['id'];
		$photo = $i['photo'];
		$name = $i['name'];
		$position = $i['position'];
	?>
		<!--Modal Hapus Pengguna-->
		<div class="modal fade" id="ModalHapus<?php echo $id; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><span class="fa fa-close"></span></span></button>
						<h4 class="modal-title" id="myModalLabel">Hapus
							Pegawai</h4>
					</div>
					<form class="form-horizontal" action="<?php echo base_url() . 'admin/pegawai_c/destroy' ?>" method="post" enctype="multipart/form-data">
						<div class="modal-body">
							<input type="hidden" name="kode" value="<?php echo $id; ?>" />
							<p>Apakah Anda yakin mau menghapus Pegawai
								<b><?php echo $name; ?></b> ?
							</p>

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
</body>

</html>