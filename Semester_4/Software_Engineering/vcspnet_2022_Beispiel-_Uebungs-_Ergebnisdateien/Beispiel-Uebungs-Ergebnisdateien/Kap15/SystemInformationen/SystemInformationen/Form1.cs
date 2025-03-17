using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SystemInformationen
{
  public partial class Form1 : Form
  {
    public Form1()
    {
      InitializeComponent();
    }

    private void displayInformation()
    {
      dataGridView1.Rows.Add("Betriebsssystem", Environment.OSVersion.VersionString);
      dataGridView1.Rows.Add("Benutzername", Environment.UserName);
      dataGridView1.Rows.Add("Mausrad", SystemInformation.MouseWheelPresent);
      dataGridView1.Rows.Add("Maustasten", SystemInformation.MouseButtons);
      dataGridView1.Rows.Add("Bildschirmauflösung",
          string.Format("{0} x {1}", SystemInformation.PrimaryMonitorSize.Width,
          SystemInformation.PrimaryMonitorSize.Height));
      dataGridView1.Rows.Add("Aktueller Ordner", Environment.CurrentDirectory);
      dataGridView1.Rows.Add("Desktop", Environment.GetFolderPath(Environment.SpecialFolder.Desktop));
      dataGridView1.Rows.Add("Startmenü", Environment.GetFolderPath(Environment.SpecialFolder.StartMenu));
      dataGridView1.Rows.Add("Programme", Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles));
      dataGridView1.Rows.Add("Eigene Dateien", Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments));
    }

    private void Form1_Load(object sender, EventArgs e)
    {
      dataGridView1.ColumnCount = 2;
      displayInformation();
    }
  }
}
