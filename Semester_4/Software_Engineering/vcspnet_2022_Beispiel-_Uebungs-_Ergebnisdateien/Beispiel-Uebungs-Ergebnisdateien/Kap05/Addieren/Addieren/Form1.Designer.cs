namespace Addieren
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
      this.grpEingabe = new System.Windows.Forms.GroupBox();
      this.txtZahl2 = new System.Windows.Forms.TextBox();
      this.lblTZahl2 = new System.Windows.Forms.Label();
      this.txtZahl1 = new System.Windows.Forms.TextBox();
      this.lblZahl1 = new System.Windows.Forms.Label();
      this.txtSumme = new System.Windows.Forms.TextBox();
      this.lblSumme = new System.Windows.Forms.Label();
      this.cmdBerechnen = new System.Windows.Forms.Button();
      this.grpEingabe.SuspendLayout();
      this.SuspendLayout();
      // 
      // grpEingabe
      // 
      this.grpEingabe.Controls.Add(this.txtZahl2);
      this.grpEingabe.Controls.Add(this.lblTZahl2);
      this.grpEingabe.Controls.Add(this.txtZahl1);
      this.grpEingabe.Controls.Add(this.lblZahl1);
      this.grpEingabe.Location = new System.Drawing.Point(12, 8);
      this.grpEingabe.Name = "grpEingabe";
      this.grpEingabe.Size = new System.Drawing.Size(160, 71);
      this.grpEingabe.TabIndex = 4;
      this.grpEingabe.TabStop = false;
      this.grpEingabe.Text = "Eingabe";
      // 
      // txtZahl2
      // 
      this.txtZahl2.Location = new System.Drawing.Point(79, 46);
      this.txtZahl2.Name = "txtZahl2";
      this.txtZahl2.Size = new System.Drawing.Size(75, 20);
      this.txtZahl2.TabIndex = 3;
      // 
      // lblTZahl2
      // 
      this.lblTZahl2.AutoSize = true;
      this.lblTZahl2.Location = new System.Drawing.Point(7, 49);
      this.lblTZahl2.Name = "lblTZahl2";
      this.lblTZahl2.Size = new System.Drawing.Size(66, 13);
      this.lblTZahl2.TabIndex = 1;
      this.lblTZahl2.Text = "Zweite Zahl:";
      // 
      // txtZahl1
      // 
      this.txtZahl1.Location = new System.Drawing.Point(79, 20);
      this.txtZahl1.Name = "txtZahl1";
      this.txtZahl1.Size = new System.Drawing.Size(75, 20);
      this.txtZahl1.TabIndex = 2;
      // 
      // lblZahl1
      // 
      this.lblZahl1.AutoSize = true;
      this.lblZahl1.Location = new System.Drawing.Point(15, 23);
      this.lblZahl1.Name = "lblZahl1";
      this.lblZahl1.Size = new System.Drawing.Size(58, 13);
      this.lblZahl1.TabIndex = 0;
      this.lblZahl1.Text = "Erste Zahl:";
      // 
      // txtSumme
      // 
      this.txtSumme.Location = new System.Drawing.Point(91, 85);
      this.txtSumme.Name = "txtSumme";
      this.txtSumme.Size = new System.Drawing.Size(75, 20);
      this.txtSumme.TabIndex = 5;
      // 
      // lblSumme
      // 
      this.lblSumme.AutoSize = true;
      this.lblSumme.Location = new System.Drawing.Point(40, 88);
      this.lblSumme.Name = "lblSumme";
      this.lblSumme.Size = new System.Drawing.Size(45, 13);
      this.lblSumme.TabIndex = 6;
      this.lblSumme.Text = "Summe:";
      // 
      // cmdBerechnen
      // 
      this.cmdBerechnen.Location = new System.Drawing.Point(32, 121);
      this.cmdBerechnen.Name = "cmdBerechnen";
      this.cmdBerechnen.Size = new System.Drawing.Size(124, 23);
      this.cmdBerechnen.TabIndex = 7;
      this.cmdBerechnen.Text = "Berechnen";
      this.cmdBerechnen.UseVisualStyleBackColor = true;
      // 
      // Form1
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(185, 153);
      this.Controls.Add(this.grpEingabe);
      this.Controls.Add(this.txtSumme);
      this.Controls.Add(this.lblSumme);
      this.Controls.Add(this.cmdBerechnen);
      this.Name = "Form1";
      this.Text = "Addieren";
      this.grpEingabe.ResumeLayout(false);
      this.grpEingabe.PerformLayout();
      this.ResumeLayout(false);
      this.PerformLayout();

    }

    #endregion

    private System.Windows.Forms.GroupBox grpEingabe;
    private System.Windows.Forms.TextBox txtZahl2;
    private System.Windows.Forms.Label lblTZahl2;
    private System.Windows.Forms.TextBox txtZahl1;
    private System.Windows.Forms.Label lblZahl1;
    private System.Windows.Forms.TextBox txtSumme;
    private System.Windows.Forms.Label lblSumme;
    private System.Windows.Forms.Button cmdBerechnen;
  }
}

