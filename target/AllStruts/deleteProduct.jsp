<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="com.example.Product"%>
<%@ page import="com.example.FactoryProvider"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Product</title>
<link rel="stylesheet" href="global.css">
</style>
</head>
<body>
	<h1>List of Products</h1>

	<table>
		<tr>
			<th>Id</th>
			<th>Product Name</th>
			<th>Description</th>
			<th>Price</th>
			<th>Category</th>
			<th>Stock</th>
		</tr>

		<% 
   
            Session session3 = FactoryProvider.getFactory().openSession();
            
            try {
                session3.beginTransaction();
                List<Product> products = session3.createQuery("from Product").getResultList();
                
                for (Product product : products) {
        %>
		<tr>
			<td><%= product.getId() %></td>
			<td><%= product.getProductName() %></td>
			<td><%= product.getDescription() %></td>
			<td><%= product.getPrice() %></td>
			<td><%= product.getCategory() %></td>
			<td><%= product.getStock() %></td>
		</tr>
		<%
                }
                session3.getTransaction().commit();
            } finally {
                if (session3 != null && session3.isOpen()) {
                    session3.close();
                }
            }
        %>
		<div class="container text-center mt-2">
			<a href="index.jsp" class="btn btn-primary">Home</a>
		</div>
	</table>
	<h1>Delete Book</h1>

	<form action="deleteProduct" method="post">
		<label for="id">Product ID:</label> <input type="text" id="id" name="id"
			placeholder="Enter Product ID to Delete" required />

		<button type="submit">Delete Product</button>
	</form>
</body>
</html>
