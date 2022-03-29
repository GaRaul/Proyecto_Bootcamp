//package main.security;
//
//import java.io.IOException;
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Component;
//
//@Component
//public class SimpleCORSFilter implements Filter {
//
//	private final Logger log = LoggerFactory.getLogger(SimpleCORSFilter.class);
//
//	public SimpleCORSFilter() {
//		log.info("SimpleCORSFilter init");
//	}
//
//	@Override
//	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
//			throws IOException, ServletException {
//
//		HttpServletRequest request = (HttpServletRequest) req;
//		HttpServletResponse response = (HttpServletResponse) res;
//
//		response.setHeader("Access-Control-Allow-Origin", request.getHeader("/**"));
//		response.setHeader("Access-Control-Allow-Methods", "POST, GET, PUT, OPTIONS, DELETE");
//		response.setHeader("Access-Control-Max-Age", "3600");
//		response.setHeader("Access-Control-Allow-Headers",
//				"X-ACCESS_TOKEN, Access-Control-Allow-Origin, Authorization, Origin, x-requested-with, Content-Type, Accept, Content-Range, Content-Disposition, Content-Description");
//
////		if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {
////			response.setHeader("Access-Control-Allow-Origin", "*");
////			response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, OPTIONS");
////
////			response.setHeader("Access-Control-Allow-Headers",
////					"DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range");
////
////			response.setHeader("Access-Control-Max-Age", "1728000");
////			response.setHeader("Content-Type", "text/plain; charset=utf-8");
////			response.setHeader("Content-Length", "0");
////		}
////		if ("POST".equalsIgnoreCase(request.getMethod())) {
////			response.setHeader("Access-Control-Allow-Origin", "*");
////			response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, OPTIONS");
////			response.setHeader("Access-Control-Allow-Headers",
////					"DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range");
////			response.setHeader("Access-Control-Expose-Headers", "Content-Length,Content-Range");
////		}
////		if ("PUT".equalsIgnoreCase(request.getMethod())) {
////			response.setHeader("Access-Control-Allow-Origin", "*");
////			response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, OPTIONS");
////			response.setHeader("Access-Control-Allow-Headers",
////					"DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range");
////			response.setHeader("Access-Control-Expose-Headers", "Content-Length,Content-Range");
//
//		chain.doFilter(req, res);
//
//	}
//
//	@Override
//	public void init(FilterConfig filterConfig) {
//	}
//
//	@Override
//	public void destroy() {
//	}
//
//}
