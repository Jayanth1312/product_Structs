<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h1 {
            color: #333;
            text-align: center;
            padding: 20px 0;
            background-color: #007bff;
            color: #fff;
            margin: 0;
        }
        .form-container {
            width: 50%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
            overflow: hidden;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input[type="text"], .form-group input[type="date"], .form-group input[type="number"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .form-group input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-group input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Add Book</h1>

    <div class="form-container">
        <form action="addProduct" method="post">
            <div class="form-group">
                <label for="product_name">Name:</label>
                <input type="text" id = "product_name" name="product.product_name" required />
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
                <input type="submit" value="Add Product" />
            </div>
        </form>
    </div>
</body>
</html>