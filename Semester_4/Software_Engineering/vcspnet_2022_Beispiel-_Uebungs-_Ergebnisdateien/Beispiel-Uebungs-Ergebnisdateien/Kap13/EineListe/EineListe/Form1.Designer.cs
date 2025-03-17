namespace EineListe
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
      this.chkSorted = new System.Windows.Forms.CheckBox();
      this.cmdExit = new System.Windows.Forms.Button();
      this.cmdEraseAll = new System.Windows.Forms.Button();
      this.cmdErase = new System.Windows.Forms.Button();
      this.cmdAdd = new System.Windows.Forms.Button();
      this.txtEingabe = new System.Windows.Forms.TextBox();
      this.lstListe = new System.Windows.Forms.ListBox();
      this.SuspendLayout();
      // 
      // chkSorted
      // 
      this.chkSorted.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
      this.chkSorted.Appearance = System.Windows.Forms.Appearance.Button;
      this.chkSorted.AutoSize = true;
      this.chkSorted.Location = new System.Drawing.Point(292, 265);
      this.chkSorted.Name = "chkSorted";
      this.chkSorted.Size = new System.Drawing.Size(50, 23);
      this.chkSorted.TabIndex = 18;
      this.chkSorted.Text = "Sortiert";
      this.chkSorted.UseVisualStyleBackColor = true;
      this.chkSorted.Click += new System.EventHandler(this.chkSorted_CheckedChanged);
      // 
      // cmdExit
      // 
      this.cmdExit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
      this.cmdExit.Location = new System.Drawing.Point(395, 265);
      this.cmdExit.Name = "cmdExit";
      this.cmdExit.Size = new System.Drawing.Size(75, 23);
      this.cmdExit.TabIndex = 19;
      this.cmdExit.Text = "Beenden";
      this.cmdExit.UseVisualStyleBackColor = true;
      this.cmdExit.Click += new System.EventHandler(this.cmdExit_Click);
      // 
      // cmdEraseAll
      // 
      this.cmdEraseAll.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
      this.cmdEraseAll.Location = new System.Drawing.Point(174, 265);
      this.cmdEraseAll.Name = "cmdEraseAll";
      this.cmdEraseAll.Size = new System.Drawing.Size(75, 23);
      this.cmdEraseAll.TabIndex = 17;
      this.cmdEraseAll.Text = "Alle löschen";
      this.cmdEraseAll.UseVisualStyleBackColor = true;
      this.cmdEraseAll.Click += new System.EventHandler(this.cmdEraseAll_Click);
      // 
      // cmdErase
      // 
      this.cmdErase.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
      this.cmdErase.Location = new System.Drawing.Point(93, 265);
      this.cmdErase.Name = "cmdErase";
      this.cmdErase.Size = new System.Drawing.Size(75, 23);
      this.cmdErase.TabIndex = 16;
      this.cmdErase.Text = "Löschen";
      this.cmdErase.UseVisualStyleBackColor = true;
      this.cmdErase.Click += new System.EventHandler(this.cmdErase_Click);
      // 
      // cmdAdd
      // 
      this.cmdAdd.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
      this.cmdAdd.Location = new System.Drawing.Point(12, 265);
      this.cmdAdd.Name = "cmdAdd";
      this.cmdAdd.Size = new System.Drawing.Size(75, 23);
      this.cmdAdd.TabIndex = 15;
      this.cmdAdd.Text = "Hinzufügen";
      this.cmdAdd.UseVisualStyleBackColor = true;
      this.cmdAdd.Click += new System.EventHandler(this.cmdAdd_Click);
      // 
      // txtEingabe
      // 
      this.txtEingabe.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
      this.txtEingabe.Location = new System.Drawing.Point(13, 234);
      this.txtEingabe.Name = "txtEingabe";
      this.txtEingabe.Size = new System.Drawing.Size(457, 20);
      this.txtEingabe.TabIndex = 20;
      // 
      // lstListe
      // 
      this.lstListe.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
      this.lstListe.FormattingEnabled = true;
      this.lstListe.Location = new System.Drawing.Point(13, 11);
      this.lstListe.Name = "lstListe";
      this.lstListe.Size = new System.Drawing.Size(457, 212);
      this.lstListe.TabIndex = 21;
      // 
      // Form1
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(482, 298);
      this.Controls.Add(this.chkSorted);
      this.Controls.Add(this.cmdExit);
      this.Controls.Add(this.cmdEraseAll);
      this.Controls.Add(this.cmdErase);
      this.Controls.Add(this.cmdAdd);
      this.Controls.Add(this.txtEingabe);
      this.Controls.Add(this.lstListe);
      this.Name = "Form1";
      this.Text = "Auflistung";
      this.ResumeLayout(false);
      this.PerformLayout();

    }

    #endregion

    private System.Windows.Forms.CheckBox chkSorted;
    private System.Windows.Forms.Button cmdExit;
    private System.Windows.Forms.Button cmdEraseAll;
    private System.Windows.Forms.Button cmdErase;
    private System.Windows.Forms.Button cmdAdd;
    private System.Windows.Forms.TextBox txtEingabe;
    private System.Windows.Forms.ListBox lstListe;
  }
}

