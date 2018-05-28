package com.biocor.util.push.device;


import com.google.gson.annotations.Expose;
import com.biocor.util.push.common.resp.BaseResult;

import java.util.ArrayList;
import java.util.List;

public class TagListResult extends BaseResult {

    private static final long serialVersionUID = -5395153728332839175L;
    @Expose public List<String> tags = new ArrayList<String>();
    
}

