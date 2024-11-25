
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;

namespace TransaktionBsp {
  class Program {
    static MySqlConnection mysqlConnection = new MySqlConnection();//§\label{cmdTransaktion14}§

    static void Main(string[] args) {
      Start();
      InsertArtikel("Sge", 14.85, "EUR");
      Stopp();
    }

    static void Start() {
      String strConnectionString = "";
      strConnectionString += "server=127.0.0.1;uid=root";
      strConnectionString += ";password=;database=oshop";
      try {
        mysqlConnection.ConnectionString = strConnectionString;
        mysqlConnection.Open();
      }
      catch (Exception ex) {
        Console.WriteLine(ex.Message);
      }
    }

    static void Stopp() {
      mysqlConnection.Close();
    }

    static void InsertArtikel(string strArtikel, double dPreis, string strWaehrung) {
      MySqlCommand command = new MySqlCommand();
      command.Connection = mysqlConnection;
      long artikel_id = 0;
      try {
        // Befehl 1
        command.CommandText = "START TRANSACTION";
        command.Prepare();
        command.ExecuteNonQuery();
        // Befehl 2
        command.CommandText = "INSERT INTO artikel (bezeichnung, einzelpreis, waehrung) VALUES (@bezeichnung, @einzelpreis, @waehrung)";
        command.Prepare();
        command.Parameters.AddWithValue("@bezeichnung", strArtikel);
        command.Parameters.AddWithValue("@einzelpreis", dPreis);
        command.Parameters.AddWithValue("@waehrung", strWaehrung);
        command.ExecuteNonQuery();
        artikel_id = command.LastInsertedId;
        // Befehl 3
        command.CommandText = "INSERT INTO artikel_nm_warengruppe VALUES (@warengruppe_id, @artikel_id)";
        command.Prepare();
        command.Parameters.Clear();
        command.Parameters.AddWithValue("@warengruppe_id", 3);
        command.Parameters.AddWithValue("@artikel_id", artikel_id);
        command.ExecuteNonQuery();
        // Befehl 4
        command.Parameters["@warengruppe_id"].Value = 4;
        command.Parameters["@artikel_id"].Value = artikel_id;
        command.ExecuteNonQuery();
        // Befehl 5
        command.Parameters.Clear();
        command.CommandText = "COMMIT"; // Alles in Ordnung §\label{cmdTransaktion15}§
        command.Prepare();
        command.ExecuteNonQuery();
      }
      catch (Exception ex) {
        Console.WriteLine(ex.Message);
        command.Parameters.Clear();
        command.CommandText = "ROLLBACK"; // Alles wieder auf Anfang §\label{cmdTransaktion16}§
        command.Prepare();
        command.ExecuteNonQuery();
      }
    }
  }
}
