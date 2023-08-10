<?php

class Pegawaic extends CI_Controller{
    function __construct() {

		parent::__construct();
		if ($this->session->userdata('masuk') != TRUE) {
			$url = base_url('administrator');
			redirect($url);
		};
		$this->load->model('m_pegawai');
		$this->load->model('m_identitas');
		$this->load->library('upload');
	}

	function index() {
		$data['iden'] = $this->m_identitas->get_all_identitas();
		$data['pegawai'] = $this->m_pegawai->index();
		$this->load->view('admin/v_pegawaiC', $data);
	}

	function destroy(){
		$kode = strip_tags($this->input->post('kode'));
		$this->m_pegawai->destroy($kode);
		echo $this->session->set_flashdata('msg', 'success-hapus');
		redirect('admin/v_pegawaiC');
	}

	function insert()
	{
		$config['upload_path'] = './assets/images/pegawai/'; //path folder
		$config['allowed_types'] = 'gif|jpg|png|jpeg|bmp'; //type yang dapat diakses bisa anda sesuaikan
		$config['encrypt_name'] = TRUE; //nama yang terupload nantinya
		$this->upload->initialize($config);

		if (!empty($_FILES['filefoto']['name'])) {
			if ($this->upload->do_upload('filefoto')) {
				$gbr = $this->upload->data();
				//Compress Image
				$config['image_library'] = 'gd2';
				$config['source_image'] = './assets/images/pegawai/' . $gbr['file_name'];
				$config['create_thumb'] = FALSE;
				$config['maintain_ratio'] = FALSE;
				$config['quality'] = '60%';
				$config['width'] = 500;
				$config['height'] = 400;
				$config['new_image'] = './assets/images/pegawai/' . $gbr['file_name'];
				$this->load->library('image_lib', $config);
				$this->image_lib->resize();

				$gambar = $gbr['file_name'];
				$name = $this->input->post('xnama_pegawai');
				$position = $this->input->post('xposition');
				$this->m_pegawai->insert($name, $position, $gambar);
				echo $this->session->set_flashdata('msg', 'success');
				redirect('admin/pegawai_c');
			} else {
				echo $this->session->set_flashdata('msg', 'warning');
				redirect('admin/pegawai_c');
			}

		} else {
			redirect('admin/pegawai_c');
		}
	}

	function update()
	{
		$config['upload_path'] = './assets/images/pegawai/'; //path folder
		$config['allowed_types'] = 'gif|jpg|png|jpeg|bmp'; //type yang dapat diakses bisa anda sesuaikan
		$config['encrypt_name'] = TRUE; //nama yang terupload nantinya
		$this->upload->initialize($config);

		if (!empty($_FILES['filefoto']['name'])) {
			if ($this->upload->do_upload('filefoto')) {
				$gbr = $this->upload->data();
				//Compress Image
				$config['image_library'] = 'gd2';
				$config['source_image'] = './assets/images/pegawai/' . $gbr['file_name'];
				$config['create_thumb'] = FALSE;
				$config['maintain_ratio'] = FALSE;
				$config['quality'] = '60%';
				$config['width'] = 500;
				$config['height'] = 400;
				$config['new_image'] = './assets/images/pegawai/' . $gbr['file_name'];
				$this->load->library('image_lib', $config);
				$this->image_lib->resize();

				$gambar = $gbr['file_name'];
				$id = $this->input->post('xcode');
				$name = $this->input->post('xnama_pegawai');
				$position = $this->input->post('xposition');
				$this->m_pegawai->update($id,$name, $position, $gambar);
				echo $this->session->set_flashdata('msg', 'success');
				redirect('admin/pegawai_c');
			} else {
				echo $this->session->set_flashdata('msg', 'warning');
				redirect('admin/pegawai_c');
			}

		} else {
			redirect('admin/pegawai_c');
		}
	}
}
