package dao;

import database.Products;
import java.util.List;

public interface ProductsDaoImpl {

    public List<Products> getAllProducts();

    public List<Products> getAllVisibleProducts();

    public List<Products> getAllInvisibleProducts();

    public int setVisible(String price, int id);

    public Products getProductById(int productId);

    public void addProduct(Products product);

    public void deleteProduct(int id);

    public void updateQuantity(int id, int quantity);
}
