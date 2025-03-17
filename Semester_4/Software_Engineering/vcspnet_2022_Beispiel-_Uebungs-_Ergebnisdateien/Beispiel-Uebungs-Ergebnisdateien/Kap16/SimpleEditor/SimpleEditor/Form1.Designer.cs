namespace SimpleEditor
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
      this.cmdSave = new System.Windows.Forms.Button();
      this.cmdOpen = new System.Windows.Forms.Button();
      this.txtEditor = new System.Windows.Forms.TextBox();
      this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
      this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
      this.SuspendLayout();
      // 
      // cmdClose
      // 
      this.cmdClose.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
      this.cmdClose.Location = new System.Drawing.Point(361, 231);
      this.cmdClose.Name = "cmdClose";
      this.cmdClose.Size = new System.Drawing.Size(75, 23);
      this.cmdClose.TabIndex = 7;
      this.cmdClose.Text = "Beenden";
      this.cmdClose.UseVisualStyleBackColor = true;
      this.cmdClose.Click += new System.EventHandler(this.button3_Click);
      // 
      // cmdSave
      // 
      this.cmdSave.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
      this.cmdSave.Location = new System.Drawing.Point(93, 231);
      this.cmdSave.Name = "cmdSave";
      this.cmdSave.Size = new System.Drawing.Size(75, 23);
      this.cmdSave.TabIndex = 6;
      this.cmdSave.Text = "Speichern";
      this.cmdSave.UseVisualStyleBackColor = true;
      this.cmdSave.Click += new System.EventHandler(this.button2_Click);
      // 
      // cmdOpen
      // 
      this.cmdOpen.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
      this.cmdOpen.Location = new System.Drawing.Point(12, 231);
      this.cmdOpen.Name = "cmdOpen";
      this.cmdOpen.Size = new System.Drawing.Size(75, 23);
      this.cmdOpen.TabIndex = 5;
      this.cmdOpen.Text = "Öffnen";
      this.cmdOpen.UseVisualStyleBackColor = true;
      this.cmdOpen.Click += new System.EventHandler(this.button1_Click);
      // 
      // txtEditor
      // 
      this.txtEditor.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
      this.txtEditor.Location = new System.Drawing.Point(12, 12);
      this.txtEditor.Multiline = true;
      this.txtEditor.Name = "txtEditor";
      this.txtEditor.ScrollBars = System.Windows.Forms.ScrollBars.Both;
      this.txtEditor.Size = new System.Drawing.Size(424, 213);
      this.txtEditor.TabIndex = 4;
      // 
      // openFileDialog1
      // 
      this.openFileDialog1.FileName = "openFileDialog1";
      this.openFileDialog1.Filter = "Textdateien (*.txt)|*.txt ";
      // 
      // saveFileDialog1
      // 
      this.saveFileDialog1.Filter = "Textdateien (*.txt)|*.txt ";
      // 
      // Form1
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(448, 266);
      this.Controls.Add(this.cmdClose);
      this.Controls.Add(this.cmdSave);
      this.Controls.Add(this.cmdOpen);
      this.Controls.Add(this.txtEditor);
      this.Name = "Form1";
      this.Text = "SimpleEditor";
      this.ResumeLayout(false);
      this.PerformLayout();

    }

    #endregion

    private System.Windows.Forms.Button cmdClose;
    private System.Windows.Forms.Button cmdSave;
    private System.Windows.Forms.Button cmdOpen;
    private System.Windows.Forms.TextBox txtEditor;
    private System.Windows.Forms.OpenFileDialog openFileDialog1;
    private System.Windows.Forms.SaveFileDialog saveFileDialog1;
  }
}

