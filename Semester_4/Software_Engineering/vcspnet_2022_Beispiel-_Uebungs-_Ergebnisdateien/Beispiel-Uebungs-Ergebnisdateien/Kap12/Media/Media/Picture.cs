using System;

namespace Media
{
  class Picture : IMedia
  {
    // die Klasse Picture ben�tigt lediglich die Methoden DisplayMadia() und StopMedia()
    // PlayMedia() wird nicht ben�tigt

    #region IMedia Member

    string IMedia.DisplayMedia()
    {
      return this.GetType().Name + ": Bild wird angezeigt.";
    }

    string IMedia.PlayMedia()
    {
      return this.GetType().Name + ": PlayMedia() wird nicht unterst�tzt.";
    }

    string IMedia.StopMedia()
    {
      return this.GetType().Name + ": Bild ausgeblendet";
    }

    #endregion
  }
}
