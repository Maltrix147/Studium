namespace Quadrieren
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
      this.txtErgebnis = new System.Windows.Forms.TextBox();
      this.lblErgebnis = new System.Windows.Forms.Label();
      this.txtZahl = new System.Windows.Forms.TextBox();
      this.lblZahl = new System.Windows.Forms.Label();
      this.cmdBerechnen = new System.Windows.Forms.Button();
      this.SuspendLayout();
      // 
      // txtErgebnis
      // 
      this.txtErgebnis.Location = new System.Drawing.Point(73, 51);
      this.txtErgebnis.Name = "txtErgebnis";
      this.txtErgebnis.Size = new System.Drawing.Size(75, 20);
      this.txtErgebnis.TabIndex = 10;
      // 
      // lblErgebnis
      // 
      this.lblErgebnis.AutoSize = true;
      this.lblErgebnis.Location = new System.Drawing.Point(23, 54);
      this.lblErgebnis.Name = "lblErgebnis";
      this.lblErgebnis.Size = new System.Drawing.Size(48, 13);
      this.lblErgebnis.TabIndex = 9;
      this.lblErgebnis.Text = "Quadrat:";
      // 
      // txtZahl
      // 
      this.txtZahl.Location = new System.Drawing.Point(73, 12);
      this.txtZahl.Name = "txtZahl";
      this.txtZahl.Size = new System.Drawing.Size(75, 20);
      this.txtZahl.TabIndex = 7;
      // 
      // lblZahl
      // 
      this.lblZahl.AutoSize = true;
      this.lblZahl.Location = new System.Drawing.Point(40, 15);
      this.lblZahl.Name = "lblZahl";
      this.lblZahl.Size = new System.Drawing.Size(31, 13);
      this.lblZahl.TabIndex = 6;
      this.lblZahl.Text = "Zahl:";
      // 
      // cmdBerechnen
      // 
      this.cmdBerechnen.Location = new System.Drawing.Point(24, 96);
      this.cmdBerechnen.Name = "cmdBerechnen";
      this.cmdBerechnen.Size = new System.Drawing.Size(124, 23);
      this.cmdBerechnen.TabIndex = 8;
      this.cmdBerechnen.Text = "Berechnen";
      this.cmdBerechnen.UseVisualStyleBackColor = true;
      // 
      // Form1
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(171, 131);
      this.Controls.Add(this.txtErgebnis);
      this.Controls.Add(this.lblErgebnis);
      this.Controls.Add(this.txtZahl);
      this.Controls.Add(this.lblZahl);
      this.Controls.Add(this.cmdBerechnen);
      this.Name = "Form1";
      this.Text = "Quadrieren";
      this.ResumeLayout(false);
      this.PerformLayout();

    }

    #endregion

    private System.Windows.Forms.TextBox txtErgebnis;
    private System.Windows.Forms.Label lblErgebnis;
    private System.Windows.Forms.TextBox txtZahl;
    private System.Windows.Forms.Label lblZahl;
    private System.Windows.Forms.Button cmdBerechnen;
  }
}

