package com.diet.biz.dietProgram.impl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.diet.biz.dietProgram.Criteria;
import com.diet.biz.dietProgram.FoodVO;
import com.diet.biz.dietProgram.KcalVO;
import com.diet.biz.dietProgram.StampVO;
import com.diet.biz.dietProgram.UserDietVO;
import com.diet.biz.user.UserVO;

@Repository
public class DietProgramDAOSpring {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// SQL 명령어들
	private final String FOOD_SELECT = "select * from tblfood where `탄수화물(g)` < ? and `단백질(g)` < ? and `지방(g)` < ? limit ?, ?";
	private final String FOOD_TOT_COUNT = "select count(*) from tblfood where `탄수화물(g)` < ? and `단백질(g)` < ? and `지방(g)` < ?";
	private final String DIET_INSERT = "insert into tbldiet(id, food, reg_date) values(?, ?, now())";
	private final String DIET_UPDATE = "update tbldiet set food = ?, reg_date = now() where id = ?";
	private final String DIET_CHECK = "select food from tbldiet where id = ? order by reg_date desc limit 1";
	private final String DIET_SELECT = "select * from tblfood where `음식명` = ?";
	private final String STAMP_CNT_UPDATE = "update tblmember set stamp_cnt = ? where id = ?";
	private final String STAMP_CNT_SELECT = "select stamp_cnt from tblmember where id = ?";
	private final String STAMP_INSERT = "insert into tblstamp(id, stamp_date) values(?, ?)";
	private final String STAMP_SELECT = "select stamp_date from tblstamp where id = ?";
	private final String STAMP_SELECT2 = "select stamp_num from tblstamp where id = ? and stamp_date = ?";
	private final String KCAL_UPDATE = "update tblmember set kcal = ? where id = ?";
	private final String NUTRIENTS_UPDATE = "update tblmember set carbs = ?, protein = ?, fat = ? where id = ?";
	
	// 사용자 스펙을 통한 기초대사량 계산
	public int dietStep1(KcalVO vo) {
		
		int bmr = 0;
		
		// 해리스 베네딕트 방정식 이용
		if(vo.getSex().equals("남")) {
			double doubleBmr = 66 + (13.7 * vo.getWeight() + (5 * vo.getHeight()) - (6.8 * vo.getAge()));
			bmr = (int) doubleBmr;
			System.out.println("남자용 방적식 결과");
			System.out.println("bmr :" + bmr);
			
		} else if(vo.getSex().equals("여")) {
			double doubleBmr = 655 + (9.6 * vo.getWeight() + (1.7 * vo.getHeight()) - (4.7 * vo.getAge()));
			bmr = (int) doubleBmr;
			System.out.println("여자용 방적식 결과");
			System.out.println("bmr :" + bmr);
		}
		
		return bmr;
	}
	
	// 기초대사량에 근거한 칼로리 계산
	public int dietStep2(KcalVO vo) {
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest req = sra.getRequest();
		HttpSession session = req.getSession();
		UserVO userInfo = (UserVO)session.getAttribute("idKey");
		
		int kcal = 0;
		
		if(vo.getType().equals("diet")) {
			
			switch(vo.getActivityAmount()) {
				case "few":
					kcal = (int) Math.round(vo.getBmr() * 1.2 * 0.8);
					break;
				case "aFew":
					kcal = (int) Math.round(vo.getBmr() * 1.375 * 0.8);
					break;
				case "normal":
					kcal = (int) Math.round(vo.getBmr() * 1.55 * 0.8);
					break;
				case "quite":
					kcal = (int) Math.round(vo.getBmr() * 1.725 * 0.8);
					break;
				case "aLot":
					kcal = (int) Math.round(vo.getBmr() * 1.9 * 0.8);
					break;
				}
			
		} else if(vo.getType().equals("bulkup")) {
			
			switch(vo.getActivityAmount()) {
				case "few":
					kcal = (int) Math.round(vo.getBmr() * 1.2 * 1.2);
					break;
				case "aFew":
					kcal = (int) Math.round(vo.getBmr() * 1.375 * 1.2);
					break;
				case "normal":
					kcal = (int) Math.round(vo.getBmr() * 1.55 * 1.2);
					break;
				case "quite":
					kcal = (int) Math.round(vo.getBmr() * 1.725 * 1.2);
					break;
				case "aLot":
					kcal = (int) Math.round(vo.getBmr() * 1.9 * 1.2);
					break;
				}
		}
		jdbcTemplate.update(KCAL_UPDATE, kcal, userInfo.getId());
		return kcal;				
	}
	
	// 영양소대로 칼로리 구성(g으로 환산)
	public List<Integer> dietStep3(KcalVO vo) {
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest req = sra.getRequest();
		HttpSession session = req.getSession();
		UserVO userInfo = (UserVO)session.getAttribute("idKey");
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		int carbs = 0;
		int protein = 0;
		int fat = 0;
		
		carbs = (int)Math.round((vo.getKcal() * 0.5)/4);
		protein = (int)Math.round((vo.getKcal() * 0.3)/4);
		fat = (int)Math.round((vo.getKcal() * 0.2)/9);
		
		list.add(carbs);
		list.add(protein);
		list.add(fat);
		
		jdbcTemplate.update(NUTRIENTS_UPDATE, carbs, protein, fat, userInfo.getId());
		return list;
	}
	
	// 칼로리에 맞는 음식 리스트 추천
	public List<FoodVO> dietStep4(KcalVO vo, Criteria cri) {
		System.out.println("dietStep4(DAO) 발동!!!");
		Object[] args = { vo.getCarbs(), vo.getProtein(), vo.getFat(), cri.getSkip(), cri.getAmount() };
		return jdbcTemplate.query(FOOD_SELECT, args, new GetFoodListRowMapper());
	}
	
