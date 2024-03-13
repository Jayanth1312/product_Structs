<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <link rel="stylesheet" href="global.css">
</head>
<body>
    <h1>Add Product</h1>

    <div class="form-container">
        <form action="addProduct" method="post">
            <div class="form-group">
                <label for="productName">Name:</label>
                <input type="text" id = "productName" name="product.productName" required />
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <input type="text" id = "description" name="product.description" required />
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" id = "price" name="product.price" required />
            </div>
            <div class="form-group">
                <label for="category">Category:</label>
                <input type="text" id = "category" name="product.category" required />
            </div>
            <div class="form-group">
                <label for="stock">Stock Available:</label>
                <input type="number" id = "stock" name="product.stock" required />
            </div>
            <div class="form-group">
                <button type="submit">Add Product</button>
            </div>
        </form>
    </div>
</body>
</html>
