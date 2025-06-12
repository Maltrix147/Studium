namespace AutoSimulation
{
    public partial class Form1 : Form
    {
        private Auto PKW = new Auto();
        public Form1()
        {
            InitializeComponent();
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            PKW.Geschwindigkeit = 50;
            PKW.Text = "PKW";
            PKW.Size = new Size(50, 20);
            PKW.Location = new Point(0, pnlStrasse.Height - 20);
            PKW.BackColor = Color.Red;
            pnlStrasse.Controls.Add(PKW);
            pnlStrasse.BackColor = Color.Gray;
            this.Text = "Geschwindigkeit: " + PKW.Geschwindigkeit.ToString();

        }
        private void button3_Click(object sender, EventArgs e)
        {

        }
    }
}
