
package com.sky.commons.generator.config;

import java.io.File;
import java.nio.charset.Charset;

/**
 * 定义常量
 *
 * @author L
 * 
 */
public class ConstVal {
	
	public static final String MODULENAME = "ModuleName";
	
	public static final String ENTITY = "Entity";
	public static final String SERIVCE = "Service";
	public static final String SERVICEIMPL = "ServiceImpl";
	public static final String MAPPER = "Mapper";
	public static final String XML = "Xml";
	public static final String CONTROLLER = "Controller";
	
	public static final String LIST = "list";
	public static final String ADD = "Add";
	public static final String EDIT = "Edit";
	public static final String JSP = "JSP";
	

	public static final String ENTITY_PATH = "entity_path";
	public static final String SERIVCE_PATH = "serivce_path";
	public static final String SERVICEIMPL_PATH = "serviceimpl_path";
	public static final String MAPPER_PATH = "mapper_path";
	public static final String XML_PATH = "xml_path";
	public static final String CONTROLLER_PATH = "controller_path";
	
	public static final String LIST_PATH = "list_path";
	public static final String ADD_PATH = "add_path";
	public static final String EDIT_PATH = "edit_path";

	public static final String JAVA_TMPDIR = "java.io.tmpdir";
	public static final String UTF8 = Charset.forName("UTF-8").name();
	public static final String UNDERLINE = "_";

	public static final String JAVA_SUFFIX = ".java";
	public static final String XML_SUFFIX = ".xml";
	public static final String JSP_SUFFIX = ".jsp";
	
	public static final String TEMPLATE_ENTITY = "/template/entity.java.vm";
	public static final String TEMPLATE_MAPPER = "/template/mapper.java.vm";
	public static final String TEMPLATE_XML = "/template/mapper.xml.vm";
	public static final String TEMPLATE_SERVICE = "/template/service.java.vm";
	public static final String TEMPLATE_SERVICEIMPL = "/template/serviceImpl.java.vm";
	public static final String TEMPLATE_CONTROLLER = "/template/controller.java.vm";
	
	public static final String TEMPLATE_LIST = "/template/list.jsp.vm";
	public static final String TEMPLATE_ADD = "/template/add.jsp.vm";
	public static final String TEMPLATE_EDIT = "/template/edit.jsp.vm";
	
	public static final String ENTITY_NAME = File.separator + "%s" + JAVA_SUFFIX;

	// 配置使用classloader加载资源
	public static final String VM_LOADPATH_KEY = "file.resource.loader.class";
	public static final String VM_LOADPATH_VALUE = "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader";

	public static final String SUPERD_MAPPER_CLASS = "com.baomidou.mybatisplus.mapper.BaseMapper";
	public static final String SUPERD_SERVICE_CLASS = "com.baomidou.mybatisplus.service.IService";
	public static final String SUPERD_SERVICEIMPL_CLASS = "com.baomidou.mybatisplus.service.impl.ServiceImpl";
	
}
