namespace First_App
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            btnDruekMich = new Button();
            lblAnzeige = new Label();
            SuspendLayout();
            // 
            // btnDruekMich
            // 
            btnDruekMich.Location = new Point(272, 109);
            btnDruekMich.Name = "btnDruekMich";
            btnDruekMich.Size = new Size(255, 58);
            btnDruekMich.TabIndex = 0;
            btnDruekMich.Text = "Bittte drücken";
            btnDruekMich.UseVisualStyleBackColor = true;
            btnDruekMich.Click += btn_Click;
            btnDruekMich.MouseEnter += btnDruekMich_Click;
            btnDruekMich.MouseLeave += btnLeave;
            // 
            // lblAnzeige
            // 
            lblAnzeige.AutoSize = true;
            lblAnzeige.Location = new Point(272, 224);
            lblAnzeige.Name = "lblAnzeige";
            lblAnzeige.Size = new Size(0, 41);
            lblAnzeige.TabIndex = 1;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(17F, 41F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(lblAnzeige);
            Controls.Add(btnDruekMich);
            Name = "Form1";
            Text = "Mein erstes Windowsprogramm";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Button btnDruekMich;
        private Label lblAnzeige;
    }
}
