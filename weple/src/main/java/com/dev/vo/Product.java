package com.dev.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Product implements Serializable {
	@Override
	public String toString() {
		return "Product [prodId=" + prodId + ", imgUrl=" + imgUrl + ", prodName=" + prodName + ", prodPrice="
				+ prodPrice + ", weight=" + weight + ", content=" + content + ", origin=" + origin + ", isShare="
				+ isShare + ", sharePeople=" + sharePeople + ", catgLevel3=" + catgLevel3 + ", participatePeople="
				+ participatePeople + ", catgLevel1=" + catgLevel1 + ", catgLevel2=" + catgLevel2 + ", myjjim=" + myjjim
				+ ", totaljjim=" + totaljjim + ", ratio=" + ratio + ", star=" + star + ", avgStar=" + avgStar + "]";
	}
	private int prodId;
	private String imgUrl;
	private String prodName;
	private int prodPrice;
	private int weight;
	private String content;
	private String origin;
	private int isShare;
	private int sharePeople;
	private int catgLevel3;
	private int participatePeople;
	private int catgLevel1;
	private int catgLevel2;
	private int myjjim;
	private int totaljjim;
	private double ratio;
	private int star;
	private double avgStar;
}
