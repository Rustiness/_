package kr.hospi.processors;

import org.apache.struts.tiles.TilesRequestProcessor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

/**
 * Created by ${Kosta} on ${2017-05-15}.
 */
public class ChefRequestProcessor extends TilesRequestProcessor {

	@Override
	protected boolean processPreprocess(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("processPreprocess()");

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return super.processPreprocess(request, response);
	}
}