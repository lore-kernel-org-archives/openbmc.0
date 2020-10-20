Return-Path: <SRS0=Gaxx=D3=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A39C4363A
	for <openbmc@archiver.kernel.org>; Tue, 20 Oct 2020 18:32:11 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D7DC2177B
	for <openbmc@archiver.kernel.org>; Tue, 20 Oct 2020 18:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D7DC2177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG2KM4mgvzDqfB
	for <openbmc@archiver.kernel.org>; Wed, 21 Oct 2020 05:32:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG2Hs1s4MzDqY2
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 05:30:47 +1100 (AEDT)
IronPort-SDR: cDXXcufNERfDka1Wdk8qLS9X6U0FymUimE4EgYm+3ypDz3H1GHQupM6e5TMyED0eH9fDCVWTW6
 lTdBoFPhrEqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="163770387"
X-IronPort-AV: E=Sophos;i="5.77,398,1596524400"; d="scan'208";a="163770387"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 11:30:44 -0700
IronPort-SDR: Ugo5mpQUtoWEIXznmLIzwk15l+vEfkijXUaxRUIVYEGbm8HL/BSfhV8NeNBZwVXfwFDP/OGp0g
 nxJZowXKYfvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,398,1596524400"; d="scan'208";a="353421814"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 20 Oct 2020 11:30:44 -0700
Received: from [10.212.202.43] (jmbills-MOBL.amr.corp.intel.com
 [10.212.202.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0FEAC5804BB
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 11:30:44 -0700 (PDT)
Subject: Re: Critical BMC process failure recovery
To: openbmc@lists.ozlabs.org
References: <C270F145-2236-4CA1-8D57-A63AB622A47C@gmail.com>
 <CAGm54UFr-4iUrd2gSu38gsEXG9cd0y83mi-mk8NOMKRvwHQTMg@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <a54cbbd2-497e-4ace-b7b3-e290dc52c2e3@linux.intel.com>
Date: Tue, 20 Oct 2020 11:30:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAGm54UFr-4iUrd2gSu38gsEXG9cd0y83mi-mk8NOMKRvwHQTMg@mail.gmail.com>
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



On 10/19/2020 7:58 PM, Lei Yu wrote:
> Hi Andrew,
> 
> In Intel-BMC/openbmc, there are watchdog configs for every service
> that in case it fails, it will reset the BMC using the watchdog. See
> the below related configs and scripts.
> 
> https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/classes/systemd-watchdog.bbclass
> https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-phosphor/watchdog/system-watchdog/watchdog-reset.sh
> 
> It probably meets most of the requirements.
As an FYI - this approach has been very aggressive, so it is resetting 
more often than we would like and doesn't seem to be recovering some of 
the cases that it should.

We are considering disabling this watchdog reset in our platforms for 
now, and will likely need to refine the approach before we would enable 
it again.

> 
> 
> On Tue, Oct 20, 2020 at 3:54 AM Andrew Geissler <geissonator@gmail.com> wrote:
>>
>> Greetings,
>>
>> I've started initial investigation into two IBM requirements:
>>
>> - Reboot the BMC if a "critical" process fails and can not recover
>> - Limit the amount of times the BMC reboots for recovery
>>    - Limit should be configurable, i.e. 3 resets within 5 minutes
>>    - If limit reached, display error to panel (if one available) and halt
>>      the BMC.
>>
>> The goal here is to have the BMC try and get itself back into a working state
>> via a reboot of itself.
>>
>> This same reboot logic and limits would also apply to kernel panics and/or
>> BMC hardware watchdog expirations.
>>
>> Some thoughts that have been thrown around internally:
>>
>> - Spend more time ensuring code doesn't fail vs. handling them failing
>> - Put all BMC code into a single application so it's all or nothing (vs.
>>    trying to pick and choose specific applications and dealing with all of
>>    the intricacies of restarting individual ones)
>> - Rebooting the BMC and getting the proper ordering of service starts is
>>    sometimes easier then testing every individual service restart for recovery
>>    paths
>>
>> "Critical" processes would be things like mapper or dbus-broker. There's
>> definitely a grey area though with other services so we'd need some
>> guidelines around defining them and allow the meta layers to have a way
>> to deem whichever they want critical.
>>
>> So anyway, just throwing this out there to see if anyone has any input
>> or is looking for something similar.
>>
>> High level, I'd probably start looking into utilizing systemd as much as
>> possible. "FailureAction=reboot-force" in the critical services and something
>> that monitors for these types of reboots and enforces the reboot limits.
>>
>> Andrew
> 
> 
> 
