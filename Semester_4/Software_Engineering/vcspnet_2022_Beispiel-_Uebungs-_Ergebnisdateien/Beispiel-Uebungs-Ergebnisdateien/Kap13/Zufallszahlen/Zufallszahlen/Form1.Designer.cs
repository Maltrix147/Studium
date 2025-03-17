namespace Zufallszahlen
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
      this.cmdBeenden = new System.Windows.Forms.Button();
      this.cmdStart = new System.Windows.Forms.Button();
      this.lblAnzahl = new System.Windows.Forms.Label();
      this.lstAusgabe = new System.Windows.Forms.ListBox();
      this.SuspendLayout();
      // 
      // cmdBeenden
      // 
      this.cmdBeenden.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
      this.cmdBeenden.Location = new System.Drawing.Point(147, 325);
      this.cmdBeenden.Name = "cmdBeenden";
      this.cmdBeenden.Size = new System.Drawing.Size(75, 23);
      this.cmdBeenden.TabIndex = 7;
      this.cmdBeenden.Text = "Beenden";
      this.cmdBeenden.UseVisualStyleBackColor = true;
      this.cmdBeenden.Click += new System.EventHandler(this.cmdBeenden_Click);
      // 
      // cmdStart
      // 
      this.cmdStart.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
      this.cmdStart.Location = new System.Drawing.Point(12, 325);
      this.cmdStart.Name = "cmdStart";
      this.cmdStart.Size = new System.Drawing.Size(75, 23);
      this.cmdStart.TabIndex = 6;
      this.cmdStart.Text = "Start";
      this.cmdStart.UseVisualStyleBackColor = true;
      this.cmdStart.Click += new System.EventHandler(this.cmdStart_Click);
      // 
      // lblAnzahl
      // 
      this.lblAnzahl.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
      this.lblAnzahl.AutoSize = true;
      this.lblAnzahl.Location = new System.Drawing.Point(85, 304);
      this.lblAnzahl.Name = "lblAnzahl";
      this.lblAnzahl.Size = new System.Drawing.Size(0, 13);
      this.lblAnzahl.TabIndex = 5;
      // 
      // lstAusgabe
      // 
      this.lstAusgabe.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
      this.lstAusgabe.FormattingEnabled = true;
      this.lstAusgabe.Location = new System.Drawing.Point(14, 13);
      this.lstAusgabe.Name = "lstAusgabe";
      this.lstAusgabe.Size = new System.Drawing.Size(208, 277);
      this.lstAusgabe.TabIndex = 4;
      // 
      // Form1
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(234, 360);
      this.Controls.Add(this.cmdBeenden);
      this.Controls.Add(this.cmdStart);
      this.Controls.Add(this.lblAnzahl);
      this.Controls.Add(this.lstAusgabe);
      this.Name = "Form1";
      this.Text = "Parameterarray";
      this.ResumeLayout(false);
      this.PerformLayout();

    }

    #endregion

    private System.Windows.Forms.Button cmdBeenden;
    private System.Windows.Forms.Button cmdStart;
    private System.Windows.Forms.Label lblAnzahl;
    private System.Windows.Forms.ListBox lstAusgabe;
  }
}

