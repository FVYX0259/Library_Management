<%@page import="java.util.* , java.sql.*" %>

<% 
String id = request.getParameter("id");
try{
Class.forName("com.mysql.cj.jdbc.Driver");
String connectionString = "jdbc:mysql://localhost:3306/lab?useSSL=false&user=root&password=root";
Connection con = DriverManager.getConnection(connectionString);
Statement st = con.createStatement();
int a = st.executeUpdate("delete from books where book_id = '"+id+"'");
if(a > 0){
%>
<script>
    alert("Successfully Removed the book with id = "+id);
    </script>
<%
    response.sendRedirect("admin.html");
}
else{
%>
<script>
    alert("There might be something wrong!!!");
    </script>
<%
    }
}
catch(Exception e){
System.out.println(e);
}



%>