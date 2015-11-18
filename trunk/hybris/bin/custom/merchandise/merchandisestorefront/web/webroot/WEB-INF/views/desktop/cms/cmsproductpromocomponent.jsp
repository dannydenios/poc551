<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/desktop/product" %>

<c:url value="${not empty page ? page.label : urlLink}" var="encodedUrl" />
<c:url value="${productData.url}/quickView" var="productQuickViewUrl"/>

<div class="productpromo">

	<div class="ProductImage QuickView">
		<a href="${productQuickViewUrl}">
			<product:productPrimaryImage product="${productData}" format="thumbnail"/>
		</a>
		<div class="QuickViewBtn" style="color: rgb(0, 0, 0); margin: 0px; top: 126.333px; left: 37.5px; display: none; background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(rgb(247, 247, 247)), to(rgb(220, 219, 219)));">Quick View</div>
	</div>
	<div class="ProductDetails">
		<a href="${productQuickViewUrl}" class="pname">${productData.name}</a>
		<em class="p-price">
			<format:price priceData="${productData.price}"/>
		</em>
	</div>
	<div class="ProductActionAdd">
		<a href="${productQuickViewUrl}" class="btn icon-Choose Options" title="Choose Options">Choose Options</a>
	</div>
</div>