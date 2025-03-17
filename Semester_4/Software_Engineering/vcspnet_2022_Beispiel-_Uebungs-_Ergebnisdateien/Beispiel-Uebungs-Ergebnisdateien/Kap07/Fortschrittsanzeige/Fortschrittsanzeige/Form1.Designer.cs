namespace Fortschrittsanzeige
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
      this.cmdClose = new System.Windows.Forms.Button();
      this.cmdReset = new System.Windows.Forms.Button();
      this.cmdStart = new System.Windows.Forms.Button();
      this.lblDisplay = new System.Windows.Forms.Label();
      this.prgBar = new System.Windows.Forms.ProgressBar();
      this.SuspendLayout();
      // 
      // cmdClose
      // 
      this.cmdClose.Location = new System.Drawing.Point(198, 103);
      this.cmdClose.Name = "cmdClose";
      this.cmdClose.Size = new System.Drawing.Size(75, 23);
      this.cmdClose.TabIndex = 5;
      this.cmdClose.Text = "Schließen";
      this.cmdClose.UseVisualStyleBackColor = true;
      this.cmdClose.Click += new System.EventHandler(this.cmdClose_Click);
      // 
      // cmdReset
      // 
      this.cmdReset.Location = new System.Drawing.Point(96, 103);
      this.cmdReset.Name = "cmdReset";
      this.cmdReset.Size = new System.Drawing.Size(96, 23);
      this.cmdReset.TabIndex = 6;
      this.cmdReset.Text = "Zurücksetzen";
      this.cmdReset.UseVisualStyleBackColor = true;
      this.cmdReset.Click += new System.EventHandler(this.cmdReset_Click);
      // 
      // cmdStart
      // 
      this.cmdStart.Location = new System.Drawing.Point(15, 103);
      this.cmdStart.Name = "cmdStart";
      this.cmdStart.Size = new System.Drawing.Size(75, 23);
      this.cmdStart.TabIndex = 7;
      this.cmdStart.Text = "Start";
      this.cmdStart.UseVisualStyleBackColor = true;
      this.cmdStart.Click += new System.EventHandler(this.cmdStart_Click);
      // 
      // lblDisplay
      // 
      this.lblDisplay.AutoSize = true;
      this.lblDisplay.Location = new System.Drawing.Point(12, 73);
      this.lblDisplay.Name = "lblDisplay";
      this.lblDisplay.Size = new System.Drawing.Size(52, 13);
      this.lblDisplay.TabIndex = 4;
      this.lblDisplay.Text = "0 Prozent";
      // 
      // prgBar
      // 
      this.prgBar.Location = new System.Drawing.Point(15, 13);
      this.prgBar.Name = "prgBar";
      this.prgBar.Size = new System.Drawing.Size(255, 41);
      this.prgBar.TabIndex = 3;
      // 
      // Form1
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(284, 138);
      this.Controls.Add(this.cmdClose);
      this.Controls.Add(this.cmdReset);
      this.Controls.Add(this.cmdStart);
      this.Controls.Add(this.lblDisplay);
      this.Controls.Add(this.prgBar);
      this.Name = "Form1";
      this.Text = "Fortschrittsanzeige";
      this.ResumeLayout(false);
      this.PerformLayout();

    }

    #endregion

    private System.Windows.Forms.Button cmdClose;
    private System.Windows.Forms.Button cmdReset;
    private System.Windows.Forms.Button cmdStart;
    private System.Windows.Forms.Label lblDisplay;
    private System.Windows.Forms.ProgressBar prgBar;
  }
}

