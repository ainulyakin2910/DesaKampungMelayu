<?php $iden = $iden->row_array() ?>
<!DOCTYPE html>
<html>

<head>
	<!-- meta tag -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=chrome">
	<meta name="keyword" content="Website Desa Kampung Melayu">
	<meta name="description" content="Website Resmi Desa Kampung Melayu">
	<!-- nggo responsive -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- favicon -->
	<link rel="icon" href="<?= base_url('assetss/favicon/d') . $iden['favicon'] ?>">
	<title>Website Desa Kampung Melayu</title>

	<!-- Data Table -->
	<link rel="stylesheet" href="<?php echo base_url() . 'assets/plugins/datatables/dataTables.bootstrap.css' ?>">
	<!-- End Data Table -->

	<!-- Google Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

	<!-- Vendor CSS Files -->
	<link href="<?php echo base_url(); ?>assets/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="<?php echo base_url(); ?>assets/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="<?php echo base_url(); ?>assets/assets/vendor/aos/aos.css" rel="stylesheet">
	<link href="<?php echo base_url(); ?>assets/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	<link href="<?php echo base_url(); ?>assets/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

	<!-- Template Main CSS File -->
	<link href="<?php echo base_url(); ?>assets/assets/css/main.css" rel="stylesheet">
	<link href="<?php echo base_url(); ?>assets/assets/css/custom.css" rel="stylesheet">
	<!-- fullcalender -->
	<link rel="stylesheet" href="<?php echo base_url('assetss/fullcalendar/fullcalendar.min.css') ?>">
	<link rel="stylesheet" href="<?php echo base_url('assetss/fullcalendar/fullcalendar.print.css') ?>" media="print">
	<!-- rampungfullcalendar -->
	<link href="<?php echo base_url('assetss/css/dataTables.bootstrap4.min.css') ?>" rel="stylesheet">
	<?php
	function limit_words($string, $word_limit)
	{
		$words = explode(" ", $string);
		return implode(" ", array_splice($words, 0, $word_limit));
	}
	?>

	<!-- Login Tamplate -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="<?php echo base_url(); ?>assets/logintemplate/fonts/icomoon/style.css">
	<link rel="stylesheet" href="<?php echo base_url(); ?>assets/logintemplate/css/owl.carousel.min.css">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="<?php echo base_url(); ?>assets/logintemplate/css/bootstrap.min.css">
	<!-- Style -->
	<link rel="stylesheet" href="<?php echo base_url(); ?>assets/logintemplate/css/style.css">
	<!-- End of Login Tamplate -->
</head>

<body>