package com.jspxcms.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jspxcms.core.domain.Attr;
import com.jspxcms.core.domain.Node;
import com.jspxcms.core.domain.NodeAttr;
import com.jspxcms.core.listener.AttrDeleteListener;
import com.jspxcms.core.listener.NodeDeleteListener;
import com.jspxcms.core.repository.NodeAttrDao;
import com.jspxcms.core.service.AttrService;
import com.jspxcms.core.service.NodeAttrService;
import com.jspxcms.core.service.NodeQueryService;

@Service
@Transactional(readOnly = true)
public class NodeAttrServiceImpl implements NodeAttrService,
		NodeDeleteListener, AttrDeleteListener {
	@Transactional
	public NodeAttr save(Node node, Attr attr) {
		NodeAttr bean = new NodeAttr();
		bean.setNode(node);
		bean.setAttr(attr);
		bean.applyDefaultValue();
		bean = dao.save(bean);
		return bean;
	}

	@Transactional
	public void update(Attr attr, Integer[] nodePermIds) {
		Integer siteId = attr.getSite().getId();
		Integer attrId = attr.getId();
		List<Node> nodes = nodeQueryService.findList(siteId, null);
		List<NodeAttr> nrs = dao.findByAttrId(attrId);
		Integer nodeId;
		boolean contains;
		for (Node node : nodes) {
			contains = false;
			nodeId = node.getId();
			for (NodeAttr nr : nrs) {
				if (!nr.getNode().getId().equals(nodeId)) {
					contains = true;
					break;
				}
			}
			if (!contains) {
				save(node, attr);
			}
		}
	}

	@Transactional
	public void update(Node node, Integer[] nodePermIds) {
		Integer nodeId = node.getId();
		List<Attr> attrs = attrService.findList(node.getSite().getId());
		List<NodeAttr> nrs = dao.findByNodeId(nodeId);
		Integer attrId;
		boolean contains;
		for (Attr attr : attrs) {
			contains = false;
			attrId = attr.getId();
			for (NodeAttr nr : nrs) {
				if (!nr.getAttr().getId().equals(attrId)) {
					contains = true;
					break;
				}
			}
			if (!contains) {
				save(node, attr);
			}
		}
	}

	public void preNodeDelete(Integer[] ids) {
		if (ids != null) {
			for (Integer id : ids) {
				dao.deleteByNodeId(id);
			}
		}
	}

	public void preAttrDelete(Integer[] ids) {
		if (ids != null) {
			for (Integer id : ids) {
				dao.deleteByAttrId(id);
			}
		}
	}

	private NodeQueryService nodeQueryService;
	private AttrService attrService;
	
	@Autowired
	public void setNodeQueryService(NodeQueryService nodeQueryService) {
		this.nodeQueryService = nodeQueryService;
	}

	@Autowired
	public void setAttrService(AttrService attrService) {
		this.attrService = attrService;
	}

	private NodeAttrDao dao;

	@Autowired
	public void setDao(NodeAttrDao dao) {
		this.dao = dao;
	}
}