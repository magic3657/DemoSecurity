package tw.ken.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * startup spring mvc
 * @author louis
 *
 */
public class AppInitializer implements WebApplicationInitializer {
	
	public void onStartup(ServletContext container) throws ServletException {
		
		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
		container.addListener(new ContextLoaderListener(ctx));
		ctx.register(AppConfig.class);
		ctx.setServletContext(container);

		DispatcherServlet dispatcher = new DispatcherServlet(ctx);
		((DispatcherServlet)dispatcher).setThrowExceptionIfNoHandlerFound(true); 
		
		Dynamic servlet = container.addServlet("dispatcher", dispatcher);
		servlet.addMapping("/");
		servlet.setLoadOnStartup(1);
	}
	
	
}
