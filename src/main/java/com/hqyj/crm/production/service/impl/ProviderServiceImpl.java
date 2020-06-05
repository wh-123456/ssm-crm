package com.hqyj.crm.production.service.impl;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.crm.production.dao.ProviderMapper;
import com.hqyj.crm.production.entity.Provider;
import com.hqyj.crm.production.service.ProviderService;
@Service
public class ProviderServiceImpl implements ProviderService {
	@Autowired
	private ProviderMapper providerMapper;

	@Override
	public PageInfo<Provider> queryPageInfo(Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Provider> providers = providerMapper.selectAllProvider();
		return new PageInfo<Provider>(providers);
	}

	@Override
	public Provider queryProviderInfo(Integer providerId) {
		return providerMapper.selectAllInfo(providerId);
	}

	@Override
	public Provider updateProvider(Provider provider) {
		providerMapper.updateProviderByPrimaryKeySelective(provider);
		providerMapper.updateProviderInfoByPrimaryKeySelective(provider);
		return providerMapper.selectAllInfo(provider.getProviderId());
	}

	@Override
	public Provider insertProvider(Provider provider) {
		String providerName = provider.getProviderName();
		if(providerName==null||"".equals(providerName)) {
			return null;
		}
		Provider provider_db=providerMapper.selectProviderByProviderName(providerName);
		if(provider_db!=null) {
			return null;
		}
		providerMapper.insertProviderInfoSelective(provider);
		providerMapper.insertProviderSelective(provider);
		return provider;
	}

	@Override
	public boolean deleteProvider(Integer providerId) {
		int n=providerMapper.deleteProviderByPrimaryKey(providerId);
		int m=providerMapper.deleteProviderInfoByPrimaryKey(providerId);
		if(n==m) {
			return true;
		}
		return false;
	}

	@Override
	public PageInfo<Provider> getProviderByKeyWord(String keyword, Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		if(keyword==null) {
			keyword="";
		}
		keyword="%"+keyword+"%";
		List<Provider> providers = providerMapper.selectProviderByKeyword(keyword);
		return new PageInfo<Provider>(providers);
	}

	@Override
	public boolean deleteManyProvider(String[] id_arr) {
		if(id_arr==null || id_arr.length==0) {
			return false;
		}
		int[] idArr=new int[id_arr.length];
		for (int i = 0; i < id_arr.length; i++) {
			idArr[i]=Integer.parseInt(id_arr[i]);
		}
		int m=providerMapper.deleteManyProvider(idArr);
		int n=providerMapper.deleteManyProviderInfo(idArr);
		
		if(m==id_arr.length&&n==id_arr.length) {
			return true;
		}
		return false;
	}

	@Override
	public List<String> queryAllProviderName() {
		return providerMapper.selectAllProviderName();
	}
	

}
