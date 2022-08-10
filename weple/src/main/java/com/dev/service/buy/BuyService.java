
package com.dev.service.buy;

import java.util.List;

import com.dev.dao.BuyDAO;
import com.dev.vo.Buy;
import com.dev.vo.OrderHisDetail;


public class BuyService {
	// 싱글톤
	private static BuyService buyService = null;
	BuyDAO bDAO = BuyDAO.getInstance();
	
	
	private BuyService() {
		
	}
	
	public static BuyService getInstance() {
		if(buyService == null) {
			buyService = new BuyService();
		}
		return buyService;
	} 
	
	
	// 선택한 상품의 id로 장바구니에서 실행하는 메소드 만들기
	public void deleteFromCart(int prodId, String userId) {
		bDAO.deleteFromCart(prodId, userId);
	}
	
	// buy_process에 insert하는 메소드(공동구매 여부에 따라서 0, 1)
	public void insertIntoCart(Buy cartProduct) {
		bDAO.insertIntoCart(cartProduct);
	}
	
	// buyVO를 넘겨서 buy_process를 결제완료상품으로, 주문번호 넣는 메소드
	public void updateOrderComplete(Buy buy) {
		bDAO.updateOrderComplete(buy);
	}

	// orderNum이랑 userId로 주문정보 조회하는 메소드(prodName, prodAmount, isShare, totalPrice)
	public List<OrderHisDetail> showAllBuy(String userId, int orderNum) {
		return bDAO.showAllBuy(userId, orderNum);
	}

}

