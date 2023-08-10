<?php
class M_pengaduan extends CI_Model
{
  function get_all_pengaduan()
  {
    $hsl = $this->db->query("
        SELECT pm.*, up.nama_lengkap AS nama, up.no_ktp AS nik
        FROM tb_pengaduan_masyarakat AS pm
        INNER JOIN tb_user_penduduk AS up ON pm.user_penduduk = up.id
        ORDER BY pm.id DESC
    ");
    return $hsl;
  }
}
