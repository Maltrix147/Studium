namespace SimpleWinApp
{
  partial class Form1
  {
    /// <summary>
    /// Erforderliche Designervariable.
    /// </summary>
    private System.ComponentModel.IContainer components = null;

    /// <summary>
    /// Verwendete Ressourcen bereinigen.
    /// </summary>
    /// <param name="disposing">True, wenn verwaltete Ressourcen gelöscht werden sollen; andernfalls False.</param>
    protected override void Dispose(bool disposing)
    {
      if (disposing && (components != null))
      {
        components.Dispose();
      }
      base.Dispose(disposing);
    }

    #region Vom Windows Form-Designer generierter Code

    /// <summary>
    /// Erforderliche Methode für die Designerunterstützung.
    /// Der Inhalt der Methode darf nicht mit dem Code-Editor geändert werden.
    /// </summary>
    private void InitializeComponent()
    {
      this.cmdStart = new System.Windows.Forms.Button();
      this.SuspendLayout();
      // 
      // cmdStart
      // 
      this.cmdStart.Location = new System.Drawing.Point(109, 49);
      this.cmdStart.Name = "cmdStart";
      this.cmdStart.Size = new System.Drawing.Size(75, 23);
      this.cmdStart.TabIndex = 1;
      this.cmdStart.Text = "Start";
      this.cmdStart.UseVisualStyleBackColor = true;
      this.cmdStart.Click += new System.EventHandler(this.cmdStart_Click);
      // 
      // Form1
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(292, 120);
      this.Controls.Add(this.cmdStart);
      this.Name = "Form1";
      this.Text = "Einfache Windows-Anwendung";
      this.ResumeLayout(false);

    }

    #endregion

    private System.Windows.Forms.Button cmdStart;
  }
}

