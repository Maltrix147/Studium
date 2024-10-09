function loadXMLDoc(filename) {
        if (window.XMLHttpRequest)	{
	xhttp=new XMLHttpRequest();
        } else {
	xhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xhttp.open("GET", filename, false);
        xhttp.send();
        return xhttp.responseXML;
 }


function getNodeText(xmlNode) {
   if (xmlNode != null) {
     // W3C DOM Level 3
     if (typeof xmlNode.textContent != 'undefined') {
       return(xmlNode.textContent);
     }
     // W3C DOM Level 2
     else if (typeof xmlNode.text != 'undefined') {
       return(xmlNode.text);
     }
   }
}

function OeffneInfoFenster(AlbumName) {
  Fenster=open("", "Individuell", "resizable=yes, screenX=0, screenY=0, height=400, width=300");
  Fenster.focus();

  with (Fenster) {
    document.write('<html><head><title>'+ AlbumName +'<\/title>');
    document.write('<link type="text\/css" rel="stylesheet" href="musik_link.css" \/>');
    document.write('<\/head>');
    document.write('<body>');
    document.write('<table border="1" cellpadding="3">');

    Titel  = XMLObjekt.getElementsByTagName('TITEL');
    i = -1;
    if (Titel.length > 0)
      do {
        i++;
        if (getNodeText(Titel[i]) == AlbumName) {
          Album = Titel[i].parentNode;

          for (j=0; j<Album.childNodes.length; j++) {
            if (Album.childNodes[j].nodeType == 1) {
              document.write('<tr>');
              document.write('<td>' + Album.childNodes[j].nodeName + ': <\/td>');
              if (getNodeText(Album.childNodes[j]) != '') {
                document.write('<td>' + getNodeText(Album.childNodes[j]) + '<\/td>');
              } else {
                document.write('<td>- Keine Angabe -<\/td>');
              }
              document.write('<\/tr>');
            }
          }
        }
      } while (getNodeText(Titel[i]) != AlbumName);

    document.write('<\/table>');
    document.write('<\/body><\/html>');
    return
  }
}

function OeffneInterpretFenster(InterpretName) {
  Fenster=open("", "Individuell", "resizable=yes, screenX=0, screenY=0, height=400, width=300");
  Fenster.focus();

  with (Fenster) {
    document.write('<html><head><title>'+ InterpretName +'<\/title>');
    document.write('<link type="text\/css" rel="stylesheet" href="musik_link.css" \/>');
    document.write('<\/head>');
    document.write('<body>');
    document.write('<table border="1" cellpadding="3">');

    Interpret  = XMLObjekt.getElementsByTagName('INTERPRET');
    document.write('<tr><td colspan="2" bgcolor="moccasin"><b>' + InterpretName + '<\/b><\/td><\/tr>');
    document.write('<tr><td><b>Titel<\/b><\/td><td><b>Stil<\/b><\/td><\/tr>');

    i = -1;
    if (Interpret.length > 0) {
      for (i=0; i<Interpret.length; i++) {
        if (getNodeText(Interpret[i]) == InterpretName) {
          Album = Interpret[i].parentNode;
          Titel = Album.getElementsByTagName('TITEL');

          document.write('<tr>');
          document.write('<td>' + getNodeText(Titel[0]) + '<\/td>');
          document.write('<td>' + getNodeText(Titel[0].attributes[0]) + '<\/td>');
          document.write('<\/tr>');
        }
      }
    }

    document.write('<\/table>');
    document.write('<\/body><\/html>');
    return;
  }
}


function OeffneModellInfo(ModellTxt) {
  Fenster=open("", "Individuell", "menubar=no, locationbar=no, resizable=yes, status=no, screenX=0, screenY=0, height=300, width=350");
  Fenster.focus();

  with (Fenster)
  {
     document.write('<html><head><title>Information zum Modell: '+ ModellTxt +'<\/title>');
     document.write('<link type="text\/css" rel="stylesheet" href="uebung3.css" \/>');
     document.write('<\/head>');
     document.write('<body>');
     document.write('<table>');

     Modell  = kfzObjekt.getElementsByTagName('MODELL');
     i = -1;
     if (Modell.length > 0)
        do {
           i++;
           if (getNodeText(Modell[i]) == ModellTxt) {
                kfz = Modell[i].parentNode;

                for (j=0; j<kfz.childNodes.length; j++) {
                  if (kfz.childNodes[j].nodeType == 1) {
                    document.write('<tr>');
                    document.write('<td>' + kfz.childNodes[j].nodeName + ': <\/td>');
                    if (getNodeText(kfz.childNodes[j]) != '') {
                       document.write('<td>');
                       document.write(getNodeText(kfz.childNodes[j]));
	       if (kfz.childNodes[j].attributes.length > 0) {
		document.write(' ' + getNodeText(kfz.childNodes[j].attributes[0]));
	      }
                       document.write('<\/td>');
                    } else {
                       document.write('<td>- Keine Angabe -<\/td>');
                    } // if
                    document.write('<\/tr>');
                  } // if
                }

             }
          } while (getNodeText(Modell[i]) != ModellTxt);

     document.write('<\/table>');


     document.write('<\/body><\/html>');
     return
  }
}