<?php
class M_layanansurat extends CI_Model
{

    function get_all_layanansurat()
    {
        $hsl = $this->db->query("SELECT * FROM tb_form ORDER BY id DESC");
        return $hsl;
    }

    function get_layanansurat($kode)
    {
      return $this->db->query("SELECT * FROM tb_form where id='$kode'");
    }

    function ubah_layanansurat($id, $data)
    {
      $this->db->where('id', $id);
      $this->db->update('tb_form', $data);

      return $this->db->affected_rows() > 0;
    }

    function hapus_layanansurat($kode)
    {
      $hsl = $this->db->query("DELETE FROM tb_form WHERE id='$kode'");
      return $hsl;
    }
}
