package com.hqyj.crm.customer.entity;

public class CustSearch {
		private String name;

	    private String source;

	    private String industry;

	    private String level;
	    
	    private Integer pageNum=1;
	    
	    private Integer pageSize=8;

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getSource() {
			return source;
		}

		public void setSource(String source) {
			this.source = source;
		}

		public String getIndustry() {
			return industry;
		}

		public void setIndustry(String industry) {
			this.industry = industry;
		}

		public String getLevel() {
			return level;
		}

		public void setLevel(String level) {
			this.level = level;
		}

		public Integer getPageNum() {
			return pageNum;
		}

		public void setPageNum(Integer pageNum) {
			if(pageNum==null) {
				return ;
			}
			this.pageNum = pageNum;
		}

		public Integer getPageSize() {
			return pageSize;
		}

		public void setPageSize(Integer pageSize) {
			if(pageSize==null) {
				return;
			}
			this.pageSize = pageSize;
		}
	    
	    

}
