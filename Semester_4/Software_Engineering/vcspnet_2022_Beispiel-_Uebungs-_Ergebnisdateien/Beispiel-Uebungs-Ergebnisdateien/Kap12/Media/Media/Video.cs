using System;

namespace Media
{
  class Video : IMedia
  {
    #region IMedia Member

    string IMedia.DisplayMedia()
    {
      return this.GetType().Name + ": Videobild wird angezeigt.";
    }

    string IMedia.PlayMedia()
    {
      return this.GetType().Name + ": Video gestartet";
    }

    string IMedia.StopMedia()
    {
      return this.GetType().Name + ": Video gestoppt";
    }

    #endregion
  }
}
