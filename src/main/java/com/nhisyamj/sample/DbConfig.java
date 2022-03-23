package com.nhisyamj.sample;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DbConfig {

  public static Connection getDBConnection() throws SQLException {
    try {
      Context ctx = new InitialContext();
      DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/sample");
      return ds.getConnection();
    } catch (NamingException e) {
      e.printStackTrace();
    }
    return null;
  }
}
