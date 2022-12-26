package cn.tdsmy.JPetStore.Dao.impl;

import cn.tdsmy.JPetStore.Dao.PetDao;
import cn.tdsmy.JPetStore.Dao.Utils.DBUtils;
import cn.tdsmy.JPetStore.Entity.Item;
import cn.tdsmy.JPetStore.Entity.Product;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/27 22:08
 * @Version 1.0
 */
public class PetDaoImpl implements PetDao {
    @Override
    public Map<String, Product> searchPet(String key)//SQL模糊查询
    {
        Map<String, Product> productMap = new HashMap<>();
        try (Connection connection = DBUtils.getConnection()) {
            String sql = "select * from product where category like '%" + key + "%' or productID like '%" + key + "%' or name like '%" + key
                    + "%' or introduce like '%" + key + "%'";
            try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql)) {
                while (res.next()) {
                    String productID = res.getString("productID");//品种ID
                    String name = res.getString("name");//品种名
                    String introduce = res.getString("introduce");//品种简介

                    Product product = new Product();
                    product.setProductID(productID);
                    product.setName(name);
                    product.setIntroduce(introduce);

                    productMap.put(productID, product);
                }
            }

            String sql2 = "select * from item where itemID like '%" + key + "%' or description like '%" + key + "%'";
            try (PreparedStatement statement = connection.prepareStatement(sql2); ResultSet res = statement.executeQuery(sql2)) {
                while (res.next()) {
                    String productID = res.getString("productID");//品种ID

                    String sql3 = "select * from product where productID ='" + productID + "'";
                    try (PreparedStatement statement2 = connection.prepareStatement(sql3); ResultSet res2 = statement2.executeQuery(sql3)) {
                        while (res2.next()) {
                            String name = res2.getString("name");//品种名
                            String introduce = res2.getString("introduce");//品种简介

                            Product product = new Product();
                            product.setProductID(productID);
                            product.setName(name);
                            product.setIntroduce(introduce);

                            productMap.put(productID, product);
                        }
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productMap;
    }

    public List<Product> searchTips(String key) {
        List<Product> Tips = new ArrayList<>();
        try (Connection connection = DBUtils.getConnection()) {
            String sql = "select * from product where category like '%" + key + "%' or productID like '%" + key + "%' or name like '%" + key
                    + "%' or introduce like '%" + key + "%'";
            try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql)) {
                while (res.next()) {
                    String productID = res.getString("productID");//品种ID
                    String name = res.getString("name");//品种名
                    String introduce = res.getString("introduce");//品种简介


                    Product product = new Product();
                    product.setProductID(productID);
                    product.setName(name);
                    product.setIntroduce(introduce);

                    Tips.add(product);
                }
            }

            String sql2 = "select * from item where itemID like '%" + key + "%' or description like '%" + key + "%'";
            try (PreparedStatement statement = connection.prepareStatement(sql2); ResultSet res = statement.executeQuery(sql2)) {
                while (res.next()) {
                    String productID = res.getString("productID");//品种ID

                    String sql3 = "select * from product where productID ='" + productID + "'";
                    try (PreparedStatement statement2 = connection.prepareStatement(sql3); ResultSet res2 = statement2.executeQuery(sql3)) {
                        while (res2.next()) {
                            String name = res2.getString("name");//品种名
                            String introduce = res2.getString("introduce");//品种简介

                            Product product = new Product();
                            product.setProductID(productID);
                            product.setName(name);
                            product.setIntroduce(introduce);

                            Tips.add(product);
                        }
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return Tips;
    }

    @Override
    public Product getProduct(String productID) {
        Product product = new Product();
        try (Connection connection = DBUtils.getConnection()) {
            String sql = "select * from product where productID = '" + productID + "'";
            try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql)) {
                if (res.next()) {
                    String name = res.getString("name");
                    String introduce = res.getString("introduce");

                    product.setProductID(productID);
                    product.setName(name);
                    product.setIntroduce(introduce);
                }
            }

            String sql2 = "select * from item where productID = '" + product.getProductID() + "'";
            try (PreparedStatement statement = connection.prepareStatement(sql2); ResultSet res = statement.executeQuery(sql2)) {
                while (res.next()) {
                    String itemID = res.getString("itemID");
                    String description = res.getString("description");
                    int stock = res.getInt("stock");
                    BigDecimal listPrice = res.getBigDecimal("listPrice");

                    Item item = new Item(itemID, description, stock, listPrice);
                    product.getItemMap().put(itemID, item);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }

    @Override
    public Map<String, Product> getProductMap(String category) {
        Map<String, Product> productMap = new HashMap<>();//key:productID,value:product
        try (Connection connection = DBUtils.getConnection()) {
            String sql = "select * from product where category = '" + category + "'";
            try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql)) {
                while (res.next()) {
                    String productID = res.getString("productID");
                    String name = res.getString("name");
                    String introduce = res.getString("introduce");

                    Product product = new Product();
                    product.setProductID(productID);
                    product.setName(name);
                    product.setIntroduce(introduce);

                    productMap.put(productID, product);
                }
            }

            productMap.forEach((productID, product) ->
            {
                String sql2 = "select * from item where productID = '" + product.getProductID() + "'";
                try (PreparedStatement statement = connection.prepareStatement(sql2); ResultSet res = statement.executeQuery(sql2)) {
                    while (res.next()) {
                        String itemID = res.getString("itemID");
                        String description = res.getString("description");
                        int stock = res.getInt("stock");
                        BigDecimal listPrice = res.getBigDecimal("listPrice");

                        Item item = new Item(itemID, description, stock, listPrice);
                        product.getItemMap().put(itemID, item);
                    }
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            });
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productMap;
    }
}
