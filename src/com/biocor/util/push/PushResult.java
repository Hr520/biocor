package com.biocor.util.push;

import com.google.gson.annotations.Expose;
import com.biocor.util.push.common.resp.BaseResult;


public class PushResult extends BaseResult {

    private static final long serialVersionUID = 93783137655776743L;

    @Expose public long msg_id;
    @Expose public int sendno;
    
}

