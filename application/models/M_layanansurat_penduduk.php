<?php
class M_layanansurat_penduduk extends CI_Model
{

    function get_all_layanansurat_penduduk()
    {
        $hsl = $this->db->query("SELECT * FROM tb_form ORDER BY id DESC");
        return $hsl;
    }

    function get_all_layanansurat_penduduk_by_user_penduduk_id($userPendudukId)
    {
        $hsl = $this->db->query("SELECT * FROM tb_form WHERE tb_user_penduduk_id = '$userPendudukId' ORDER BY id DESC");
        return $hsl;
    }
    
    function get_layanansurat($kode)
    {
      return $this->db->query("SELECT * FROM tb_form where id='$kode'");
    }

    function hapus_layanansurat($kode)
    {
      $hsl = $this->db->query("DELETE FROM tb_form WHERE id='$kode'");
      return $hsl;
    }
}
