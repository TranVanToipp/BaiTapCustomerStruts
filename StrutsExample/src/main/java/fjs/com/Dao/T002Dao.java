package fjs.com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import fjs.com.Dto.T002Dto;
import fjs.com.common.DbConnection;


public class T002Dao {
	public List<T002Dto> pagingData(int index) {
		List<T002Dto> list = new ArrayList<T002Dto>();
		Connection conn = null;
		//sql
		//select * from mstcustomer order by CUSTOMER_ID OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY
		String query = "SELECT * FROM mstcustomer ORDER BY CUSTOMER_ID LIMIT ?, 3";
		try {
			conn = new DbConnection().getConnection(conn);
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, (index-1)*3);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				T002Dto datapagin = new T002Dto();
				datapagin.setCUSTOMER_ID(rs.getString(1));
				datapagin.setCUSTOMER_NAME(rs.getString(2));
				datapagin.setSEX(rs.getString(3));
				datapagin.setBIRTHDAY(rs.getString(4));
				datapagin.setADDRESS(rs.getString(5));
	            list.add(datapagin);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int getDataPage() {
		String query = "select count(*) from mstcustomer";
		Connection conn = null;
		try {
			conn = new DbConnection().getConnection(conn);
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				return rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
