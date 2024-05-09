<%@page import="java.util.* , java.sql.*" %>

<% 
String username = request.getParameter("username");
String password = request.getParameter("password");
try{
Class.forName("com.mysql.cj.jdbc.Driver");
String connectionString = "jdbc:mysql://localhost:3306/lab?useSSL=false&user=root&password=root";
Connection con = DriverManager.getConnection(connectionString);
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("Select * from regis where username = '"+username+"' and password = '"+password+"'");
if(rs.next()){
%>
<script>
    alert("Successfully Login as User!")
    </script>
<%
    response.sendRedirect("user.html");
}
else{
%>
<script>
    alert("Invalid Credientials!!!");
    </script>
<%
    }
}
catch(Exception e){
System.out.println(e);
}



%>