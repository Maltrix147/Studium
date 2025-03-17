namespace Autofahren
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
      this.pnlStrasse = new System.Windows.Forms.Panel();
      this.cmdBeenden = new System.Windows.Forms.Button();
      this.cmdSchneller = new System.Windows.Forms.Button();
      this.cmdLangsamer = new System.Windows.Forms.Button();
      this.cmdFahren = new System.Windows.Forms.Button();
      this.cmdStart = new System.Windows.Forms.Button();
      this.SuspendLayout();
      // 
      // pnlStrasse
      // 
      this.pnlStrasse.BackColor = System.Drawing.SystemColors.ButtonShadow;
      this.pnlStrasse.Location = new System.Drawing.Point(13, 12);
      this.pnlStrasse.Name = "pnlStrasse";
      this.pnlStrasse.Size = new System.Drawing.Size(560, 36);
      this.pnlStrasse.TabIndex = 11;
      // 
      // cmdBeenden
      // 
      this.cmdBeenden.Location = new System.Drawing.Point(498, 68);
      this.cmdBeenden.Name = "cmdBeenden";
      this.cmdBeenden.Size = new System.Drawing.Size(75, 23);
      this.cmdBeenden.TabIndex = 10;
      this.cmdBeenden.Text = "Beenden";
      this.cmdBeenden.UseVisualStyleBackColor = true;
      this.cmdBeenden.Click += new System.EventHandler(this.cmdBeenden_Click);
      // 
      // cmdSchneller
      // 
      this.cmdSchneller.Location = new System.Drawing.Point(336, 68);
      this.cmdSchneller.Name = "cmdSchneller";
      this.cmdSchneller.Size = new System.Drawing.Size(75, 23);
      this.cmdSchneller.TabIndex = 9;
      this.cmdSchneller.Text = "Schneller";
      this.cmdSchneller.UseVisualStyleBackColor = true;
      this.cmdSchneller.Click += new System.EventHandler(this.cmdSchneller_Click);
      // 
      // cmdLangsamer
      // 
      this.cmdLangsamer.Location = new System.Drawing.Point(255, 68);
      this.cmdLangsamer.Name = "cmdLangsamer";
      this.cmdLangsamer.Size = new System.Drawing.Size(75, 23);
      this.cmdLangsamer.TabIndex = 8;
      this.cmdLangsamer.Text = "Langsamer";
      this.cmdLangsamer.UseVisualStyleBackColor = true;
      this.cmdLangsamer.Click += new System.EventHandler(this.cmdLangsamer_Click);
      // 
      // cmdFahren
      // 
      this.cmdFahren.Location = new System.Drawing.Point(174, 68);
      this.cmdFahren.Name = "cmdFahren";
      this.cmdFahren.Size = new System.Drawing.Size(75, 23);
      this.cmdFahren.TabIndex = 7;
      this.cmdFahren.Text = "Fahren";
      this.cmdFahren.UseVisualStyleBackColor = true;
      this.cmdFahren.Click += new System.EventHandler(this.cmdFahren_Click);
      // 
      // cmdStart
      // 
      this.cmdStart.Location = new System.Drawing.Point(12, 68);
      this.cmdStart.Name = "cmdStart";
      this.cmdStart.Size = new System.Drawing.Size(75, 23);
      this.cmdStart.TabIndex = 6;
      this.cmdStart.Text = "Start";
      this.cmdStart.UseVisualStyleBackColor = true;
      this.cmdStart.Click += new System.EventHandler(this.cmdStart_Click);
      // 
      // Form1
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(585, 103);
      this.Controls.Add(this.pnlStrasse);
      this.Controls.Add(this.cmdBeenden);
      this.Controls.Add(this.cmdSchneller);
      this.Controls.Add(this.cmdLangsamer);
      this.Controls.Add(this.cmdFahren);
      this.Controls.Add(this.cmdStart);
      this.Name = "Form1";
      this.Text = "Form1";
      this.Load += new System.EventHandler(this.Form1_Load);
      this.ResumeLayout(false);

    }

    #endregion

    private System.Windows.Forms.Panel pnlStrasse;
    private System.Windows.Forms.Button cmdBeenden;
    private System.Windows.Forms.Button cmdSchneller;
    private System.Windows.Forms.Button cmdLangsamer;
    private System.Windows.Forms.Button cmdFahren;
    private System.Windows.Forms.Button cmdStart;
  }
}

