            <?php $a = $identitas->row_array() ?>

            <!-- Footer Start -->
            <div class="container-fluid bg-dark text-light mt-5 wow fadeInUp" data-wow-delay="0.1s">
                <div class="container">
                    <div class="row gx-5">
                        <div class="col-lg-4 col-md-6 footer-about">
                            <div class="d-flex flex-column align-items-center justify-content-center text-center h-100 bg-primary p-4">
                                <a href="index.html" class="navbar-brand">
                                    <h3 class="m-0 text-white"><i class="fa fa-user-tie me-2"></i>Kampung Melayu</h3>
                                </a>
                                <p class="mt-3 mb-4">Desa yang amanah, sejahtera, bersih, dan Mandiri </p>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-6">
                            <div class="row gx-5">
                                <div class="col-lg-6 col-md-12 pt-5 mb-5">
                                    <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                        <h3 class="text-light mb-0">Hubungi Kami</h3>
                                    </div>
                                    <div class="d-flex mb-2">
                                        <i class="bi bi-geo-alt text-primary me-2"></i>
                                        <p class="mb-0"><?= $a['alamat'] ?></p>
                                    </div>
                                    <div class="d-flex mb-2">
                                        <i class="bi bi-envelope-open text-primary me-2"></i>
                                        <p class="mb-0"><?= $a['email'] ?></p>
                                    </div>
                                    <div class="d-flex mb-2">
                                        <i class="bi bi-telephone text-primary me-2"></i>
                                        <p class="mb-0"><?= $a['telepon'] ?></p>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 pt-0 pt-lg-5 mb-5">
                                    <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                        <h3 class="text-light mb-0">Usefull Links</h3>
                                    </div>
                                    <div class="link-animated d-flex flex-column justify-content-start">
                                        <a class="text-light mb-2" href="<?php echo site_url('/'); ?>"><i class="bi bi-arrow-right text-primary me-2"></i>Beranda</a>
                                        <a class="text-light mb-2" href="<?php echo site_url('/berita'); ?>"><i class="bi bi-arrow-right text-primary me-2"></i>Berita</a>
                                        <a class="text-light mb-2" href="<?php echo site_url('/form/login'); ?>"><i class="bi bi-arrow-right text-primary me-2"></i>Pengajuan Surat</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid text-white" style="background: #061429;">
                <div class="container text-center">
                    <div class="row justify-content-end">
                        <div class="col-lg-8 col-md-6">
                            <div class="d-flex align-items-center justify-content-center" style="height: 75px;">
                                <p class="mb-0">&copy; <a class="text-white border-bottom" href="#">Website Pemerintahan Desa Kampung Melayu</a>. Universitas Darwan Ali. <br> Dibuat Oleh : Muhammad Ainul Yakin.</br>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="<?php echo base_url(); ?>assets/startup2/lib/wow/wow.min.js"></script>
            <script src="<?php echo base_url(); ?>assets/startup2/lib/easing/easing.min.js"></script>
            <script src="<?php echo base_url(); ?>assets/startup2/lib/waypoints/waypoints.min.js"></script>
            <script src="<?php echo base_url(); ?>assets/startup2/lib/counterup/counterup.min.js"></script>
            <script src="<?php echo base_url(); ?>assets/startup2/lib/owlcarousel/owl.carousel.min.js"></script>

            <!-- Template Javascript -->
            <script src="<?php echo base_url(); ?>assets/startup2/js/main.js"></script>
            </body>

            </html>