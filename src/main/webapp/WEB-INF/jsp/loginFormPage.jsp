<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<html>

<head>
	<title>Login Page</title>
	<style>
		.failCSS {
			color: red;
			background-color: yellow;
		}
		.logoutCSS {
			color: green;
		}
	</style>
	
</head>

<body>

<h3>Custom Login Page</h3>
	<!-- Немного о Csrf. Хакерская атака. Напрмер вы залогинены на сайте site.com. пользователь заходит на какойто другой сайт хакера evilsite.com. 
	и через форму на этом сайте произваодит какие-то действия на site.com (в форме например <form action="site.com/somePage"...>). 
	и таким образом через форму на сайте хакера можно сделать что-то не хорошее на страничке где пользователь залогинен (купить на site.com что-то например). 
	Spring предоставляет средства для защиты от этого. Спринг фильтр генерирует специальный токен отсылает его пользователю и вставляет его в форму залогиненого пользователя на site.com которую он будет отправлять.
	Теперь отправить данные на сервер site.com смогут только формы site.com которые получили токен от фильтра а формы evilsite.com сгенерировать и отправить такой токен который примет сервер не смогут.
	form:form автоматически принимает токен от спринг фильтра и отправляет его вместе с данными формы. писать что-то дополнительное для включения защиты не нужно.-->
	<form:form action="${pageContext.request.contextPath}/handle_loginInfoUrl" method="POST"> <!--В Security конфигурации было: login-processing-url="/handle_loginInfoUrl". на этот адрес в атребете action нашей кастомной формы отправляються отправляються данные пользователя которые он ввел. 
	pageContext.request.contextPath зто просто имя нашего приложения. тоесть то что в браузере http://localhost:8080/имя проэкта (тоесть аcontextPath)/admin-->
		User name: <input type="text" name="username" /> <br> <!-- важно отметить что name в инпутах должны быть обязательно именно "username" и "password" -->
		Password: <input type="password" name="password" />
		<c:if test="${param.error != null}"><!-- Если данные формы не верны Spring Security добавит в url браузера страницы формы параметр error.
		с помощью jstl можно проверить пуст ли он. если нет значит пользователь ввел что-то не так и вывести сообщение об ошибке. -->
			<i class="failCSS">invalid username/password.</i> <!-- class это название стиля которое применяетьсяк сообщению об ошибке. смори настройку стиля выше -->
		</c:if>
		<c:if test="${param.logout != null}"> <!-- после выхода со  страницы admin Spring Security добавит параметр в ссылку браузера на этой странице logout проверяя который можно вывести сообщение о успешном выходе -->
			<i class="logoutCSS">You succesfully logged out!!!</i> 
		</c:if>
		<input type="submit" value="LOGIN" />
	</form:form>

</body>

</html>


