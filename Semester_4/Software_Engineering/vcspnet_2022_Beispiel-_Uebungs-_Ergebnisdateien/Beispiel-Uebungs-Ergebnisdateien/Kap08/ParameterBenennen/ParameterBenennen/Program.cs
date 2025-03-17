using System;

namespace ParameterBenennen
{
  class Program
  {
    static void Main(string[] args)
    {
      Personal pers = new Personal();

      pers.Anlegen(alter: 25, ort: "Leipzig", name: "Meier");
    }
  }

  class Personal
  {
    private string name;
    private string ort;
    private int alter;

    public void Anlegen(string name, string ort, int alter)
    {
      this.name = name;
      this.ort = ort;
      this.alter = alter;
    }
  }
}