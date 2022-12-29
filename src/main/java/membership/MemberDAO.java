package membership;

import javax.servlet.ServletContext;

import common.JDBConnect;
import model2.mvcboard.MVCBoardDTO;
/*
DAO(Data Access Object)
: 실제 데이터베이스에 접근하여 여러가지 CRUD작업을 하기위한 객체
*/
public class MemberDAO extends JDBConnect {
	
	//생성자 메서드
	//매개변수가 4개인 부모의 생성자를 호출하여 DB에 연결한다.
    public MemberDAO(String drv, String url, String id, String pw) {
        super(drv, url, id, pw);
    }
    //application 내장객체만 매개변수로 전달한 후 DB에 연결한다. 
    public MemberDAO(ServletContext application) {
        super(application);
    }

    /*
    사용자가 입력한 아이디, 패스워드를 통해 회원테이블을 select한 후
    존재하는 정보인 경우 DTO객체에 그 정보를 담아 반환한다. 
    */
    public MemberDTO getMemberDTO(String uid, String upass) {
        
    	//로그인을 위한 쿼리문을 실행한 후 회원정보를 저장하기 위해
    	//생성
    	MemberDTO dto = new MemberDTO();
    	//로그인 위해 인파라미터가 있는 동적 쿼리문 작성
    	String query = "SELECT * FROM member WHERE id=? AND pass=?"; 
    	
        try {
        	//쿼리문 실행을 위한 prepared객체 생성 및 인파라미터 설정
            psmt = con.prepareStatement(query);
            psmt.setString(1, uid);     
            psmt.setString(2, upass);  
            //select 쿼리문을 실행한 후 ResultSet으로 반환받는다.
            rs = psmt.executeQuery();  

            //반환된 ResultSet객체를 통해 회원정보가 있는지 확인한다.
            if (rs.next()) {
            	//정보가 있다면 DTO객체에 회원정보를 저장한다. 
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
        //호출한 지점으로 DTO객체를 반환한다. 
        return dto; 
    }
    
    //회원가입
    public int addAccount(MemberDTO dto) {
		int result = 0;
		
		try {
			/*
			ofile : 원본파일명
			sfile : 서버에 저장된 파일명
			 */
			String query = "INSERT INTO member ( "
					+ " id, pass, name, email, domain, phonenum) "
					+ " VALUES (?,?,?,?,?,?)";
			
			//동적쿼리문 -> prepared객체
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getDomain());
			psmt.setString(6, dto.getPhonenum());
			//insert를 실행하여 입력된 행의 갯수를 반환받는다.
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
         
     	//로그인을 위한 쿼리문을 실행한 후 회원정보를 저장하기 위해
     	//생성
     	MemberDTO dto = new MemberDTO();
     	//로그인 위해 인파라미터가 있는 동적 쿼리문 작성
     	String query = "SELECT id FROM member "
     			+ " WHERE name=? AND phonenum=?"; 
     	
         try {
         	//쿼리문 실행을 위한 prepared객체 생성 및 인파라미터 설정
             psmt = con.prepareStatement(query);
             psmt.setString(1, uname);     
             psmt.setString(2, uphone);  
             //select 쿼리문을 실행한 후 ResultSet으로 반환받는다.
             rs = psmt.executeQuery();  

             //반환된 ResultSet객체를 통해 회원정보가 있는지 확인한다.
             if (rs.next()) {
             	//정보가 있다면 DTO객체에 회원정보를 저장한다. 
                 dto.setId(rs.getString(1));
                 dto.setName(rs.getString(2));
             }
         }
         catch (Exception e) {
             e.printStackTrace();
         }
         //호출한 지점으로 DTO객체를 반환한다. 
         return dto; 
     }
  	
  	 //비밀번호 찾기를 위한 메소드(오버로딩)
  	public MemberDTO searchMemberDTO(String id, String name, String phone) {
        
     	//로그인을 위한 쿼리문을 실행한 후 회원정보를 저장하기 위해
     	//생성
     	MemberDTO dto = new MemberDTO();
     	//로그인 위해 인파라미터가 있는 동적 쿼리문 작성
     	String query = "SELECT pass FROM member "
     			+ " WHERE id= ? AND name=? AND phonenum=?"; 
     	
         try {
         	//쿼리문 실행을 위한 prepared객체 생성 및 인파라미터 설정
             psmt = con.prepareStatement(query);
             psmt.setString(1, id);
             psmt.setString(2, name);     
             psmt.setString(3, phone);  
             //select 쿼리문을 실행한 후 ResultSet으로 반환받는다.
             rs = psmt.executeQuery();  

             //반환된 ResultSet객체를 통해 회원정보가 있는지 확인한다.
             if (rs.next()) {
             	//정보가 있다면 DTO객체에 회원정보를 저장한다. 
                 dto.setId(rs.getString(1));
                 dto.setName(rs.getString(2));
                 dto.setPass(rs.getString(3));
             }
         }
         catch (Exception e) {
             e.printStackTrace();
         }
         //호출한 지점으로 DTO객체를 반환한다. 
         return dto; 
     }
}


