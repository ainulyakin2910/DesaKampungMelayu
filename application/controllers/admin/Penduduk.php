<?php

class Penduduk extends CI_Controller {

	function __construct() {
		parent::__construct();
		if ($this->session->userdata('masuk') != TRUE) {
			$url = base_url('administrator');
			redirect($url);
		};
		$this->load->model('m_penduduk');
		$this->load->model('m_userpenduduk');
		$this->load->model('m_identitas');
		$this->load->model('m_pengguna');
	}

	function index() {
		$x['iden'] = $this->m_identitas->get_all_identitas();
		$kode = $this->session->userdata('idadmin');
		$x['user'] = $this->m_pengguna->get_pengguna_login($kode);
		$x['data'] = $this->m_penduduk->get_all();
		$this->load->view('admin/v_penduduk', $x);
	}

  function simpan() {
    $post = $this->input->post();
    $pen = $this->m_penduduk->get_penduduk($post['nik'])->num_rows();

    if ($pen > 0) {
      echo $this->session->set_flashdata('msg', 'error');
    } else {
      echo $this->session->set_flashdata('msg', 'success');
      $this->m_penduduk->simpan($post);
    }
    
    redirect('admin/penduduk');
  }
  
  function update() {
    $post = $this->input->post();
    $this->m_penduduk->update($post);
    $this->m_userpenduduk->updateNama($post['id'], $post['nama'], $post['nik']);
    
    echo $this->session->set_flashdata('msg', 'info');
    
    redirect('admin/penduduk');    
  }

  function hapus() {
    $id = $this->input->post('id');
    $this->m_penduduk->hapus($id);

    echo $this->session->set_flashdata('msg', 'success-hapus');
    
    redirect('admin/penduduk');
  }
}