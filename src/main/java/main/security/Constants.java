package main.security;

public class Constants {

	// Spring Security

	public static final String SWAGGER_JSON = "/v2/api-docs";
	public static final String SWAGGER_URL = "/swagger-ui/index.html";
	public static final String[] ALLOWED_SwAGGER = {
			// -- Swagger UI v2
            "/v2/api-docs",
            "/configuration/ui",
            "/configuration/security",
            "/swagger-ui/index.html",
            "/webjars/",
            // -- Swagger UI v3 (OpenAPI)
            "/v3/api-docs/",
            "/swagger-ui/",
            "/swagger-ui/index.html"};
	public static final String LOGIN_URL = "/login";
	public static final String HEADER_AUTHORIZACION_KEY = "Authorization";
	public static final String TOKEN_BEARER_PREFIX = "Bearer ";

	// JWT

	public static final String ISSUER_INFO = "PSystems";
	public static final String SUPER_SECRET_KEY = "aSxvZySrI6sAyRFp!BoTW2AIarwBeo#5ia2LdboGfLa*xwLSIZ";
	public static final long TOKEN_EXPIRATION_TIME = 864_000_000; // 10 day

}