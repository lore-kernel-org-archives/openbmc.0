Return-Path: <SRS0=7r8K=NI=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2F8C4338F
	for <openbmc@archiver.kernel.org>; Tue, 17 Aug 2021 19:06:33 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23AB960BD3
	for <openbmc@archiver.kernel.org>; Tue, 17 Aug 2021 19:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23AB960BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gq0r74Bk1z3bWg
	for <openbmc@archiver.kernel.org>; Wed, 18 Aug 2021 05:06:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gq0qf4bM1z30GG
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 05:06:04 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="195752809"
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="195752809"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 12:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="680468216"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 17 Aug 2021 12:05:00 -0700
Received: from [10.251.28.193] (jmbills-MOBL.amr.corp.intel.com
 [10.251.28.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 07F045808DB
 for <openbmc@lists.ozlabs.org>; Tue, 17 Aug 2021 12:04:59 -0700 (PDT)
Subject: Re: [x86-power-control]: press the power button for a long time that
 can't force turn off system power
To: openbmc@lists.ozlabs.org
References: <DM6PR08MB55145CD3DC0AD96D30B70771DCE59@DM6PR08MB5514.namprd08.prod.outlook.com>
 <8fcc9529-0f7b-df46-aa28-1569d254eb20@linux.intel.com>
 <DM6PR08MB551464D29CE9BD91FFE1B20ADCE69@DM6PR08MB5514.namprd08.prod.outlook.com>
 <b133d936-c788-1800-7b72-e197b69387cc@linux.intel.com>
 <DM6PR08MB55145A59C44D48FFD5B70C26DCFD9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <878c1c79-662f-468d-82d1-a890a8aeab2e@www.fastmail.com>
 <DM6PR08MB551444C4EAB80473CB576740DCFD9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <aef11e4c-0b18-47a3-8116-36db990b998c@www.fastmail.com>
 <DM6PR08MB5514BD820BCA7BCD3B810BFDDCFE9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <66823be3-bf61-4d1d-8dd8-6798f51dd701@www.fastmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <8de9006c-a45a-4a24-0afa-c99ced621080@linux.intel.com>
Date: Tue, 17 Aug 2021 13:04:59 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <66823be3-bf61-4d1d-8dd8-6798f51dd701@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>



On 8/17/2021 5:30 AM, Andrew Jeffery wrote:
> Hi Chris,
> 
> On Tue, 17 Aug 2021, at 20:47, Chris Chen (TPI) wrote:
>> Hi Andrew,
>>
>> That means I'm able to choose one of following 2 options to achieve
>> pass-through behavior when I using x86-power-control package, is my
>> understanding correct?
>>
>> 1. Add code to re-enable GPIOP0 and GPIOP1 into a pass-through function
>> after they are requested as a GPIO function in the x86-power-control
>> package. (Or maybe to create a script with "devmem > 0x1e6e24BC 32
>> 0x0F000000" command that will be run automatically after system up to
>> change register directly.)
> 
> This is a hack and should be a last resort. Even then I'd avoid it.
> 
> Certainly you should avoid shipping with /dev/mem enabled.
> 
>>
>> 2. Modify pinctrl in Kernel that will not disable GPIOP0 and GPIOP1's
>> pass-through function if they already are configured as a pass-through
>> when they are requesting as a GPIO function.
> 
> Perhaps, though maybe you should follow up on whether you can drive
> GPIOP1 when it's in pass-through mode. My recollection is you cannot,
> at least for the AST2500 and earlier, in which case both P0 and P1 are
> effectively inputs for the purpose of the GPIO controller despite P1
> being a physical output. This behaviour is probably more confusing than
> it is helpful.
> 
> There's also option 3 which is to emulate the pass-through in software,
> as I outlined in my previous email.
This is some of the configuration that I have on my system where the 
pass-through is working correctly in x86-power-control:

I have one kernel patch that selects the "pass-through" pin 
configuration on startup: 
https://github.com/Intel-BMC/linux/commit/8fe1ac31c13a0e8443c665394112ba407c90ae70.

In x86-power-control, I have the POWER_BUTTON GPIO mapped to GPIOP2, and 
I'm able to claim and monitor that GPIO without affecting the 
pass-through status.

I have POWER_OUT mapped to GPIOP3 which cannot be held in 
x86-power-control as it disables the pass-through when claimed.  So, it 
is always released after the power-control action is completed.

Thanks,
-Jason

> 
> Hope that helps,
> 
> Andrew
> 
