package com.biocor.util.push.common.resp;

public class DefaultResult extends BaseResult {

	public static DefaultResult fromResponse(ResponseWrapper responseWrapper) {
		DefaultResult result = null;

		if (responseWrapper.isServerResponse()) {
			result = new DefaultResult();
		}

		result.setResponseWrapper(responseWrapper);

		return result;
	}

}