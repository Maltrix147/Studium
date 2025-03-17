using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Autofahren
{
  public partial class Form1 : Form
  {
    Auto PKW = new Auto();

    public Form1()
    {
      InitializeComponent();
    }

    private void cmdStart_Click(object sender, EventArgs e)
    {
      PKW.Left = 0;
      this.Text = "Geschwindigkeit: " + PKW.Geschwindigkeit.ToString();
    }

    private void Form1_Load(object sender, EventArgs e)
    {
      PKW.Geschwindigkeit = 50;
      PKW.Location = new Point(0, pnlStrasse.Height - 20);
      PKW.Size = new Size(50, 20);
      PKW.Text = "PKW";
      PKW.BackColor = Color.Red;
      pnlStrasse.BackColor = Color.Gray;
      pnlStrasse.Controls.Add(PKW);
      this.Text = "Geschwindigkeit: " + PKW.Geschwindigkeit.ToString();
    }

    private void cmdFahren_Click(object sender, EventArgs e)
    {
      PKW.Fahren(pnlStrasse);
    }

    private void cmdLangsamer_Click(object sender, EventArgs e)
    {
      PKW.Geschwindigkeit -= 10;
      this.Text = "Geschwindigkeit: " + PKW.Geschwindigkeit.ToString();
    }

    private void cmdSchneller_Click(object sender, EventArgs e)
    {
      PKW.Geschwindigkeit += 10;
      this.Text = "Geschwindigkeit: " + PKW.Geschwindigkeit.ToString();
    }

    private void cmdBeenden_Click(object sender, EventArgs e)
    {
      PKW.Geschwindigkeit = 0;
      Close();
    }
  }
}