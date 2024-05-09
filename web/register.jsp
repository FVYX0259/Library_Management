<%@ page import = "java.sql.* , java.util.*"%>

<%
       String username = request.getParameter("username");
       String pass = request.getParameter("password");
       String email = request.getParameter("email");
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String connectionString = "jdbc:mysql://localhost:3306/lab?useSSL=false&user=root&password=root";
            Connection con = DriverManager.getConnection(connectionString);
            Statement st = con.createStatement();
            int a = st.executeUpdate("Insert into regis(email,password,username) values ('"+email+"','"+pass+"','"+username+"')");
            if(a > 0){
               response.sendRedirect("user.html");
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
%>