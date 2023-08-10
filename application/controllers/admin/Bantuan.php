<?php
class Bantuan extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        if ($this->session->userdata('masuk') != TRUE) {
            $url = base_url('administrator');
            redirect($url);
        };
        $this->load->model('m_identitas');
        $this->load->model('m_bantuan');
        $this->load->model('m_pengguna');
        $this->load->library('upload');
    }

    function index()
    {
        $x['iden'] = $this->m_identitas->get_all_identitas();
        $x['data'] = $this->m_bantuan->get_all_bantuan();
        $this->load->view('admin/v_bantuan', $x);
    }

    function simpan_bantuan()
    {
        $config['upload_path'] = './assets/images/'; //path folder
        $config['allowed_types'] = 'gif|jpg|png|jpeg|bmp'; //type yang dapat diakses bisa anda sesuaikan
        $config['encrypt_name'] = TRUE; //nama yang terupload nantinya

        $this->upload->initialize($config);
        if (!empty($_FILES['filefoto']['name'])) {
            if ($this->upload->do_upload('filefoto')) {
                $gbr = $this->upload->data();
                //Compress Image
                $config['image_library'] = 'gd2';
                $config['source_image'] = './assets/images/' . $gbr['file_name'];
                $config['create_thumb'] = FALSE;
                $config['maintain_ratio'] = FALSE;
                $config['quality'] = '60%';
                $config['new_image'] = './assets/images/' . $gbr['file_name'];
                $this->load->library('image_lib', $config);
                $this->image_lib->resize();

                $gambar = $gbr['file_name'];
                $bantuan = strip_tags($this->input->post('xnama_bantuan'));
                $kode = $this->session->userdata('idadmin');
                $user = $this->m_pengguna->get_pengguna_login($kode);
                $p = $user->row_array();
                $user_id = $p['id'];
                $this->m_bantuan->simpan_bantuan($bantuan, $gambar);
                echo $this->session->set_flashdata('msg', 'success');
                redirect('admin/bantuan');
            } else {
                echo $this->session->set_flashdata('msg', 'warning');
                redirect('admin/bantuan');
            }
        } else {
            redirect('admin/bantuan');
        }
    }

    function update_bantuan()
    {

        $config['upload_path'] = './assets/images/'; //path folder
        $config['allowed_types'] = 'gif|jpg|png|jpeg|bmp'; //type yang dapat diakses bisa anda sesuaikan
        $config['encrypt_name'] = TRUE; //nama yang terupload nantinya

        $this->upload->initialize($config);
        if (!empty($_FILES['filefoto']['name'])) {
            if ($this->upload->do_upload('filefoto')) {
                $gbr = $this->upload->data();
                //Compress Image
                $config['image_library'] = 'gd2';
                $config['source_image'] = './assets/images/' . $gbr['file_name'];
                $config['create_thumb'] = FALSE;
                $config['maintain_ratio'] = FALSE;
                $config['quality'] = '60%';
                $config['new_image'] = './assets/images/' . $gbr['file_name'];
                $this->load->library('image_lib', $config);
                $this->image_lib->resize();

                $gambar = $gbr['file_name'];
                $bantuan_id = $this->input->post('kode');
                $bantuan_nama = strip_tags($this->input->post('xnama_bantuan'));
                $images = $this->input->post('gambar');
                $path = './assets/images/' . $images;
                unlink($path);
                $kode = $this->session->userdata('idadmin');
                $user = $this->m_pengguna->get_pengguna_login($kode);
                $p = $user->row_array();
                $user_id = $p['id'];
                $this->m_bantuan->update_bantuan($bantuan_id, $bantuan_nama, $gambar);
                echo $this->session->set_flashdata('msg', 'info');
                redirect('admin/bantuan');
            } else {
                echo $this->session->set_flashdata('msg', 'warning');
                redirect('admin/bantuan');
            }
        } else {
            $bantuan_id = $this->input->post('kode');
            $bantuan_nama = strip_tags($this->input->post('xnama_bantuan'));
            $kode = $this->session->userdata('idadmin');
            $user = $this->m_pengguna->get_pengguna_login($kode);
            $p = $user->row_array();
            $user_id = $p['id'];
            $this->m_bantuan->update_bantuan_tanpa_img($bantuan_id, $bantuan_nama);
            echo $this->session->set_flashdata('msg', 'info');
            redirect('admin/bantuan');
        }
    }

    function hapus_bantuan()
    {
        $kode = $this->input->post('kode');
        $gambar = $this->input->post('gambar');
        $path = './assets/images/' . $gambar;
        if (file_exists($path)) {
            unlink($path);
        }
        $this->m_bantuan->hapus_bantuan($kode);
        echo $this->session->set_flashdata('msg', 'success-hapus');
        redirect('admin/bantuan');
    }
}
