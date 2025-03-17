namespace Kontakt
{
  partial class KontaktForm
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
      this.grpAnrede = new System.Windows.Forms.GroupBox();
      this.optHerr = new System.Windows.Forms.RadioButton();
      this.optFrau = new System.Windows.Forms.RadioButton();
      this.grpAdresse = new System.Windows.Forms.GroupBox();
      this.txtOrt = new System.Windows.Forms.TextBox();
      this.mskPLZ = new System.Windows.Forms.MaskedTextBox();
      this.lblWohnort = new System.Windows.Forms.Label();
      this.txtHausnummer = new System.Windows.Forms.TextBox();
      this.txtStrasse = new System.Windows.Forms.TextBox();
      this.lblStrasse = new System.Windows.Forms.Label();
      this.txtVorname = new System.Windows.Forms.TextBox();
      this.lblVorname = new System.Windows.Forms.Label();
      this.txtNachname = new System.Windows.Forms.TextBox();
      this.lblNachname = new System.Windows.Forms.Label();
      this.cmdSpeichern = new System.Windows.Forms.Button();
      this.cmdAbbrechen = new System.Windows.Forms.Button();
      this.grpAnrede.SuspendLayout();
      this.grpAdresse.SuspendLayout();
      this.SuspendLayout();
      // 
      // grpAnrede
      // 
      this.grpAnrede.Controls.Add(this.optHerr);
      this.grpAnrede.Controls.Add(this.optFrau);
      this.grpAnrede.Location = new System.Drawing.Point(16, 13);
      this.grpAnrede.Name = "grpAnrede";
      this.grpAnrede.Size = new System.Drawing.Size(260, 47);
      this.grpAnrede.TabIndex = 4;
      this.grpAnrede.TabStop = false;
      this.grpAnrede.Text = "Anrede";
      // 
      // optHerr
      // 
      this.optHerr.AutoSize = true;
      this.optHerr.Location = new System.Drawing.Point(133, 19);
      this.optHerr.Name = "optHerr";
      this.optHerr.Size = new System.Drawing.Size(45, 17);
      this.optHerr.TabIndex = 1;
      this.optHerr.TabStop = true;
      this.optHerr.Text = "Herr";
      this.optHerr.UseVisualStyleBackColor = true;
      // 
      // optFrau
      // 
      this.optFrau.AutoSize = true;
      this.optFrau.Location = new System.Drawing.Point(18, 19);
      this.optFrau.Name = "optFrau";
      this.optFrau.Size = new System.Drawing.Size(46, 17);
      this.optFrau.TabIndex = 0;
      this.optFrau.TabStop = true;
      this.optFrau.Text = "Frau";
      this.optFrau.UseVisualStyleBackColor = true;
      // 
      // grpAdresse
      // 
      this.grpAdresse.Controls.Add(this.txtOrt);
      this.grpAdresse.Controls.Add(this.mskPLZ);
      this.grpAdresse.Controls.Add(this.lblWohnort);
      this.grpAdresse.Controls.Add(this.txtHausnummer);
      this.grpAdresse.Controls.Add(this.txtStrasse);
      this.grpAdresse.Controls.Add(this.lblStrasse);
      this.grpAdresse.Controls.Add(this.txtVorname);
      this.grpAdresse.Controls.Add(this.lblVorname);
      this.grpAdresse.Controls.Add(this.txtNachname);
      this.grpAdresse.Controls.Add(this.lblNachname);
      this.grpAdresse.Location = new System.Drawing.Point(16, 66);
      this.grpAdresse.Name = "grpAdresse";
      this.grpAdresse.Size = new System.Drawing.Size(260, 148);
      this.grpAdresse.TabIndex = 5;
      this.grpAdresse.TabStop = false;
      this.grpAdresse.Text = "Adresse";
      // 
      // txtOrt
      // 
      this.txtOrt.Location = new System.Drawing.Point(84, 110);
      this.txtOrt.Name = "txtOrt";
      this.txtOrt.Size = new System.Drawing.Size(167, 20);
      this.txtOrt.TabIndex = 9;
      // 
      // mskPLZ
      // 
      this.mskPLZ.Location = new System.Drawing.Point(9, 110);
      this.mskPLZ.Mask = "00000";
      this.mskPLZ.Name = "mskPLZ";
      this.mskPLZ.PromptChar = ' ';
      this.mskPLZ.Size = new System.Drawing.Size(69, 20);
      this.mskPLZ.TabIndex = 8;
      // 
      // lblWohnort
      // 
      this.lblWohnort.AutoSize = true;
      this.lblWohnort.Location = new System.Drawing.Point(6, 94);
      this.lblWohnort.Name = "lblWohnort";
      this.lblWohnort.Size = new System.Drawing.Size(48, 13);
      this.lblWohnort.TabIndex = 7;
      this.lblWohnort.Text = "Wohnort";
      // 
      // txtHausnummer
      // 
      this.txtHausnummer.Location = new System.Drawing.Point(200, 71);
      this.txtHausnummer.Name = "txtHausnummer";
      this.txtHausnummer.Size = new System.Drawing.Size(51, 20);
      this.txtHausnummer.TabIndex = 6;
      // 
      // txtStrasse
      // 
      this.txtStrasse.Location = new System.Drawing.Point(9, 71);
      this.txtStrasse.Name = "txtStrasse";
      this.txtStrasse.Size = new System.Drawing.Size(185, 20);
      this.txtStrasse.TabIndex = 5;
      // 
      // lblStrasse
      // 
      this.lblStrasse.AutoSize = true;
      this.lblStrasse.Location = new System.Drawing.Point(6, 55);
      this.lblStrasse.Name = "lblStrasse";
      this.lblStrasse.Size = new System.Drawing.Size(38, 13);
      this.lblStrasse.TabIndex = 4;
      this.lblStrasse.Text = "Straße";
      // 
      // txtVorname
      // 
      this.txtVorname.Location = new System.Drawing.Point(133, 32);
      this.txtVorname.Name = "txtVorname";
      this.txtVorname.Size = new System.Drawing.Size(118, 20);
      this.txtVorname.TabIndex = 3;
      // 
      // lblVorname
      // 
      this.lblVorname.AutoSize = true;
      this.lblVorname.Location = new System.Drawing.Point(130, 16);
      this.lblVorname.Name = "lblVorname";
      this.lblVorname.Size = new System.Drawing.Size(49, 13);
      this.lblVorname.TabIndex = 2;
      this.lblVorname.Text = "Vorname";
      // 
      // txtNachname
      // 
      this.txtNachname.Location = new System.Drawing.Point(9, 32);
      this.txtNachname.Name = "txtNachname";
      this.txtNachname.Size = new System.Drawing.Size(118, 20);
      this.txtNachname.TabIndex = 1;
      // 
      // lblNachname
      // 
      this.lblNachname.AutoSize = true;
      this.lblNachname.Location = new System.Drawing.Point(6, 16);
      this.lblNachname.Name = "lblNachname";
      this.lblNachname.Size = new System.Drawing.Size(59, 13);
      this.lblNachname.TabIndex = 0;
      this.lblNachname.Text = "Nachname";
      // 
      // cmdSpeichern
      // 
      this.cmdSpeichern.Location = new System.Drawing.Point(16, 231);
      this.cmdSpeichern.Name = "cmdSpeichern";
      this.cmdSpeichern.Size = new System.Drawing.Size(127, 23);
      this.cmdSpeichern.TabIndex = 7;
      this.cmdSpeichern.Text = "Speichern";
      this.cmdSpeichern.UseVisualStyleBackColor = true;
      // 
      // cmdAbbrechen
      // 
      this.cmdAbbrechen.Location = new System.Drawing.Point(149, 231);
      this.cmdAbbrechen.Name = "cmdAbbrechen";
      this.cmdAbbrechen.Size = new System.Drawing.Size(127, 23);
      this.cmdAbbrechen.TabIndex = 6;
      this.cmdAbbrechen.Text = "Abbrechen";
      this.cmdAbbrechen.UseVisualStyleBackColor = true;
      // 
      // KontaktForm
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(292, 266);
      this.Controls.Add(this.grpAnrede);
      this.Controls.Add(this.grpAdresse);
      this.Controls.Add(this.cmdSpeichern);
      this.Controls.Add(this.cmdAbbrechen);
      this.Name = "KontaktForm";
      this.Text = "Kontaktformular";
      this.grpAnrede.ResumeLayout(false);
      this.grpAnrede.PerformLayout();
      this.grpAdresse.ResumeLayout(false);
      this.grpAdresse.PerformLayout();
      this.ResumeLayout(false);

    }

    #endregion

    private System.Windows.Forms.GroupBox grpAnrede;
    private System.Windows.Forms.RadioButton optHerr;
    private System.Windows.Forms.RadioButton optFrau;
    private System.Windows.Forms.GroupBox grpAdresse;
    private System.Windows.Forms.TextBox txtOrt;
    private System.Windows.Forms.MaskedTextBox mskPLZ;
    private System.Windows.Forms.Label lblWohnort;
    private System.Windows.Forms.TextBox txtHausnummer;
    private System.Windows.Forms.TextBox txtStrasse;
    private System.Windows.Forms.Label lblStrasse;
    private System.Windows.Forms.TextBox txtVorname;
    private System.Windows.Forms.Label lblVorname;
    private System.Windows.Forms.TextBox txtNachname;
    private System.Windows.Forms.Label lblNachname;
    private System.Windows.Forms.Button cmdSpeichern;
    private System.Windows.Forms.Button cmdAbbrechen;
  }
}

