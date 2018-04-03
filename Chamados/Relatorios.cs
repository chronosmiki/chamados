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
    public partial class Relatorios : Form
    {
        public Relatorios()
        {
            InitializeComponent();
        }

        private void Relatorios_Load(object sender, EventArgs e)
        {
            // TODO: esta linha de código carrega dados na tabela 'dsChamados.DataTable1'. Você pode movê-la ou removê-la conforme necessário.
            this.DataTable1TableAdapter.Fill(this.dsChamados.DataTable1);

            this.reportViewer1.RefreshReport();
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }
    }
}
