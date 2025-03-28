﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SimpleEditor
{
  public partial class Form1 : Form
  {
    public Form1()
    {
      InitializeComponent();
    }

    private void button1_Click(object sender, EventArgs e)
    {
      if (openFileDialog1.ShowDialog() == DialogResult.OK)
      {
        string datei = openFileDialog1.FileName;
        this.txtEditor.Text = System.IO.File.ReadAllText(datei);
      }
    }

    private void button2_Click(object sender, EventArgs e)
    {
      if (saveFileDialog1.ShowDialog() == DialogResult.OK)
      {
        string datei = saveFileDialog1.FileName;
        System.IO.File.WriteAllText(datei, this.txtEditor.Text);
      }
    }

    private void button3_Click(object sender, EventArgs e)
    {
      this.Close();
    }
  }
}
