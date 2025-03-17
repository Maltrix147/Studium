namespace Klick
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
      this.cmdKlick = new System.Windows.Forms.Button();
      this.SuspendLayout();
      // 
      // cmdKlick
      // 
      this.cmdKlick.Location = new System.Drawing.Point(93, 122);
      this.cmdKlick.Name = "cmdKlick";
      this.cmdKlick.Size = new System.Drawing.Size(106, 23);
      this.cmdKlick.TabIndex = 1;
      this.cmdKlick.Text = "Bitte anklicken";
      this.cmdKlick.UseVisualStyleBackColor = true;
      this.cmdKlick.MouseEnter += new System.EventHandler(this.cmdKlick_MouseEnter);
      // 
      // Form1
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(292, 266);
      this.Controls.Add(this.cmdKlick);
      this.Name = "Form1";
      this.Text = "Klick-Fenster";
      this.ResumeLayout(false);

    }

    #endregion

    private System.Windows.Forms.Button cmdKlick;
  }
}

