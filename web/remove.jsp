<%@ page import="java.util.* , java.sql.* " %>
<style>
    body{
        background: rgb(5, 68, 104);
    }
    .cont{
        background: #fff;
    }
    </style>
    <script>
       function handle(e){
           alert(e);
       }
       </script>
    <center style="padding-top: 100px">
        <h1> Available Books </h1>
        <table border="2" class = "cont" style="padding: 20px">
   <tr>
        <td>Book ID</td>
        <td>Title</td>
        <td>Author</td>
        <td>Published_Year</td>
        <td>Genre</td>
        <td>Available_Copies</td>
        <td>Actions</td>
   </tr>
   <%
   try
   {
       Class.forName("com.mysql.cj.jdbc.Driver");
        String connectionString = "jdbc:mysql://localhost:3306/lab?useSSL=false&user=root&password=root";
        Connection con = DriverManager.getConnection(connectionString);
        Statement st = con.createStatement();
       ResultSet rs=st.executeQuery("select * from Books");
       while(rs.next())
       {
   %>
           <tr><td><%=rs.getString(1) %></td>
           <td><%=rs.getString(2) %></td>
           <td><%=rs.getString(3) %></td>
           <td><%=rs.getString(4) %></td>
           <td><%=rs.getString(5) %></td>
           <td><%=rs.getString(6) %></td>
           <td><a href="handleremove.jsp?id=<%=rs.getString(1)%>" style="background-color: green">Remove</a></td>
           </tr>
   <%
       }
   %>
   </table>
    </center>
   <%
   }
   catch(Exception e)
   {
        System.out.println(e);
   }
   %>