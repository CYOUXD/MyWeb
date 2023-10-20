package com.myweb.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.service.ContentServiceImpl;
import com.myweb.board.service.DeleteServiceImple;
import com.myweb.board.service.GetListServiceImpl;
import com.myweb.board.service.IBoardService;
import com.myweb.board.service.RegistServiceImpl;
import com.myweb.board.service.UpdateServiceImpl;

//서비스와 데이터를 전달해 주는건 모드 프론트 컨트롤을 통해서 처리된다.
//모든 페이지는 프론트 컨트롤을 통하지 않으면 데이터를 받아 올 수 없다.

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardController() {
        super();
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	//.board로 끝나는 요청들은 이 컨트롤러로 들어오게 설정
	//1. get, post 방식으로 요청시 하나의 메서드로 연결 -> doAction();
	//2. 컨텍스트 path를 제거 /board/list.board 요청으로 들어오면 board_list(view) 화면으로 이동
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//컨트롤러로 들어온 요청 명령어를 구분해서 처리한다.
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String command = uri.substring(path.length());
		
		//System.out.println(command);
		
		//서비스 객체 생성
		IBoardService service = null; //여러번 사용됨
		
		//command에 따른 동작 구현
		if(command.equals("/board/list.board")) {
			//<게시글 목록 전달>
			//게시글 목록 데이터 전달
			//1. 서비스로 데이터 전송
			service = new GetListServiceImpl();
			service.execute(request, response); //필요한 데이터를 넘겨줌
			
			//2. 서비스 파일에서 메서드 실행
			
			//3. 서비스에서 작업 완료 한 후 페이지 이동하지 않고 데이터를 전송할 경우 forward 사용, 페이지 이동할 경우 redirect 사용
			//GetListServiceImple에서 전달 받은 request 강제 저장된 list를 포워드(=값을 넘길 때는 포워드)
			RequestDispatcher dp = request.getRequestDispatcher("board_list.jsp");
			dp.forward(request, response);

		}else if(command.equals("/board/write.board")) {
			//글 작성 페이지(view)로 이동
			response.sendRedirect("board_write.jsp");
		}else if(command.equals("/board/register.board")) {
			//<게시글 등록>
			//서비스 객체를 생성
			//board_write.jsp : form 값 입력 -> BoardControl.java : control에서 데이터 전달 
			//-> IBoardService.java(인터페이스) : 추상 메서드 사용 -> RegistServiceImplement.java : 받은 데이터를 이용한 메서드를 사용하여 출력
			//-> BoardDAO.java : RegistServiceImplement.java에서 사용할 메서드 제공 -> 데이터를 보낸 후 이 페이지에서 sendRedirect를 하여 다시 이 페이지 상단의 어노테이션과 if를 통해 목록 페이지로 이동
			service = new RegistServiceImpl();
			service.execute(request, response);
			
			//DB에 insert 후 목록으로 이동
			response.sendRedirect("list.board"); //다시 리스트로 이동
			//지금 이 페이지로 redirect 한 다음 리스트 목록으로 이동
			//list.board로 보내면 어노테이션의 *.board에 적용되어 첫번째 if인 /board/list.board의 경로로 가게 됨
			
			//리다이렉트는 주소가 바뀌기 때문에 리퀘스트 파라미터 값을 따로 저장하지 않고는 넘길 수 없다.
			//리퀘스트는 url까지만 유지되고 url 주소가 바뀌면 리퀘스트는 사라진다. 그래서 리다이렉트를 하면 url 주소가 바뀌고 리퀘스트 내부의 값은 사라진다.
		}else if(command.equals("/board/content.board")) {
			//String num = request.getParameter("num");
			//System.out.println(num);
			//<게시글 내용 전달> -> 내용 보여줄 페이지로 전달
			service = new ContentServiceImpl();
			service.execute(request, response);
			
			RequestDispatcher dp = request.getRequestDispatcher("board_content.jsp");
			dp.forward(request, response);
			//리다이렉트가 아니고 포워드라서 페이지 이동이 없기 때문에 파라미터가 그대로 전달된다.
			//***서비스에서 getParameter로 가져오는 이유는 이 데이터를 가지고 메서드를 사용하여 새로운 객체 정보를 만들어서 새 데이터를 강제 저장해서 전달하기 위해서이다.
			//***그래서 param.pageNum은 서비스에서 따로 get, set을 하지 않아도 페이지 이동이 없기 때문에 전달되는 페이지에서 바로 받아서 사용할 수 있다.
		}else if(command.equals("/board/modify.board")) {
			//<게시글 내용 전달> -> 내용 수정 페이지로 전달(ContentServiceImpl 재사용)
			service = new ContentServiceImpl();
			service.execute(request, response);
			
			RequestDispatcher dp = request.getRequestDispatcher("board_modify.jsp");
			dp.forward(request, response); 
			//페이지를 이동하지 않고 데이터를 전달할 때 사용하는 것이 forward
		}else if(command.equals("/board/update.board")) {
			//<게시글 수정> -> 수정 할 데이터를 받아서 전달
			//form으로부터 정보를 받고 UpdateServiceImpl로 전달
			
			/*
			 * 1. UpdateServiceImpl을 생성
			 * 2. service 영역에서 num, title, content를 받아서 DAO의 update() 메서드 실행
			 * 3. DAO에서 update() 메서드를 생성하고 sql의 update 구문을 사용하여 데이터 수정
			 * 4. 완료 후 게시글 내용 보기 화면으로 연결 - content.board로 연결
			 * 		(주의사항 - 필요한 값을 전달해야 한다. forward로 안넘김)
			 * 
			 * sql = "update board set title=?, content=? where num=?";
			 */
			service = new UpdateServiceImpl();
			service.execute(request, response);
			
			String num = request.getParameter("num");
			
			System.out.println(num);
			response.sendRedirect("content.board?num="+num); 
			//페이지를 이동해야 하므로 forward를 사용할 수 없음
			
		}else if(command.equals("/board/delete.board")) {
			//<게시글 삭제>
			/*
			 * 1. DeleteServiceImple을 생성
			 * 2. service 영역에서 num을 받아서 delete()로 전달
			 * 3. DAO에 있는 delete()에서 sql delete 구문 실행
			 * 4. 글 목록으로 페이지 이동
			 * 
			 * sql = "delete from board where num=?";
			 */
			service = new DeleteServiceImple();
			service.execute(request, response);
			
			response.sendRedirect("list.board");
		}
	}

}
