using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace IntegerCalc
{
  public partial class IntCalcForm : Form
  {
    public IntCalcForm()
    {
      InitializeComponent();
    }

    private void cmdPlus_Click(object sender, EventArgs e)
    {
      int zahl1, zahl2, result;
      string txt;

      txt = txtZahl1.Text;
      zahl1 = Int32.Parse(txt);
      txt = txtZahl2.Text;
      zahl2 = Int32.Parse(txt);
      result = zahl1 + zahl2;  // Berechnung: Addition
      txt = result.ToString();

      txtErgebnis.Text = txt;
    }

    private void cmdSub_Click(object sender, EventArgs e)
    {
      int zahl1, zahl2, result;
      string txt;

      txt = txtZahl1.Text;
      zahl1 = Int32.Parse(txt);
      txt = txtZahl2.Text;
      zahl2 = Int32.Parse(txt);
      result = zahl1 - zahl2;  // Berechnung: Subtraktion
      txt = result.ToString();

      txtErgebnis.Text = txt;
    }

    private void cmdMult_Click(object sender, EventArgs e)
    {
      int zahl1, zahl2, result;
      string txt;

      txt = txtZahl1.Text;
      zahl1 = Int32.Parse(txt);
      txt = txtZahl2.Text;
      zahl2 = Int32.Parse(txt);
      result = zahl1 * zahl2;  // Berechnung: Multiplikation
      txt = result.ToString();

      txtErgebnis.Text = txt;
    }

    private void cmdDiv_Click(object sender, EventArgs e)
    {
      int zahl1, zahl2, result;
      string txt;

      txt = txtZahl1.Text;
      zahl1 = Int32.Parse(txt);
      txt = txtZahl2.Text;
      zahl2 = Int32.Parse(txt);
      result = zahl1 / zahl2;  // Berechnung: Division
      txt = result.ToString();

      txtErgebnis.Text = txt;
    }

    private void cmdMod_Click(object sender, EventArgs e)
    {
      int zahl1, zahl2, result;
      string txt;

      txt = txtZahl1.Text;
      zahl1 = Int32.Parse(txt);
      txt = txtZahl2.Text;
      zahl2 = Int32.Parse(txt);
      result = zahl1 % zahl2;  // Berechnung: Modulo
      txt = result.ToString();

      txtErgebnis.Text = txt;
    }
  }
}