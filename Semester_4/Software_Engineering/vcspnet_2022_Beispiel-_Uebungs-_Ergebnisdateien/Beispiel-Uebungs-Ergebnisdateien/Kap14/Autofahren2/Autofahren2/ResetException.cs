using System;

namespace Autofahren2
{
  public class ResetException : ApplicationException
  {
    public ResetException() : base() { }

    public ResetException(string Meldung) : base(Meldung) { }

    public ResetException(string Meldung, Exception e) : base(Meldung, e) { }
  }
}
