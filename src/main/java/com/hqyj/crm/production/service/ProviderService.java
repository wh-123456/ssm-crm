package com.hqyj.crm.production.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.hqyj.crm.production.entity.Provider;

public interface ProviderService {

	PageInfo<Provider> queryPageInfo(Integer pageNum, Integer pageSize);

	Provider queryProviderInfo(Integer providerId);

	Provider updateProvider(Provider provider);

	Provider insertProvider(Provider provider);

	boolean deleteProvider(Integer providerId);

	PageInfo<Provider> getProviderByKeyWord(String keyword, Integer pageNum, Integer pageSize);

	boolean deleteManyProvider(String[] id_arr);

	List<String> queryAllProviderName();

}
