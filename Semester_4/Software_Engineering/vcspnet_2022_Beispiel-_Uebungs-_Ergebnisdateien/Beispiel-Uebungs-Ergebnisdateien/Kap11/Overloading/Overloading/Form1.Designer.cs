namespace Overloading
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
      this.cmdTestString = new System.Windows.Forms.Button();
      this.cmdTestInt = new System.Windows.Forms.Button();
      this.cmdTest = new System.Windows.Forms.Button();
      this.lblAusgabe = new System.Windows.Forms.Label();
      this.SuspendLayout();
      // 
      // cmdTestString
      // 
      this.cmdTestString.Location = new System.Drawing.Point(260, 52);
      this.cmdTestString.Name = "cmdTestString";
      this.cmdTestString.Size = new System.Drawing.Size(118, 23);
      this.cmdTestString.TabIndex = 7;
      this.cmdTestString.Text = "Test(string)";
      this.cmdTestString.UseVisualStyleBackColor = true;
      this.cmdTestString.Click += new System.EventHandler(this.cmdTestString_Click);
      // 
      // cmdTestInt
      // 
      this.cmdTestInt.Location = new System.Drawing.Point(136, 52);
      this.cmdTestInt.Name = "cmdTestInt";
      this.cmdTestInt.Size = new System.Drawing.Size(118, 23);
      this.cmdTestInt.TabIndex = 6;
      this.cmdTestInt.Text = "Test(int)";
      this.cmdTestInt.UseVisualStyleBackColor = true;
      this.cmdTestInt.Click += new System.EventHandler(this.cmdTestInt_Click);
      // 
      // cmdTest
      // 
      this.cmdTest.Location = new System.Drawing.Point(12, 52);
      this.cmdTest.Name = "cmdTest";
      this.cmdTest.Size = new System.Drawing.Size(118, 23);
      this.cmdTest.TabIndex = 5;
      this.cmdTest.Text = "Basis Test()";
      this.cmdTest.UseVisualStyleBackColor = true;
      this.cmdTest.Click += new System.EventHandler(this.cmdTest_Click);
      // 
      // lblAusgabe
      // 
      this.lblAusgabe.BackColor = System.Drawing.SystemColors.Info;
      this.lblAusgabe.Location = new System.Drawing.Point(12, 9);
      this.lblAusgabe.Name = "lblAusgabe";
      this.lblAusgabe.Size = new System.Drawing.Size(366, 19);
      this.lblAusgabe.TabIndex = 4;
      this.lblAusgabe.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
      // 
      // Form1
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(390, 87);
      this.Controls.Add(this.cmdTestString);
      this.Controls.Add(this.cmdTestInt);
      this.Controls.Add(this.cmdTest);
      this.Controls.Add(this.lblAusgabe);
      this.Name = "Form1";
      this.Text = "Überladen und überschreiben";
      this.ResumeLayout(false);

    }

    #endregion

    private System.Windows.Forms.Button cmdTestString;
    private System.Windows.Forms.Button cmdTestInt;
    private System.Windows.Forms.Button cmdTest;
    private System.Windows.Forms.Label lblAusgabe;
  }
}

