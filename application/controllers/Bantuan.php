<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 *
 */

class Bantuan extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('m_berita');
        $this->load->model('m_kategori');
        $this->load->model('m_pengumuman');
        $this->load->model('m_agenda');
        $this->load->model('m_potensi');
        $this->load->model('m_pengunjung');

        $this->load->model('m_identitas');
        $this->load->model('m_bantuan');
        $this->m_pengunjung->count_visitor();
    }
    function index()
    {
        $jum = $this->m_potensi->potensi();
        $page = $this->uri->segment(3);
        if (!$page) :
            $offset = 0;
        else :
            $offset = $page;
        endif;
        $limit = 5;
        $config['base_url'] = site_url() . 'potensi/index/';
        $config['total_rows'] = $jum->num_rows();
        $config['per_page'] = $limit;
        $config['uri_segment'] = 3;
        //Tambahan untuk styling
        $config['full_tag_open'] = '<div class="pagging text-center"><nav><ul class="pagination justify-content-center">';
        $config['full_tag_close'] = '</ul></nav></div>';
        $config['num_tag_open'] = '<li class="page-item"><span class="page-link">';
        $config['num_tag_close'] = '</span></li>';
        $config['cur_tag_open'] = '<li class="page-item"><span class="page-link">';
        $config['cur_tag_close'] = '<span class="sr-only">(current)</span></span></li>';
        $config['next_tag_open'] = '<li class="page-item"><span class="page-link">';
        $config['next_tagl_close'] = '<span aria-hidden="true">&raquo;</span></span></li>';
        $config['prev_tag_open'] = '<li class="page-item"><span class="page-link">';
        $config['prev_tagl_close'] = '</span>Next</li>';
        $config['first_tag_open'] = '<li class="page-item"><span class="page-link">';
        $config['first_tagl_close'] = '</span></li>';
        $config['last_tag_open'] = '<li class="page-item"><span class="page-link">';
        $config['last_tagl_close'] = '</span></li>';
        $config['first_link'] = 'Awal';
        $config['last_link'] = 'Akhir';
        $config['next_link'] = 'Next >>';
        $config['prev_link'] = '<< Prev';
        $this->pagination->initialize($config);
        $x['page'] = $this->pagination->create_links();
        $x['data'] = $this->m_potensi->potensi_perpage($offset, $limit);
        // var_dump($this->m_potensi->potensi_perpage($offset, $limit)->result_array());
        $x['agendaterbaru'] = $this->m_agenda->get_agenda_terbaru();
        $x['allkate'] = $this->m_kategori->get_all_kategori();
        $x['pengumumanterbaru'] = $this->m_pengumuman->get_pengumuman_terbaru();
        $x['populer'] = $this->m_berita->get_berita_populer();
        $x['beritaterbaru'] = $this->m_berita->get_berita_terbaru();

        $x['identitas'] = $this->m_identitas->get_all_identitas();
        $x['iden'] = $this->m_identitas->get_all_identitas();

        $x['arr_bantuan'] = $this->m_bantuan->getAll()->result();

        $this->load->view('bantuan', $x);
    }
    function detail($slugs)
    {
        $slug = htmlspecialchars($slugs, ENT_QUOTES);
        $query = $this->db->get_where('tb_potensi', array('slug' => $slug));
        if ($query->num_rows() > 0) {
            $b = $query->row_array();
            $kode = $b['id'];
            $data = $this->m_potensi->get_potensid_by_kode($kode);
            $row = $data->row_array();
            // var_dump($data);
            $x['id'] = $row['id'];
            $x['title'] = $row['judul'];
            $x['image'] = $row['gambar'];
            $x['blog'] = $row['isi'];
            $x['tanggal'] = $row['tanggal'];
            $x['author'] = $row['author'];
            $x['slug'] = $row['slug'];
            $x['agendaterbaru'] = $this->m_agenda->get_agenda_terbaru();
            $x['allkate'] = $this->m_kategori->get_all_kategori();
            $x['pengumumanterbaru'] = $this->m_pengumuman->get_pengumuman_terbaru();
            $x['populer'] = $this->m_berita->get_berita_populer();
            $x['beritaterbaru'] = $this->m_berita->get_berita_terbaru();

            $x['iden'] = $this->m_identitas->get_all_identitas();
            $this->load->view('v_potensi', $x);
        } else {
            redirect('potensi');
        }
    }
}
