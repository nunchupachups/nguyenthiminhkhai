<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bo.khachhangbo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.sachbean"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.sachbo"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Document</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8") ;
response.setCharacterEncoding("utf-8");
loaibo lbo=new loaibo();
sachbo sbo=new sachbo();
giohangbo ghbo=new giohangbo();
khachhangbo khbo=new khachhangbo();
ArrayList<sachbean> ds=sbo.getsach();
String ml=request.getParameter("ml");
String key=request.getParameter("txtTim");
String un=request.getParameter("txtun");
String pass=request.getParameter("txtpass");
khachhangbean kh=khbo.Ktdn(un, pass);
if(session.getAttribute("gh")==null) session.setAttribute("gh", ghbo);

if(kh!=null){ 
	session.setAttribute("acc", kh);
	}
if(request.getParameter("ss")!=null){
	session.removeAttribute("acc");
}
if(ml!=null) ds=sbo.TimLoai(ml);
else
	if(key!=null) ds=sbo.Tim(key);
giohangbo ghss=(giohangbo) session.getAttribute("gh");
khachhangbean khss=(khachhangbean) session.getAttribute("acc");
%>
    <nav class="navbar navbar-inverse">
  	<div class="container-fluid">
    <ul class="nav navbar-nav">
      <li class="active"><a href="menu.jsp">Trang chủ</a></li>
      <li><a href="htgiohang.jsp">Giỏ hàng(<%=ghss.tongsach()%>)</a></li>
      <li><a href="#">Thanh toán</a></li>
      <li><a href="#">Lịch sử mua hàng</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    <% 
    	
    	if(khss==null){ %>
      <li><a href="#"><span class="glyphicon glyphicon-user"></span>Đăng ký</a></li>
      <li><a href="#" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-log-in"></span>Đăng nhập</a></li>
      <%}else {
    	  
      %>
      <li><a href="#"><span class="glyphicon glyphicon-user"></span>Xin chào, <%=khss.getHoten() %></a></li>
      <li><a href="menu.jsp?ss=0"><span class="glyphicon glyphicon-log-out"></span>Đăng Xuất</a></li>
      <%} %>
    </ul>
  </div>
</nav>

<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Thông tin đăng nhập</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	
        	
          <form method="post" action="menu.jsp?login=0">
          	Tên đăng nhập: <input type="text" name="txtun" class="form-control"> <br>
          	Mật khẩu : <input type="password" name="txtpass" class="form-control"> <br>
          	<input type="submit" name="but1" value="Đăng nhập" class="btn-primary">
          </form>
        </div>
        
      </div>
    </div>
  </div>
<%if(request.getParameter("login")!=null){
	if (kh!=null){%>
		<script>
		alert("Đăng nhập thành công!");
		</script>
	<%}else if(un!=null){ %>
	<script>
	alert("Sai tên đăng nhập hoặc mật khẩu!");
	</script>
	<%}} %>




  <table align="center" cellspacing="0" width="1000">
  <tr>
  	<td valign="top" width="200">
  		<table class="table table-hover">
  			<%
  			for(loaibean loai: lbo.getloai()){
  			%>
  			<tr>
  				<td>
  					<a href="menu.jsp?ml=<%=loai.getMaloai()%>">
  					<%=loai.getTenloai() %>
  					</a>
  				</td>
  			</tr>
  			<%} %>
  		</table>
  	</td>
  	<td valign="top" width="550">
  		<table class="table table-hover">
  			<% 
  				int n=ds.size();
  				for(int i=0;i<n;i++){
  				sachbean s= ds.get(i);
  				%>
  				<tr>
  					<td>
  				    	<img src="image_sach/<%=s.getAnh() %>" width="150px" height="200px"><br>
  				        	<a href="giohang.jsp?ms=<%=s.getMasach()%>">  <img src="buynow.jpg" alt="haha"></a> <br>
  				            <%=s.getTensach() %> <br>
  				            <%=s.getTacgia()%> <br>
  				            <%=s.getGia()%> <br>
  				    </td>
  				<%i++;
  				if(i<n){
  				s= ds.get(i);
  				%>
  					<td>
  				    	<img src="image_sach/<%=s.getAnh() %>" width="150px" height="200px"><br>
  				        	<a href="giohang.jsp?ms=<%=s.getMasach()%>">  <img src="buynow.jpg"></a> <br>
  				            <%=s.getTensach() %> <br>
  				            <%=s.getTacgia()%> <br>
  				            <%=s.getGia()%> <br>
  				    </td>
  				<%} %>
  				<%i++;
  				if(i<n){
  				s= ds.get(i);
  				%>
  					<td>
  						<img src="image_sach/<%=s.getAnh() %>" width="150px" height="200px"><br>
  						<a href="giohang.jsp?ms=<%=s.getMasach()%>">  <img src="buynow.jpg"></a> <br>
  						<%=s.getTensach() %> <br>
  						<%=s.getTacgia()%> <br>
  						<%=s.getGia()%> <br>
  					</td>
  				<%} %>
  				   
  				</tr>  	
  				<%} %>		
  		</table>
  	</td>
  	<td valign="top" width="250">
  		<form action="menu.jsp" method="post" align="right">
  			<input type="text" name="txtTim">
  			<input type="submit" value="Search" name="but1">
  		</form>
  	</td>
  </tr>
  </table>
</body>
</html>