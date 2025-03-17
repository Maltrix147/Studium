using System;

namespace EigeneException
{
  public class EmptyStringException : ApplicationException
  {
    public EmptyStringException() : base() { }
    public EmptyStringException(string meldung) : base(meldung) { }
    public EmptyStringException(string meldung, Exception ex) : base(meldung, ex) { }
  }

  class Test
  {
    public string Plus(string txt1, string txt2)
    {
      if (txt1.Length == 0 || txt2.Length == 0)
        throw new EmptyStringException("Mindestens einer de Strings ist leer!");
      else
        return txt1 + txt2;
    }
  }

  class Program
  {
    static void Main(string[] args)
    {    
      Test eineInstanz = new Test();

      try
      {
        Console.WriteLine(eineInstanz.Plus("Zusammen", ""));
      }
      catch (EmptyStringException e)
      {
        Console.WriteLine(e.Message);
      }
      finally
      {
        Console.WriteLine("finally-Block ausgeführt.");
      }
    }
  }
}