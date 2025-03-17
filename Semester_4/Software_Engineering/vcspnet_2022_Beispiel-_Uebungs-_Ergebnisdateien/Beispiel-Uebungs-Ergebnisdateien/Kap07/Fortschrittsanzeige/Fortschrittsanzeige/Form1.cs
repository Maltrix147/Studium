using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Fortschrittsanzeige
{
  public partial class Form1 : Form
  {
    public Form1()
    {
      InitializeComponent();
    }

    private void cmdReset_Click(object sender, EventArgs e)
    {
      prgBar.Value = 0;
      lblDisplay.Text = "0 Prozent";
      cmdReset.Enabled = false;
    }

    private void cmdClose_Click(object sender, EventArgs e)
    {
      Close();
    }

    private void cmdStart_Click(object sender, EventArgs e)
    {
      const int maxCount = 100;
      int i = 0;
      prgBar.Minimum = 0;
      prgBar.Maximum = maxCount;
      cmdReset.Enabled = false;
      cmdStart.Enabled = false;

      while (i <= maxCount)
      {
        lblDisplay.Text = i.ToString() + " Prozent";
        prgBar.Value = i++;
        /* Alternative
         * prgBar.Value = i;
         * i += 1;
         */

        Application.DoEvents();
        System.Threading.Thread.Sleep(100);
      }

      cmdReset.Enabled = true;
      cmdStart.Enabled = true;
    }
  }
}
