<%@page import="java.util.* , java.sql.*" %>

<%
    String id = request.getParameter("id");
    try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    String connectionString = "jdbc:mysql://localhost:3306/lab?useSSL=false&user=root&password=root";
    Connection con = DriverManager.getConnection(connectionString);
    Statement st = con.createStatement();
    ResultSet rs=st.executeQuery("select * from Books where book_id = '"+id+"'");
    if(rs.next()){
    %>
    <section class="container" style="font-family: Arial, sans-serif; background-color: #f2f2f2; padding: 20px;">
    <div style="max-width: 600px; margin: 0 auto; background-color: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
        <h2 style="text-align: center;">Edit a Book Details</h2>
        <form action="edit2.jsp" method="post">
            <div style="margin-bottom: 10px;">
                <label for="book_id" style="display: inline-block; width: 120px;">Book ID:</label>
                <input type="text" id="book_id" name="book_id" readonly value ="<%=rs.getString(1)%>" style="padding: 8px; width: calc(100% - 140px);" required>
            </div>
            <div style="margin-bottom: 10px;">
                <label for="title" style="display: inline-block; width: 120px;">Title:</label>
                <input type="text" id="title" name="title" value ="<%=rs.getString(2)%>" style="padding: 8px; width: calc(100% - 140px);" required>
            </div>
            <div style="margin-bottom: 10px;">
                <label for="author" style="display: inline-block; width: 120px;">Author:</label>
                <input type="text" id="author" name="author" value ="<%=rs.getString(3)%>" style="padding: 8px; width: calc(100% - 140px);" required>
            </div>
            <div style="margin-bottom: 10px;">
                <label for="published_year" style="display: inline-block; width: 120px;">Published Year:</label>
                <input type="text" id="published_year" name="published_year" value ="<%=rs.getString(4)%>" style="padding: 8px; width: calc(100% - 140px);" required>
            </div>
            <div style="margin-bottom: 10px;">
                <label for="genre" style="display: inline-block; width: 120px;">Genre:</label>
                <input type="text" id="genre" name="genre" value ="<%=rs.getString(5)%>" style="padding: 8px; width: calc(100% - 140px);" required>
            </div>
            <div style="margin-bottom: 10px;">
                <label for="available_copies" style="display: inline-block; width: 120px;">Available Copies:</label>
                <input type="text" id="available_copies" value ="<%=rs.getString(6)%>" name="available_copies" style="padding: 8px; width: calc(100% - 140px);" required>
            </div>
            <div style="text-align: center;">
                <input type="submit" value="Edit Book" style="padding: 10px 20px; background-color: #007bff; color: #fff; border: none; border-radius: 5px; cursor: pointer;">
            </div>
        </form>
    </div>
    </section>
    <%
    }
    }
    catch(Exception e){
    System.out.println(e);
    }
%>