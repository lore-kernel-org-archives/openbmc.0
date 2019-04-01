Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Xwlm2GgkzDqMV
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 02:11:15 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x31F6tkf131932
 for <openbmc@lists.ozlabs.org>; Mon, 1 Apr 2019 11:11:13 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rkn0c89ws-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 11:11:12 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 1 Apr 2019 16:11:11 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 1 Apr 2019 16:11:08 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x31FB7YP24707128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Apr 2019 15:11:07 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F7AE2805C;
 Mon,  1 Apr 2019 15:11:07 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8A2428058;
 Mon,  1 Apr 2019 15:11:06 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  1 Apr 2019 15:11:06 +0000 (GMT)
Subject: Re: [PATCH dev-5.0 v2 1/5] media: platform: Aspeed: Remove use of
 reset line
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
 <1553894143-559-2-git-send-email-eajames@linux.ibm.com>
 <41569937-f8bc-b391-8b19-c931a11e20d8@linux.intel.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 1 Apr 2019 10:11:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <41569937-f8bc-b391-8b19-c931a11e20d8@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19040115-0040-0000-0000-000004DA3FFC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010855; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000283; SDB=6.01182824; UDB=6.00619101; IPR=6.00963566; 
 MB=3.00026246; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-01 15:11:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040115-0041-0000-0000-000008E565AF
Message-Id: <ee4ae2fb-624d-d1d1-ef9f-b35de3c4f458@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-01_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=967 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904010102
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Apr 2019 15:11:17 -0000


On 3/29/19 6:54 PM, Jae Hyun Yoo wrote:
>>   static void aspeed_video_off(struct aspeed_video *video)
>>   {
>> -    aspeed_video_reset(video);
>> +    /* Disable interrupts */
>> +    aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
>>         /* Turn off the relevant clocks */
>>       clk_disable_unprepare(video->vclk);
>> @@ -508,7 +497,13 @@ static void aspeed_video_on(struct aspeed_video 
>> *video)
>>       clk_prepare_enable(video->eclk);
>>       clk_prepare_enable(video->vclk);
>>   -    aspeed_video_reset(video);
>> +    /*
>> +     * Delay (and don't sleep in case in interrupt context) to let the
>> +     * clocks stabilize. Without this, mode detection sometimes fails.
>> +     * Possibly the registers don't update too soon after clocks are
>> +     * enabled.
>> +     */
>> +    udelay(100);
>>   }
>
> aspeed_video_off() will be called from interrupt context too. Are you
> sure that this 100us delay is needed at here? If it's actually needed,
> would it be batter to use devm_request_threaded_irq() instead of
> devm_request_irq() in aspeed_video_init() function?

Well this isn't new to this patchset, it delayed 100us before in 
aspeed_video_reset.

I am quite sure it's needed.

Since the ast2500 has only one logical processor, I'm not sure a 
threaded irq would function any differently.

>
> Cheers,
> Jae
>
