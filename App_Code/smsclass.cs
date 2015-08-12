using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//namespaces to define
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class smsclass
{
    public static int setRecord(String qry)
    {
        int i = 0;

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString.ToString());

        conn.Open();

        SqlCommand cmd = new SqlCommand(qry, conn);
        i = cmd.ExecuteNonQuery();

        conn.Close();

        return i;
    }
    public static SqlDataReader getRecord(String qry)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString.ToString());

        conn.Open();

        SqlCommand cmd = new SqlCommand(qry, conn);
        SqlDataReader dr = cmd.ExecuteReader();

        return dr;

    }
}