package com.example;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionSupport;

public class updateProduct extends ActionSupport {
	private int id;
	private Product product;

	public String post() {
		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();

			// Fetch the existing product from the database using its ID
			Product existingProduct = session.get(Product.class, id);

			if (existingProduct != null) {
				// Update the product details with the provided data
				existingProduct.setProductName(product.getProductName());
				existingProduct.setDescription(product.getDescription());
				existingProduct.setCategory(product.getCategory());
				existingProduct.setStock(product.getStock());

				// No need to set the ID here, as it's already set in the fetched object

				// Save the changes
				session.update(existingProduct);

				tx.commit();
				addActionMessage("Product updated successfully!");
				return SUCCESS;
			} else {
				addActionError("Product with ID " + id + " not found.");
				return ERROR;
			}
		} catch (Exception e) {
			if (tx != null && tx.isActive()) {
				tx.rollback();
			}
			addActionError("Error updating Product: " + e.getMessage());
			return ERROR;
		} finally {
			session.close();
		}
	}

	// Getters and setters for id and product
	// These methods are necessary to allow Struts to populate the properties
	// from the form data

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
}