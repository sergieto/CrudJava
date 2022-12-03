<%-- 
    Document   : agregarProfesor
    Created on : 2/12/2022, 06:41:11 PM
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
        <h1 align="center">Sistema Universidad</h1>
        <h2 align="center">Agregar Profesor</h2><br>
        
        <c:if test="${param.nombre == null}">
            <form method="post" align="center">
                <table border="3" cellspacing="3" cellpadding="3" align="center"
                   style="background-color:#82AA82;
                           border-color:#226022;">
                    <tbody>
                        <%--<tr>
                            <td></td>
                            <td><input type="hidden" name="id" value="${fila.id}"/></td>
                        </tr> --%>
                        <tr>
                            <td>Cédula</td>
                            <td><input type="text" name="cedula" value="${fila.cedula}"
                                       style="background-color:#92AA92; border-color:#226022;"/></td>
                        </tr>
                        <tr>
                            <td>Nombre</td>
                            <td><input type="text" name="nombre" value="${fila.nombre}"
                                       style="background-color:#92AA92; border-color:#226022;"/></td>
                        </tr>
                        <tr>
                            <td>Facultad</td>
                            <td><input type="text" name="facultad" value="${fila.facultad}"
                                       style="background-color:#92AA92; border-color:#226022;"/></td>
                        </tr>
                        <tr>
                            <td>Teléfono</td>
                            <td><input type="text" name="telefono" value="${fila.telefono}"
                                       style="background-color:#92AA92; border-color:#226022;"/></td>
                        </tr>
                        <tr>
                            <td>Categoría</td>
                            <td>
                                <sql:query var="resCategorias" dataSource="${universidad}">
                                    SELECT * FROM categoria;
                                </sql:query>
                                    <select name="id_categoria" style="background-color:#92AA92; border-color:#226022;">
                                        <option value="0">---SELECT---</option>
                                        <c:forEach var="item" items="${resCategorias.rows}">
                                            <option value="${item.id}">
                                                <c:out value="${item.descripcion}"/>
                                            </option>
                                        </c:forEach>
                                    </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
                        <br>
                        <input type="submit" value="Insertar"
                               style="background-color:#92AA92; border-color:#226022;">
            </form>
        </c:if>
        <c:if test="${param.nombre!=null}">
            <sql:update var="resultado" dataSource="${universidad}">
                INSERT INTO 
                profesor (nombre, cedula, facultad, telefono, id_categoria)
                VALUES ('${param.nombre}',
                '${param.cedula}',
                '${param.facultad}',
                '${param.telefono}',
                '${param.id_categoria}'
                );
            </sql:update>
            <c:if test="${resultado==1}">
                <p align="center">Registro Exitoso</p>
                <p align="center"><a href="index.jsp"><input type="submit" value="Regresar"
                                                             style="background-color:#92AA92; border-color:#226022;">
                                    </a>
                </p>
                
            </c:if>
        </c:if>
    </body>
</html>

