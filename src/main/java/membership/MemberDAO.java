package membership;

import javax.servlet.ServletContext;

import common.JDBConnect;
import model2.mvcboard.MVCBoardDTO;

public class MemberDAO extends JDBConnect {
	
	//생성자 메서드
    public MemberDAO(String drv, String url, String id, String pw) {
        super(drv, url, id, pw);
    }
    public MemberDAO(ServletContext application) {
        super(application);
    }

    /*
    사용자가 입력한 아이디, 패스워드를 통해 회원테이블을 select한 후
    존재하는 정보인 경우 DTO객체에 그 정보를 담아 반환한다. 
    */
    public MemberDTO getMemberDTO(String uid, String upass) {
        
    	MemberDTO dto = new MemberDTO();
    	String query = "SELECT * FROM member WHERE id=? AND pass=?"; 
    	
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, uid);     
            psmt.setString(2, upass);  
            rs = psmt.executeQuery();  

            if (rs.next()) {
                dto.setId(rs.getString("id"));
                dto.setPass(rs.getString("pass"));
                dto.setName(rs.getString("name"));
                dto.setRegidate(rs.getString("regidate"));
                dto.setEmail(rs.getString("email"));
                dto.setDomain(rs.getString("domain"));
                dto.setPhonenum(rs.getString("phonenum"));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return dto; 
    }
    
    //회원가입
    public int addAccount(MemberDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO member ( "
					+ " id, pass, name, email, domain, phonenum) "
					+ " VALUES (?,?,?,?,?,?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getDomain());
			psmt.setString(6, dto.getPhonenum());

			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("회원가입 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
    
    //회원정보 수정
  	public int UpdateInfo(MemberDTO dto) {
  		int result = 0;
  		try {
  		
  			String query = " UPDATE member "
  						+ " SET pass=?, name=?, "
  						+ " email=?, domain=?, phonenum=? "
  						+ " WHERE id=? ";
  			
  			//쿼리문 준비
  			psmt = con.prepareStatement(query);
  			psmt.setString(1, dto.getPass());
  			psmt.setString(2, dto.getName());
  			psmt.setString(3, dto.getEmail());
  			psmt.setString(4, dto.getDomain());
  			psmt.setString(5, dto.getPhonenum());
  			psmt.setString(6, dto.getId());
  			
  			
  			result = psmt.executeUpdate();
  		}
  		catch (Exception e) {
  			System.out.println("회원정보 수정 중 예외 발생");
  			e.printStackTrace();
  		}
  		return result;
  	}
  	
  	 public MemberDTO searchMemberDTO(String uname, String uphone) {
         
     	MemberDTO dto = new MemberDTO();

     	String query = "SELECT id FROM member "
     			+ " WHERE name=? AND phonenum=?"; 
     	
         try {
             psmt = con.prepareStatement(query);
             psmt.setString(1, uname);     
             psmt.setString(2, uphone);  
             rs = psmt.executeQuery();  

             if (rs.next()) {
                 dto.setId(rs.getString(1));
                 dto.setName(rs.getString(2));
             }
         }
         catch (Exception e) {
             e.printStackTrace();
         }
         return dto; 
     }
  	
  	 //비밀번호 찾기를 위한 메소드(오버로딩)
  	public MemberDTO searchMemberDTO(String id, String name, String phone) {
        
     	MemberDTO dto = new MemberDTO();
     	String query = "SELECT pass FROM member "
     			+ " WHERE id= ? AND name=? AND phonenum=?"; 
     	
         try {
             psmt = con.prepareStatement(query);
             psmt.setString(1, id);
             psmt.setString(2, name);     
             psmt.setString(3, phone);  

             rs = psmt.executeQuery();  

             if (rs.next()) {
                 dto.setId(rs.getString(1));
                 dto.setName(rs.getString(2));
                 dto.setPass(rs.getString(3));
             }
         }
         catch (Exception e) {
             e.printStackTrace();
         }
         return dto; 
     }
  	
  	public boolean duplicateCheck(String id) {
        
        String query =" select id from member where id = ?";
        
        try {
           psmt = con.prepareStatement(query);
           psmt.setString(1, id);
           rs= psmt.executeQuery();
           
           if (rs.next()) {
              System.out.println("중복아이디 있음 : " +  rs.getString("id"));
             
              return false;
              
           }
           
        }
        catch (Exception e) {
           e.printStackTrace();
        }
        return true;
  	}
        
        
}


