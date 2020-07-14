package pension.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/*
 *    [ Data Base Connection Pool Bean ]
 *    
 *    ?•„?˜?˜ ?´?¼?Š¤ê°? ?™?‘?•˜? ¤ë©? 
 *    
 *    1. Servers/context.xml ë¬¸ì„œ?— DB ? ‘?† ? •ë³´ê? ?ˆ?–´?•¼?•œ?‹¤.
 *    
 *    <Resource name="jdbc/myoracle" auth="Container"
              type="javax.sql.DataSource" driverClassName="oracle.jdbc.OracleDriver"
              url="jdbc:oracle:thin:@127.0.0.1:1521:xe"
              username="scott" password="tiger" maxTotal="20" maxIdle="10"
              maxWaitMillis="-1"/>
              
      2. ?”„ë¡œì ?Š¸?˜ WEB-INF/web.xml ë¬¸ì„œ?— ?•„?˜?˜ ?„¤? •?´ ?ˆ?–´?•¼?•œ?‹¤.
      
      <resource-ref>
		 <description>Oracle Datasource example</description>
		 <res-ref-name>jdbc/myoracle</res-ref-name>
		 <res-type>javax.sql.DataSource</res-type>
		 <res-auth>Container</res-auth>
	  </resource-ref>
	  
	  3. WEB-INF/lib/ ?´?”?— ojdbc6.jar ?ŒŒ?¼?„ ?„£?–´?„œ ?¼ë¹„ë¥´?Ÿ¬ë¦¬ë?? ?‚¬?š©?•  ì¤?ë¹„ë?? ?•´?•¼?•œ?‹¤.
	  
	  ?œ„?˜ 3ê°?ì§? ?„¤? •?„ ?•œ ?›„?—
	  
	  - new DbcpBean().getConn() ë©”ì†Œ?“œë¥? ?˜¸ì¶œí•˜ë©? Connection Poll ?—?„œ
	  Connection ê°ì²´ê°? ?•˜?‚˜ ë¦¬í„´?œ?‹¤.
	  
	  - Dao ?—?„œ Connection ê°ì²´ë¥? ?‚¬?š©?•œ?›„ .close() ë©”ì†Œ?“œë¥? ?˜¸ì¶œí•˜ë©? 
	    ??™?œ¼ë¡? Connection Pool ?— Connection ê°ì²´ê°? ë°˜í™˜?œ?‹¤.
 */

public class DbcpBean {
	// ?•„?“œ
	private Connection conn;
	
	// ?ƒ?„±?
	public DbcpBean() {
		// Connection ê°ì²´?˜ ì°¸ì¡°ê°’ì„ ?–»?–´???„œ ?•„?“œ?— ???¥?•˜?Š” ?‘?—…?„ ?•œ?‹¤.
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();
		//etc.
		}catch(Exception e) { e.printStackTrace();}
	}
	
	// Connection ê°ì²´ë¥? ë¦¬í„´?•´ì£¼ëŠ” ë©”ì†Œ?“œ
	public Connection getConn() {
		return conn;
	}
}
