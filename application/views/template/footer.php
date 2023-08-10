</main>

<!-- ======= Footer ======= -->
<footer id="footer" class="footer">

	<div class="container">
		<div class="row gy-4">
			<div class="col-lg-5 col-md-12 footer-info">
				<a href="index.html" class="logo d-flex align-items-center">
					<span>Kampung Melayu</span>
				</a>

				<?php $a = $identitas->row_array() ?>
				<p>Sebuah Desa yang berada di <?php echo $a['alamat']; ?></p>
			</div>

			<div class="col-lg-2 col-6 footer-links">
				<h4>Useful Links</h4>
				<ul>
					<li><a href="<?= base_url() ?>">Home</a></li>
					<li><a href="<?php echo base_url() . 'sambutan'; ?>">About us</a></li>
					<li><a href="<?php echo base_url() . 'form'; ?>">Services</a></li>
				</ul>
			</div>

			<div class="col-lg-2 col-6 footer-links">
				<h4>Our Services</h4>
				<ul>
					<li><a href="<?php echo base_url() . 'form'; ?>">Pembuatan KTP</a></li>
					<li><a href="<?php echo base_url() . 'form'; ?>">Surat - Surat</a></li>
					<!-- <li><a href="#">Product Management</a></li>
					<li><a href="#">Marketing</a></li>
					<li><a href="#">Graphic Design</a></li> -->
				</ul>
			</div>
			<?php $a = $identitas->row_array() ?>
			<div class="col-lg-3 col-md-12 footer-contact text-center text-md-start">
				<h4>Contact Us</h4>
				<p>
					<?php echo $a['alamat']; ?> <br><br>
					<strong>Phone:</strong> <?php echo $a['telepon'] ?><br>
					<strong>Email:</strong> <?php echo $a['email'] ?><br>
				</p>

			</div>

		</div>
	</div>

	<div class="container mt-4">
		<div class="copyright">
			&copy; Copyright <strong><span>Desa Kampung Melayu</span></strong>. All Rights Reserved
		</div>
	</div>

</footer><!-- End Footer -->
<!-- End Footer -->

<a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<div id="preloader"></div>

<script src="<?php echo base_url(); ?>assets/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<?php echo base_url(); ?>assets/assets/vendor/aos/aos.js"></script>
<script src="<?php echo base_url(); ?>assets/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="<?php echo base_url(); ?>assets/assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="<?php echo base_url(); ?>assets/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="<?php echo base_url(); ?>assets/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="<?php echo base_url(); ?>assets/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="<?php echo base_url(); ?>assets/assets/js/main.js"></script>

<!-- Login Tamplate -->
<script src="<?php echo base_url(); ?>assets/logintemplate/js/jquery-3.3.1.min.js"></script>
<script src="<?php echo base_url(); ?>assets/logintemplate/js/popper.min.js"></script>
<script src="<?php echo base_url(); ?>assets/logintemplate/js/bootstrap.min.js"></script>
<script src="<?php echo base_url(); ?>assets/logintemplate/js/main.js"></script>
<!-- End of Login Template -->



<!-- //js lama -->
<?php $i = $ig->row_array() ?>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script>
	window.jQuery || document.write('<script src="<?= base_url('
		assetss / js / jquery - slim.min.js ') ?>"><\/script>')
</script>
<script src="<?= base_url('assetss/js/popper.min.js') ?>"></script>
<script src="<?= base_url('assetss/js/bootstrap.min.js') ?>"></script>
<script src="<?= base_url('assetss/slimScroll/jquery.slimscroll.min.js') ?>"></script>
<script src="<?= base_url('assetss/fastclick/fastclick.js') ?>"></script>
<script src="<?php echo base_url('assetss/js/jquery.dataTables.min.js') ?>"></script>
<script src="<?php echo base_url('assetss/js/dataTables.bootstrap4.min.js') ?>"></script>
<script>
	.$(document).ready(function() {
	$('#display').DataTable();
	}));
</script>
<script src="<?= base_url('assetss/fancybox/jquery.fancybox.min.js') ?>"></script>

<script src="<?= base_url('assetss/fullcalendar/lib/moment.min.js') ?>"></script>
<script src="<?= base_url('assetss/fullcalendar/fullcalendar.min.js') ?>"></script>
<script src="<?= base_url('assetss/fullcalendar/locale-all.js') ?>"></script>
<script src="<?= base_url('assetss/fullcalendar/gcal.js') ?>"></script>

<script src="<?= base_url('assetss/js/engine.js') ?>"></script>
<script src="<?php echo base_url('assetss/js/jssocials.js') ?>"></script>

<script>
	$(document).ready(function() {
		$(".sharePopup").jsSocials({
			showCount: true,
			showLabel: true,
			shareIn: "popup",
			shares: [
				"email",
				"twitter",
				"facebook",
				"googleplus",
				"linkedin",
				{
					share: "pinterest",
					label: "Pin this"
				},
				"whatsapp"
			]
		});
	});
</script>
<script>
	function openCity(evt, cityName) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" active", "");
		}
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " active";
	}

	// Get the element with id="defaultOpen" and click on it
	if (document.getElementById("defaultOpen")) {
		document.getElementById("defaultOpen").click();
	}
</script>
<script type="text/javascript" src="<?php echo base_url('assetss/js/instafeed.min.js') ?>"></script>
<script type="text/javascript">
	var userFeed = new Instafeed({
		get: 'user',
		userId: '<?php echo $i["userid"] ?>',
		clientId: '<?php echo $i["client"] ?>',
		accessToken: '<?php echo $i["accestoken"] ?>',
		resolution: 'standard_resolution',
		template: '<div class="col-sm-2  col-md-2" ><div class="hovereffect"><a href="{{ link }}" class="media-item" target="_blank" id="{{ id }}"><img src="{{ image }}" class="img-fluid bg1" /> <i class="fa fa-instagram icon fa-2x" style="color: gray;right: 10px;position: absolute;top: 7px;"></i><div class="overlay"><h2><i class="fa fa-thumbs-up"> {{ likes }}</i> <i class="fa fa-comment"></i> {{ comments }}</h2></div></a></div></div> ',
		sortBy: 'most-recent',
		limit: 6,
		links: false
	});
	if ($('#instafeed').length) {
		userFeed.run();
	}
</script>
<script type="text/javascript">
	var galleryFeed = new Instafeed({
		get: 'user',
		userId: '<?php echo $i["userid"] ?>',
		clientId: '<?php echo $i["client"] ?>',
		accessToken: '<?php echo $i["accestoken"] ?>',
		resolution: 'standard_resolution',
		template: ' <div class="col-md-6 col-lg-4 item zoom-on-hover" ><div class="hovereffect"><a href="{{ link }}" target="_blank" id="{{ id }}"><img src="{{ image }}" class="img-fluid " /> <i class="fa fa-instagram icon fa-2x" style="color: gray;right: 10px;position: absolute;top: 7px;"></i></a> <div class="overlay"><h2><i class="fa fa-thumbs-up"> {{ likes }}</i> <i class="fa fa-comment"></i> {{ comments }}</h2></div></div></div>',
		sortBy: 'most-recent',
		links: false,
		target: "instafeed-gallery-feed",
	});
	if ($('#instafeed-gallery-feed').length) {
		galleryFeed.run();
	}
</script>
</body>

</html>