package com.jspxcms.core.listener;

import java.util.List;

import com.jspxcms.core.domain.Info;

/**
 * AbstractInfoListener
 * 
 * @author liufang
 * 
 */
public abstract class AbstractInfoListener implements InfoListener {
	public void postInfoSave(Info bean) {
	}

	public void postInfoUpdate(Info bean) {
	}

	public void postInfoDelete(List<Info> beans) {
	}

	public void postInfoPass(List<Info> beans) {
	}

	public void postInfoReject(List<Info> beans) {
	}
}
