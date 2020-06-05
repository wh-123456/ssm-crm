/**
	 * @Title: 
	 * @Description: TODO 
	 * @param @param 
	 * @param @param 
	 * @param @return 
	 * @return 
	 * @throws
	 */
package com.hqyj.crm.pSell.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.crm.pSell.dao.SellMapper;
import com.hqyj.crm.pSell.entity.Sell;
import com.hqyj.crm.pSell.service.SellService;

/**
 * @author ASUS
 *
 */
@Service
public class SellServiceImpl implements SellService{
	@Autowired
	private SellMapper sellMapper;

	/* (non-Javadoc)
	 * @see com.hqyj.crm.pSell.service.SellService#queryAllSell()
	 */
	@Override
	public List<Sell> queryAllSell() {
		return sellMapper.queryAllSell();
	}

	/* (non-Javadoc)
	 * @see com.hqyj.crm.pSell.service.SellService#addSell(com.hqyj.crm.pSell.entity.Sell)
	 */
	@Override
	public int addSell(Sell sell) {
		return sellMapper.insertSelective(sell);
	}

	/* (non-Javadoc)
	 * @see com.hqyj.crm.pSell.service.SellService#deleteSell(int)
	 */
	public int deleteSell(String sellId) {
		return sellMapper.deleteByPrimaryKey(sellId);
	}

	/* (non-Javadoc)
	 * @see com.hqyj.crm.pSell.service.SellService#updateSell(com.hqyj.crm.pSell.entity.Sell)
	 */
	@Override
	public int updateSell(Sell sell) {
		return sellMapper.updateByPrimaryKeySelective(sell);
	}

}
