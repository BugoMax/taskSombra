<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<script src="${pageContext.request.contextPath}/resources/js/jquery-1.7.1.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/ui/jquery.ui.core.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/ui/jquery.ui.widget.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/ui/jquery.ui.position.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/ui/jquery.ui.autocomplete.js"></script>
		<link href="<c:url value="/resources/css/style_new.css" />"rel="stylesheet">
		<link href="<c:url value="/resources/images/favicon.ico" />"rel="shortcut icon"type="image/x-icon">
		<title>Articles</title>
	</head>
	<body>
		<div class="container">
			<h1>Bath and Health</h1>
			<h3>Articles</h3>
		</div>
		<div class="container articles">
			<c:forEach var="article" items="${articleList}">
				<div class="col-sm-12 col-md-6">
					<div class="panel panel-default" >
				    	<div class="panel-heading">
							<!-- add link (wrapper tag) to the good -->
							<a href="articles&${article.id}"><img alt="${article.header}"
								border="0" src="admin/image?imgName=${article.imgPath}"
								class="img-responsive"></a>
						</div>
						<div class="panel-body">
							<div class="article_header">
								<h3 class="articles_h">
									<a href="articles&${article.id}">
									<c:out value="${article.header}" />
								</a></h3>
							</div>
							<!-- think about keeping this information on this page -->
							<div class="article_body">
								<p><c:out value="${article.content.length() > 300 ? article.content.substring(0, 300) : article.content}" escapeXml="false"/></p>
							</div>
							<div class="articles_read">
								<a href="articles&${article.id}">Read</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</body>
</html>