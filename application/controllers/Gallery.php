<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 *
 */

class Gallery extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('m_galeri');
		$this->load->model('m_pengunjung');

		$this->load->model('m_identitas');
		$this->m_pengunjung->count_visitor();
	}
	function index()
	{
		$x['albumda'] = $this->m_galeri->ambil_album();

		$x['iden'] = $this->m_identitas->get_all_identitas();
		$x['identitas'] = $this->m_identitas->get_all_identitas();
		$x['galeri'] = $this->m_galeri->get_galeri_home();
		// var_dump($data->result());
		$this->load->view('gallery', $x);
	}
	function get_subkategori()
	{
		$id = $this->input->post('id');
		if ($id != 0) {
			$data = $this->m_galeri->ambil_gambar($id);
			echo json_encode($data);
		} else {
			$data = $this->m_galeri->ambil_gallery()->result_array();
			echo json_encode($data);
		}
	}
	public function showGallery()
	{
		// Logika untuk mengambil data galeri
		// ...

		// Mengirimkan data ke tampilan
		$data['galeri'] = $m_galeri; // Ganti dengan logika Anda sendiri

		// Menampilkan tampilan gallery.php
		$this->load->view('gallery', $data);
	}
}
