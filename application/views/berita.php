<?php $this->load->view('template/startup2/header');
$this->load->view('template/startup2/menu') ?>
<div class="marketing">
    <?php $this->load->view('template/pathway') ?>
    <div class="featurette-divider"></div>
    <div class="container">

        <div class="row">

            <!-- Blog Entries Column -->
            <div class="col-md-8">
                <h3 class="p-title">BERITA <span style="color:#DC3545;"></span></h3>
                <?php echo $this->session->flashdata('msg'); ?>
                <?php foreach ($data->result() as $row) : ?>
                    <a href="<?php echo site_url('berita/vw-' . $row->slug); ?>">
                        <div class="single-blog-post post-style-4 d-flex align-items-center">
                            <div class="post-thumbnail">
                                <img src="<?php echo base_url() . 'assets/images/' . $row->gambar; ?>" alt="" class="img-fluid gabr">
                            </div>
                            <div class="post-content">
                                <a href="<?php echo site_url('berita/vw-' . $row->slug); ?>" class="headline">
                                    <h4><?php echo $row->judul; ?></h4>
                                </a>
                                <p> <?php echo limit_words($row->isi, 15) . '...'; ?></p>
                                <div class="post-meta">
                                    <p><i class="fa fa-user"></i> <?php echo $row->author; ?> | <i class="fa fa-calendar"></i>
                                        <?php echo $row->tanggal; ?> | <i class="fa fa-tags"></i> <?php echo $row->kategori; ?></p>
                                </div>
                            </div>
                        </div>
                    </a>
                <?php endforeach; ?>
                <br>
                <?php if (isset($page)) : ?>
                    <?php echo $page; ?>
                <?php endif; ?>

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