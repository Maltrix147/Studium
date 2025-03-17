using System;

namespace Media
{
  class Audio : IMedia
  {
    // die Klasse Picture ben�tigt lediglich die Methoden DisplayMadia() und StopMedia()
    // PlayMedia() wird nicht ben�tigt

    #region IMedia Member

    string IMedia.DisplayMedia()
    {
      return this.GetType().Name + ": DisplayMedia() wird nicht unterst�tzt.";
    }

    string IMedia.PlayMedia()
    {
      return this.GetType().Name + ": Audio gestartet";
    }

    string IMedia.StopMedia()
    {
      return this.GetType().Name + ": Audio gestoppt";
    }

    #endregion
  }
}
