package com.mulcam.project.common;

import java.io.InputStream;
import java.net.URL;

import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;

import com.mulcam.project.vo.OpenApiReqParamVO;

public class XmlParserUtil {
	public static Document XmlToNodeList(OpenApiReqParamVO paramVO) throws Exception {

		// XML 받을 URL 생성
		String parameter = "/" + paramVO.getServiceName() + "/" + paramVO.getServiceAction();
		parameter += "?apiKey=" + paramVO.getApiKey();
		
		if ( paramVO.getDietSeCode() != null ) {
			parameter += "&dietSeCode=" + paramVO.getDietSeCode();
		}
		
		if ( paramVO.getCntntsNo() >0 ) {
			parameter += "&cntntsNo=" + paramVO.getCntntsNo();
		}
		
		if ( paramVO.getNumOfRows() != null ) {
			parameter += "&numOfRows=" + paramVO.getNumOfRows();
		}
		
		System.out.println("XmlParserUtil " + parameter);

		// 서버와 통신
		URL apiUrl = new URL("http://api.nongsaro.go.kr/service" + parameter);
		InputStream apiStream = apiUrl.openStream();

		Document doc = null;
		try {
			// xml document
			doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			apiStream.close();
		}
		
		return doc;

		
	}
}