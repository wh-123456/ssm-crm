package com.hqyj.crm.production.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.crm.common.entity.Result;
import com.hqyj.crm.production.dao.ProductMapper;
import com.hqyj.crm.production.entity.Product;
import com.hqyj.crm.production.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper productMapper;

	@Override
	public Result queryProductByProductName(Product product) {
		if(product.getProductName()==null||"".equals(product.getProductName())) {
			return new Result(500,"产品名字为空");
		}
		 product =productMapper.selectByProductName(product);
		return new Result(200,"success",product);
	}

	@Override
	public PageInfo<Product> queryProducts(Product product, Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Product> products = productMapper.selectProducts();
		return new PageInfo<Product>(products);
	}

	@Override
	public Product insertProduct(Product product) {
		String productName = product.getProductName();
		if(productName==null||"".equals(productName)) {
			return null;
		}
		Product product_db=productMapper.selectProductByProductName(productName);
		if(product_db!=null) {
			return null;
		}
		productMapper.insertProductSelective(product);
		productMapper.insertProductInfoSelective(product);
		return product;
	}

	@Override
	public Product updateProduct(Product product) {
		productMapper.updateProductByPrimaryKeySelective(product);
		productMapper.updateProductInfoByPrimaryKeySelective(product);
//		 productMapper.selectByPrimaryKey(product.getProductId());
		return product;
	}

	@Override
	public Integer deleteProductByProductId(Integer productId) {
		productMapper.deleteProductByPrimaryKey(productId);
		return productMapper.deleteProductInfoByPrimaryKey(productId);
	}

	@Override
	public Product queryProductByProduct(Product product) {
		product = productMapper.selectProductInfoByPrimaryKey(product.getProductId());
		return product;
	}

	@Override
	public boolean deleteManyProducts(String[] id_arr) {
		if (id_arr == null || id_arr.length == 0) {
			return false;
		}
		int[] idArr = new int[id_arr.length];
		for (int i = 0; i < id_arr.length; i++) {
			idArr[i] = Integer.parseInt(id_arr[i]);
		}
		int n = productMapper.deleteManyProduct(idArr);
		int m = productMapper.deleteManyProductInfo(idArr);
		if (n == id_arr.length && m == id_arr.length) {
			return true;
		}
		return false;
	}

	@Override
	public PageInfo<Product> queryProductByKeyWord(String keyWord,String category,Integer pageNum,Integer pageSize) {
		keyWord="%"+keyWord+"%";
		PageHelper.startPage(pageNum, pageSize);
		List<Product> products=productMapper.selectProductByKeyWord(keyWord,category);
		return new PageInfo<Product>(products);
	}

	@Override
	public Set<String> queryCategroys() {
		
		return productMapper.queryCategroys();
	}

	@Override
	public List<Product> queryProducts() {
		return productMapper.selectProducts();
	}

}
