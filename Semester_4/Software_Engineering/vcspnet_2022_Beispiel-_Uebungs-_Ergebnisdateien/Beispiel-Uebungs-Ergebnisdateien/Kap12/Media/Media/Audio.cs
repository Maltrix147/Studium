using System;

namespace Media
{
  class Audio : IMedia
  {
    // die Klasse Picture benötigt lediglich die Methoden DisplayMadia() und StopMedia()
    // PlayMedia() wird nicht benötigt

    #region IMedia Member

    string IMedia.DisplayMedia()
    {
      return this.GetType().Name + ": DisplayMedia() wird nicht unterstützt.";
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
