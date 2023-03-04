package chap07.dao;

import java.util.List;

import chap07.dto.PizzaOrder;

public interface PizzaOrderDAO {

	// 피자 오더 객체를 여러개 선택할 수 있는 메서드
	// 피자 오더 여러개를 받을 수 있는 메서드
	List<PizzaOrder> selectAll(String query);
	
	// DB로부터 피자 오더 객체를 하나만 선택해오는 메서드
	PizzaOrder select(String query);
	
	// DB에 새로운 피자 주문을 추가하는 메서드
	Integer insert(PizzaOrder order);
	
	// 이런식으로 추상화 해놓고 사용하면.. 비즈니스 로직의 코드량이 획기적으로 줄어든다.
}
