namespace Ganzzahlrechner
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void btnPlus_Click(object sender, EventArgs e)
        {
            try
            {
                int ergebnis = Convert.ToInt32(txtZahl1.Text);
                ergebnis += Convert.ToInt32(txtZahl2.Text);
                ergebnis += Convert.ToInt32(txtZahl3.Text);
                txtErgebnis.Text = Convert.ToString(ergebnis);
            }
            catch
            {
                MessageBox.Show("Bitte Überprüfen Sie Ihre Eingabe", "Fehlerhafte Eingaben", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnMulti_Click(object sender, EventArgs e)
        {
            try
            {
                int ergebnis = Convert.ToInt32(txtZahl1.Text);
                ergebnis *= Convert.ToInt32(txtZahl2.Text);
                ergebnis *= Convert.ToInt32(txtZahl3.Text);
                txtErgebnis.Text = Convert.ToString(ergebnis);
            }
            catch
            {
                MessageBox.Show("Bitte Überprüfen Sie Ihre Eingabe", "Fehlerhafte Eingaben", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
