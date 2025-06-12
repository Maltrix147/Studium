namespace AutoSimulation
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
            pnlStrasse = new Panel();
            btnStart = new Button();
            btnFahren = new Button();
            btnLangsamer = new Button();
            btnSchneller = new Button();
            btnBeenden = new Button();
            SuspendLayout();
            // 
            // pnlStrasse
            // 
            pnlStrasse.BackColor = SystemColors.ControlDark;
            pnlStrasse.Location = new Point(53, 37);
            pnlStrasse.Name = "pnlStrasse";
            pnlStrasse.Size = new Size(1944, 185);
            pnlStrasse.TabIndex = 0;
            // 
            // btnStart
            // 
            btnStart.Location = new Point(110, 272);
            btnStart.Name = "btnStart";
            btnStart.Size = new Size(188, 58);
            btnStart.TabIndex = 1;
            btnStart.Text = "Start";
            btnStart.UseVisualStyleBackColor = true;
            // 
            // btnFahren
            // 
            btnFahren.Location = new Point(520, 272);
            btnFahren.Name = "btnFahren";
            btnFahren.Size = new Size(188, 58);
            btnFahren.TabIndex = 2;
            btnFahren.Text = "Fahren";
            btnFahren.UseVisualStyleBackColor = true;
            // 
            // btnLangsamer
            // 
            btnLangsamer.Location = new Point(930, 272);
            btnLangsamer.Name = "btnLangsamer";
            btnLangsamer.Size = new Size(188, 58);
            btnLangsamer.TabIndex = 3;
            btnLangsamer.Text = "Langsamer";
            btnLangsamer.UseVisualStyleBackColor = true;
            // 
            // btnSchneller
            // 
            btnSchneller.Location = new Point(1340, 272);
            btnSchneller.Name = "btnSchneller";
            btnSchneller.Size = new Size(188, 58);
            btnSchneller.TabIndex = 4;
            btnSchneller.Text = "Schneller";
            btnSchneller.UseVisualStyleBackColor = true;
            btnSchneller.Click += button3_Click;
            // 
            // btnBeenden
            // 
            btnBeenden.Location = new Point(1750, 272);
            btnBeenden.Name = "btnBeenden";
            btnBeenden.Size = new Size(188, 58);
            btnBeenden.TabIndex = 5;
            btnBeenden.Text = "Beenden";
            btnBeenden.UseVisualStyleBackColor = true;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(17F, 41F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(2047, 425);
            Controls.Add(btnBeenden);
            Controls.Add(btnSchneller);
            Controls.Add(btnLangsamer);
            Controls.Add(btnFahren);
            Controls.Add(btnStart);
            Controls.Add(pnlStrasse);
            Name = "Form1";
            Text = "Form1";
            ResumeLayout(false);
        }

        #endregion

        private Panel pnlStrasse;
        private Button btnStart;
        private Button btnFahren;
        private Button btnLangsamer;
        private Button btnSchneller;
        private Button btnBeenden;
    }
}
