<?php
defined('BASEPATH') or exit('No direct script access allowed');

use Dompdf\Dompdf;

class Form extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('m_statis');
        $this->load->model('m_berita');
        $this->load->model('m_kategori');
        $this->load->model('m_pengumuman');
        $this->load->model('m_agenda');
        $this->load->model('m_pengunjung');

        $this->load->model('m_identitas');
        $this->load->model('m_form');
        $this->load->model('m_layanansurat_penduduk');
        $this->load->model('M_userpenduduk');
        $this->load->model('m_penduduk');
        $this->load->model('m_pengaturan_layanan_surat');
        $this->load->helper('pdf');
        $this->m_pengunjung->count_visitor();
    }

    function index()
    {
        if (!$this->session->has_userdata('auth_penduduk')) {
            redirect('form/login');
        }

        $x['statis'] = $this->m_statis->get_all_pegawai();
        $x['agendaterbaru'] = $this->m_agenda->get_agenda_terbaru();
        $x['allkate'] = $this->m_kategori->get_all_kategori();
        $x['pengumumanterbaru'] = $this->m_pengumuman->get_pengumuman_terbaru();
        $x['populer'] = $this->m_berita->get_berita_populer();
        $x['beritaterbaru'] = $this->m_berita->get_berita_terbaru();

        $x['iden'] = $this->m_identitas->get_all_identitas();
        $x['identitas'] = $this->m_identitas->get_all_identitas();

        $this->load->view('v_form', $x);
    }

    function list()
    {
        if (!$this->session->has_userdata('auth_penduduk')) {
            redirect('form/login');
        }

        $x['statis'] = $this->m_statis->get_all_pegawai();
        $x['agendaterbaru'] = $this->m_agenda->get_agenda_terbaru();
        $x['allkate'] = $this->m_kategori->get_all_kategori();
        $x['pengumumanterbaru'] = $this->m_pengumuman->get_pengumuman_terbaru();
        $x['populer'] = $this->m_berita->get_berita_populer();
        $x['beritaterbaru'] = $this->m_berita->get_berita_terbaru();

        $x['iden'] = $this->m_identitas->get_all_identitas();
        $x['identitas'] = $this->m_identitas->get_all_identitas();
        $x['data'] = $this->m_layanansurat_penduduk->get_all_layanansurat_penduduk_by_user_penduduk_id($this->session->userdata('auth_penduduk')->id);

        $this->load->view('v_form_list', $x);
    }

    function ubah()
    {
        if (!$this->session->has_userdata('auth_penduduk')) {
            redirect('form/login');
        }

        $x['statis'] = $this->m_statis->get_all_pegawai();
        $x['agendaterbaru'] = $this->m_agenda->get_agenda_terbaru();
        $x['allkate'] = $this->m_kategori->get_all_kategori();
        $x['pengumumanterbaru'] = $this->m_pengumuman->get_pengumuman_terbaru();
        $x['populer'] = $this->m_berita->get_berita_populer();
        $x['beritaterbaru'] = $this->m_berita->get_berita_terbaru();

        $x['iden'] = $this->m_identitas->get_all_identitas();
        $x['identitas'] = $this->m_identitas->get_all_identitas();
        $x['data'] = $this->m_penduduk->get_penduduk($this->session->userdata('auth_penduduk')->no_ktp)->row();
        // var_dump($x['data']);
        $this->load->view('v_form_ubahdata', $x);
    }

    function ubahaction()
    {
        if (!$this->session->has_userdata('auth_penduduk')) {
            redirect('form/login');
        }
        $post = $this->input->post();
        if (!empty($_FILES['foto_ktp']['name'])) {
            $config['upload_path'] = './uploads/';
            $config['allowed_types'] = 'jpg|jpeg|png';
            $config['encrypt_name'] = TRUE;

            $this->load->library('upload', $config);
            $this->upload->initialize($config);

            if ($this->upload->do_upload('foto_ktp')) {
                $photo = $this->upload->data('file_name');
            } else {
                $photo =  $this->upload->display_errors();
                redirect('form/ubah');
            }

            $this->m_penduduk->update($post, $photo);
        } else {
            $this->m_penduduk->update($post);
        }
        $this->session->set_flashdata('success', 'Berhasil mengubah data!');
        $this->M_userpenduduk->updateNama($post['nama'], $post['nik']);

        redirect('form/ubah');
    }

    function downloadpdf()
    {
        $filename = $this->input->get('filename');

        header("Content-type:application/pdf");
        header("Content-Disposition:attachment;filename=\"$filename\"");
        readfile('uploads/' . $filename);

        // header('Content-Disposition: attachment; filename="' . $filename . '"');
        // header("Content-Type: application/pdf");
        // header("Content-Length: " . filesize(file_get_contents('uploads/' . $filename)));
        // readfile(file_get_contents());
        unlink('uploads/' . $filename);
    }

    function login()
    {
        if ($this->session->has_userdata('auth_penduduk')) {
            redirect('form');
        }

        $x['statis'] = $this->m_statis->get_all_pegawai();
        $x['agendaterbaru'] = $this->m_agenda->get_agenda_terbaru();
        $x['allkate'] = $this->m_kategori->get_all_kategori();
        $x['pengumumanterbaru'] = $this->m_pengumuman->get_pengumuman_terbaru();
        $x['populer'] = $this->m_berita->get_berita_populer();
        $x['beritaterbaru'] = $this->m_berita->get_berita_terbaru();

        $x['iden'] = $this->m_identitas->get_all_identitas();
        $x['identitas'] = $this->m_identitas->get_all_identitas();
        $this->load->view('v_form_login', $x);
    }

    function lupakatasandi()
    {
        if ($this->session->has_userdata('auth_penduduk')) {
            redirect('form');
        }

        $x['statis'] = $this->m_statis->get_all_pegawai();
        $x['agendaterbaru'] = $this->m_agenda->get_agenda_terbaru();
        $x['allkate'] = $this->m_kategori->get_all_kategori();
        $x['pengumumanterbaru'] = $this->m_pengumuman->get_pengumuman_terbaru();
        $x['populer'] = $this->m_berita->get_berita_populer();
        $x['beritaterbaru'] = $this->m_berita->get_berita_terbaru();

        $x['iden'] = $this->m_identitas->get_all_identitas();
        $x['identitas'] = $this->m_identitas->get_all_identitas();
        $this->load->view('v_form_lupa_kata_sandi', $x);
    }

    function identitaslupakatasandi()
    {
        if ($this->session->has_userdata('auth_penduduk')) {
            redirect('form');
        }

        $x['statis'] = $this->m_statis->get_all_pegawai();
        $x['agendaterbaru'] = $this->m_agenda->get_agenda_terbaru();
        $x['allkate'] = $this->m_kategori->get_all_kategori();
        $x['pengumumanterbaru'] = $this->m_pengumuman->get_pengumuman_terbaru();
        $x['populer'] = $this->m_berita->get_berita_populer();
        $x['beritaterbaru'] = $this->m_berita->get_berita_terbaru();

        $x['iden'] = $this->m_identitas->get_all_identitas();
        $x['identitas'] = $this->m_identitas->get_all_identitas();
        $this->load->view('v_form_identitas_lupa_kata_sandi', $x);
    }

    function lupakatasandiaction()
    {
        if ($this->session->has_userdata('auth_penduduk')) {
            redirect('form');
        }

        /**
         * 
         * Load Dependency
         */
        $this->load->library('form_validation');
        $this->load->helper('security');

        /**
         * Validation Rules
         * 
         */
        $this->form_validation->set_rules('no_ktp', 'Nomor KTP', 'required');

        if ($this->form_validation->run() == false) {

            /**
             * Failed Validation
             * 
             */
            $this->session->set_flashdata('error', validation_errors());
            $this->session->set_flashdata('old_input', $this->input->post());

            redirect('form/lupakatasandi');
        } else {
            if (!$rowPenduduk = $this->M_userpenduduk->findByNoKTP($this->input->post('no_ktp'))) {
                $this->session->set_flashdata('error', 'No KTP tidak ditemukan');
                $this->session->set_flashdata('old_input', $this->input->post());

                redirect('form/lupakatasandi');
            }

            redirect('form/identitaslupakatasandi?no_ktp=' . $this->input->post('no_ktp'));
        }
    }

    public function identitaslupakatasandiaction()
    {
        if ($this->session->has_userdata('auth_penduduk')) {
            redirect('form');
        }

        /**
         * 
         * Load Dependency
         */
        $this->load->library('form_validation');
        $this->load->helper('security');

        /**
         * Validation Rules
         * 
         */
        $this->form_validation->set_rules('no_ktp', 'Nomor KTP', 'required');
        $this->form_validation->set_rules('dimana_anda_lahir', 'Dimana anda lahir', 'required');
        $this->form_validation->set_rules('siapa_nama_sahabat_anda', 'Siapa nama sahabat anda', 'required');

        if ($this->form_validation->run() == false) {

            /**
             * Failed Validation
             * 
             */
            $this->session->set_flashdata('error', validation_errors());
            $this->session->set_flashdata('old_input', $this->input->post());

            redirect('form/identitaslupakatasandi?no_ktp=' . $this->input->post('no_ktp'));
        } else {
            if (!$rowPenduduk = $this->M_userpenduduk->findByNoKTP($this->input->post('no_ktp'))) {
                $this->session->set_flashdata('error', 'No KTP tidak ditemukan');
                $this->session->set_flashdata('old_input', $this->input->post());

                redirect('form/identitaslupakatasandi?no_ktp=' . $this->input->post('no_ktp'));
            }

            if ($rowPenduduk->dimana_anda_lahir != trim(strtolower($this->input->post('dimana_anda_lahir'))) && $rowPenduduk->siapa_nama_sahabat_anda != trim(strtolower($this->input->post('siapa_nama_sahabat_anda')))) {
                $this->session->set_flashdata('error', 'Jawaban verifikasi identitas salah');
                $this->session->set_flashdata('old_input', $this->input->post());

                redirect('form/identitaslupakatasandi?no_ktp=' . $this->input->post('no_ktp'));
            }

            $token = substr(str_shuffle('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 1, 25);
            $this->M_userpenduduk->updateToken($token, $this->input->post('no_ktp'));

            redirect('form/resetkatasandi?token=' . $token);
        }
    }

    function resetkatasandi()
    {
        if ($this->session->has_userdata('auth_penduduk')) {
            redirect('form');
        }

        $x['statis'] = $this->m_statis->get_all_pegawai();
        $x['agendaterbaru'] = $this->m_agenda->get_agenda_terbaru();
        $x['allkate'] = $this->m_kategori->get_all_kategori();
        $x['pengumumanterbaru'] = $this->m_pengumuman->get_pengumuman_terbaru();
        $x['populer'] = $this->m_berita->get_berita_populer();
        $x['beritaterbaru'] = $this->m_berita->get_berita_terbaru();

        $x['iden'] = $this->m_identitas->get_all_identitas();
        $x['identitas'] = $this->m_identitas->get_all_identitas();
        $this->load->view('v_form_reset_kata_sandi', $x);
    }


    function resetkatasandiaction()
    {
        if ($this->session->has_userdata('auth_penduduk')) {
            redirect('form');
        }

        /**
         * 
         * Load Dependency
         */
        $this->load->library('form_validation');
        $this->load->helper('security');

        /**
         * Validation Rules
         * 
         */
        $this->form_validation->set_rules('token', 'Token', 'required');
        $this->form_validation->set_rules('password', 'Password', 'required|min_length[6]');

        if ($this->form_validation->run() == false) {

            /**
             * Failed Validation
             * 
             */
            $this->session->set_flashdata('error', validation_errors());
            $this->session->set_flashdata('old_input', $this->input->post());

            redirect('form/resetkatasandi?token=' . $this->input->post('token'));
        } else {

            /**
             * Password Confirmation not match
             *
             */
            if ($this->input->post('password') != $this->input->post('password_confirmation')) {
                $this->session->set_flashdata('error', 'Password konfirmasi tidak cocok');
                $this->session->set_flashdata('old_input', $this->input->post());

                redirect('form/resetkatasandi?token=' . $this->input->post('token'));
            }

            if (!$rowPenduduk = $this->M_userpenduduk->findByToken($this->input->post('token'))) {
                $this->session->set_flashdata('error', 'Token tidak ditemukan');
                $this->session->set_flashdata('old_input', $this->input->post());

                redirect('form/resetkatasandi?token=' . $this->input->post('token'));
            }

            $this->M_userpenduduk->updatePassword(password_hash($this->input->post('password'), PASSWORD_DEFAULT), $rowPenduduk->no_ktp);

            $this->session->set_flashdata('success', 'Reset kata sandi berhasil');

            redirect('form/login');
        }
    }

    public function logout()
    {
        if (!$this->session->has_userdata('auth_penduduk')) {
            redirect('form/login');
        }

        $this->session->sess_destroy();
        redirect('form/login');
    }

    function register()
    {
        if ($this->session->has_userdata('auth_penduduk')) {
            redirect('form');
        }

        $x['statis'] = $this->m_statis->get_all_pegawai();
        $x['agendaterbaru'] = $this->m_agenda->get_agenda_terbaru();
        $x['allkate'] = $this->m_kategori->get_all_kategori();
        $x['pengumumanterbaru'] = $this->m_pengumuman->get_pengumuman_terbaru();
        $x['populer'] = $this->m_berita->get_berita_populer();
        $x['beritaterbaru'] = $this->m_berita->get_berita_terbaru();

        $x['iden'] = $this->m_identitas->get_all_identitas();
        $x['identitas'] = $this->m_identitas->get_all_identitas();

        if (!empty($this->input->post())) {
            $nik = $this->input->post('nik');
            $cpen = $this->m_penduduk->get_penduduk($nik)->num_rows();
            if ($cpen > 0) {
                $x['nik'] = $nik;
            } else {
                $this->session->set_flashdata('error', 'NIK tidak terdaftar.');
                redirect('form/register');
            }
        } else {
            $x['nik'] = null;
        }

        $this->load->view('v_form_register', $x);
    }

    public function registeraction()
    {
        if ($this->session->has_userdata('auth_penduduk')) {
            redirect('form');
        }

        /**
         * 
         * Load Dependency
         */
        $this->load->library('form_validation');
        $this->load->helper('security');

        /**
         * Validation Rules
         * 
         */
        $this->form_validation->set_rules('no_ktp', 'Nomor KTP', 'required|numeric|min_length[6]|is_unique[tb_user_penduduk.no_ktp]');
        $this->form_validation->set_rules('dimana_anda_lahir', 'Dimana anda lahir', 'required');
        $this->form_validation->set_rules('siapa_nama_sahabat_anda', 'Siapa nama sahabat anda', 'required');
        $this->form_validation->set_rules('password', 'Password', 'required|min_length[6]');

        if ($this->form_validation->run() == false) {

            /**
             * Failed Validation
             * 
             */
            $this->session->set_flashdata('error', validation_errors());
            $this->session->set_flashdata('old_input', $this->input->post());

            redirect('form/register');
        } else {

            /**
             * Password Confirmation not match
             * 
             */
            if ($this->input->post('password') != $this->input->post('password_confirmation')) {
                $this->session->set_flashdata('error', 'Password konfirmasi tidak cocok');
                $this->session->set_flashdata('old_input', $this->input->post());

                redirect('form/register');
            }

            /**
             * Create User Penduduk
             * 
             */

            $pen = $this->m_penduduk->get_penduduk($this->input->post('no_ktp'))->row();

            $this->db->insert('tb_user_penduduk', [
                'nama_lengkap' => $pen->nama,
                'no_ktp' => $this->input->post('no_ktp'),
                'dimana_anda_lahir' => trim(strtolower($this->input->post('dimana_anda_lahir'))),
                'siapa_nama_sahabat_anda' => trim(strtolower($this->input->post('siapa_nama_sahabat_anda'))),
                'password' => password_hash($this->input->post('password'), PASSWORD_DEFAULT),
            ]);

            $this->session->set_flashdata('success', 'Registrasi berhasil');

            redirect('form/login');
        }
    }

    public function loginaction()
    {
        if ($this->session->has_userdata('auth_penduduk')) {
            redirect('form');
        }

        /**
         * 
         * Load Dependency
         */
        $this->load->library('form_validation');
        $this->load->helper('security');

        /**
         * Validation Rules
         * 
         */
        $this->form_validation->set_rules('no_ktp', 'Nomor KTP', 'required');
        $this->form_validation->set_rules('password', 'Password', 'required');

        if ($this->form_validation->run() == false) {

            /**
             * Failed Validation
             * 
             */
            $this->session->set_flashdata('error', validation_errors());
            $this->session->set_flashdata('old_input', $this->input->post());

            redirect('form/login');
        } else {
            if (!$rowPenduduk = $this->M_userpenduduk->findByNoKTP($this->input->post('no_ktp'))) {
                $this->session->set_flashdata('error', 'No KTP tidak ditemukan');
                $this->session->set_flashdata('old_input', $this->input->post());

                redirect('form/login');
            }

            if (!password_verify($this->input->post('password'), $rowPenduduk->password)) {
                $this->session->set_flashdata('error', 'No KTP dan password tidak cocok');
                $this->session->set_flashdata('old_input', $this->input->post());

                redirect('form/login');
            }

            $this->session->set_userdata('auth_penduduk', $rowPenduduk);
            redirect('form');
        }
    }


    /**
     * @param int $number
     * @return string
     */
    public function numberToRomanRepresentation($number)
    {
        $map = array('M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400, 'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40, 'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1);
        $returnValue = '';
        while ($number > 0) {
            foreach ($map as $roman => $int) {
                if ($number >= $int) {
                    $number -= $int;
                    $returnValue .= $roman;
                    break;
                }
            }
        }
        return $returnValue;
    }

    function downloadsurat()
    {
        if (!$this->session->has_userdata('auth_penduduk')) {
            if ($this->session->userdata('masuk') != TRUE) {
                $url = base_url('administrator');
                redirect($url);
            } else {
                redirect('form/login');
            }
        }

        $kode = $this->input->get('kode');
        $surat = $this->m_layanansurat_penduduk->get_layanansurat($kode)->row();
        $pengaturan = $this->m_pengaturan_layanan_surat->firstData()->row_array();
        // var_dump($surat);

        if ($surat->letter_category == 'surat_keterangan_tidak_mampu') {
            $nomorSurat = "400/" . ($this->db->query("SELECT * FROM tb_form WHERE letter_category = 'surat_keterangan_tidak_mampu'")->num_rows()) . "/SKTM-KM/" . $this->numberToRomanRepresentation(date('m')) . "/" . date('Y');
        } elseif ($surat->letter_category == 'surat_keterangan_domisili') {
            $nomorSurat = "470/" . ($this->db->query("SELECT * FROM tb_form WHERE letter_category = 'surat_keterangan_domisili'")->num_rows()) . "/SKD-KM/" . $this->numberToRomanRepresentation(date('m')) . "/" . date('Y');
        } elseif ($surat->letter_category == 'surat_keterangan_kematian') {
            $nomorSurat = "140/" . ($this->db->query("SELECT * FROM tb_form WHERE letter_category = 'surat_keterangan_kematian'")->num_rows()) . "/SKK-KM/" . $this->numberToRomanRepresentation(date('m')) . "/" . date('Y');
        } elseif ($surat->letter_category == 'surat_keterangan_kelahiran') {
            $nomorSurat = "470/" . ($this->db->query("SELECT * FROM tb_form WHERE letter_category = 'surat_keterangan_kelahiran'")->num_rows()) . "/SKK-PEM-KM/" . $this->numberToRomanRepresentation(date('m')) . "/" . date('Y');
        } elseif ($surat->letter_category == 'surat_keterangan_penghasilan_orang_tua') {
            $nomorSurat = "147/" . ($this->db->query("SELECT * FROM tb_form WHERE letter_category = 'surat_keterangan_penghasilan_orang_tua'")->num_rows()) . "/SPOT-KM/" . $this->numberToRomanRepresentation(date('m')) . "/" . date('Y');
        } elseif ($surat->letter_category == 'surat_pengantar_berkelakuan_baik') {
            $nomorSurat = "140/" . ($this->db->query("SELECT * FROM tb_form WHERE letter_category = 'surat_pengantar_berkelakuan_baik'")->num_rows()) . "/SBK-KM/" . $this->numberToRomanRepresentation(date('m')) . "/" . date('Y');
        } elseif ($surat->letter_category == 'surat_pernyataan_belum_menikah') {
            $nomorSurat = "147/" . ($this->db->query("SELECT * FROM tb_form WHERE letter_category = 'surat_pernyataan_belum_menikah'")->num_rows()) . "/SPBM-KM/" . $this->numberToRomanRepresentation(date('m')) . "/" . date('Y');
        }
        // var_dump($surat);
        if ($surat->letter_category == 'surat_keterangan_tidak_mampu') {
            $html = "
            <table>
                <tr>
                    <td>
                    </td>
                    <td>
                        
                    </td>
                </tr>
            </table>

            <div style='position: relative'>
            <h3 style='text-align: center;'>PEMERINTAH  KABUPATEN  KATINGAN</h3>
            <h3 style='text-align: center; margin-top: -1rem'>KECAMATAN  MENDAWAI</h3>
            <h2 style='text-align: center; margin-top: -1rem'>DESA KAMPUNG MELAYU</h2>
            <p style='text-align: center; margin-top: -1rem'>Alamat :Desa Kampung Melayu Rt.002 Rw.001 Kode Pos 74464</p>
            </div>

            <img style='position: absolute; top: 1.8rem; left: 1rem; width: 75px' src='" . $this->encode_img_base64(__DIR__ . '/../../assetss/pdf/logo-min.png') . "' />
            <div style='width: 100%; height: 4px; background: #111'>
            </div>

            <h3 style='text-align: center; text-decoration: underline'>" . strtoupper(str_replace('_', ' ', $surat->letter_category)) . "</h3>
            <p style='text-align: center; margin-top: -1rem'>Nomor : " . $nomorSurat . "</p>
            <p>Yang Bertanda Tangan Dibawah ini Kepala Desa Kampung Melayu, Kecamatan Mendawai, Kabupaten Katingan, menerangkan dengan sebenarnya, bahwa:</p>
            <table>
                <tr>
                    <td style='padding-bottom: .8rem'>Nama</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->name . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>NIK</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->nik . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Jenis Kelamin</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . ($surat->gender == 'L' ? 'Laki-laki' : 'Perempuan') . "</td>
                </tr>
                <tr>
                    <td style='padding-right: 1rem; padding-bottom: .8rem'>Tempat/Tanggal Lahir</td>
                    <td style='padding-bottom: .8rem; padding-right: .3rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->pob . ", " . date('d-m-Y', strtotime($surat->dob)) . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Warga Negara</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->warga_negara . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Agama</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->religion . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Pekerjaan</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->job . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Alamat</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->address . "</td>
                </tr>
            </table>
            <p style='line-height: 1.5rem'>Nama tersebut diatas adalah benar warga Desa Kampung Melayu, Kecamatan Mendawai, Kabupaten Katingan. Berdasarkan keterangan yang ada pada kami bahwa yang bersangkutan <b>benar</b> termasuk kategori Keluarga <b>Tidak Mampu</b>.</p>
            <p style='line-height: 1.5rem'>Surat keterangan tidak mampu ini diberikan untuk <b>Digunakan Untuk</b> " . $surat->melengkapi_persyaratan . " <b>a.n</b> " . $surat->name . "</p>
            <p style='line-height: 1.5rem; margin-top: 1rem'>Demikian surat keterangan ini dibuat agar dapat dipergunakan sebagaimana mestinya.</p>
            <table style='width: 100%'>
                <tr style='width: 100%'>
                    <td style='width: 50%'>
                    </td>
                    <td style='width: 50%'>
                        <table>
                            <tr>
                                <td>Dibuat  di</td>
                                <td style='padding-left: .5rem; padding-right: .5rem'>:</td>
                                <td>Kampung Melayu</td>
                            </tr>
                            <tr>
                                <td>Pada  Tanggal</td>
                                <td style='padding-left: .5rem; padding-right: .5rem'>:</td>
                                <td>" . date('d-m-Y') . "</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style='width: 100%'>
                    <td style='width: 50%'>
                    </td>
                    <td style='width: 50%'>
                        <h5 style='text-align: center'>" . $pengaturan['jabatan_penandatangan_surat'] . "</h5>
                    </td>
                </tr> " .
                ($surat->ttd ? "<img style='position: absolute; bottom: 5rem; right: 7rem; width: 120px' src='" . $this->encode_img_base64(__DIR__ . '/../../uploads/' . $surat->ttd) . "' /> " : "")
                . " <tr style='width: 100%'>
                    <td style='width: 50%'>
                    </td>
                    <td style='width: 50%'>
                        <h5 style='text-align: center; margin-top: 4rem'>" . $pengaturan['nama_penandatangan_surat'] . "</h5>
                        <h5 style='text-align: center; margin-top: -1rem'>NIP." . $pengaturan['nomor_nip_penandatangan_surat'] . "</h5>
                    </td>
                </tr>
            </table>
        ";

            generate_pdf($html, 'surat_keterangan_tidak_mampu', 'A4', 'portrait');
        } elseif ($surat->letter_category == 'surat_keterangan_kelahiran') {
            $html = "<table>
                  <tr>
                      <td>
                      </td>
                      <td>
                          
                      </td>
                  </tr>
              </table>

              <div style='position: relative'>
              <h3 style='text-align: center;'>PEMERINTAH  KABUPATEN  KATINGAN</h3>
              <h3 style='text-align: center; margin-top: -1rem'>KECAMATAN  MENDAWAI</h3>
              <h2 style='text-align: center; margin-top: -1rem'>DESA KAMPUNG MELAYU</h2>
              <p style='text-align: center; margin-top: -1rem'>Alamat : Desa Kampung Melayu Rt.002 Rw.001 Kode Pos 74464</p>
              </div>

              <img style='position: absolute; top: 1.8rem; left: 1rem; width: 75px' src='" . $this->encode_img_base64(__DIR__ . '/../../assetss/pdf/logo-min.png') . "' />
              <div style='width: 100%; height: 4px; background: #111'>
              </div>

              <h3 style='text-align: center; text-decoration: underline'>" . strtoupper(str_replace('_', ' ', $surat->letter_category)) . "</h3>
              <p style='text-align: center; margin-top: -1rem'>Nomor : " . $nomorSurat . "</p>
              <p>Kepala Desa Kampung Melayu Kecamatan Mendawai Kabupaten Katingan, dengan ini menerangkan:</p>
              <table>
                  <tr>
                      <td style='padding-bottom: .8rem'>Nama</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->name . "</td>
                  </tr>
                  <tr>
                      <td style='padding-right: 1rem; padding-bottom: .8rem'>Tempat/Tanggal Lahir</td>
                      <td style='padding-bottom: .8rem; padding-right: .3rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->pob . ", " . date('d-m-Y', strtotime($surat->dob)) . "</td>
                  </tr>
                  <tr>
                      <td style='padding-bottom: .8rem'>Jenis Kelamin</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . ($surat->gender == 'L' ? 'Laki-laki' : 'Perempuan') . "</td>
                  </tr>
                  <tr>
                      <td style='padding-bottom: .8rem'>Agama</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->religion . "</td>
                  </tr>
                  <tr>
                      <td style='padding-bottom: .8rem'>Alamat</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->address . "</td>
                  </tr>
              </table>

              <p style='margin-top: 1.5rem; margin-bottom: 1.5rem'>Orang tersebut diatas adalah anak dari: </p>

              <table>
                  <tr>
                      <td style='padding-bottom: .8rem'>Nama Ibu</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->nama_ibu . "</td>
                  </tr>
                  <tr>
                      <td style='padding-bottom: .8rem'>Nama Ayah</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->nama_ayah . "</td>
                  </tr>
              </table>

              <p style='line-height: 1.5rem; margin-top: 1rem'>Demikianlah surat keterangan kelahiran ini kami buat dengan sebenarnya dan dapat dipergunakan sebagaimana mestinya.</p>
              <table style='width: 100%'>
                  <tr style='width: 100%'>
                      <td style='width: 50%'>
                      </td>
                      <td style='width: 50%'>
                          <table>
                              <tr>
                                  <td>Dibuat  di</td>
                                  <td style='padding-left: .5rem; padding-right: .5rem'>:</td>
                                  <td>Kampung Melayu</td>
                              </tr>
                              <tr>
                                  <td>Pada  Tanggal</td>
                                  <td style='padding-left: .5rem; padding-right: .5rem'>:</td>
                                  <td>" . date('d-m-Y') . "</td>
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr style='width: 100%'>
                      <td style='width: 50%'>
                      </td>
                      <td style='width: 50%'>
                          <h5 style='text-align: center'>" . $pengaturan['jabatan_penandatangan_surat'] . "</h5>
                      </td>
                  </tr>" .
                ($surat->ttd ? "<img style='position: absolute; bottom: 12rem; right: 7rem; width: 120px' src='" . $this->encode_img_base64(__DIR__ . '/../../uploads/' . $surat->ttd) . "' /> " : "")
                . "
                  <tr style='width: 100%'>
                      <td style='width: 50%'>
                      </td>
                      <td style='width: 50%'>
                          <h5 style='text-align: center; margin-top: 4rem'>" . $pengaturan['nama_penandatangan_surat'] . "</h5>
                          <h5 style='text-align: center; margin-top: -1rem'>NIP." . $pengaturan['nomor_nip_penandatangan_surat'] . "</h5>
                      </td>
                  </tr>
              </table>
          ";
            generate_pdf($html, 'surat_keterangan_kelahiran', 'A4', 'portrait');
        } elseif ($surat->letter_category == 'surat_keterangan_domisili') {
            $html = "
            <table>
                <tr>
                    <td>
                    </td>
                    <td>
                        
                    </td>
                </tr>
            </table>

            <div style='position: relative'>
            <h3 style='text-align: center;'>PEMERINTAH  KABUPATEN  KATINGAN</h3>
            <h3 style='text-align: center; margin-top: -1rem'>KECAMATAN  MENDAWAI</h3>
            <h2 style='text-align: center; margin-top: -1rem'>DESA KAMPUNG MELAYU</h2>
            <p style='text-align: center; margin-top: -1rem'>Alamat : Desa Kampung Melayu Rt.002 Rw.001 Kode Pos 74464</p>
            </div>

            <img style='position: absolute; top: 1.8rem; left: 1rem; width: 75px' src='" . $this->encode_img_base64(__DIR__ . '/../../assetss/pdf/logo-min.png') . "' />
            <div style='width: 100%; height: 4px; background: #111'>
            </div>

            <h3 style='text-align: center; text-decoration: underline'>" . strtoupper(str_replace('_', ' ', $surat->letter_category)) . "</h3>
            <p style='text-align: center; margin-top: -1rem'>Nomor : " . $nomorSurat . "</p>
            <p>Kepala Desa Kampung Melayu, Kecamatan Mendawai, Kabupaten Katingan. dengan ini menerangkan:</p>
            <table>
                <tr>
                    <td style='padding-bottom: .8rem'>Nama</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->name . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>NIK</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->nik . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Jenis Kelamin</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . ($surat->gender == 'L' ? 'Laki-laki' : 'Perempuan') . "</td>
                </tr>
                <tr>
                    <td style='padding-right: 1rem; padding-bottom: .8rem'>Tempat/Tanggal Lahir</td>
                    <td style='padding-bottom: .8rem; padding-right: .3rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->pob . ", " . date('d-m-Y', strtotime($surat->dob)) . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Agama</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->religion . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Pekerjaan</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->job . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Alamat</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->address . "</td>
                </tr>
            </table>
            <p style='line-height: 1.5rem'>Yang bersangkutan  adalah  benar  Penduduk dan berdomisili Di " . $surat->address . ".</p>
            <p style='line-height: 1.5rem; margin-top: 1rem'>Demikian  surat  Keterangan Domisili ini di buat dan diberikan mengingat KTP yang bersangkutan masih dalam proses pengurusan dan untuk dapat dipergunakan sebagaimana mestinya..</p>
            <table style='width: 100%'>
                <tr style='width: 100%'>
                    <td style='width: 50%'>
                    </td>
                    <td style='width: 50%'>
                        <table>
                            <tr>
                                <td>Dibuat  di</td>
                                <td style='padding-left: .5rem; padding-right: .5rem'>:</td>
                                <td>Kampung Melayu</td>
                            </tr>
                            <tr>
                                <td>Pada  Tanggal</td>
                                <td style='padding-left: .5rem; padding-right: .5rem'>:</td>
                                <td>" . date('d-m-Y') . "</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style='width: 100%'>
                    <td style='width: 50%'>
                    </td>
                    <td style='width: 50%'>
                        <h5 style='text-align: center'>" . $pengaturan['jabatan_penandatangan_surat'] . "</h5>
                    </td>
                </tr> " .
                ($surat->ttd ? "<img style='position: absolute;  bottom: 14rem; right: 7rem; width: 120px'src='" . $this->encode_img_base64(__DIR__ . '/../../uploads/' . $surat->ttd) . "' /> " : "")
                . "
                <tr style='width: 100%'>
                    <td style='width: 50%'>
                    </td>
                    <td style='width: 50%'>
                        <h5 style='text-align: center; margin-top: 4rem'>" . $pengaturan['nama_penandatangan_surat'] . "</h5>
                        <h5 style='text-align: center; margin-top: -1rem'>NIP." . $pengaturan['nomor_nip_penandatangan_surat'] . "</h5>
                    </td>
                </tr>
            </table>
          ";

            generate_pdf($html, 'surat_keterangan_domisili', 'A4', 'portrait');
        } elseif ($surat->letter_category == 'surat_keterangan_kematian') {
            $html = "
            <table>
                <tr>
                    <td>
                    </td>
                    <td>
                        
                    </td>
                </tr>
            </table>

            <div style='position: relative'>
            <h3 style='text-align: center;'>PEMERINTAH  KABUPATEN  KATINGAN</h3>
            <h3 style='text-align: center; margin-top: -1rem'>KECAMATAN  MENDAWAI</h3>
            <h2 style='text-align: center; margin-top: -1rem'>DESA KAMPUNG MELAYU</h2>
            <p style='text-align: center; margin-top: -1rem'>Alamat : Desa Kampung Melayu Rt.002 Rw.001 Kode Pos 74464</p>
            </div>

            <img style='position: absolute; top: 1.8rem; left: 1rem; width: 75px' src='" . $this->encode_img_base64(__DIR__ . '/../../assetss/pdf/logo-min.png') . "' />
            <div style='width: 100%; height: 4px; background: #111'>
            </div>

            <h3 style='text-align: center; text-decoration: underline'>" . strtoupper(str_replace('_', ' ', $surat->letter_category)) . "</h3>
            <p style='text-align: center; margin-top: -1rem'>Nomor : " . $nomorSurat . "</p>
            <p>Kepala Desa Kampung Melayu, Kecamatan Mendawai, Kabupaten Katingan, dengan ini menerangkan:</p>
            <table>
                <tr>
                    <td style='padding-bottom: .8rem'>Nama</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->name . "</td>
                </tr>
                <tr>
                    <td style='padding-right: 1rem; padding-bottom: .8rem'>Tempat/Tanggal Lahir</td>
                    <td style='padding-bottom: .8rem; padding-right: .3rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->pob . ", " . date('d-m-Y', strtotime($surat->dob)) . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Jenis Kelamin</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . ($surat->gender == 'L' ? 'Laki-laki' : 'Perempuan') . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Nama Ibu</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->nama_ibu . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Nama Ayah</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->nama_ayah . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Agama</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->religion . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Alamat</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->address . "</td>
                </tr>
            </table>

            <p style='margin-top: 1.5rem; margin-bottom: 1.5rem'>Telah Meninggal dunia pada: </p>

            <table>
                <tr>
                    <td style='padding-bottom: .8rem'>Hari</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->hari_meninggal . "</td>
                </tr>
                <tr>
                    <td style='padding-right: 1rem; padding-bottom: .8rem'>Tanggal</td>
                    <td style='padding-bottom: .8rem; padding-right: .3rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->tanggal_meninggal . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Pukul</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->jam_meninggal . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Bertempat di</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->bertempat_di . "</td>
                </tr>
            </table>

            <p style='line-height: 1.5rem; margin-top: 1rem'>Demikian surat keterangan ini di buat untuk dipergunakan sebagaimana  mestinya.</p>
            <table style='width: 100%'>
                <tr style='width: 100%'>
                    <td style='width: 50%'>
                    </td>
                    <td style='width: 50%'>
                        <table>
                            <tr>
                                <td>Dibuat  di</td>
                                <td style='padding-left: .5rem; padding-right: .5rem'>:</td>
                                <td>Kampung Melayu</td>
                            </tr>
                            <tr>
                                <td>Pada  Tanggal</td>
                                <td style='padding-left: .5rem; padding-right: .5rem'>:</td>
                                <td>" . date('d-m-Y') . "</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style='width: 100%'>
                    <td style='width: 50%'>
                    </td>
                    <td style='width: 50%'>
                        <h5 style='text-align: center'>" . $pengaturan['jabatan_penandatangan_surat'] . "</h5>
                    </td>
                </tr>" .
                ($surat->ttd ? "<img style='position: absolute;  bottom: 5rem; right: 7rem; width: 120px' src='" . $this->encode_img_base64(__DIR__ . '/../../uploads/' . $surat->ttd) . "' /> " : "")
                . "
                <tr style='width: 100%'>
                    <td style='width: 50%'>
                    </td>
                    <td style='width: 50%'>
                        <h5 style='text-align: center; margin-top: 4rem'>" . $pengaturan['nama_penandatangan_surat'] . "</h5>
                        <h5 style='text-align: center; margin-top: -1rem'>NIP." . $pengaturan['nomor_nip_penandatangan_surat'] . "</h5>
                    </td>
                </tr>
            </table>
        ";
            generate_pdf($html, 'surat_keterangan_kematian', 'A4', 'portrait');
        } elseif ($surat->letter_category == 'surat_keterangan_penghasilan_orang_tua') {
            $html = "
              <table>
                  <tr>
                      <td>
                      </td>
                      <td>
                          
                      </td>
                  </tr>
              </table>

              <div style='position: relative'>
              <h3 style='text-align: center;'>PEMERINTAH  KABUPATEN  KATINGAN</h3>
              <h3 style='text-align: center; margin-top: -1rem'>KECAMATAN  MENDAWAI</h3>
              <h2 style='text-align: center; margin-top: -1rem'>DESA KAMPUNG MELAYU</h2>
              <p style='text-align: center; margin-top: -1rem'>Alamat : Desa Kampung Melayu Rt.002 Rw.001 Kode Pos 74464</p>
              </div>

              <img style='position: absolute; top: 1.8rem; left: 1rem; width: 75px' src='" . $this->encode_img_base64(__DIR__ . '/../../assetss/pdf/logo-min.png') . "' />
              <div style='width: 100%; height: 4px; background: #111'>
              </div>

              <h3 style='text-align: center; text-decoration: underline'>" . strtoupper(str_replace('_', ' ', $surat->letter_category)) . "</h3>
              <p style='text-align: center; margin-top: -1rem'>Nomor : " . $nomorSurat . "</p>
              <p>Kepala Desa Kampung Melayu, Kecamatan Mendawai, Kabupaten Katingan, dengan ini menerangkan:</p>
              <table>
                  <tr>
                      <td style='padding-bottom: .8rem'>Nama</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->name . "</td>
                  </tr>
                  <tr>
                      <td style='padding-bottom: .8rem'>NIK</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->nik . "</td>
                  </tr>
                  <tr>
                      <td style='padding-bottom: .8rem'>Jenis Kelamin</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . ($surat->gender == 'L' ? 'Laki-laki' : 'Perempuan') . "</td>
                  </tr>
                  <tr>
                      <td style='padding-right: 1rem; padding-bottom: .8rem'>Tempat/Tanggal Lahir</td>
                      <td style='padding-bottom: .8rem; padding-right: .3rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->pob . ", " . date('d-m-Y', strtotime($surat->dob)) . "</td>
                  </tr>
                  <tr>
                      <td style='padding-bottom: .8rem'>Pekerjaan</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->job . "</td>
                  </tr>
                  <tr>
                      <td style='padding-bottom: .8rem'>Status Pernikahan</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->marital_status . "</td>
                  </tr>
                  <tr>
                      <td style='padding-bottom: .8rem'>Alamat</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->address . "</td>
                  </tr>
              </table>

              <p style='line-height: 1.5rem; margin-top: 1rem'>Nama tersebut diatas adalah benar warga Desa Kampung Melayu, Kecamatan Mendawai, Kabupaten Katingan. Berdasarkan keterangan yang ada pada kami benar bahwa yang bersangkutan tergolong keluarga yang tidak mampu.</p>
              <p style='line-height: 1.5rem; margin-top: 1rem'>Surat Keterangan ini dibuat untuk " . $surat->melengkapi_persyaratan . "</p>
              <p style='line-height: 1.5rem; margin-top: 1rem'>Demikian surat keterangan ini dibuat, atas perhatian dan kerjasamanya kami ucapkan terima kasih.</p>
              
              <table style='width: 100%'>
                  <tr style='width: 100%'>
                      <td style='width: 50%'>
                      </td>
                      <td style='width: 50%'>
                          <table>
                              <tr>
                                  <td>Dibuat  di</td>
                                  <td style='padding-left: .5rem; padding-right: .5rem'>:</td>
                                  <td>Kampung Melayu</td>
                              </tr>
                              <tr>
                                  <td>Pada  Tanggal</td>
                                  <td style='padding-left: .5rem; padding-right: .5rem'>:</td>
                                  <td>" . date('d-m-Y') . "</td>
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr style='width: 100%'>
                      <td style='width: 50%'>
                      </td>
                      <td style='width: 50%'>
                          <h5 style='text-align: center'>" . $pengaturan['jabatan_penandatangan_surat'] . "</h5>
                      </td>
                  </tr>" .
                ($surat->ttd ? "<img style='position: absolute;  bottom: 10rem; right: 7rem; width: 120px' src='" . $this->encode_img_base64(__DIR__ . '/../../uploads/' . $surat->ttd) . "' /> " : "")
                . "
                  <tr style='width: 100%'>
                      <td style='width: 50%'>
                      </td>
                      <td style='width: 50%'>
                          <h5 style='text-align: center; margin-top: 4rem'>" . $pengaturan['nama_penandatangan_surat'] . "</h5>
                          <h5 style='text-align: center; margin-top: -1rem'>NIP." . $pengaturan['nomor_nip_penandatangan_surat'] . "</h5>
                      </td>
                  </tr>
              </table>
          ";
            generate_pdf($html, 'surat_keterangan_penghasilan_orang_tua', 'A4', 'portrait');
        } elseif ($surat->letter_category == 'surat_pengantar_berkelakuan_baik') {
            $html = "
            <table>
                <tr>
                    <td>
                    </td>
                    <td>
                        
                    </td>
                </tr>
            </table>

            <div style='position: relative'>
            <h3 style='text-align: center;'>PEMERINTAH  KABUPATEN  KATINGAN</h3>
            <h3 style='text-align: center; margin-top: -1rem'>KECAMATAN  MENDAWAI</h3>
            <h2 style='text-align: center; margin-top: -1rem'>DESA KAMPUNG MELAYU</h2>
            <p style='text-align: center; margin-top: -1rem'>Alamat : Desa Kampung Melayu Rt.002 Rw.001 Kode Pos 74464</p>
            </div>

            <img style='position: absolute; top: 1.8rem; left: 1rem; width: 75px' src='" . $this->encode_img_base64(__DIR__ . '/../../assetss/pdf/logo-min.png') . "' />
            <div style='width: 100%; height: 4px; background: #111'>
            </div>

            <h3 style='text-align: center; text-decoration: underline'>" . strtoupper(str_replace('_', ' ', $surat->letter_category)) . "</h3>
            <p style='text-align: center; margin-top: -1rem'>Nomor : " . $nomorSurat . "</p>
            <p>Yang Bertanda Tangan di Bawah ini Kepala Desa Kampung Melayu Menerangkan Bahwa :</p>
            <table>
                <tr>
                    <td style='padding-bottom: .8rem'>Nama</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->name . "</td>
                </tr>
                <tr>
                    <td style='padding-right: 1rem; padding-bottom: .8rem'>Tempat/Tanggal Lahir</td>
                    <td style='padding-bottom: .8rem; padding-right: .3rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->pob . ", " . date('d-m-Y', strtotime($surat->dob)) . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Agama</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->religion . "</td>
                </tr>
                <tr>
                    <td style='padding-bottom: .8rem'>Keperluan</td>
                    <td style='padding-bottom: .8rem'>:</td>
                    <td style='padding-bottom: .8rem'>" . $surat->keperluan . "</td>
                </tr>
            </table>

            <p style='line-height: 1.5rem; margin-top: 1rem'>Menurut Sepengetahuan Kami bahwa namanya tersebut diatas selama tinggal didesa Kampung Melayu Tidak pernah melakukan tindakan/perbuatan yang melanggar hukum atau melanggar aturan serta undang-undang Negara dan Hukum adat yang  berlaku.</p>
            <p style='line-height: 1.5rem; margin-top: 1rem'>Demikian surat Pernyataan ini dibuat, atas perhatian dan kerjasamanya kami ucapkan terimakasih.</p>
            
            <table style='width: 100%'>
                <tr style='width: 100%'>
                    <td style='width: 50%'>
                    </td>
                    <td style='width: 50%'>
                        <table>
                            <tr>
                                <td>Dibuat  di</td>
                                <td style='padding-left: .5rem; padding-right: .5rem'>:</td>
                                <td>Kampung Melayu</td>
                            </tr>
                            <tr>
                                <td>Pada  Tanggal</td>
                                <td style='padding-left: .5rem; padding-right: .5rem'>:</td>
                                <td>" . date('d-m-Y') . "</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style='width: 100%'>
                    <td style='width: 50%'>
                    </td>
                    <td style='width: 50%'>
                        <h5 style='text-align: center'>" . $pengaturan['jabatan_penandatangan_surat'] . "</h5>
                    </td>
                </tr>" .
                ($surat->ttd ? "<img style='position: absolute;  bottom: 19rem; right: 7rem; width: 120px' src='" . $this->encode_img_base64(__DIR__ . '/../../uploads/' . $surat->ttd) . "' /> " : "")
                . "
                <tr style='width: 100%'>
                    <td style='width: 50%'>
                    </td>
                    <td style='width: 50%'>
                        <h5 style='text-align: center; margin-top: 4rem'>" . $pengaturan['nama_penandatangan_surat'] . "</h5>
                        <h5 style='text-align: center; margin-top: -1rem'>NIP." . $pengaturan['nomor_nip_penandatangan_surat'] . "</h5>
                    </td>
                </tr>
            </table>
        ";
            generate_pdf($html, 'surat_pengantar_berkelakuan_baik', 'A4', 'portrait');
        } else if ($surat->letter_category == 'surat_pernyataan_belum_menikah') {
            $html = "
              <table>
                  <tr>
                      <td>
                      </td>
                      <td>
                          
                      </td>
                  </tr>
              </table>

              <div style='position: relative'>
              <h3 style='text-align: center;'>PEMERINTAH  KABUPATEN  KATINGAN</h3>
              <h3 style='text-align: center; margin-top: -1rem'>KECAMATAN  MENDAWAI</h3>
              <h2 style='text-align: center; margin-top: -1rem'>DESA KAMPUNG MELAYU</h2>
              <p style='text-align: center; margin-top: -1rem'>Alamat : Desa Kampung Melayu Rt.002 Rw.001 Kode Pos 74464</p>
              </div>

              <img style='position: absolute; top: 1.8rem; left: 1rem; width: 75px' src='" . $this->encode_img_base64(__DIR__ . '/../../assetss/pdf/logo-min.png') . "' />
              <div style='width: 100%; height: 4px; background: #111'>
              </div>

              <h3 style='text-align: center; text-decoration: underline'>" . strtoupper(str_replace('_', ' ', $surat->letter_category)) . "</h3>
              <p style='text-align: center; margin-top: -1rem'>Nomor : " . $nomorSurat . "</p>
              <p>Yang Bertanda Tangan di Bawah ini Kepala Desa Kampung Melayu Menerangkan Bahwa :</p>
              <table>
                  <tr>
                      <td style='padding-bottom: .8rem'>Nama</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->name . "</td>
                  </tr>
                  <tr>
                      <td style='padding-bottom: .8rem'>NIK</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->nik . "</td>
                  </tr>
                  <tr>
                      <td style='padding-bottom: .8rem'>Jenis Kelamin</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . ($surat->gender == 'L' ? 'Laki-laki' : 'Perempuan') . "</td>
                  </tr>
                  <tr>
                      <td style='padding-right: 1rem; padding-bottom: .8rem'>Tempat/Tanggal Lahir</td>
                      <td style='padding-bottom: .8rem; padding-right: .3rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->pob . ", " . date('d-m-Y', strtotime($surat->dob)) . "</td>
                  </tr>
                  <tr>
                      <td style='padding-bottom: .8rem'>Pekerjaan</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->job . "</td>
                  </tr>
                  
                  <tr>
                      <td style='padding-bottom: .8rem'>Alamat</td>
                      <td style='padding-bottom: .8rem'>:</td>
                      <td style='padding-bottom: .8rem'>" . $surat->address . "</td>
                  </tr>
              </table>

              <p style='line-height: 1.5rem; margin-top: 1rem'>Nama tersebut adalah benar warga Desa Kampung Melayu, Kecamatan Mendawai, Kabupaten Katingan, Berdasarkan pernyataan yang bersangkutan " . date('Y-m-d') . ". Dengan ini menerangkan bahwa benar Belum Pernah Menikah dengan siapapun. Surat Keterangan ini dibuat untuk " . $surat->keperluan . ".</p>
              <p style='line-height: 1.5rem; margin-top: 1rem'>Demikian surat ini dibuat, atas perhatian dan kerjasamanya kami ucapkan terima kasih.</p>
              
              <table style='width: 100%'>
                  <tr style='width: 100%'>
                      <td style='width: 50%'>
                      </td>
                      <td style='width: 50%'>
                          <table>
                              <tr>
                                  <td>Dibuat  di</td>
                                  <td style='padding-left: .5rem; padding-right: .5rem'>:</td>
                                  <td>Kampung Melayu</td>
                              </tr>
                              <tr>
                                  <td>Pada  Tanggal</td>
                                  <td style='padding-left: .5rem; padding-right: .5rem'>:</td>
                                  <td>" . date('d-m-Y') . "</td>
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr style='width: 100%'>
                      <td style='width: 50%'>
                      </td>
                      <td style='width: 50%'>
                          <h5 style='text-align: center'>" . $pengaturan['jabatan_penandatangan_surat'] . "</h5>
                      </td>
                  </tr>" .
                ($surat->ttd ? "<img style='position: absolute;  bottom: 15rem; right: 7rem; width: 120px' src='" . $this->encode_img_base64(__DIR__ . '/../../uploads/' . $surat->ttd) . "' /> " : "")
                . "
                  <tr style='width: 100%'>
                      <td style='width: 50%'>
                      </td>
                      <td style='width: 50%'>
                          <h5 style='text-align: center; margin-top: 4rem'>" . $pengaturan['nama_penandatangan_surat'] . "</h5>
                          <h5 style='text-align: center; margin-top: -1rem'>NIP." . $pengaturan['nomor_nip_penandatangan_surat'] . "</h5>
                      </td>
                  </tr>
              </table>
          ";
            generate_pdf($html, 'surat_keterangan_tidak_mampu', 'A4', 'portrait');
        } else {
            redirect('form/list');
        }
    }

    public function pengajuansurat()
    {
        if (!$this->session->has_userdata('auth_penduduk')) {
            redirect('form/login');
        }

        $this->load->library('form_validation');
        $this->load->helper('security');

        try {
            $pengaturan = $this->m_pengaturan_layanan_surat->firstData()->row_array();
            $pen = $this->m_penduduk->get_penduduk($this->session->userdata('auth_penduduk')->no_ktp)->row();
            $data = [
                'tb_user_penduduk_id' => $this->session->userdata('auth_penduduk')->id,
                'nik' => $pen->nik,
                'name' => $pen->nama,
                'no_hp' => $pen->no_hp,
                'letter_category' => $this->input->post('letter_category'),
                'gender' => $pen->jenis_kelamin,
                'pob' => $pen->tempat_lahir,
                'dob' => $pen->tanggal_lahir,
                'job' => $pen->pekerjaan,
                'address' => $pen->alamat,
                'religion' => $pen->agama,
                'marital_status' => $pen->status,
                'warga_negara' => $pen->kewarganegaraan,
                'nama_ibu' => $this->input->post('nama_ibu'),
                'nama_ayah' => $this->input->post('nama_ayah'),
                'photo' => $pen->foto_ktp,
                'isChange' => false,
                'created_at' => date('Y-m-d H:i:s'),
                'melengkapi_persyaratan' => $this->input->post('melengkapi_persyaratan'),
                'hari_meninggal' => $this->input->post('hari_meninggal'),
                'tanggal_meninggal' => $this->input->post('tanggal_meninggal'),
                'jam_meninggal' => $this->input->post('jam_meninggal'),
                'bertempat_di' => $this->input->post('bertempat_di'),
                'keperluan' => $this->input->post('keperluan'),
                'penandatangan' => $pengaturan['nama_penandatangan_surat'],
                'opsi_ttd' => $this->input->post('opsi_ttd')
            ];


            $this->db->insert('tb_form', $data);
            $this->session->set_flashdata('success', 'Data added successfully!');
            redirect('form/list');
        } catch (\Throwable $th) {
            var_dump($th);
            die;
        }
    }

    function ubahpengajuan()
    {
        $kode = $this->input->get('id');
        $surat = $this->m_layanansurat_penduduk->get_layanansurat($kode)->row();

        if ($surat->status != 'Menunggu Persetujuan') {
            return redirect('form/list');
        }

        $x['statis'] = $this->m_statis->get_all_pegawai();
        $x['agendaterbaru'] = $this->m_agenda->get_agenda_terbaru();
        $x['allkate'] = $this->m_kategori->get_all_kategori();
        $x['pengumumanterbaru'] = $this->m_pengumuman->get_pengumuman_terbaru();
        $x['populer'] = $this->m_berita->get_berita_populer();
        $x['beritaterbaru'] = $this->m_berita->get_berita_terbaru();

        $x['iden'] = $this->m_identitas->get_all_identitas();
        $x['identitas'] = $this->m_identitas->get_all_identitas();
        $x['data'] = $surat;

        $this->load->view('v_form_ubah', $x);
    }

    function ubahpengajuanaction()
    {
        $post = $this->input->post();
        $this->db->where('id', $post['id']);
        $this->db->update('tb_form', $post);

        return redirect('form/list');
    }

    function hapuspengajuan()
    {
        $kode = $this->input->get('id');
        $surat = $this->m_layanansurat_penduduk->get_layanansurat($kode)->row();
        if ($surat->status == 'Menunggu Persetujuan') {
            $surat = $this->m_layanansurat_penduduk->hapus_layanansurat($kode);
            $this->session->set_flashdata('success_msg', 'Berhasil menghapus!');
        }

        return redirect('form/list');
    }

    function pengaduan()
    {
        if (!$this->session->has_userdata('auth_penduduk')) {
            redirect('form/login');
        }

        $x['identitas'] = $this->m_identitas->get_all_identitas();

        $this->load->view('v_pengaduan_masyarakat', $x);
    }

    function pengaduanaction()
    {
        if (!$this->session->has_userdata('auth_penduduk') || $this->session->userdata('masuk') != TRUE) {
            if ($this->session->userdata('masuk') != TRUE) {
                $url = base_url('administrator');
                redirect($url);
            } else {
                redirect('form/login');
            }
        }


        $this->load->library('form_validation');
        $this->load->helper('security');

        $this->form_validation->set_rules('judul', 'Judul', 'required');
        $this->form_validation->set_rules('isi', 'Isi', 'required');
        $this->form_validation->set_rules('tgl_kejadian', 'Tanggal Kejadian', 'required');
        $this->form_validation->set_rules('lokasi_kejadian', 'Lokasi Kejadian', 'required');
        $this->form_validation->set_rules('kategori_laporan', 'Kategori Laporan', 'required');

        if ($this->form_validation->run() == false) {
            $this->session->set_flashdata('error', validation_errors());
            $this->session->set_flashdata('old_input', $this->input->post());

            redirect('form/pengaduan');
        } else {
            $data = [
                'user_penduduk' => $this->session->userdata('auth_penduduk')->id,
                'judul' => $this->input->post('judul'),
                'isi' => $this->input->post('isi'),
                'tgl_kejadian' => $this->input->post('tgl_kejadian'),
                'lokasi_kejadian' => $this->input->post('lokasi_kejadian'),
                'kategori_laporan' => $this->input->post('kategori_laporan'),
            ];

            $this->db->insert('tb_pengaduan_masyarakat', $data);

            $this->session->set_flashdata('success', 'Pengaduan telah dikirimkan');

            redirect('pengaduan');
        }
    }

    function encode_img_base64($img_path = false): string
    {
        if ($img_path) {
            $path = $img_path;
            $type = pathinfo($path, PATHINFO_EXTENSION);
            $data = file_get_contents($path);
            return 'data:image/' . $type . ';base64,' . base64_encode($data);
        }
        return '';
    }
}
