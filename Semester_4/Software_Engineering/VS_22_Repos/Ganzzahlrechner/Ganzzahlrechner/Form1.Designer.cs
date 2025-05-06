namespace Ganzzahlrechner
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
            lblZahl1 = new Label();
            lblZahl2 = new Label();
            lblZahl3 = new Label();
            txtZahl1 = new TextBox();
            txtZahl2 = new TextBox();
            txtZahl3 = new TextBox();
            lblErgebnis = new Label();
            txtErgebnis = new TextBox();
            btnPlus = new Button();
            btnMinus = new Button();
            btnMulti = new Button();
            btnDiv = new Button();
            btnProzent = new Button();
            SuspendLayout();
            // 
            // lblZahl1
            // 
            lblZahl1.AutoSize = true;
            lblZahl1.Location = new Point(81, 69);
            lblZahl1.Name = "lblZahl1";
            lblZahl1.Size = new Size(105, 41);
            lblZahl1.TabIndex = 0;
            lblZahl1.Text = "Zahl 1:";
            // 
            // lblZahl2
            // 
            lblZahl2.AutoSize = true;
            lblZahl2.Location = new Point(81, 173);
            lblZahl2.Name = "lblZahl2";
            lblZahl2.Size = new Size(105, 41);
            lblZahl2.TabIndex = 1;
            lblZahl2.Text = "Zahl 2:";
            // 
            // lblZahl3
            // 
            lblZahl3.AutoSize = true;
            lblZahl3.Location = new Point(81, 273);
            lblZahl3.Name = "lblZahl3";
            lblZahl3.Size = new Size(105, 41);
            lblZahl3.TabIndex = 2;
            lblZahl3.Text = "Zahl 3:";
            // 
            // txtZahl1
            // 
            txtZahl1.Location = new Point(258, 70);
            txtZahl1.Name = "txtZahl1";
            txtZahl1.Size = new Size(250, 47);
            txtZahl1.TabIndex = 3;
            // 
            // txtZahl2
            // 
            txtZahl2.Location = new Point(258, 173);
            txtZahl2.Name = "txtZahl2";
            txtZahl2.Size = new Size(250, 47);
            txtZahl2.TabIndex = 4;
            // 
            // txtZahl3
            // 
            txtZahl3.Location = new Point(258, 273);
            txtZahl3.Name = "txtZahl3";
            txtZahl3.Size = new Size(250, 47);
            txtZahl3.TabIndex = 5;
            // 
            // lblErgebnis
            // 
            lblErgebnis.AutoSize = true;
            lblErgebnis.Location = new Point(81, 378);
            lblErgebnis.Name = "lblErgebnis";
            lblErgebnis.Size = new Size(139, 41);
            lblErgebnis.TabIndex = 6;
            lblErgebnis.Text = "Erbebnis:";
            // 
            // txtErgebnis
            // 
            txtErgebnis.Enabled = false;
            txtErgebnis.Location = new Point(258, 378);
            txtErgebnis.Name = "txtErgebnis";
            txtErgebnis.Size = new Size(250, 47);
            txtErgebnis.TabIndex = 7;
            // 
            // btnPlus
            // 
            btnPlus.Location = new Point(658, 95);
            btnPlus.Name = "btnPlus";
            btnPlus.Size = new Size(188, 58);
            btnPlus.TabIndex = 8;
            btnPlus.Text = "+";
            btnPlus.UseVisualStyleBackColor = true;
            btnPlus.Click += btnPlus_Click;
            // 
            // btnMinus
            // 
            btnMinus.Location = new Point(891, 95);
            btnMinus.Name = "btnMinus";
            btnMinus.Size = new Size(188, 58);
            btnMinus.TabIndex = 9;
            btnMinus.Text = "-";
            btnMinus.UseVisualStyleBackColor = true;
            // 
            // btnMulti
            // 
            btnMulti.Location = new Point(658, 173);
            btnMulti.Name = "btnMulti";
            btnMulti.Size = new Size(188, 58);
            btnMulti.TabIndex = 10;
            btnMulti.Text = "*";
            btnMulti.UseVisualStyleBackColor = true;
            btnMulti.Click += btnMulti_Click;
            // 
            // btnDiv
            // 
            btnDiv.Location = new Point(891, 173);
            btnDiv.Name = "btnDiv";
            btnDiv.Size = new Size(188, 58);
            btnDiv.TabIndex = 11;
            btnDiv.Text = "/";
            btnDiv.UseVisualStyleBackColor = true;
            // 
            // btnProzent
            // 
            btnProzent.Location = new Point(891, 256);
            btnProzent.Name = "btnProzent";
            btnProzent.Size = new Size(188, 58);
            btnProzent.TabIndex = 12;
            btnProzent.Text = "%";
            btnProzent.UseVisualStyleBackColor = true;
            btnProzent.Click += button1_Click;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(17F, 41F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1289, 473);
            Controls.Add(btnProzent);
            Controls.Add(btnDiv);
            Controls.Add(btnMulti);
            Controls.Add(btnMinus);
            Controls.Add(btnPlus);
            Controls.Add(txtErgebnis);
            Controls.Add(lblErgebnis);
            Controls.Add(txtZahl3);
            Controls.Add(txtZahl2);
            Controls.Add(txtZahl1);
            Controls.Add(lblZahl3);
            Controls.Add(lblZahl2);
            Controls.Add(lblZahl1);
            Name = "Form1";
            Text = "Ganzzahl Rechner";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label lblZahl1;
        private Label lblZahl2;
        private Label lblZahl3;
        private TextBox txtZahl1;
        private TextBox txtZahl2;
        private TextBox txtZahl3;
        private Label lblErgebnis;
        private TextBox txtErgebnis;
        private Button btnPlus;
        private Button btnMinus;
        private Button btnMulti;
        private Button btnDiv;
        private Button btnProzent;
    }
}
