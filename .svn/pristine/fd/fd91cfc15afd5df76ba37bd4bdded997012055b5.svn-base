package www.zhizunbao.utils;

public class PageUtil {

	//当前页
	private int currentPage;
	//上一页
	private int prevPage;
	//下一页
	private int nextPage;
	//最后一页
	private int lastPage;
	//总条数
	private int count;
	//每页条数
	private int pageSize;
	//记录
	private int pageRecord;
	
	private String mohu;
	
	private String page;
	
	//分页
	public PageUtil(String currentPage,int pageSize,int count) {
		//初始化 当前页
		initCurrentPage(currentPage);
		//计算上一页
		initPrevPage();
		//计算最后一页
		initLastPage(count, pageSize);
		//计算下一页
		initNextPage();
		//计算记录
		initPageRecord();
		initPage();
	}
	
	//模糊查询+分页
	public PageUtil(String currentPage,int pageSize,int count,String mohu) {
		//初始化 当前页
		initCurrentPage(currentPage);
		//计算上一页
		initPrevPage();
		//计算最后一页
		initLastPage(count, pageSize);
		//计算下一
		initNextPage();
		//计算记录
		initPageRecord();
		this.mohu = mohu;
		initPage();
	}
	
	//第一步，给当前页初始化值
	private void initCurrentPage(String currentPage){
		if(currentPage==null||currentPage.equals("")){
			currentPage = "1";
		}
		this.currentPage = Integer.parseInt(currentPage);
	}
	//第二步，初始化上一页的值
	private void initPrevPage(){
		if(this.currentPage==1){
			this.prevPage = this.currentPage;
		}else{
			this.prevPage = this.currentPage-1;
		}
	}
	//第三步，初始化最后一页的值
	private void initLastPage(int count,int pageSize){
		this.count = count;
		this.pageSize = pageSize;
		if(this.count%this.pageSize==0){
			this.lastPage = this.count/this.pageSize;
		}else{
			this.lastPage = this.count/this.pageSize+1;
		}
	}
	//第四部，计算下一页
	private void initNextPage(){
		if(this.currentPage == this.lastPage){
			this.nextPage = this.lastPage;
		}else{
			this.nextPage = this.currentPage+1;
		}
	}
	
	private void initPageRecord(){
		this.pageRecord = (this.currentPage-1)*this.pageSize;
	}
	
	private void initPage(){
		this.page = "第"+this.currentPage+"/"+this.lastPage+"页";
		this.page += "<input type='button' value='首页' onclick='fenye(1)' >";
		this.page += "<input type='button' value='上一页' onclick='fenye("+this.prevPage+")' >";
		this.page += "<input type='button' value='下一页' onclick='fenye("+this.nextPage+")' >";
		this.page += "<input type='button' value='尾页' onclick='fenye("+this.lastPage+")' >";
	}
	

	public int getCurrentPage() {
		return currentPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public int getCount() {
		return count;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getPageRecord() {
		return pageRecord;
	}

	public String getMohu() {
		return mohu;
	}

	public String getPage() {
		return page;
	}
	
	
}
