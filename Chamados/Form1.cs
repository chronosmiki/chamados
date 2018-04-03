using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Chamados
{
    public partial class Form1 : Form
    {
        DAO dao;
        public Form1()
        {   
            InitializeComponent();
        }

        private void btnSalvar_Click(object sender, EventArgs e)
        {
            dao = new DAO();

            String HR = cbHR.Value.ToString();
            String MM = cbMM.Value.ToString();
            String dataChm = dateTime.Value.Date.ToString("yyyy-MM-dd " + HR +":"+ MM + ":00");
            String solic = txtSolic.Text;
            String chamado = txtChamados.Text;
            String soluc = txtSoluc.Text;
            int tipo = cbTipos.SelectedIndex + 1;
            try
            {
                dao.insereChamado(dataChm, solic, chamado, soluc, tipo);
                MessageBox.Show("Chamado inserido com sucesso!", "Novo Chamado", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }catch(MySqlException ex)
            {
                MessageBox.Show("Erro no BD: " + ex, "ERRO!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            dao = new DAO();
            try
            {
                cbTipos.DataSource = dao.getTipos();
            }catch(MySqlException ex)
            {
                MessageBox.Show("Erro no BD: " + ex, "ERRO!" , MessageBoxButtons.OK, MessageBoxIcon.Error);
            }            
        }

        private void btnLimpar_Click(object sender, EventArgs e)
        {
            txtChamados.Clear();
            txtSolic.Clear();
            txtSoluc.Clear();
            cbTipos.SelectedIndex = 0;
            cbHR.Value = 1;
            cbMM.Value = 0;
        }

        private void sairToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnRSimples_Click(object sender, EventArgs e)
        {
            Relatorios re = new Relatorios();
            re.Show();
        }
    }
}
