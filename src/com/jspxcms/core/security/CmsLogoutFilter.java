package com.jspxcms.core.security;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;

import com.jspxcms.core.support.Constants;

public class CmsLogoutFilter extends LogoutFilter {
	public static final String DEFAULT_BACK_REDIRECT_URL = "/cmscp/index.do";
	/**
	 * 返回URL
	 */
	public static final String FALLBACK_URL_PARAM = "fallbackUrl";
	/**
	 * 后台路径
	 */
	private String backUrl = Constants.BACK_URL;
	private String backRedirectUrl = DEFAULT_BACK_REDIRECT_URL;

	protected String getRedirectUrl(ServletRequest req, ServletResponse resp,
			Subject subject) {
		HttpServletRequest request = (HttpServletRequest) req;
		String redirectUrl = request.getParameter(FALLBACK_URL_PARAM);
		if (StringUtils.isBlank(redirectUrl)) {
			if (request.getRequestURI().startsWith(
					request.getContextPath() + backUrl)) {
				redirectUrl = getBackRedirectUrl();
			} else {
				redirectUrl = getRedirectUrl();
			}
		}
		return redirectUrl;
	}

	public String getBackRedirectUrl() {
		return backRedirectUrl;
	}

	public void setBackRedirectUrl(String backRedirectUrl) {
		this.backRedirectUrl = backRedirectUrl;
	}

	public String getBackUrl() {
		return backUrl;
	}

	public void setBackUrl(String backUrl) {
		this.backUrl = backUrl;
	}
}
