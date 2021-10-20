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
    <title>Document</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8") ;
response.setCharacterEncoding("utf-8");
giohangbo ghbo=new giohangbo();
sachbo sbo=new sachbo();
String ms=request.getParameter("ms");
String xoaAll=request.getParameter("xoaAll");
String msxoa=request.getParameter("msxoa");
String mscn=request.getParameter("mscn");
String slcn=request.getParameter("txtsl") ;
if(session.getAttribute("gh")==null) session.setAttribute("gh", ghbo);
giohangbo ghss=(giohangbo) session.getAttribute("gh");
ArrayList<giohangbean> dsgh=ghss.getgiohang();
sachbean s=sbo.TimSach(ms);
if(msxoa!=null) dsgh = ghss.xoa(msxoa);
if(xoaAll!=null) dsgh = ghss.xoaAll();
if(mscn!=null) dsgh = ghss.sua(mscn, (long)Long.parseLong(slcn));
if(ms!=null) dsgh= ghss.them(s.getMasach(), s.getTensach(), s.getTacgia(), s.getAnh(), s.getGia(), (long)1);
session.setAttribute("gh", ghss);
response.sendRedirect("htgiohang.jsp");
%>
</body>
</html>