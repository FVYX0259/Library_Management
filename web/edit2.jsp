<%@ page import = "java.sql.* , java.util.*"%>

<%
       String id = request.getParameter("book_id");
       String title = request.getParameter("title");
       String author = request.getParameter("author");
       String py = request.getParameter("published_year");
       String genre = request.getParameter("genre");
       String ac = request.getParameter("available_copies");
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String connectionString = "jdbc:mysql://localhost:3306/lab?useSSL=false&user=root&password=root";
            Connection con = DriverManager.getConnection(connectionString);
            Statement st = con.createStatement();
            int a = st.executeUpdate("update books set title = '"+title+"' , author = '"+author+"' , published_year = '"+py+"' , genre = '"+genre+"' , available_copies = '"+ac+"' where book_id = '"+id+"'");
            if(a > 0){
            %>
            <script>
               alert("Edit Successfully!!!");
               </script>
               <%
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
%>