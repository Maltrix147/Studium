﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Klick
{
  public partial class Form1 : Form
  {
    public Form1()
    {
      InitializeComponent();
    }

    private void cmdKlick_MouseEnter(object sender, EventArgs e)
    {
      MessageBox.Show("Die Maus zeigt auf die Schaltfläche.");
    }
  }
}
