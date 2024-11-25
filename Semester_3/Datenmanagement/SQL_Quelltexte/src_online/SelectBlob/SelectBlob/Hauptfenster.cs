using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.IO;

namespace SelectBlob {
    public partial class Hauptfenster : Form {
        public Hauptfenster() {
            InitializeComponent();
        }

        private void bttnBild_Click(object sender, EventArgs e) {
            FolderBrowserDialog dlg = new FolderBrowserDialog();
            MySqlConnection MySqlConn;
            MySqlCommand MySqlCmd;
            MySqlDataReader MySqlData;

            MySqlConn = new MySql.Data.MySqlClient.MySqlConnection();
            MySqlCmd = new MySql.Data.MySqlClient.MySqlCommand();

            string strSelect;
            Int32 iDateigroesse;
            byte[] binBilddaten;
            FileStream streamDatei;
            string strDateiname;

//            MySqlConn.ConnectionString = "server=10.0.2.2";
            MySqlConn.ConnectionString = "server=127.0.0.1";
            MySqlConn.ConnectionString += ";uid=root";
            MySqlConn.ConnectionString += ";pwd=";
            MySqlConn.ConnectionString += ";database=oshop";

            strSelect = "SELECT bild, dateiname, dateigroesse FROM bild";

            if (dlg.ShowDialog() != DialogResult.OK) {
                return;
            }

            try {
                MySqlConn.Open();

                MySqlCmd.Connection = MySqlConn;
                MySqlCmd.CommandText = strSelect;
                MySqlData = MySqlCmd.ExecuteReader();

                if (!MySqlData.HasRows) {
                    throw new Exception("Es liegen keine Bilddaten vor.");
                }

                while (MySqlData.Read()) {
                    iDateigroesse = MySqlData.GetInt32(MySqlData.GetOrdinal("dateigroesse"));
                    binBilddaten = new byte[iDateigroesse];

                    MySqlData.GetBytes(MySqlData.GetOrdinal("bild"), 0, binBilddaten, 0, iDateigroesse);

                    strDateiname = dlg.SelectedPath + Path.DirectorySeparatorChar + MySqlData.GetString("dateiname");
                    streamDatei = new FileStream(Path.GetFullPath(strDateiname), FileMode.OpenOrCreate, FileAccess.Write);
                    streamDatei.Write(binBilddaten, 0, iDateigroesse);
                    streamDatei.Close();
                    lbDateien.Items.Insert(0, Path.GetFullPath(strDateiname));
                }
               
                MySqlData.Close();
                MySqlConn.Close();
            }
            catch (Exception ex) {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
 
        }
    }
}
