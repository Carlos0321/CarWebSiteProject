package com.lec.mvcproject.service;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.mvcproject.dao.CarDao;
import com.lec.mvcproject.dto.CarDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MainService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 파일첨부 로직 + 파라미터들 받아 DB에 join
		String path = request.getRealPath("carimg");
		int maxSize = 1024*1024*10; // 최대업로드 사이즈는 10M
		String cFileName = "", dbFileName = null;
		try {
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			cFileName = mRequest.getFilesystemName(param);
			dbFileName = mRequest.getParameter("dbFileName");
			if(cFileName==null) {
				cFileName = dbFileName;
			}
			
			String brandname = mRequest.getParameter("brandname");
			System.out.println(brandname);
			CarDao cDao = CarDao.getInstance();
			ArrayList<CarDto> cars = cDao.mainlistCar(brandname);
			HttpSession session = request.getSession();
			session.setAttribute("cars", cars);
			
//			String brandname = mRequest.getParameter("brandname");
//			CarDao cDao = CarDao.getInstance();
//			CarDto cars = cDao.getBrand(brandid);
//			request.setAttribute("cars", cars);
			
			
			
			
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		// 서버에 올라간 carimg 파일을 소스폴더에 filecopy (파일 수정을 안 했거나, 예외가 떨어질 경우 복사 안 함)
		if(dbFileName!=null && !cFileName.equals(dbFileName)) { 
			InputStream  is = null;
			OutputStream os = null;
			try {
				File serverFile = new File(path+"/"+cFileName);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("C:/Carlos_Java/webPro/source/07_Project1/1stProject/WebContent/carimg/"+cFileName);
				byte[] bs = new byte[(int)serverFile.length()];
				while(true) {
					int nByteCnt = is.read(bs);
					if(nByteCnt==-1) break;
					os.write(bs, 0, nByteCnt);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if(os!=null) os.close();
					if(is!=null) is.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			} // try
		}// 파일 복사 if
	}

}
