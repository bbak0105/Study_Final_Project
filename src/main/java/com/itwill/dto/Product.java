package com.itwill.dto;

/*�̸�        ��?       ����            
--------- -------- ------------- 
PD_NO     NOT NULL VARCHAR2(20)  
PD_PDN_NO          VARCHAR2(20)  
PD_PCG_NO          VARCHAR2(5)   
PD_CNT             NUMBER        
PD_PRICE           NUMBER   */

public class Product {
	private String pdNo;
	private String pdPdnNo;//���� �ѹ�(����) -> �����ǰ�� ��������
	private String pdPcgNo;//ī�װ��� �ѹ�(����) -> ī�װ��� �̸� ��������
	private int pdCnt;
	private int pdPrice;
	
	private ProductCategory pcg;//-> ī�װ��� �̸� ��������
	
	private Production pdn;//-> �����ǰ�� ��������
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public ProductCategory getPcg() {
		return pcg;
	}

	public void setPcg(ProductCategory pcg) {
		this.pcg = pcg;
	}

	
	public Production getPdn() {
		return pdn;
	}


	public void setPdn(Production pdn) {
		this.pdn = pdn;
	}


	public String getPdNo() {
		return pdNo;
	}

	public void setPdNo(String pdNo) {
		this.pdNo = pdNo;
	}

	public String getPdPdnNo() {
		return pdPdnNo;
	}


	public void setPdPdnNo(String pdPdnNo) {
		this.pdPdnNo = pdPdnNo;
	}


	public String getPdPcgNo() {
		return pdPcgNo;
	}

	public void setPdPcgNo(String pdPcgNo) {
		this.pdPcgNo = pdPcgNo;
	}

	public int getPdCnt() {
		return pdCnt;
	}

	public void setPdCnt(int pdCnt) {
		this.pdCnt = pdCnt;
	}

	public int getPdPrice() {
		return pdPrice;
	}

	public void setPdPrice(int pdPrice) {
		this.pdPrice = pdPrice;
	}
}