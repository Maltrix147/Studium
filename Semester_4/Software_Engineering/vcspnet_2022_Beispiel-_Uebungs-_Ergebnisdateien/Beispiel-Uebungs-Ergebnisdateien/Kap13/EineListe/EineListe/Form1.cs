using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace EineListe
{
  public partial class Form1 : Form
  {
    public Form1()
    {
      InitializeComponent();
    }

    private void cmdAdd_Click(object sender, EventArgs e)
    {
      if (!(txtEingabe.Text == ""))
      {
        lstListe.Items.Add(txtEingabe.Text);
      }
    }

    private void cmdErase_Click(object sender, EventArgs e)
    {
	  // zusätzliche Klammern verbessern die Lesbarkeit
      if ((lstListe.Items.Count > 0) && (lstListe.SelectedIndex >= 0))
      {
        lstListe.Items.RemoveAt(lstListe.SelectedIndex);
      }
    }

    private void cmdEraseAll_Click(object sender, EventArgs e)
    {
      lstListe.Items.Clear();
    }

    private void cmdExit_Click(object sender, EventArgs e)
    {
      Close();
    }

    private void chkSorted_CheckedChanged(object sender, EventArgs e)
    {
      lstListe.Sorted = chkSorted.Checked;
    }
  }
}