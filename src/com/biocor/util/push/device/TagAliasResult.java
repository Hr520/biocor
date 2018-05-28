package com.biocor.util.push.device;


import com.google.gson.annotations.Expose;
import com.biocor.util.push.common.resp.BaseResult;

import java.util.List;

public class TagAliasResult extends BaseResult {

    private static final long serialVersionUID = -4765083329495728276L;
    @Expose public List<String> tags;
    @Expose public String alias;
        
}

