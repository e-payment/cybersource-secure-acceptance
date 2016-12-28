<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="sun.misc.BASE64Encoder" %>
<%@ page import="javax.crypto.Mac" %>
<%@ page import="javax.crypto.spec.SecretKeySpec" %>
<%@ page import="java.security.InvalidKeyException" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="java.util.*" %>
<%!
	private static final String ALGORITHM  = "HmacSHA256";
	private static final String SECRET_KEY = "9a5d4d3a6f9845bf96372912813ff4582e71cf2482c14924b6a8a56b146d79bb5ec5b1b6ea5449229eaefaea522d1e25edd359e9c16946b691c504850cb5e9cb188383e627594e19b925de7a36ab06dcc23511ddc0754c86836feedf500332452f8bc1f455d44af5aae4dcbfe2cbec14b4b8644878ea40fab7f761cd6c9c96b1";
	
	private String sign(Map params) throws InvalidKeyException, NoSuchAlgorithmException {
		return sign(buildDataToSign(params), SECRET_KEY);
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
