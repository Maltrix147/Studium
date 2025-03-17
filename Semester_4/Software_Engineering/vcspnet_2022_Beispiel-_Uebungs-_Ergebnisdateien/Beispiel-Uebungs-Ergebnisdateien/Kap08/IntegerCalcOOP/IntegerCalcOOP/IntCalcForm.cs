using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace IntegerCalcOOP
{
  public partial class IntCalcForm : Form
  {
    public IntCalcForm()
    {
      InitializeComponent();
    }

    Rechner rechenoperationen = new Rechner();

    private void init()
    {
      string txt;

      txt = txtZahl1.Text;
      rechenoperationen.Value1 = Int32.Parse(txt);
      txt = txtZahl2.Text;
      rechenoperationen.Value2 = Int32.Parse(txt);
    }

    private void anzeigen(int value)
    {
      string txt;

      txt = value.ToString();
      txtErgebnis.Text = txt;
    }

    private void cmdPlus_Click(object sender, EventArgs e)
    {
      int result;

      init();
      result = rechenoperationen.Plus();  // Berechnung: Addition
      anzeigen(result);
    }

    private void cmdSub_Click(object sender, EventArgs e)
    {
      int result;

      init();
      result = rechenoperationen.Minus();  // Berechnung: Subtraktion
      anzeigen(result);
    }

    private void cmdMult_Click(object sender, EventArgs e)
    {
      int result;

      init();
      result = rechenoperationen.Mult();  // Berechnung: Multiplikation
      anzeigen(result);
    }

    private void cmdDiv_Click(object sender, EventArgs e)
    {
      int result;

      init();
      result = rechenoperationen.Div();  // Berechnung: Division
      anzeigen(result);
    }

    private void cmdMod_Click(object sender, EventArgs e)
    {
      int result;

      init();
      result = rechenoperationen.Modulo();  // Berechnung: Modulo
      anzeigen(result);
    }
  }
}
