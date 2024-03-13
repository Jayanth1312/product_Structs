<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.example.Product" %>
<%@ page import="com.example.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <link rel="stylesheet" href="global.css">
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
   
            Session session1 = FactoryProvider.getFactory().openSession();
            
            try {
                session1.beginTransaction();
                List<Product> products = session1.createQuery("from Product").getResultList();
                
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
                session1.getTransaction().commit();
            } finally {
                if (session1 != null && session1.isOpen()) {
                    session1.close();
                }
            }
        %>
        <div class="container text-center mt-2">
        	<a href="index.jsp" class="btn btn-primary">Home</a>
        </div>
    </table>
    
    <h1>Update Product</h1>
    
    <form action="updateProduct" method="post">
<label for="id">Product ID:</label>
        <input type="text" id="id" name="id" placeholder="Enter Product ID" required />

        <label for="productName">Name:</label>
        <input type="text" id="productName" name="product.productName" placeholder="Enter Name" required />

        <label for="description">Description:</label>
        <input type="text" id="description" name="product.description" placeholder="Enter Description" required />

        <label for="price">Price:</label>
        <input type="number" id="price" name="book.price" placeholder="Enter Price" required />

        <label for="category">Category:</label>
        <input type="text" id="category" name="product.category" placeholder="Enter Category" required />

        <label for="stock">Stock Available:</label>
        <input type="number" id="stock" name="product.stock" placeholder="Enter stock available" required />

        <button type="submit">Update Product</button>
    </form>
</body>
</html>
