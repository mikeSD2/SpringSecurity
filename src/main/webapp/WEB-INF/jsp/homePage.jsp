<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %> 
<html>

<body>
	<h2>hello from home jsp !!!</h2>
</body>
<!-- Воспользуемся тегом security чтобы отобразить какойто контент на странице в зависимости от роли вошедшего пользователя -->
	<security:authorize access="hasRole('ROLE_DUNGEONADMIN')"><!-- если пользователь имеет роль ROLE_DUNGEONADMIN показать ссылку -->
		<p>
			<a href="${pageContext.request.contextPath}/admin">Entar admin page</a>
		</p>
	</security:authorize>	

</html>