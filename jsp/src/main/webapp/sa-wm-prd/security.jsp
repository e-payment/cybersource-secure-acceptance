<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="sun.misc.BASE64Encoder" %>
<%@ page import="javax.crypto.Mac" %>
<%@ page import="javax.crypto.spec.SecretKeySpec" %>
<%@ page import="java.security.InvalidKeyException" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="java.util.*" %>
<%@ include file="config.jsp" %>
<%!
	private static final String ALGORITHM  = "HmacSHA256";

	private String sign(Map params) throws InvalidKeyException, NoSuchAlgorithmException {
		String p_secret_key = "";
		if(params.get("secret_key") == null) {
			p_secret_key = SECRET_KEY;
		} else {
			p_secret_key = String.valueOf(params.get("secret_key"));
		}
		//System.out.println("p_secret_key: " + p_secret_key);
		return sign(buildDataToSign(params), p_secret_key);
	}
	
	private String sign(String data, String secretKey) throws InvalidKeyException, NoSuchAlgorithmException {

		SecretKeySpec secretKeySpec = new SecretKeySpec(secretKey.getBytes(), ALGORITHM);
		Mac mac = Mac.getInstance(ALGORITHM);
		mac.init(secretKeySpec);
		byte[] rawHmac = mac.doFinal(data.getBytes());
		BASE64Encoder encoder = new BASE64Encoder();
		
		return encoder.encodeBuffer(rawHmac).trim();
	}
	
	private String buildDataToSign(Map params) {

		String[] signedFieldNames = String.valueOf(params.get("signed_field_names")).split(",");
		List dataToSign = new ArrayList();
		
		//for (String signedFieldName : signedFieldNames)
		for (int i = 0; i < signedFieldNames.length; i++) {
			String signedFieldName = signedFieldNames[i];
			dataToSign.add(signedFieldName + "=" + String.valueOf(params.get(signedFieldName)));
		}
		
		return commaSeparate(dataToSign);
	}
	
	private String commaSeparate(List dataToSign) {

		StringBuilder csv = new StringBuilder();

		Iterator it = dataToSign.iterator();
		while (it.hasNext()) {
			if (csv.toString().trim().length() > 0) {
				csv.append(",");
			}
			
			csv.append(it.next());
		}
		
		return csv.toString();
	}
%>