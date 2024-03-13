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

			// Fetch the existing book from the database using ISBN
			Product existingProduct = session.get(Product.class, id);

			if (existingProduct != null) {
				// Update the book details
				existingProduct.setId(id);
				existingProduct.setName(product.getName());
				existingProduct.setDescription(product.getDescription());
				existingProduct.setCategory(product.getCategory());
				existingProduct.setStock(product.getStock());

				// Save the changes
				session.merge(existingProduct);

				tx.commit();
				addActionMessage("Product updated successfully!");
				return SUCCESS;
			} else {
				addActionError("Product with Id " + id + " not found.");
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Product getBook() {
		return product;
	}

	public void setBook(Product book) {
		this.product = product;
	}

}
