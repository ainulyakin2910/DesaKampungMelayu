  <meta charset="utf-8">

  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="keyword" content="Website Desa Kampung Melayu, Web Kampung Melayu">
  <meta name="description" content="Website Resmi Desa Kampung Melayu">
  <title><?php echo SITE_NAME . ": " . ucfirst($this->uri->segment(1)) . " - " . ucfirst($this->uri->segment(2)) ?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <?php $iden = $iden->row_array() ?>
  <link rel="icon" href="<?= base_url('assetss/favicon/') . $iden['favicon'] ?>">