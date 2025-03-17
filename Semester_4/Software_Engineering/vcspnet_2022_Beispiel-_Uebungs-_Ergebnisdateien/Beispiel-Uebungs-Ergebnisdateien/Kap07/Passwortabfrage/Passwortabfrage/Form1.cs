using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Passwortabfrage
{
  public partial class Form1 : Form
  {
    public Form1()
    {
      InitializeComponent();
    }

    private void cmdOk_Click(object sender, EventArgs e)
    {
      string txt;
      const string PWAdmin = "ad2013min";
      const string PWUser = "einUser";
      txt = txtEingabe.Text;
      txtEingabe.Clear();

      switch (txt)
      {
        case PWAdmin:
          txtAusgabe.Text = "Sie sind als Administrator angemeldet.";
          break;
        case PWUser:
          txtAusgabe.Text = "Sie haben sich als User angemeldet.";
          break;
        default:
          txtAusgabe.Text = "Sie sind nur als Gast angemeldet.";
          break;
      }
    }
  }
}
