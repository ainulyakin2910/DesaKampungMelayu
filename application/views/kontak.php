<?php $this->load->view('template/startup2/header');
$this->load->view('template/startup2/menu') ?>
<div class="marketing">
    <?php $this->load->view('template/pathway') ?>
    <div class="featurette-divider"></div>
    <div class="container">
        <h3 class="p-title">KONTAK <span style="color:#DC3545;">KAMI</span></h3>
        <div id="loveandtruth" class="section">
            <div class="row row-contact">
                <?php $a = $identitas->row_array() ?>
                <div class="col-sm-4">
                    <h4>KANTOR</h4>
                    <div class="media">
                        <div class="media-left"><i class="icons bi bi-geo-alt-fill    "></i></div>
                        <div class="media-body">
                            <p align="justify"> <?php echo $a['alamat']; ?></p>
                        </div>
                    </div>
                    <div class="media">
                        <div class="media-left"><i class="icons bi bi-telephone"></i></div>
                        <div class="media-body">
                            <p> Phone : <?php echo $a['telepon'] ?></p>
                        </div>
                    </div>
                    <div class="media">
                        <div class="media-left"><i class="icons bi bi-envelope"></i></div>
                        <div class="media-body">
                            <p> Email : <?php echo $a['email'] ?></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <h4>JAM KERJA</h4>
                    <?php foreach ($waktu->result() as $waktu) : ?>
                        <div class="media">
                            <div class="media-left"><i class="icons bi bi-clock"></i></div>
                            <div class="media-body">
                                <p><?php echo $waktu->hari . ' ' . $waktu->jam ?></p>
                            </div>
                        </div>
                    <?php endforeach ?>
                </div>
                <div class="col-sm-5">
                    <h4>HUBUNGI KAMI</h4>
                    <form id="myformBeranda" action="<?php echo site_url('kontak/kirim_pesanloveandtruth'); ?>" method="post">
                        <div class="form-group">
                            <label for="xemail">Email address</label>
                            <input type="email" class="form-control" id="xemail" placeholder="name@example.com" required="true" name="xemail">
                        </div>
                        <div class="form-group">
                            <label for="xnama">Nama</label>
                            <input type="name" class="form-control" id="xnama" placeholder="Nama Anda" required="true" name="xnama">
                        </div>
                        <div class="form-group">
                            <label for="hp">Telephone</label>
                            <input class="form-control" type="tel" placeholder="08564211xxxx" id="hp" required name="xtelp">
                        </div>
                        <div class="form-group">
                            <label for="xpesan">Pesan</label>
                            <textarea class="form-control" id="xpesan" rows="3" required="true" name="xpesan"></textarea>
                        </div>
                        <button type="submit" class="btn btn-danger">Kirim</button>
                        <div><?php echo $this->session->flashdata('msg'); ?></div>
                    </form>
                </div>
            </div>
            <h4>PETA LOKASI KANTOR DESA KAMPUNG MELAYU</h4>
            <div class="map-responsive">
                <?php echo $a['maps'] ?>

            </div>
        </div>
    </div>




</div>
<!-- end feature yo-->
<!-- FOOTER -->
<?php $this->load->view('template/startup2/footer') ?>