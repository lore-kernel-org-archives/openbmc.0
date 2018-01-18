Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zMQYB64jBzF0bN
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jan 2018 11:57:49 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2018 16:57:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,374,1511856000"; d="scan'208";a="22570824"
Received: from haiyuewa-mobl1.ccr.corp.intel.com (HELO [10.239.196.40])
 ([10.239.196.40])
 by fmsmga004.fm.intel.com with ESMTP; 17 Jan 2018 16:57:43 -0800
Subject: Re: [PATCH arm/aspeed/ast2500 v1] ipmi: add an Aspeed KCS IPMI BMC
 driver
To: minyard@acm.org, joel@jms.id.au, openbmc@lists.ozlabs.org,
 openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org
Cc: andriy.shevchenko@intel.com
References: <1516103023-19244-1-git-send-email-haiyue.wang@linux.intel.com>
 <a716bfaf-d41e-7865-8b9d-61e6abed2035@acm.org>
 <54c6562b-f35a-c616-b6c2-a2eadf6937da@acm.org>
 <e462c75e-8d93-cddf-06f9-f40643e5b703@linux.intel.com>
 <b22f5462-6518-9558-0fcd-5bb9cbd395b9@acm.org>
From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <39da73d5-23da-c2b3-7fd2-b9c6c7e293ac@linux.intel.com>
Date: Thu, 18 Jan 2018 08:57:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <b22f5462-6518-9558-0fcd-5bb9cbd395b9@acm.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Jan 2018 00:57:51 -0000



On 2018-01-18 00:31, Corey Minyard wrote:
> On 01/17/2018 08:31 AM, Wang, Haiyue wrote:
>>
>>
>
> Snip...
>
>>>>>
>>>>> +
>>>>> +struct kcs_bmc {
>>>>> +    struct regmap *map;
>>>>> +    spinlock_t     lock;
>>>>
>>>> This lock is only used in threads, as far as I can tell. Couldn't 
>>>> it just be a normal mutex?
>>>> But more on this later.
>>>>
>> I missed this lock using in KCS ISR function, for AST2500 is single 
>> core CPU. The critical data such as
>> data_in_avail is shared between ISR and user thread, spinlock_t 
>> related API should be the right one ?
>> especially for SMP ?
>>
>
> Sort of.  In the case below, you need to use spin_lock_irqsave(), you 
> don't necessarily get
> here with interrupts disabled.
>
> In the ones called from user context, you should really use 
> spin_lock_irq().  Interrupts
> should always be on at that point, so it's better.
>
Understood, will change it with the right API call.
>> static irqreturn_t kcs_bmc_irq(int irq, void *arg)
>> {
>>     ....
>>     spin_lock(&kcs_bmc->lock);  // <-- MISSED
>>
>>     switch (sts) {
>>     case KCS_STR_IBF | KCS_STR_CMD_DAT:
>>         kcs_rx_cmd(kcs_bmc);
>>         break;
>>
>>     case KCS_STR_IBF:
>>         kcs_rx_data(kcs_bmc);
>>         break;
>>
>>     default:
>>         ret = IRQ_NONE;
>>         break;
>>     }
>>
>>     spin_unlock(&kcs_bmc->lock); // <-- MISSED
>>
>>     return ret;
>> }
>>
>>
>
>>>>> + spin_lock_irqsave(&kcs_bmc->lock, flags);
>>>>> +    if (kcs_bmc->kcs_phase == KCS_PHASE_READ) {
>>>>
>>>> If you don't modify kcs_phase here, you have a race condition. You 
>>>> probably
>>>> need a KCS_WAIT_READ condition.  Also, the nomenclature of "read" 
>>>> and "write"
>>>> here is a little confusing, since your phases are from the host's 
>>>> point of view,
>>>> not this driver's point of view.  You might want to document that 
>>>> explicitly.
>>>>
>> The race condition means that the user MAY write the duplicated 
>> response ?
>
> Not exactly.  Two threads can call this, and if it hasn't transitions 
> from the read phase,
> the data out will be overwritten.
>
OK, will add new state KCS_WAIT_READ handling.
