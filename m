Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Xzkv2N99zDqL2
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 04:25:41 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Apr 2019 10:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,297,1549958400"; d="scan'208";a="132016825"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga006.jf.intel.com with ESMTP; 01 Apr 2019 10:25:38 -0700
Subject: Re: [PATCH dev-5.0 v2 1/5] media: platform: Aspeed: Remove use of
 reset line
To: Eddie James <eajames@linux.vnet.ibm.com>,
 Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
 <1553894143-559-2-git-send-email-eajames@linux.ibm.com>
 <41569937-f8bc-b391-8b19-c931a11e20d8@linux.intel.com>
 <ee4ae2fb-624d-d1d1-ef9f-b35de3c4f458@linux.vnet.ibm.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <958a300d-e767-2589-f074-183ba761c129@linux.intel.com>
Date: Mon, 1 Apr 2019 10:25:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <ee4ae2fb-624d-d1d1-ef9f-b35de3c4f458@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 01 Apr 2019 17:25:44 -0000



On 4/1/2019 8:11 AM, Eddie James wrote:
> 
> On 3/29/19 6:54 PM, Jae Hyun Yoo wrote:
>>>   static void aspeed_video_off(struct aspeed_video *video)
>>>   {
>>> -    aspeed_video_reset(video);
>>> +    /* Disable interrupts */
>>> +    aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
>>>         /* Turn off the relevant clocks */
>>>       clk_disable_unprepare(video->vclk);
>>> @@ -508,7 +497,13 @@ static void aspeed_video_on(struct aspeed_video 
>>> *video)
>>>       clk_prepare_enable(video->eclk);
>>>       clk_prepare_enable(video->vclk);
>>>   -    aspeed_video_reset(video);
>>> +    /*
>>> +     * Delay (and don't sleep in case in interrupt context) to let the
>>> +     * clocks stabilize. Without this, mode detection sometimes fails.
>>> +     * Possibly the registers don't update too soon after clocks are
>>> +     * enabled.
>>> +     */
>>> +    udelay(100);
>>>   }
>>
>> aspeed_video_off() will be called from interrupt context too. Are you
>> sure that this 100us delay is needed at here? If it's actually needed,
>> would it be batter to use devm_request_threaded_irq() instead of
>> devm_request_irq() in aspeed_video_init() function?
> 
> Well this isn't new to this patchset, it delayed 100us before in 
> aspeed_video_reset.
> 
> I am quite sure it's needed.

This is previous code of aspeed_video_reset():
static void aspeed_video_reset(struct aspeed_video *video)
{
	/* Reset the engine */
	reset_control_assert(video->rst);

	/* Don't usleep here; function may be called in interrupt context */
	udelay(100);
	reset_control_deassert(video->rst);
}

The delay was added between assert and deassert to shape the reset
signal up, but the delay in this patch set is after the deasserting of
reset signal. Now in this patch set, you are going to use reset control
using the way that clk-aspeed module provides. The module already has
a 10msec delay in aspeed_clk_enable() for making the reset pulse so
you don't need to add an additional delay at here.

Practically, I tested this patch after removing the 100usec delay and
checked that this driver works well.

> Since the ast2500 has only one logical processor, I'm not sure a 
> threaded irq would function any differently.

Yes, good point. Differently from other Aspeed driver modules, it calls
clk_prepare_enable() in interrupt context which will cause at least
10msecs of busy waiting thru aspeed_clk_enable() in isr. In UP kernel,
this will disturb handling of most of all other interrupts so it's the
reason why I suggested threaded irq instead.

Try this change in aspeed_video_init():
rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
			       IRQF_ONESHOT | IRQF_SHARED, DEVICE_NAME,
			       video);

This threaded irq handling works well in my H/W.

Cheers,
Jae
