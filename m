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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Y3QJ0w3ZzDqCX
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 07:11:35 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x31KAeWp062892
 for <openbmc@lists.ozlabs.org>; Mon, 1 Apr 2019 16:11:33 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rkqkpx93x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 16:11:32 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 1 Apr 2019 21:11:31 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 1 Apr 2019 21:11:30 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x31KBTnx19857632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Apr 2019 20:11:29 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2B3E12405A;
 Mon,  1 Apr 2019 20:11:29 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68B94124052;
 Mon,  1 Apr 2019 20:11:29 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  1 Apr 2019 20:11:29 +0000 (GMT)
Subject: Re: [PATCH dev-5.0 v2 1/5] media: platform: Aspeed: Remove use of
 reset line
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
 <1553894143-559-2-git-send-email-eajames@linux.ibm.com>
 <41569937-f8bc-b391-8b19-c931a11e20d8@linux.intel.com>
 <ee4ae2fb-624d-d1d1-ef9f-b35de3c4f458@linux.vnet.ibm.com>
 <958a300d-e767-2589-f074-183ba761c129@linux.intel.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 1 Apr 2019 15:11:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <958a300d-e767-2589-f074-183ba761c129@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19040120-0064-0000-0000-000003C5128B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010856; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000283; SDB=6.01182924; UDB=6.00619259; IPR=6.00963667; 
 MB=3.00026248; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-01 20:11:31
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040120-0065-0000-0000-00003CEA67D7
Message-Id: <8c1e0f6f-18a6-289a-451b-ad244226bdf2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-01_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904010130
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
X-List-Received-Date: Mon, 01 Apr 2019 20:11:36 -0000


On 4/1/19 12:25 PM, Jae Hyun Yoo wrote:
>
>
> On 4/1/2019 8:11 AM, Eddie James wrote:
>>
>> On 3/29/19 6:54 PM, Jae Hyun Yoo wrote:
>>>>   static void aspeed_video_off(struct aspeed_video *video)
>>>>   {
>>>> -    aspeed_video_reset(video);
>>>> +    /* Disable interrupts */
>>>> +    aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
>>>>         /* Turn off the relevant clocks */
>>>>       clk_disable_unprepare(video->vclk);
>>>> @@ -508,7 +497,13 @@ static void aspeed_video_on(struct 
>>>> aspeed_video *video)
>>>>       clk_prepare_enable(video->eclk);
>>>>       clk_prepare_enable(video->vclk);
>>>>   -    aspeed_video_reset(video);
>>>> +    /*
>>>> +     * Delay (and don't sleep in case in interrupt context) to let 
>>>> the
>>>> +     * clocks stabilize. Without this, mode detection sometimes 
>>>> fails.
>>>> +     * Possibly the registers don't update too soon after clocks are
>>>> +     * enabled.
>>>> +     */
>>>> +    udelay(100);
>>>>   }
>>>
>>> aspeed_video_off() will be called from interrupt context too. Are you
>>> sure that this 100us delay is needed at here? If it's actually needed,
>>> would it be batter to use devm_request_threaded_irq() instead of
>>> devm_request_irq() in aspeed_video_init() function?
>>
>> Well this isn't new to this patchset, it delayed 100us before in 
>> aspeed_video_reset.
>>
>> I am quite sure it's needed.
>
> This is previous code of aspeed_video_reset():
> static void aspeed_video_reset(struct aspeed_video *video)
> {
>     /* Reset the engine */
>     reset_control_assert(video->rst);
>
>     /* Don't usleep here; function may be called in interrupt context */
>     udelay(100);
>     reset_control_deassert(video->rst);
> }
>
> The delay was added between assert and deassert to shape the reset
> signal up, but the delay in this patch set is after the deasserting of
> reset signal. Now in this patch set, you are going to use reset control
> using the way that clk-aspeed module provides. The module already has
> a 10msec delay in aspeed_clk_enable() for making the reset pulse so
> you don't need to add an additional delay at here.


That is the logical conclusion, but the results I got didn't agree. In 
my previous testing, I was only able to detect the resolution maybe 50% 
of the time without this delay.


>
> Practically, I tested this patch after removing the 100usec delay and
> checked that this driver works well.


Now I just ran my tests, and I can't recreate my previous problem with 
or without the delay... I don't understand that. Same code, same system, 
but different kernel build. Very odd. But that leaves me with no 
justification for this delay, so I'll remove it.


>
>> Since the ast2500 has only one logical processor, I'm not sure a 
>> threaded irq would function any differently.
>
> Yes, good point. Differently from other Aspeed driver modules, it calls
> clk_prepare_enable() in interrupt context which will cause at least
> 10msecs of busy waiting thru aspeed_clk_enable() in isr. In UP kernel,
> this will disturb handling of most of all other interrupts so it's the
> reason why I suggested threaded irq instead.
>
> Try this change in aspeed_video_init():
> rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
>                    IRQF_ONESHOT | IRQF_SHARED, DEVICE_NAME,
>                    video);


Looks good, but this should probably go in a different patch set.


>
> This threaded irq handling works well in my H/W.
>
> Cheers,
> Jae
>
