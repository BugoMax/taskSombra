	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="cf"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<script src="${pageContext.request.contextPath}/resources/js/jquery-1.7.1.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/ui/jquery.ui.core.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/ui/jquery.ui.widget.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/ui/jquery.ui.position.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/ui/jquery.ui.autocomplete.js"></script>
		
		<script type="text/JavaScript"
			src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js">
			
		</script>
		<script type="text/javascript">
			function plusToBasket(id) {		
				var productid = id;
				$.ajax({
					url : 'plusBasket',
					type : 'GET',
					data : ({
						productId : id
					}),
					success : function(id) {
						var secondHalf = "idQty";
						var name = productid + secondHalf;
						var qty = document.getElementById(name);
						qty.value = +qty.value + +1;
						var totalName = "totalItem";
						var basePrice = "price";
						var total = document.getElementById("total");
						var item = document.getElementById(totalName + productid);
						var price = document.getElementById(basePrice + productid);
						var sum = parseFloat(item.innerHTML) + parseFloat(price.value);
						var totalSum = parseFloat(total.innerHTML) + parseFloat(price.value);
						item.innerHTML =  sum.toFixed(2);
						total.innerHTML = totalSum.toFixed(2);
					}
				});
			}
			function minusFromBasket(id) {
				var productid = id;
				$.ajax({
					url : 'minusBasket', //call method to save to basket
					type : 'GET',
					data : ({
						productId : id
					}),
					success : function(id) {
						var secondHalf = "idQty";
						var name = productid + secondHalf;
						var qty = document.getElementById(name);
						qty.value = +qty.value + -1;
						var totalName = "totalItem";
						var basePrice = "price";
						var total = document.getElementById("total");
						var item = document.getElementById(totalName + productid);
						var price = document.getElementById(basePrice + productid);
						var sum = parseFloat(item.innerHTML) - parseFloat(price.value);
						var totalSum = parseFloat(total.innerHTML) - parseFloat(price.value);
						item.innerHTML =  sum.toFixed(2);
						total.innerHTML = totalSum.toFixed(2);
					}
				});
			}
		</script>
		<link href="<c:url value="/resources/css/style_new.css" />"rel="stylesheet">
		<title>Cart</title>
	</head>
	<body>
		<cf:form method="GET" action="confirm" modelAttribute="product">
			<table class="zui-table zui-table-highlight-all cart" align="center">
				<tr class="cart_title">
					<th>Photo</th>
					<th>Name</th>
					<th>Price</th>
					<th>Qty</th>
					<th>Total</th>
					<th>Remove</th>
				</tr>
				<c:forEach var="product" items="${basketList}">
					
					<tr>
						<td>
						<div class="cart_img-wrap">
						 <a class="cart_img" href="product${product.id}"> 
						 <c:if test="${product.imgPath == null}">
										<img alt="${product.productName}" border="0"
										src="<c:url value="/resources/images/default.jpg" />"
										width="130" height="120" />
								</c:if> 
								<c:if test="${product.imgPath != null}">
									<img alt="${product.productName}" border="0"
										src="admin/image?imgName=${product.imgPath}" width="230"
										height="220" />
								</c:if>
						 </a>
						</div>
						</td>
						<td class="cart_name">${product.productName}</td>
						<td class="cart_price">
							<div>
								<input type="hidden" id="price${product.id}" value="${product.price}"/>	
									${product.price}
							</div>
						</td>
						<td class="cart_qty">
							<div>
								<span class="minus">
									<a href="javascript:minusFromBasket(${product.id})"><span class="glyphicon glyphicon-minus cart_minus"></span>
									</a>
								</span> 
								<input
									type="text" value="${product.basketQty}" id="${product.id}idQty"
									name="${product.id}idQty" size="3" /> <span class="plus"><a
									href="javascript:plusToBasket(${product.id})"><span class="glyphicon glyphicon-plus cart_plus"></span></a></span>
							</div>
						</td>
					
						<!--  PUT BUTTON -->
						<c:set var="totalItem" value="${product.price*product.basketQty}" />
						<td class="cart_total">
							<div id="totalItem${product.id}">${totalItem}</div>
						</td>
						<c:set var="total" value="${totalItem+total}" />
						<td class="cart_remove">
							<a href="remove${product.id}" title="Remove"><span class="glyphicon glyphicon-trash"></span></a>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td class="cart_total-whole">Total: <div id = "total">${total}</div></td>
					<td align="right">
						<input class="cart_confirm" type="submit" value="Buy"/>
					</td>
				</tr>
			</table>
			
		</cf:form>
	
	</body>
</html>