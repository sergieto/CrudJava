<%-- 
    Document   : eliminarProfesor
    Created on : 2/12/2022, 06:49:51 PM
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:setDataSource var="universidad"
                   driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:33065/profesorese192?zeroDateTimeBehavior=CONVERT_TO_NULL"
                   user="root"
                   password="admin" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar Registro</title>
    </head>
    <body style="background-color:#529952;"><br>
        <h1 align="center">Registro Eliminado</h1>
        
        <c:if test="${param.id != null}" >
            <sql:update var="result" dataSource="${universidad}">
                DELETE from profesor
                WHERE id = ${param.id}
            </sql:update>
            <c:if test="${result==1}">
                <p align="center">Registro Eliminado exitosamente</p>
                <p align="center"><a href="index.jsp">
                     <input type="submit" value="Regresar"
                            style="background-color:#92AA92; border-color:#226022;"/>
                </a></p>
            </c:if>
        </c:if>
    </body>
</html>

