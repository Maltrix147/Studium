using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace IntegerCalcProp
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
      rechenoperationen.Zahl1 = Int32.Parse(txtZahl1.Text);
      rechenoperationen.Zahl2 = Int32.Parse(txtZahl2.Text);
    }

    private void anzeigen(int value)
    {
      txtErgebnis.Text = value.ToString();
    }

    private void cmdPlus_Click(object sender, EventArgs e)
    {
      init();
      anzeigen(rechenoperationen.Plus());    // Berechnung: Addition
    }

    private void cmdSub_Click(object sender, EventArgs e)
    {
      init();
      anzeigen(rechenoperationen.Minus());   // Berechnung: Subtraktion
    }

    private void cmdMult_Click(object sender, EventArgs e)
    {
      init();
      anzeigen(rechenoperationen.Mult());    // Berechnung: Multiplikation
    }

    private void cmdDiv_Click(object sender, EventArgs e)
    {
      init();
      anzeigen(rechenoperationen.Div());     // Berechnung: Division
    }

    private void cmdMod_Click(object sender, EventArgs e)
    {
      init();
      anzeigen(rechenoperationen.Modulo());  // Berechnung: Modulo
    }
  }
}
