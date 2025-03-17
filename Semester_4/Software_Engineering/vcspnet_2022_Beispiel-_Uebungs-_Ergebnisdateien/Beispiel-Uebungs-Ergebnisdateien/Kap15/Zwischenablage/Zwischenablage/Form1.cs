using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Zwischenablage
{
  public partial class Form1 : Form
  {
    public Form1()
    {
      InitializeComponent();
    }

    private void Form1_Load(object sender, EventArgs e)
    {
      textBox1.Text = "Klicken Sie auf die Schaltfläche \"Zwischenablage\" auswerten.";
      textBox1.Show();
      pictureBox1.Hide();
    }

    private void button1_Click(object sender, EventArgs e)
    {
      if (Clipboard.ContainsText())
      {
        textBox1.Text = Clipboard.GetText();
        textBox1.Show();
        pictureBox1.Hide();
      }
      else if (Clipboard.ContainsImage())
      {
        pictureBox1.Image = Clipboard.GetImage();
        textBox1.Hide();
        pictureBox1.Show();
      }
      else
      {
        textBox1.Text = "Die Zwischenablage ist leer oder enthält keinen Text und kein Bild";
        textBox1.Show();
        pictureBox1.Hide();
      }
    }
  }
}
