<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="sun.misc.BASE64Encoder,javax.crypto.*,javax.crypto.spec.*"%>
<%@ page import="java.util.*"%>
<%!

	private String getMerchantID() {

		return "adminkrungsri";

	}

	private String getSharedSecret() {

		return "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC9h2WYRiaKkh71Z5XP6F62rXZ4yAJrxKuz57pSta98sXBih8c9Nan28Xkc7aY3o+Enh7jixZjWnDQV1Cnz8RdnmLcm5mzcYqhVhxOe5mrPEuH9LZjrMELCFgGgbRgqYFIuXqkUFLkbjmhKkqXYqipS+5OEkJk+zEg770uZPfVRqQIDAQAB";

	}

	private String getSerialNumber() {

		return "3360421602250176056165";

	}

	public String getPublicDigest(String customValues) throws Exception {

		String pub = getSharedSecret();

		BASE64Encoder encoder = new BASE64Encoder();

		Mac sha1Mac = Mac.getInstance("HmacSHA1");

		SecretKeySpec publicKeySpec = new SecretKeySpec(pub.getBytes(),
				"HmacSHA1");

		sha1Mac.init(publicKeySpec);

		byte[] publicBytes = sha1Mac.doFinal(customValues.getBytes());

		String publicDigest = encoder.encodeBuffer(publicBytes);

		return publicDigest.replaceAll("\n", "");

	}

	public String insertSignature(Map map) {

		if (map == null) {
			return "";
		}

		try {

			map.put("merchantID", getMerchantID());

			map.put("orderPage_timestamp", String.valueOf(System
					.currentTimeMillis()));

			map.put("orderPage_version", "7");

			map.put("orderPage_serialNumber", getSerialNumber());

			Set keys = map.keySet();

			StringBuffer customFields = new StringBuffer();
			StringBuffer dataToSign = new StringBuffer();
			StringBuffer output = new StringBuffer();

			for (Iterator i = keys.iterator(); i.hasNext();) {

				String key = (String) i.next();

				customFields.append(key);

				dataToSign.append(key + "=" + String.valueOf(map.get(key)));

				if (i.hasNext()) {

					customFields.append(',');

					dataToSign.append(',');

				}

				output.append("<input type=\"hidden\" name=\"");

				output.append(key);

				output.append("\" value=\"");

				output.append(String.valueOf(map.get(key)));

				output.append("\">\n");

			}

			if (customFields.length() > 0) {

				dataToSign.append(',');

			}

			dataToSign.append("signedFieldsPublicSignature=");

			dataToSign.append(getPublicDigest(customFields.toString()).trim());

			output
					.append("<input type=\"hidden\" name=\"orderPage_signaturePublic\" value=\""
							+ getPublicDigest(dataToSign.toString()) + "\">\n");

			output
					.append("<input type=\"hidden\" name=\"orderPage_signedFields\" value=\""
							+ customFields.toString() + "\">\n");

			return output.toString();

		} catch (Exception e) {

			e.printStackTrace();

			return "";

		}

	}

	public String insertSignature(String amount, String currency) {

		try {

			if (amount == null) {

				amount = "0.00";

			}

			if (currency == null) {

				currency = "usd";

			}

			String time = String.valueOf(System.currentTimeMillis());

			String merchantID = getMerchantID();

			String data = merchantID + amount + currency + time;

			String serialNumber = getSerialNumber();

			StringBuffer sb = new StringBuffer();

			sb.append("<input type=\"hidden\" name=\"amount\" value=\"");

			sb.append(amount);

			sb.append("\">\n<input type=\"hidden\" name=\"currency\" value=\"");

			sb.append(currency);

			sb.append("\">\n<input type=\"hidden\" name=\"orderPage_timestamp\" value=\"");

			sb.append(time);

			sb.append("\">\n<input type=\"hidden\" name=\"merchantID\" value=\"");

			sb.append(merchantID);

			sb.append("\">\n<input type=\"hidden\" name=\"orderPage_signaturePublic\" value=\"");

			sb.append(getPublicDigest(data));

			sb.append("\">\n<input type=\"hidden\" name=\"orderPage_version\" value=\"7\">\n");

			sb.append("<input type=\"hidden\" name=\"orderPage_serialNumber\" value=\"");

			sb.append(serialNumber);

			sb.append("\">\n");

			return sb.toString();

		} catch (Exception e) {

			e.printStackTrace();

			return "";

		}

	}

	public String insertSignature(String amount, String currency,
			String orderPage_transactionType) {

		try {

			if (amount == null) {

				amount = "0.00";

			}

			if (currency == null) {

				currency = "usd";

			}

			String time = String.valueOf(System.currentTimeMillis());

			String merchantID = getMerchantID();

			String data = merchantID + amount + currency + time
					+ orderPage_transactionType;

			String serialNumber = getSerialNumber();

			StringBuffer sb = new StringBuffer();

			sb.append("<input type=\"hidden\" name=\"amount\" value=\"");

			sb.append(amount);

			sb.append("\">\n<input type=\"hidden\" name=\"orderPage_transactionType\" value=\"");

			sb.append(orderPage_transactionType);

			sb.append("\">\n<input type=\"hidden\" name=\"currency\" value=\"");

			sb.append(currency);

			sb.append("\">\n<input type=\"hidden\" name=\"orderPage_timestamp\" value=\"");

			sb.append(time);

			sb.append("\">\n<input type=\"hidden\" name=\"merchantID\" value=\"");

			sb.append(merchantID);

			sb.append("\">\n<input type=\"hidden\" name=\"orderPage_signaturePublic\" value=\"");

			sb.append(getPublicDigest(data));

			sb.append("\">\n<input type=\"hidden\" name=\"orderPage_version\" value=\"7\">\n");

			sb.append("<input type=\"hidden\" name=\"orderPage_serialNumber\" value=\"");

			sb.append(serialNumber);

			sb.append("\">\n");

			return sb.toString();

		} catch (Exception e) {

			e.printStackTrace();

			return "";

		}

	}

	public String insertSubscriptionSignature(String subscriptionAmount,
			String subscriptionStartDate, String subscriptionFrequency,

			String subscriptionNumberOfPayments,
			String subscriptionAutomaticRenew) {

		if (subscriptionFrequency == null) {

			return "";

		}

		if (subscriptionAmount == null) {

			subscriptionAmount = "0.00";

		}

		if (subscriptionStartDate == null) {

			subscriptionStartDate = "00000000";

		}

		if (subscriptionNumberOfPayments == null) {

			subscriptionNumberOfPayments = "0";

		}

		if (subscriptionAutomaticRenew == null) {

			subscriptionAutomaticRenew = "true";

		}

		try {

			String data = subscriptionAmount + subscriptionStartDate
					+ subscriptionFrequency + subscriptionNumberOfPayments
					+ subscriptionAutomaticRenew;

			StringBuffer sb = new StringBuffer();

			sb.append("<input type=\"hidden\" name=\"recurringSubscriptionInfo_amount\" value=\"");

			sb.append(subscriptionAmount);

			sb.append("\">\n<input type=\"hidden\" name=\"recurringSubscriptionInfo_numberOfPayments\" value=\"");

			sb.append(subscriptionNumberOfPayments);

			sb.append("\">\n<input type=\"hidden\" name=\"recurringSubscriptionInfo_frequency\" value=\"");

			sb.append(subscriptionFrequency);

			sb.append("\">\n<input type=\"hidden\" name=\"recurringSubscriptionInfo_automaticRenew\" value=\"");

			sb.append(subscriptionAutomaticRenew);

			sb.append("\">\n<input type=\"hidden\" name=\"recurringSubscriptionInfo_startDate\" value=\"");

			sb.append(subscriptionStartDate);

			sb.append("\">\n<input type=\"hidden\" name=\"recurringSubscriptionInfo_signaturePublic\" value=\"");

			sb.append(getPublicDigest(data));

			sb.append("\">\n");

			return sb.toString();

		} catch (Exception e) {

			e.printStackTrace();

			return "";

		}

	}

	public String insertSubscriptionIDSignature(String subscriptionID) {

		if (subscriptionID == null) {

			return "";

		}

		try {

			StringBuffer sb = new StringBuffer();

			sb.append("<input type=\"hidden\" name=\"paySubscriptionCreateReply_subscriptionID\" value=\"");

			sb.append(subscriptionID);

			sb.append("\">\n<input type=\"hidden\" name=\"paySubscriptionCreateReply_subscriptionIDPublicSignature\" value=\"");

			sb.append(getPublicDigest(subscriptionID));

			sb.append("\">\n");

			return sb.toString();

		} catch (Exception e) {

			e.printStackTrace();

			return "";

		}

	}

	public boolean verifySignature(String data, String signature) {

		if (data == null || signature == null) {

			return false;

		}

		try {

			String pub = getSharedSecret();

			BASE64Encoder encoder = new BASE64Encoder();

			Mac sha1Mac = Mac.getInstance("HmacSHA1");

			SecretKeySpec publicKeySpec = new SecretKeySpec(pub.getBytes(),
					"HmacSHA1");

			sha1Mac.init(publicKeySpec);

			byte[] publicBytes = sha1Mac.doFinal(data.getBytes());

			String publicDigest = encoder.encodeBuffer(publicBytes);

			publicDigest = publicDigest.replaceAll("[\r\n\t]", "");

			return signature.equals(publicDigest);

		} catch (Exception e) {

			e.printStackTrace();

			return false;

		}

	}

	public boolean verifyTransactionSignature(Map map) {

		if (map == null) {

			return false;

		}

		String transactionSignature = (String) map
				.get("signedDataPublicSignature");

		if (transactionSignature == null) {

			return false;

		}

		String transactionSignatureFields = (String) map.get("signedFields");

		if (transactionSignatureFields == null) {

			return false;

		}

		StringTokenizer tokenizer = new StringTokenizer(
				transactionSignatureFields, ",", false);

		StringBuffer data = new StringBuffer();

		while (tokenizer.hasMoreTokens()) {

			String key = tokenizer.nextToken();

			data.append(key + "=" + map.get(key));

			data.append(',');

		}

		data.append("signedFieldsPublicSignature=");

		try {

			data.append(getPublicDigest(transactionSignatureFields).trim());

		} catch (Exception e) {

			e.printStackTrace();

			return false;

		}

		return verifySignature(data.toString(), transactionSignature);

	}%>
