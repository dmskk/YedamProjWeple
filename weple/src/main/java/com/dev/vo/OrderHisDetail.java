package com.dev.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderHisDetail {
	String prodName;
	int buyAmount;
	int isShare;
	int totalPrice;
	int prodPrice;
	
	@Override
	public String toString() {
		return "OrderHisDetail [prodName=" + prodName + ", buyAmount=" + buyAmount + ", isShare=" + isShare
				+ ", totalPrice=" + totalPrice + ", prodPrice=" + prodPrice + "]";
	}
}

