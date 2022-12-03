<%-- 
    Document   : index
    Created on : 2/12/2022, 03:34:39 PM
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
        <title>Sistema Universidad</title>
    </head>
    <body style="background-color:#529952;"><br>
        <h1 align="center">Sistema Universidad!</h1>
        <h2 align="center">Profesores Registrados</h2><br>
        
        <sql:query var="resultado" scope="request" dataSource="${universidad}">
            SELECT profesor.id, profesor.cedula as cedula, profesor.nombre as nombre,
            profesor.facultad as facultad, profesor.telefono as telefono,
            categoria.descripcion as descripcion
            from profesor
            left join categoria
            on profesor.id_categoria=categoria.id
        </sql:query>
            
            <table border="3" cellspacing="3" cellpadding="3" align="center"
                   style="background-color:#82AA82;
                           border-color:#226022;">
                <thead>
                    <tr>
                        <th>CEDULA</th>
                        <th>NOMBRE</th>
                        <th>FACULTAD</th>
                        <th>TELEFONO</th>
                        <th>CATEGORÍA</th>
                        <th colspan="2">ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="fila" items="${resultado.rows}">
                        <tr>
                            <td ><c:out value="${fila.cedula}"/></td>
                            <td><c:out value="${fila.nombre}"/></td>
                            <td><c:out value="${fila.facultad}"/></td>
                            <td><c:out value="${fila.telefono}"/></td>
                            <td><c:out value="${fila.descripcion}"/></td>
                                <td>
                                    <a href="eliminarProfesor.jsp?id=${fila.id}">
                                        <input type="submit" value="Eliminar" 
                                               style="background-color:#92AA92; border-color:#226022;"></a>
                                </td>
                                <td>
                                    <a href="actualizarProfesor.jsp?id=${fila.id}">
                                        <input type="submit" value="Editar"
                                               style="background-color:#92AA92; border-color:#226022;"></a>
                                </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <p align="center">
            <a href="agregarProfesor.jsp?id=${fila.id}">
                            <input type="submit" value="Nuevo Profesor" 
                                   style="background-color:#92AA92; border-color:#226022;"></a>
            </p><br>
            <p align="center"><img src="logo2UTS.png" width="150" height="100" alt="error de imagen"></p>
    </body>
</html>

