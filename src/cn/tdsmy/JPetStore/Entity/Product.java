package cn.tdsmy.JPetStore.Entity;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/31 23:10
 * @Version 1.0
 */
public class Product {
    private String category;
    private String productID;
    private String name;
    private String introduce;
    private Map<String, Item> itemMap;//key:itemID,value:item

    public Product(String productID, String name, String introduce, Map<String, Item> itemMap) {
        this.productID = productID;
        this.name = name;
        this.introduce = introduce;
        this.itemMap = itemMap;
    }

    public Product() {
        itemMap = new HashMap<>();
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public Map<String, Item> getItemMap() {
        return itemMap;
    }

    public void setItemMap(Map<String, Item> itemMap) {
        this.itemMap = itemMap;
    }
}
