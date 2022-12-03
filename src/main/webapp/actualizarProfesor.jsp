<%-- 
    Document   : actualizarProfesor
    Created on : 2/12/2022, 06:56:39 PM
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
        <title>Actualizar Registro</title>
    </head>
    <body style="background-color:#529952;"><br>
        <h1 align="center">Actualizar Profesor</h1>
        <c:if test="${param.modifica == null}">
            <sql:query var="rsProfesor" dataSource="${universidad}">
                SELECT * FROM profesor WHERE id = ?
                <sql:param value="${param.id}"></sql:param>
            </sql:query>
            <form method="post">
                <table border="3" cellspacing="3" cellpadding="3" align="center"
                   style="background-color:#82AA82;
                           border-color:#226022;">
                    <c:forEach var="itemP" items="${rsProfesor.rows}">
                        <%-- <tr>
                            <td></td>
                            <td><input type="hidden" name="id" value="${itemP.id}"></td>
                        </tr> --%>
                        <tr>
                            <td>Cedula</td>
                            <td><input type="text" name="cedula" value="${itemP.cedula}"
                                       style="background-color:#92AA92; border-color:#226022;"></td>
                        </tr>
                        <tr>
                            <td>Nombre</td>
                            <td><input type="text" name="nombre" value="${itemP.nombre}"
                                       style="background-color:#92AA92; border-color:#226022;"></td>
                        </tr>
                        <tr>
                            <td>Facultad</td>
                            <td><input type="text" name="facultad" value="${itemP.facultad}"
                                       style="background-color:#92AA92; border-color:#226022;"></td>
                        </tr>           
                        <tr>
                            <td>Teléfono</td>
                            <td><input type="text" name="telefono" value="${itemP.telefono}"
                                       style="background-color:#92AA92; border-color:#226022;"></td>
                        </tr>
                        <tr>
                            <td>Categoría</td>
                            <td>
                                <sql:query var="rsCategoria" dataSource="${universidad}">
                                    SELECT * FROM categoria;
                                </sql:query>
                                <select name="id_categoria" style="background-color:#92AA92; border-color:#226022;">
                                    <option value="0">--Seleccione--</option>
                                    <c:forEach var="categoria" items="${rsCategoria.rows}">
                                        <option value="${categoria.id}"
                                                <c:if test="${categoria.id==itemP.id_categoria}">
                                                    selected
                                                </c:if>
                                                >
                                            <c:out value="${categoria.descripcion}"/>
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>

                    </c:forEach>
                </table>
                
                <br><!-- comment -->
                <p align="center"><input type="submit" value="Actualizar"
                                         style="background-color:#92AA92; border-color:#226022;"/>
                </p>
                <tr><input type="hidden" name="modifica" value="SI"></tr>
            </form>
        </c:if>
                
                <c:if test="${param.modifica!=null}">
                    <sql:update var="result" dataSource="${universidad}">
                        UPDATE profesor
                        set nombre = '${param.nombre}',
                        cedula = '${param.cedula}',
                        facultad = '${param.facultad}',
                        telefono = '${param.telefono}',
                        id_categoria = '${param.id_categoria}'
                        WHERE id = '${param.id}';
                    </sql:update>
                    <c:if test="${result ==1}">
                        <p align="center">Actualización Exitosa</p>
                        <p align="center"><a href="index.jsp"><input type="submit" value="Regresar"
                                                                     style="background-color:#92AA92; border-color:#226022;"></p>
                    </c:if>
                </c:if>       
    </body>
</html>
