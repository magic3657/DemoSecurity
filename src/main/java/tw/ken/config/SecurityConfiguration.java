package tw.ken.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	@Qualifier("customUserDetailsService")
	UserDetailsService userDetailsService;

	@Autowired
	CustomSuccessHandler customSuccessHandler;

	@Autowired
	public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("UTF-8");
		filter.setForceEncoding(true);
		
		http.authorizeRequests()
				// .antMatchers("/", "/home").permitAll()
				// 符合USER權縣者才可查看此頁
				.antMatchers("/", "/home").access("hasRole('USER')")
				// 符合ADMIN權縣者才可查看此頁
				.antMatchers("/admin/**").access("hasRole('ADMIN')")
				// 符合ADMIN、DBA權縣者才可查看此頁
				.antMatchers("/db/**").access("hasRole('ADMIN') and hasRole('DBA')")
				.and()
					.formLogin()
					.loginPage("/login").usernameParameter("ssoId").passwordParameter("password")
					.successHandler(customSuccessHandler)
				.and()
					.csrf()
				.and()
					.exceptionHandling()
					.accessDeniedPage("/Access_Denied");
	}
}
