namespace Passwortabfrage
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
      this.cmdOk = new System.Windows.Forms.Button();
      this.txtEingabe = new System.Windows.Forms.TextBox();
      this.txtAusgabe = new System.Windows.Forms.TextBox();
      this.SuspendLayout();
      // 
      // cmdOk
      // 
      this.cmdOk.Location = new System.Drawing.Point(66, 181);
      this.cmdOk.Name = "cmdOk";
      this.cmdOk.Size = new System.Drawing.Size(75, 23);
      this.cmdOk.TabIndex = 5;
      this.cmdOk.Text = "OK";
      this.cmdOk.UseVisualStyleBackColor = true;
      this.cmdOk.Click += new System.EventHandler(this.cmdOk_Click);
      // 
      // txtEingabe
      // 
      this.txtEingabe.Location = new System.Drawing.Point(12, 144);
      this.txtEingabe.Name = "txtEingabe";
      this.txtEingabe.PasswordChar = '*';
      this.txtEingabe.Size = new System.Drawing.Size(182, 20);
      this.txtEingabe.TabIndex = 4;
      // 
      // txtAusgabe
      // 
      this.txtAusgabe.Enabled = false;
      this.txtAusgabe.Location = new System.Drawing.Point(12, 12);
      this.txtAusgabe.Multiline = true;
      this.txtAusgabe.Name = "txtAusgabe";
      this.txtAusgabe.Size = new System.Drawing.Size(182, 114);
      this.txtAusgabe.TabIndex = 3;
      // 
      // Form1
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(206, 216);
      this.Controls.Add(this.cmdOk);
      this.Controls.Add(this.txtEingabe);
      this.Controls.Add(this.txtAusgabe);
      this.Name = "Form1";
      this.Text = "Passwortabfrage";
      this.ResumeLayout(false);
      this.PerformLayout();

    }

    #endregion

    private System.Windows.Forms.Button cmdOk;
    private System.Windows.Forms.TextBox txtEingabe;
    private System.Windows.Forms.TextBox txtAusgabe;
  }
}

