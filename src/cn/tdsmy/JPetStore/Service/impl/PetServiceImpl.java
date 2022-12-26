package cn.tdsmy.JPetStore.Service.impl;

import cn.tdsmy.JPetStore.Dao.PetDao;
import cn.tdsmy.JPetStore.Dao.impl.PetDaoImpl;
import cn.tdsmy.JPetStore.Entity.Product;
import cn.tdsmy.JPetStore.Service.PetService;

import java.util.List;
import java.util.Map;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/27 22:56
 * @Version 1.0
 */
public class PetServiceImpl implements PetService {
    private PetDao petDao;

    @Override
    public Map<String, Product> searchPet(String key) {
        if (petDao == null) {
            petDao = new PetDaoImpl();
        }
        return petDao.searchPet(key);
    }

    @Override
    public Map<String, Product> getProductMap(String category) {
        if (petDao == null) {
            petDao = new PetDaoImpl();
        }
        return petDao.getProductMap(category);
    }

    @Override
    public Product getProduct(String productID) {
        if (petDao == null) {
            petDao = new PetDaoImpl();
        }
        return petDao.getProduct(productID);
    }

    public List<Product> searchTips(String key) {
        if (petDao == null) {
            petDao = new PetDaoImpl();
        }
        return petDao.searchTips(key);
    }
}
