namespace IntegerCalcExcept
{
  partial class IntCalcForm
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
      this.cmdMod = new System.Windows.Forms.Button();
      this.cmdDiv = new System.Windows.Forms.Button();
      this.cmdMult = new System.Windows.Forms.Button();
      this.cmdSub = new System.Windows.Forms.Button();
      this.cmdPlus = new System.Windows.Forms.Button();
      this.txtErgebnis = new System.Windows.Forms.TextBox();
      this.txtZahl2 = new System.Windows.Forms.TextBox();
      this.txtZahl1 = new System.Windows.Forms.TextBox();
      this.lblErgebnis = new System.Windows.Forms.Label();
      this.lblZahl2 = new System.Windows.Forms.Label();
      this.lblZahl1 = new System.Windows.Forms.Label();
      this.SuspendLayout();
      // 
      // cmdMod
      // 
      this.cmdMod.Location = new System.Drawing.Point(231, 68);
      this.cmdMod.Name = "cmdMod";
      this.cmdMod.Size = new System.Drawing.Size(23, 23);
      this.cmdMod.TabIndex = 21;
      this.cmdMod.Text = "%";
      this.cmdMod.UseVisualStyleBackColor = true;
      this.cmdMod.Click += new System.EventHandler(this.cmdMod_Click);
      // 
      // cmdDiv
      // 
      this.cmdDiv.Location = new System.Drawing.Point(202, 68);
      this.cmdDiv.Name = "cmdDiv";
      this.cmdDiv.Size = new System.Drawing.Size(23, 23);
      this.cmdDiv.TabIndex = 20;
      this.cmdDiv.Text = "/";
      this.cmdDiv.UseVisualStyleBackColor = true;
      this.cmdDiv.Click += new System.EventHandler(this.cmdDiv_Click);
      // 
      // cmdMult
      // 
      this.cmdMult.Location = new System.Drawing.Point(202, 39);
      this.cmdMult.Name = "cmdMult";
      this.cmdMult.Size = new System.Drawing.Size(23, 23);
      this.cmdMult.TabIndex = 19;
      this.cmdMult.Text = "*";
      this.cmdMult.UseVisualStyleBackColor = true;
      this.cmdMult.Click += new System.EventHandler(this.cmdMult_Click);
      // 
      // cmdSub
      // 
      this.cmdSub.Location = new System.Drawing.Point(231, 10);
      this.cmdSub.Name = "cmdSub";
      this.cmdSub.Size = new System.Drawing.Size(23, 23);
      this.cmdSub.TabIndex = 18;
      this.cmdSub.Text = "-";
      this.cmdSub.UseVisualStyleBackColor = true;
      this.cmdSub.Click += new System.EventHandler(this.cmdSub_Click);
      // 
      // cmdPlus
      // 
      this.cmdPlus.Location = new System.Drawing.Point(202, 10);
      this.cmdPlus.Name = "cmdPlus";
      this.cmdPlus.Size = new System.Drawing.Size(23, 23);
      this.cmdPlus.TabIndex = 17;
      this.cmdPlus.Text = "+";
      this.cmdPlus.UseVisualStyleBackColor = true;
      this.cmdPlus.Click += new System.EventHandler(this.cmdPlus_Click);
      // 
      // txtErgebnis
      // 
      this.txtErgebnis.Enabled = false;
      this.txtErgebnis.Location = new System.Drawing.Point(85, 62);
      this.txtErgebnis.Name = "txtErgebnis";
      this.txtErgebnis.ReadOnly = true;
      this.txtErgebnis.Size = new System.Drawing.Size(100, 20);
      this.txtErgebnis.TabIndex = 16;
      // 
      // txtZahl2
      // 
      this.txtZahl2.Location = new System.Drawing.Point(85, 36);
      this.txtZahl2.Name = "txtZahl2";
      this.txtZahl2.Size = new System.Drawing.Size(100, 20);
      this.txtZahl2.TabIndex = 14;
      this.txtZahl2.Validating += new System.ComponentModel.CancelEventHandler(this.txtZahl2_Validating);
      // 
      // txtZahl1
      // 
      this.txtZahl1.Location = new System.Drawing.Point(85, 10);
      this.txtZahl1.Name = "txtZahl1";
      this.txtZahl1.Size = new System.Drawing.Size(100, 20);
      this.txtZahl1.TabIndex = 12;
      this.txtZahl1.Validating += new System.ComponentModel.CancelEventHandler(this.txtZahl1_Validating);
      // 
      // lblErgebnis
      // 
      this.lblErgebnis.AutoSize = true;
      this.lblErgebnis.Location = new System.Drawing.Point(18, 65);
      this.lblErgebnis.Name = "lblErgebnis";
      this.lblErgebnis.Size = new System.Drawing.Size(51, 13);
      this.lblErgebnis.TabIndex = 15;
      this.lblErgebnis.Text = "Ergebnis:";
      // 
      // lblZahl2
      // 
      this.lblZahl2.AutoSize = true;
      this.lblZahl2.Location = new System.Drawing.Point(18, 39);
      this.lblZahl2.Name = "lblZahl2";
      this.lblZahl2.Size = new System.Drawing.Size(40, 13);
      this.lblZahl2.TabIndex = 13;
      this.lblZahl2.Text = "Zahl 2:";
      // 
      // lblZahl1
      // 
      this.lblZahl1.AutoSize = true;
      this.lblZahl1.Location = new System.Drawing.Point(18, 13);
      this.lblZahl1.Name = "lblZahl1";
      this.lblZahl1.Size = new System.Drawing.Size(40, 13);
      this.lblZahl1.TabIndex = 11;
      this.lblZahl1.Text = "Zahl 1:";
      // 
      // IntCalcForm
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(272, 101);
      this.Controls.Add(this.cmdMod);
      this.Controls.Add(this.cmdDiv);
      this.Controls.Add(this.cmdMult);
      this.Controls.Add(this.cmdSub);
      this.Controls.Add(this.cmdPlus);
      this.Controls.Add(this.txtErgebnis);
      this.Controls.Add(this.txtZahl2);
      this.Controls.Add(this.txtZahl1);
      this.Controls.Add(this.lblErgebnis);
      this.Controls.Add(this.lblZahl2);
      this.Controls.Add(this.lblZahl1);
      this.Name = "IntCalcForm";
      this.Text = "Ganzzahl-Rechner";
      this.ResumeLayout(false);
      this.PerformLayout();

    }

    #endregion

    private System.Windows.Forms.Button cmdMod;
    private System.Windows.Forms.Button cmdDiv;
    private System.Windows.Forms.Button cmdMult;
    private System.Windows.Forms.Button cmdSub;
    private System.Windows.Forms.Button cmdPlus;
    private System.Windows.Forms.TextBox txtErgebnis;
    private System.Windows.Forms.TextBox txtZahl2;
    private System.Windows.Forms.TextBox txtZahl1;
    private System.Windows.Forms.Label lblErgebnis;
    private System.Windows.Forms.Label lblZahl2;
    private System.Windows.Forms.Label lblZahl1;
  }
}

