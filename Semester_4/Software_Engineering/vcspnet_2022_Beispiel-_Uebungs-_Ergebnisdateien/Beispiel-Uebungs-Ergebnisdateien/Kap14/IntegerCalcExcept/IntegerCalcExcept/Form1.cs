using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace IntegerCalcExcept
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
      try
      {
        rechenoperationen.Zahl1 = Int32.Parse(txtZahl1.Text);
        try
        {
          rechenoperationen.Zahl2 = Int32.Parse(txtZahl2.Text);
        }
        catch
        {
          MessageBox.Show("Bitte nur ganze Zahlen eingeben.");
          txtZahl2.Clear();
          txtZahl2.Focus();
        }
      }
      catch
      {
        MessageBox.Show("Bitte nur ganze Zahlen eingeben.");
        txtZahl1.Clear();
        txtZahl1.Focus();
      }
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
      try
      {
        init();
        anzeigen(rechenoperationen.Div());     // Berechnung: Division
      }
      catch (DivideByZeroException)
      {
        MessageBox.Show("Bitte keine Division durch 0.");
        txtZahl2.Clear();
        txtZahl2.Focus();
      }
    }

    private void cmdMod_Click(object sender, EventArgs e)
    {
      try
      {
        init();
        anzeigen(rechenoperationen.Modulo());  // Berechnung: Modulo
      }
      catch (DivideByZeroException)
      {
        MessageBox.Show("Bitte keine Division durch 0.");
        txtZahl2.Clear();
        txtZahl2.Focus();
      }
    }

    private void txtZahl1_Validating(object sender, CancelEventArgs e)
    {
      if (true)//(txtZahl1.TextLength > 0)
        try
        {
          rechenoperationen.Zahl1 = Convert.ToInt32(txtZahl1.Text);
        }
        catch
        {
          MessageBox.Show("Bitte nur ganze Zahlen eingeben.");
          txtZahl1.Clear();
          txtZahl1.Focus();
        }
    }

    private void txtZahl2_Validating(object sender, CancelEventArgs e)
    {
      if (true)//(txtZahl2.TextLength > 0)
      {
        try
        {
          rechenoperationen.Zahl2 = Convert.ToInt32(txtZahl2.Text);
        }
        catch
        {
          MessageBox.Show("Bitte nur ganze Zahlen eingeben.");
          txtZahl2.Clear();
          txtZahl2.Focus();
        }
      }
    }
  }
}
