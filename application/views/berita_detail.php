<?php $this->load->view('template/startup2/header');
$this->load->view('template/startup2/menu') ?>
<div class="marketing">
    <?php $this->load->view('template/pathway') ?>
    <div class="featurette-divider"></div>
    <div class="container">

        <div class="row">

            <!-- Blog Entries Column -->
            <div class="col-md-8">

                <h1 class="p-title"><?php echo $title; ?></h1>

                <!-- Author -->
                <p class="lead">
                    by
                    <i class="bi bi-person"></i> <?php echo $author; ?>
                </p>

                <hr>
                <div class="meta">
                    <div class="date"><i class="bi bi-calendar-week"></i> <?php echo $tanggal; ?></div>
                    <div class="tags">
                        <i class="bi bi-tag"></i> <a href=""><?php echo $kategori; ?></a>
                    </div>
                </div>
                <hr>

                <!-- Preview Image -->
                <img class="img-fluid rounded" src="<?php echo base_url() . 'assets/images/' . $image ?>" alt="900x300">

                <hr>

                <?php echo $blog; ?>

                <!-- koemtar dulu bosq -->
                <!-- <ul class="nav nav-tabs blogpost-tab-wrap" style="margin-bottom: 10px; " role="tablist">
                    <li class="nav-item blogpost-nav-tab">
                        <a class="nav-link active" data-toggle="tab" href="#comments" role="tab">Komentar</a>
                    </li>
                    <li class="nav-item blogpost-nav-tab">
                        <a class="nav-link" data-toggle="tab" href="#write-comment" role="tab">Tinggalkan Komentar</a>
                    </li>
                </ul> -->
                <!-- <div class="clearfix"></div> -->
                <!-- <?php echo $this->session->flashdata('msg'); ?> -->
                <!-- <div class="blogpost-tabs">
                    <div class="tab-content">
                        <div class="tab-pane active" id="comments" role="tabpanel">
                            <?php
                            $colors = array(
                                '#007bff',
                                '#6610f2',
                                '#6f42c1',
                                '#e83e8c',
                                '#dc3545',
                                '#fd7e14',
                                '#ffc107',
                                '#28a745',
                                '#20c997',
                                '#17a2b8',
                            );
                            foreach ($show_komentar->result() as $row) :
                                shuffle($colors);
                            ?>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="blodpost-tab-img" style="background-color:<?php echo reset($colors); ?>;width: 65px;height: 65px;border-radius:50px 50px 50px 50px;">
                                                    <center>
                                                        <h2 style="padding-top:20%;color:#fff;"><?php echo substr($row->nama, 0, 1); ?></h2>
                                                    </center>
                                                </div>
                                            </div>
                                            <div class="col-md-10">
                                                <div class="blogpost-tab-description">
                                                    <h6><?php echo $row->nama; ?></h6>
                                                    <small><em><?php echo date("d M Y H:i", strtotime($row->tanggal)); ?></em></small>
                                                    <p><?php echo $row->isi; ?></p>
                                                </div>
                                                <hr>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <?php
                                $id = $row->beritaid;
                                $id2 = $row->id;
                                $query = $this->db->query("SELECT * FROM tb_komentar WHERE status='1' AND parent='$id2' ORDER BY id ASC");
                                foreach ($query->result() as $res) :
                                    shuffle($colors);
                                ?>
                                    <div class="row">
                                        <div class="col-md-12 offset-md-1">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <div class="blodpost-tab-img" style="background-color:<?php echo reset($colors); ?>;width: 65px;height: 65px;border-radius:50px 50px 50px 50px;">
                                                        <center>
                                                            <h2 style="padding-top:20%;color:#fff;"><?php echo substr($res->nama, 0, 1); ?></h2>
                                                        </center>
                                                    </div>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="blogpost-tab-description">
                                                        <h6><?php echo $res->nama; ?></h6>
                                                        <small><em><?php echo date("d M Y H:i", strtotime($res->tanggal)); ?></em></small>
                                                        <p><?php echo $res->isi; ?></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                            <?php endforeach; ?>
                        </div>
                        <div class="tab-pane" id="write-comment" role="tabpanel">
                            <form action="<?php echo site_url('berita/komentar'); ?>" method="post">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label>Nama</label>
                                            <input type="text" class="form-control" name="nama" placeholder="Nama Lengkap" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" class="form-control" name="email" placeholder="Email" required>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>Komentar Anda</label>
                                            <textarea class="form-control" name="komentar" rows="6" required> </textarea>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <input type="hidden" name="id" value="<?php echo $id; ?>" required>
                                        <button type="submit" class="btn btn-danger">Kirim Komentar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div> -->

            </div>

            <!-- Sidebar Widgets Column -->
            <div class="col-md-4">
                <?php $this->load->view('template/widget') ?>

            </div>

        </div>
    </div>

</div>
<!-- end feature yo-->
<!-- FOOTER -->
<?php $this->load->view('template/startup2/footer') ?>