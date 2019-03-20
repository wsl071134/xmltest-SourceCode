package util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStream;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class xml2cpp {

	public static String ExecuteXSL(InputStream xmlfile, String xslfile) {
		try {
			String content = "";
			ByteArrayOutputStream byteRep = new ByteArrayOutputStream();
			TransformerFactory transformerFactory = TransformerFactory
					.newInstance();
			StreamSource source = new StreamSource(xmlfile);
			StreamResult result = new StreamResult(byteRep);
			StreamSource style = new StreamSource(xslfile);
			Transformer transformer = transformerFactory.newTransformer(style);
			transformer.setOutputProperty(
					javax.xml.transform.OutputKeys.ENCODING, "utf-8"); // \u8BBE\u7F6E\u7F16\u7801
			transformer.transform(source, result);
			content = byteRep.toString();
			return content;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	/*
	 * public static String getXslFilePath() { File file = new
	 * File("D:\\study\\xsl2xml\\xsl"); File files[] = file.listFiles(); String
	 * filename = ""; String filepath = ""; for (File f : files) { filename =
	 * f.getName(); if (filename.indexOf("xsl") != -1) { filepath =
	 * f.getAbsolutePath(); break; } } return filepath; }
	 */
	/*
	 * public static String[] getXmlFilePath() { File file = new
	 * File("D:\\study\\xsl2xml\\xml"); File files[] = file.listFiles(); String
	 * filename = ""; String[] filepath = new String[files.length]; for (int i =
	 * 0; i < files.length; i++) { File f = files[i]; filename = f.getName(); if
	 * (filename.indexOf("xml") != -1) { filepath[i] = f.getAbsolutePath(); } }
	 * return filepath; }
	 */

	public static void createFile(String contents,String cppFileName) {
		try {
			File newFile = new File(cppFileName);
			if (!newFile.exists()) {
				newFile.createNewFile();
			}
			FileWriter fw = new FileWriter(newFile);
			fw.write(contents);
			fw.close();
		} catch (Exception e) {
		}

	}

}
