using System;

namespace Overloading
{
  class Klasse1
  {
    public virtual string Test()
    {
      return "Die Methode Klasse1.Test wurde ohne Parameter aufgerufen.";
    }

    public string Test(int i)
    {
      return "Die Methode Klasse1.Test wurde mit int-Parameter aufgerufen.";
    }

    public string Test(string s)
    {
      return "Die Methode Klasse1.Test wurde mit string-Parameter aufgerufen.";
    }
  }
}
