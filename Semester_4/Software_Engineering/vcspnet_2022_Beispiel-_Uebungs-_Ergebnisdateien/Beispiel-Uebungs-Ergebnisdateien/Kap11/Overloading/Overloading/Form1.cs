using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Overloading
{
  public partial class Form1 : Form
  {
    Klasse1 instanz;

    public Form1()
    {
      InitializeComponent();
    }

    private void cmdTest_Click(object sender, EventArgs e)
    {
      instanz = new Klasse2();
      lblAusgabe.Text = instanz.Test();
    }

    private void cmdTestInt_Click(object sender, EventArgs e)
    {
      instanz = new Klasse2();
      lblAusgabe.Text = instanz.Test(50);
    }

    private void cmdTestString_Click(object sender, EventArgs e)
    {
      instanz = new Klasse2();
      lblAusgabe.Text = instanz.Test("Test");
    }
  }
}
