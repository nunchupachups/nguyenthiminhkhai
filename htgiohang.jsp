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
khachhangbo khbo=new khachhangbo();
giohangbo ghbo=new giohangbo();
ArrayList<sachbean> ds=sbo.getsach();
String ml=request.getParameter("ml");
String key=request.getParameter("txtTim");
String un=request.getParameter("txtun");
String pass=request.getParameter("txtpass");
khachhangbean kh=khbo.Ktdn(un, pass);
String ms=request.getParameter("ms");
String xoaAll=request.getParameter("xoaAll");
String msxoa=request.getParameter("msxoa");
String mscn=request.getParameter("mscn");
String slcn=request.getParameter("txtsl") ;
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
khachhangbean khss=(khachhangbean) session.getAttribute("acc");
giohangbo ghss=(giohangbo) session.getAttribute("gh");
%>
    <nav class="navbar navbar-inverse">
  	<div class="container-fluid">
    <ul class="nav navbar-nav">
      <li><a href="menu.jsp">Trang ch???</a></li>
      <li class="active"><a href="htgiohang.jsp">Gi??? h??ng(<%=ghss.tongsach()%>)</a></li>
      <li><a href="#">Thanh to??n</a></li>
      <li><a href="#">L???ch s??? mua h??ng</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    <% 
    	
    	if(khss==null){ %>
      <li><a href="#"><span class="glyphicon glyphicon-user"></span>????ng k??</a></li>
      <li><a href="#" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-log-in"></span>????ng nh???p</a></li>
      <%}else {
    	  
      %>
      <li><a href="#"><span class="glyphicon glyphicon-user"></span>Xin ch??o, <%=khss.getHoten() %></a></li>
      <li><a href="giohang.jsp?ss=0"><span class="glyphicon glyphicon-log-out"></span>????ng Xu???t</a></li>
      <%} %>
    </ul>
  </div>
</nav>

<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Th??ng tin ????ng nh???p</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	
        	
          <form method="post" action="giohang.jsp?login=0">
          	T??n ????ng nh???p: <input type="text" name="txtun" class="form-control"> <br>
          	M???t kh???u : <input type="password" name="txtpass" class="form-control"> <br>
          	<input type="submit" name="but1" value="????ng nh???p" class="btn-primary">
          </form>
        </div>
        
      </div>
    </div>
  </div>
<%if(request.getParameter("login")!=null){
	if (kh!=null){%>
		<script>
		alert("????ng nh???p th??nh c??ng!");
		</script>
	<%}else if(un!=null){ %>
	<script>
	alert("Sai t??n ????ng nh???p ho???c m???t kh???u!");
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
  					<tr>
  						<td colspan="2"><h6>GI??? H??NG C???A B???N</h6></td>
  					</tr>
  					<%	
  					
  					ArrayList<giohangbean> dsgh=ghss.getgiohang();
  					for(giohangbean k:dsgh){
  					%>
  						<tr>
  							<td style="display:flex;flex-direction:row">
  								<div><img src="image_sach/<%=k.getAnh()%>" width="100px" height="120px">
  								</div>
  								
  								<div style="margin-left:10px">
  									<p><strong><%=k.getTensach() %></strong></p><br>
  									
  										<form method="post" action="giohang.jsp?mscn=<%=k.getMasach()%>">
  										<p>Gi??: <%=k.getGia() %>?? x 
  										<input type="text" name="txtsl" value=<%=k.getSoluong() %> style="width:40px">
  										<input class= "btn-link" type="submit" name="btncn" value="C???p nh???t" >
  										   | <span><a class= "btn-link" href="giohang.jsp?msxoa=<%=k.getMasach()%>">Tr??? l???i</a></span>
  										</form>
  										 
  									</p>
  								</div>
  							</td>
  							
  						</tr>
  						
  				<%}%>
  					<tr>
  						<td><h4><strong>T???ng c???ng: <%=ghss.tongtien() %>VN??</strong></h4></td>
  					</tr>
  					<tr>
  						<td align="center">
  							<span><a class = "btn btn-default" href="giohang.jsp?xoaAll=0" >Tr??? l???i to??n b???</a></span>
  							<span><a class = "btn btn-default" href="menu.jsp" >Ti???p t???c mua h??ng</a></span>
  							<span><a class = "btn btn-primary" href="giohang.jsp" >Thanh to??n</a></span>

  							
  						</td>
  					</tr>
			
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