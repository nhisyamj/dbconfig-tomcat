<%@ page import="java.sql.Connection" %>
<%@ page import="com.nhisyamj.sample.DbConfig" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%
    Connection conn;

    try {
        conn = DbConfig.getDBConnection();
        if (conn!=null) {
            PreparedStatement ps = conn.prepareCall("CREATE TABLE sample ( \n" +
                    "   id INT NOT NULL, \n" +
                    "   title VARCHAR(50) NOT NULL, \n" +
                    "   author VARCHAR(20) NOT NULL, \n" +
                    "   submission_date DATE \n" +
                    ")");
            ps.execute();

            ps = conn.prepareCall("INSERT INTO sample(id, title, author) VALUES (1, 'testing', 'hisyam johan')");
            ps.execute();

            ps = conn.prepareCall("SELECT id, title, author FROM sample");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getString("id"));
                System.out.println(rs.getString("title"));
                System.out.println(rs.getString("author"));
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
