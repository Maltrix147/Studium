using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Zufallszahlen
{
  public partial class Form1 : Form
  {
    public Form1()
    {
      InitializeComponent();
    }

    private void sendToListBox(params int[] elemente)
    {
      lstAusgabe.Items.Clear();

      foreach (int i in elemente)
      {
        lstAusgabe.Items.Add(i.ToString());
      }

      lblAnzahl.Text = elemente.Length.ToString() + " Elemente";
    }

    private void cmdStart_Click(object sender, EventArgs e)
    {
      int anzahl;
      int zahl;
      int[] zahlen;

      Random randomNumbers = new Random();

      anzahl = randomNumbers.Next(20);
      zahlen = new int[anzahl];

      for (int i = 0; i < anzahl; i++)
      {
        zahl = randomNumbers.Next(1, 100);
        zahlen.SetValue(zahl, i);     // oder zahlen[i] = zahl;
      }

      sendToListBox(zahlen);
    }

    private void cmdBeenden_Click(object sender, EventArgs e)
    {
      Close();
    }
  }
}
