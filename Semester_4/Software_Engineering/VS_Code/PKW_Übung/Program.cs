using System.Reflection.Metadata.Ecma335;

namespace For
{
  class Program
  {
    static void Main(string[] args)
    {
        PKW meinAuto =new PKW (500, "VW", 310, "rot");
        PKW deinAuto =new PKW (400, "Porsche", 350, "blau");
        meinAuto.beschleunigen(10);
        meinAuto.beschleunigen(10);
        meinAuto.beschleunigen(30);
        meinAuto.beschleunigen(100);
        meinAuto.fahren(50);
    }
  }
  public class PKW
  {
    private int Leistung;
    private string Hersteller;
    private int Geschwindigkeit;
    private string Farbe;
    private int aktuelleGeschwindigkeit;
    private int gefahrene_Strecke;

    public PKW(int leistung, string hersteller, int geschwindigkeit, string farbe)
    {
        this.Leistung = leistung;
        this.Hersteller = hersteller;
        this.Geschwindigkeit = geschwindigkeit;
        this.Farbe = farbe;
        this.aktuelleGeschwindigkeit = 0;
        this.gefahrene_Strecke = 0;
    }

    public void bremsen(int betrag)
    {
        if ((this.aktuelleGeschwindigkeit -betrag) > 0)
        {
            this.aktuelleGeschwindigkeit -= betrag;
        }
        
    }
    public void beschleunigen(int betrag)
    {
        if ((this.aktuelleGeschwindigkeit + betrag) < this.Geschwindigkeit)
        {
            this.aktuelleGeschwindigkeit += betrag;
        }
    }
    public void beschleunigen()
    {
        if (this.aktuelleGeschwindigkeit < this.Geschwindigkeit)
        {
            this.aktuelleGeschwindigkeit += 10;
        }
    }

    public void fahren(int Strecke)
    {
        this.gefahrene_Strecke += Strecke;
    }

  }
}