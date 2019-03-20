package util;

import java.io.File;
import java.io.InputStream;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class Transform {
	/**
	 * @param is
	 */
	public static boolean xmlTocode(InputStream xmlFile, String xslFileName,
			String cppFileName) {
		boolean flag = true;
		try {
			TransformerFactory tFac = TransformerFactory.newInstance();
			Source stander = new StreamSource(xslFileName);//xsl源文件
			Transformer t = tFac.newTransformer(stander);
			File cpp = new File(cppFileName);//转换后的文件
			Source xml = new StreamSource(xmlFile);//xml文件
			Result result = new StreamResult(cpp);
			t.transform(xml, result);//转换写入 
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}

	/*
	 * public static void main(String[] args) { // TODO Auto-generated method
	 * stub String xmlFileName = "F:\\xml\\code.xml"; String xslFileName =
	 * "src/code.xsl"; String htmlFileName = "F:\\xml\\code.c";
	 * xmlTocode(xmlFileName, xslFileName, htmlFileName);
	 * 
	 * }
	 */
}