	// 칼로리에 앚는 음식 리스트 추천(수정하기 경로로)
	public List<FoodVO> getFoodList(Criteria cri) {
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest req = sra.getRequest();
		HttpSession session = req.getSession();
		UserVO userInfo = (UserVO)session.getAttribute("idKey");
		System.out.println("탄수화물은....? : " + userInfo.getUserCarbs());
		Object[] args = { userInfo.getUserCarbs(), userInfo.getUserProtein(), userInfo.getUserFat(), cri.getSkip(), cri.getAmount() };
		return jdbcTemplate.query(FOOD_SELECT, args, new GetFoodListRowMapper());
	}
	
	// 음식 총 개수
	public int getTotalFood1(KcalVO vo) {
		System.out.println("getTotalFood 발동!!!");
		Object[] args = { vo.getCarbs(), vo.getProtein(), vo.getFat() };
		return jdbcTemplate.queryForObject(FOOD_TOT_COUNT, args, Integer.class);
	}
	
	// 음식 총 개수(수정하기 경로로)
	public int getTotalFood2() {
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest req = sra.getRequest();
		HttpSession session = req.getSession();
		UserVO userInfo = (UserVO)session.getAttribute("idKey");
		Object[] args = { userInfo.getUserCarbs(), userInfo.getUserProtein(), userInfo.getUserFat() };
		return jdbcTemplate.queryForObject(FOOD_TOT_COUNT, args, Integer.class);
	}
	
	// 유저가 선택한 음식 리스트 DB에 넣기
	public void insertDiet(UserDietVO vo) {
		System.out.println("insertFood 발동!!!");
		jdbcTemplate.update(DIET_INSERT, vo.getId(), vo.getFood());
	}
	
	// 유저가 선택한 음식 리스트 수정하기
	public void updateDiet(UserDietVO vo, String foodArr) {
		System.out.println("updateFood 발동!!!");
		jdbcTemplate.update(DIET_UPDATE, foodArr, vo.getId());
	}
	
	// 유저가 선택한 음식 리스트 확인하기
	public String dietListChk(UserVO vo) {
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest req = sra.getRequest();
		HttpSession session = req.getSession();
		try {
			System.out.println("dietListChk 발동!!!");
			UserVO userInfo = (UserVO)session.getAttribute("idKey");
			Object[] args = {userInfo.getId()};
			String dietList = jdbcTemplate.queryForObject(DIET_CHECK, args, String.class);
			return dietList;
			
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	// 확인된 음식 리스트 화면에 출력
	public List<FoodVO> getDietList(String[] dietArr) {
		System.out.println("getDietList 발동!!!");
		ArrayList<FoodVO> list = new ArrayList<FoodVO>();
		for(int i = 0; i < dietArr.length; ++i) {
			Object[] args = {dietArr[i]};
			list.add(jdbcTemplate.queryForObject(DIET_SELECT, args, new GetFoodListRowMapper()));
		}
		return list;
	}
	
	// 달의 일수 구하기
	public int getLengthOfMon() {
		LocalDate now = LocalDate.now();
		int lengthOfMon = now.lengthOfMonth();
		return lengthOfMon;
	}
	
	// 현재 달(월) 구하기
	public int getMonth() {
		LocalDate now = LocalDate.now();
		int monthValue = now.getMonthValue();
		return monthValue;
	}
	
	// stamp_date 데이터 가져오기
	public List<StampVO> getStampDate() {
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest req = sra.getRequest();
		HttpSession session = req.getSession();
		UserVO userInfo = (UserVO)session.getAttribute("idKey");
		Object[] args = {userInfo.getId()};
		return jdbcTemplate.query(STAMP_SELECT, args, new GetStampRowMapper());
	}
	
	// stamp_date 데이터 중복확인
	public int checkStampDate(String stampDate) {
		try {
			ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
			HttpServletRequest req = sra.getRequest();
			HttpSession session = req.getSession();
			UserVO userInfo = (UserVO)session.getAttribute("idKey");
			Object[] args = {userInfo.getId(), stampDate};
			return jdbcTemplate.queryForObject(STAMP_SELECT2, args, Integer.class);
			
		} catch (EmptyResultDataAccessException e) {
			return 0;
		}
	}
	
	// 일일 미션 도장 찍기
	public void monthlyStampMission(String stampCnt) {
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest req = sra.getRequest();
		HttpSession session = req.getSession();
		UserVO userInfo = (UserVO)session.getAttribute("idKey");
		Object[] args = {stampCnt, userInfo.getId()};
		jdbcTemplate.update(STAMP_CNT_UPDATE, args);
	}
	
	// 일일 미션 도장 찍기(일일 기록)
	public void dailyStampMission(String stampDate) {
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest req = sra.getRequest();
		HttpSession session = req.getSession();
		UserVO userInfo = (UserVO)session.getAttribute("idKey");
		Object[] args = {userInfo.getId(), stampDate};
		jdbcTemplate.update(STAMP_INSERT, args);
		
	}
	
	// DB stampCnt 컬럼 가져오기
	public String getStampCnt() {
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest req = sra.getRequest();
		HttpSession session = req.getSession();
		UserVO userInfo = (UserVO)session.getAttribute("idKey");
		Object[] args = {userInfo.getId()};
	
		return jdbcTemplate.queryForObject(STAMP_CNT_SELECT, args, String.class);
	}
	

}
