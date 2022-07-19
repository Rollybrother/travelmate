package com.spring.tmz.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring.tmz.domain.ReviewVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/mybatis-context.xml",
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class MyBoardServiceTests {
	
	@Setter(onMethod_= {@Autowired})
	private Review_service review_service;
	
//	@Test
//	public void testMyBoardServiceExist() {
//		log.info(review_service);
//		assertNotNull(review_service);
//	}
//	@Test
//	public void get_board_detail_modify() {
//		log.info(review_service.get_board_detail_modify(3L));
//		
//	}
//	@Test
//	public void set_review_board_deleted() {
//		log.info(review_service.set_review_board_deleted(3L));
//		
//	}
//	@Test
//	public void remove_review_board() {
//		log.info(review_service.remove_review_board(2L));
//	}
	@Test
	public void modify_review_board() {
		ReviewVO my_review = new ReviewVO();
		my_review.setRv_title("제목1");
		my_review.setRv_writer("작성자1");
		my_review.setRv_content("내용1");
		my_review.setRv_no(1);
		log.info(review_service.modify_review_board(my_review));
	}
//	
//	@Test
//	public void testGetBoardList() {
////		myBoardService.getBoardList().forEach(myBoard -> log.info(myBoard));
//		//		assertNotNull(myBoardService);
//		review_service.getBoardList(new MyBoardPagingDTO(2, 10)).forEach(myBoard -> log.info(myBoard));
//	}
//	@Test
//	public void testGetBoardList() {
//		myBoardService.getBoardList().forEach(myBoard -> log.info(myBoard));
//		//		assertNotNull(myBoardService);
//	}
//	@Test
//	public void registerBoard() {
//		ReviewVO my_review = new ReviewVO();
//		my_review.setRv_title("제목");
//		my_review.setRv_writer("작성자");
//		my_review.setRv_content("내용");
//		review_service.register_review_board(my_review);
//
//		log.info("등롣된 글의 글번호:"+review_service.register_review_board(my_review));
//	}
////	@Test
////	public void registerBoard() {
////		MyBoardVO myBoard = new MyBoardVO(0,"서비스 새글 입력 테스트 제목","서비스 새글 테스트 내용",null, 0,0,0,null,null);
////		myBoardService.registerBoard(myBoard);
////		//		assertNotNull(myBoardService);
////		log.info("등롣된 글의 글번호:"+myBoardService.registerBoard(myBoard));
////	}
//		@Test
//		public void testGetBoard() {
//			log.info(myBoardService.getBoard(1L));
//		}
//		@Test
//		public void testsetBoardDeleted() {
//			log.info(myBoardService.setBoardDeleted(7L));
//			log.info(myBoardService.setBoardDeleted(8L));
//			
//			log.info(myBoardService.getBoard(7L));
//			log.info(myBoardService.getBoard(8L));
//		}
//		@Test
//		public void testRemoveBoard() {
//			log.info("수행결과"+myBoardService.removeBoard(7L));
//			log.info(myBoardService.getBoard(7L));
//
//		}
//		@Test
//		public void testModifyBoard() {
//			
//			MyBoardVO myBoardVO = myBoardService.getBoard(1L);
//			
//			if(myBoardVO == null) {
//				return;
//			}
//			
//			myBoardVO.setBtitle("제목수정:서비스 테스트");
//			log.info("수정된 게시물 조회 결과"+myBoardService.modifyBoard(myBoardVO));
//		}
	
		
}
