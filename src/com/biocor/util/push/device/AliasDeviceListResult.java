package com.biocor.util.push.device;

import java.util.ArrayList;
import java.util.List;



import com.google.gson.annotations.Expose;
import com.biocor.util.push.common.resp.BaseResult;


public class AliasDeviceListResult extends BaseResult {
   
	@Expose public List<String> registration_ids = new ArrayList<String>();

}

