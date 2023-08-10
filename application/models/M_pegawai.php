<?php

class M_pegawai extends CI_Model {

    function index() {
        $hsl = $this->db->query("SELECT tb_pegawai.* FROM tb_pegawai");
		return $hsl;
    }
    function destroy($kode){
        $hsl = $this->db->query("DELETE FROM tb_pegawai WHERE id='$kode'");
		return $hsl;
    }
    function insert($name, $position, $photo) {
		$hsl = $this->db->query("insert into tb_pegawai (name,position,photo) values ('$name','$position','$photo')");
		return $hsl;
	}
    function update($id, $name, $position, $photo) {
		$hsl = $this->db->query("update tb_pegawai set name='$name',position='$position',photo='$photo' where id='$id'");
		return $hsl;
	}
}
?>
