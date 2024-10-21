namespace SelectBlob {
    partial class Hauptfenster {
        /// <summary>
        /// Erforderliche Designervariable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Verwendete Ressourcen bereinigen.
        /// </summary>
        /// <param name="disposing">True, wenn verwaltete Ressourcen gelöscht werden sollen; andernfalls False.</param>
        protected override void Dispose(bool disposing) {
            if (disposing && (components != null)) {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Vom Windows Form-Designer generierter Code

        /// <summary>
        /// Erforderliche Methode für die Designerunterstützung.
        /// Der Inhalt der Methode darf nicht mit dem Code-Editor geändert werden.
        /// </summary>
        private void InitializeComponent() {
            this.bttnBild = new System.Windows.Forms.Button();
            this.lbDateien = new System.Windows.Forms.ListBox();
            this.SuspendLayout();
            // 
            // bttnBild
            // 
            this.bttnBild.Location = new System.Drawing.Point(13, 13);
            this.bttnBild.Name = "bttnBild";
            this.bttnBild.Size = new System.Drawing.Size(185, 23);
            this.bttnBild.TabIndex = 0;
            this.bttnBild.Text = "Bilder speichern";
            this.bttnBild.UseVisualStyleBackColor = true;
            this.bttnBild.Click += new System.EventHandler(this.bttnBild_Click);
            // 
            // lbDateien
            // 
            this.lbDateien.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.lbDateien.FormattingEnabled = true;
            this.lbDateien.Location = new System.Drawing.Point(13, 43);
            this.lbDateien.Name = "lbDateien";
            this.lbDateien.Size = new System.Drawing.Size(185, 95);
            this.lbDateien.TabIndex = 1;
            // 
            // Hauptfenster
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(210, 146);
            this.Controls.Add(this.lbDateien);
            this.Controls.Add(this.bttnBild);
            this.Name = "Hauptfenster";
            this.Text = "Bilder speichern";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button bttnBild;
        private System.Windows.Forms.ListBox lbDateien;
    }
}

