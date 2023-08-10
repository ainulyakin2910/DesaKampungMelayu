<?php $this->load->view('template/startup2/header');
$this->load->view('template/startup2/menu') ?>

<style>
    .alert.alert-danger p {
        color: unset !important;
        font-size: .85rem;
        margin-bottom: unset;
    }
</style>

<div class="marketing">
    <?php $this->load->view('template/pathway') ?>
    <div class="featurette-divider"></div>

    <div class="container">
        <?php
        if ($this->session->flashdata('success_msg')) {
            echo '<div class="alert alert-success">' . $this->session->flashdata('success_msg') . '</div>';
        }
        ?>
        <div class="row mb-4">
            <div class="col">
                <h3>Selamat Datang : <?= $this->session->userdata('auth_penduduk')->nama_lengkap ?></h3>
                <a href="<?php echo base_url() . 'form/ubah'; ?>" class="btn btn-info">Ubah Data</a>
                <button onclick="document.getElementById('form-logout').submit()" class="btn btn-danger">Logout</button>

                <form method="POST" action="<?= site_url('form/logout') ?>" id="form-logout">
                </form>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo base_url() . 'form'; ?>">Form Pengajuan Surat</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo base_url() . 'form/pengaduan'; ?>">Form Pengaduan Masyarakat</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="<?php echo base_url() . 'form/list'; ?>">List Pengajuan Surat</a>
                    </li>
                </ul>
                <div class="card mb-5">
                    <div class="card-header">
                        <h4 class="mb-0 text-center">List Pengajuan Surat</h4>
                    </div>
                    <div class="card-body">
                        <?php
                        if ($this->session->flashdata('success')) {
                            echo '<div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Success!</strong> ' . $this->session->flashdata('success') . '
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>';
                        }
                        ?>

                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box">
                                    <div class="box">`
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <div class="table-responsive">
                                                <table id="table-list" class="table table-striped" style="font-size:12px;">
                                                    <thead>
                                                        <tr>
                                                            <th style="width:70px;">No</th>
                                                            <th>Nama</th>
                                                            <th>Kategori Surat</th>
                                                            <th>Tanggal Dibuat</th>
                                                            <th>Opsi TTD</th>
                                                            <th>Status</th>
                                                            <th>Pesan Admin</th>
                                                            <th>Aksi</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <?php
                                                        $no = 0;
                                                        foreach ($data->result_array() as $i) :
                                                            $no++;
                                                            $layanan_surat_name = $i['name'];
                                                            $layanan_surat_dibuat = $i['created_at'];
                                                            $status = $i['status'];
                                                        ?>
                                                            <tr>
                                                                <td><?php echo $no; ?></td>
                                                                <td><?php echo $layanan_surat_name; ?></td>
                                                                <td><?= ucwords(str_replace('_', ' ', $i['letter_category'])) ?></td>
                                                                <td><?php echo $layanan_surat_dibuat; ?></td>
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
                                                                    <?php
                                                                    if ($status == 'Menunggu Persetujuan') :
                                                                        echo '<span class="badge alert-info">' . $status . '</span>';
                                                                    elseif ($status == 'Di Setujui') :
                                                                        echo '<span class="badge alert-success">' . $status . '</span>';
                                                                    elseif ($status == 'Di Tolak') :
                                                                        echo '<span class="badge alert-danger">' . $status . '</span>';
                                                                    endif;
                                                                    ?>
                                                                </td>
                                                                <td><?= $i['pesan_admin'] ?></td>
                                                                <td>
                                                                    <?php if ($status == 'Di Setujui') { ?>
                                                                        <a href="<?= base_url() ?>form/downloadsurat?kode=<?= $i['id'] ?>" class="btn btn-success btn-sm">Download PDF</a>
                                                                    <?php } elseif ($status == 'Di Tolak') { ?>
                                                                        -
                                                                    <?php } else { ?>
                                                                        <a href="<?= base_url() ?>form/ubahpengajuan?id=<?= $i['id'] ?>" class="btn btn-info btn-sm">Ubah</a>
                                                                        <a href="<?= base_url() ?>form/hapuspengajuan?id=<?= $i['id'] ?>" class="btn btn-danger btn-sm">Hapus</a>
                                                                    <?php } ?>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <?php
    if ($this->session->flashdata('flashpdf_form_pengajuan')) {
    ?>
        <iframe src="<?= site_url('form/downloadpdf?filename=' . $this->session->flashdata('flashpdf_form_pengajuan')) ?>" frameborder="0" style="display: none;"></iframe>
    <?php
    }
    ?>


    <!-- end feature yo-->
    <!-- FOOTER -->
    <?php $this->load->view('template/startup2/footer') ?>
    <script>
        const isLargerThanMobileScreen = ($(window).width() > 480) ? true : false;

        if (isLargerThanMobileScreen) {
            $(function() {
                $("#table-list").DataTable();
            });
        } else {
            $(function() {
                $("#table-list").DataTable({
                    scrollX: true,
                });
            });
        }
    </script>