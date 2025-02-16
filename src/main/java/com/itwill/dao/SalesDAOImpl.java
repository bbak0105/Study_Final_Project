package com.itwill.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.dto.Sales;
import com.itwill.mapper.SalesMapper;

@Repository
public class SalesDAOImpl implements SalesDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Sales> selectMonthList() {
		return sqlSession.getMapper(SalesMapper.class).selectMonthList();
	}

	@Override
	public List<Sales> selectTermList(Sales sales) {
		return sqlSession.getMapper(SalesMapper.class).selectTermList(sales);
	}

	@Override
	public List<Sales> selectWeekList() {
		return sqlSession.getMapper(SalesMapper.class).selectWeekList();
	}

	@Override
	public List<Sales> selectWeekMax() {
		return sqlSession.getMapper(SalesMapper.class).selectWeekMax();
	}

	@Override
	public List<Sales> selectWeekMin() {
		return sqlSession.getMapper(SalesMapper.class).selectWeekMin();
	}

	@Override
	public List<Sales> selectWeekEntire() {
		return sqlSession.getMapper(SalesMapper.class).selectWeekEntire();
	}

	@Override
	public List<Sales> selectWeekAvg() {
		return sqlSession.getMapper(SalesMapper.class).selectWeekAvg();
	}

	@Override
	public List<Sales> selectMonthMax() {
		return sqlSession.getMapper(SalesMapper.class).selectMonthMax();
	}

	@Override
	public List<Sales> selectMonthMin() {
		return sqlSession.getMapper(SalesMapper.class).selectMonthMin();
	}

	@Override
	public List<Sales> selectMonthEntire() {
		return sqlSession.getMapper(SalesMapper.class).selectMonthEntire();
	}

	@Override
	public List<Sales> selectMonthAvg() {
		return sqlSession.getMapper(SalesMapper.class).selectMonthAvg();
	}

	@Override
	public List<Sales> selectBestItem(Sales sales) {
		return sqlSession.getMapper(SalesMapper.class).selectBestItem(sales);
	}

	@Override
	public List<Sales> selectWorstIme(Sales sales) {
		return sqlSession.getMapper(SalesMapper.class).selectWorstIme(sales);
	}

	@Override
	public List<Sales> selectTermTotal(Sales sales) {
		return sqlSession.getMapper(SalesMapper.class).selectTermTotal(sales);
	}

	@Override
	public List<Sales> selectTermAvg(Sales sales) {
		return sqlSession.getMapper(SalesMapper.class).selectTermAvg(sales);
	}

	@Override
	public List<Sales> selectNowMonth() {
		return sqlSession.getMapper(SalesMapper.class).selectNowMonth(); 
	}

	@Override
	public List<Sales> selectNowBest() {
		return sqlSession.getMapper(SalesMapper.class).selectNowBest();
	}

	@Override
	public List<Sales> selectTotalOrder() {
		return sqlSession.getMapper(SalesMapper.class).selectTotalOrder();
	}

	@Override
	public List<Sales> selectTotalRelout() {
		return sqlSession.getMapper(SalesMapper.class).selectTotalRelout();
	}

	@Override
	public List<Sales> selectNowmonthSales() {
		return sqlSession.getMapper(SalesMapper.class).selectNowmonthSales();
	}

	@Override
	public List<Sales> selectLastmonthSales() {
		return sqlSession.getMapper(SalesMapper.class).selectLastmonthSales();
	}

	@Override
	public List<Sales> selectNowbunSales() {
		return sqlSession.getMapper(SalesMapper.class).selectNowbunSales();
	}

	@Override
	public List<Sales> selectLastbunSales() {
		return sqlSession.getMapper(SalesMapper.class).selectLastbunSales();
	}

	@Override
	public List<Sales> selectNowyearSales() {
		return sqlSession.getMapper(SalesMapper.class).selectNowyearSales();
	}

	@Override
	public List<Sales> selectLastyearSales() {
		return sqlSession.getMapper(SalesMapper.class).selectLastyearSales();
	}

}
