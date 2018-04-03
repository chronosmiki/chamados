using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Windows.Forms;
using System.Data;

namespace Chamados
{
    class DAO
    {
        private string server = "localhost";
        private string UserID = "root";
        private string pwd = "Bud@guri18";
        private string DB = "chamados";
        private MySqlConnectionStringBuilder conn_string = new MySqlConnectionStringBuilder();


        public List<String> getTipos()
        {
            conn_string.Server = server;
            conn_string.UserID = UserID;
            conn_string.Password = pwd;
            conn_string.Database = DB;

            List<String> tipos = new List<String>();

            using (MySqlConnection conn = new MySqlConnection(conn_string.ToString()))
            using (MySqlCommand cmd = new MySqlCommand("select * from tipos", conn))
            {
                conn.Open();
                MySqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    tipos.Add(dr.GetString(1));
                }
                dr.Close();
                conn.Close();
            }
            return tipos;
        }

        public void insereChamado(String Data ,String Solic, String Chamado, String Soluc, int tipo)
        {
            conn_string.Server = server;
            conn_string.UserID = UserID;
            conn_string.Password = pwd;
            conn_string.Database = DB;

            using (MySqlConnection conn = new MySqlConnection(conn_string.ToString()))
            {
                conn.Open();

                MySqlCommand cmd = conn.CreateCommand();

                cmd.CommandText = "INSERT INTO chamados (datachamado, solicitante, chamado, solucao, idtipo) VALUES (@datachamado, @solicitante, @chamado, @solucao, @idtipo)";

                cmd.Parameters.AddWithValue("@datachamado", Data);
                cmd.Parameters.AddWithValue("@solicitante", Solic);
                cmd.Parameters.AddWithValue("@chamado", Chamado);
                cmd.Parameters.AddWithValue("@solucao", Soluc);
                cmd.Parameters.AddWithValue("@idtipo", tipo);

                cmd.ExecuteNonQuery();

                conn.Close();
            }
        }

    }
}
