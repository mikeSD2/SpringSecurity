<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!-- добавляем либу с тегом для получения id и ролей -->
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %> 
<html>
<!-- для получения данных которые мы вводили в форму авторизации можем использовать jsp тег security но перед этим добавить spring-security-taglibs зависимость в pom. -->
<body>
	<h2>hello from admin jsp !!!</h2>
	Id: <security:authentication property="principal.username" /><!-- вот так показываем имя пользователя -->
	<br>
	Role(s): <security:authentication property="principal.authorities" /><!-- вот так показываем роль пользователя -->

</body>
<form:form action="${pageContext.request.contextPath}/logout" method="POST"> <!-- кнопка для выхода. отправляем сигнал фильтру о выходе на ссылку /logout -->
		<input type="submit" value="Logout" />
	</form:form>
</html>