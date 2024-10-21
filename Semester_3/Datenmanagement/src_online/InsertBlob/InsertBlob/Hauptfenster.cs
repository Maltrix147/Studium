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

namespace InsertBlob {
  public partial class Hauptfenster : Form {
    public Hauptfenster() {
      InitializeComponent();
    }

    private void BttnBild_Click(object sender, EventArgs e) {
      OpenFileDialog dlg = new OpenFileDialog();
      dlg.DefaultExt = "png";
      dlg.Filter = "png-Dateien|*.png|jpg-Dateien|*.jpg|Alle Dateien|*.*";
      if (dlg.ShowDialog() == System.Windows.Forms.DialogResult.OK) {
        MySqlConnection MySqlConn = new MySqlConnection();
        MySqlCommand MySqlCmd = new MySqlCommand();
        String strInsert;
        Int32 iDateigroesse;
        Byte[] binBilddaten;
        FileStream streamDatei;

        MySqlConn.ConnectionString = "server=127.0.0.1";
        MySqlConn.ConnectionString += ";uid=root";
        MySqlConn.ConnectionString += ";pwd=";
        MySqlConn.ConnectionString += ";database=oshop";

        try {
          streamDatei = new FileStream(Path.GetFullPath(dlg.FileName), FileMode.Open, FileAccess.Read);
          if (streamDatei.Length > Int32.MaxValue) {
            throw new Exception("Datei zu gross");
          }
          iDateigroesse = Convert.ToInt32(streamDatei.Length);

          binBilddaten = new byte[iDateigroesse];
          streamDatei.Read(binBilddaten, 0, iDateigroesse);
          streamDatei.Close();

          MySqlConn.Open();

          strInsert = "INSERT INTO ";
          strInsert += " bild (bild, dateiname, dateityp, dateigroesse, artikel_id)";
          strInsert += " VALUES";
          strInsert += "  (@bild, @dateiname, @dateityp, @dateigroesse, 9015)";

          MySqlCmd.Connection = MySqlConn;
          MySqlCmd.CommandText = strInsert;
          MySqlCmd.Parameters.AddWithValue("@dateiname", Path.GetFileName(dlg.FileName));
          MySqlCmd.Parameters.AddWithValue("@dateigroesse", iDateigroesse);
          MySqlCmd.Parameters.AddWithValue("@dateityp", Path.GetExtension(dlg.FileName));
          MySqlCmd.Parameters.AddWithValue("@bild", binBilddaten);

          MySqlCmd.ExecuteNonQuery();

          MessageBox.Show("Und wieder ein neuer Spaten",
              "Spatenbild importiert!", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);

          MySqlConn.Close();
        }
        catch (Exception ex) {
          MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
      }
    }
  }
}
