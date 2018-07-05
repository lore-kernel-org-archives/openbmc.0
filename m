Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41M3MT68R1zF26T
 for <openbmc@lists.ozlabs.org>; Fri,  6 Jul 2018 02:33:35 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jul 2018 09:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,313,1526367600"; d="scan'208";a="213688233"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga004.jf.intel.com with ESMTP; 05 Jul 2018 09:33:32 -0700
Subject: Re: [PATCH linux-next v5 08/13] drivers/mfd: Add PECI client mfd
 driver
To: Lee Jones <lee.jones@linaro.org>
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>, Joel Stanley
 <joel@jms.id.au>, Vernon Mauery <vernon.mauery@linux.intel.com>
References: <20180601182227.23938-1-jae.hyun.yoo@linux.intel.com>
 <20180613063038.GJ5278@dell>
 <6663376b-2671-0c7e-93df-558728c92184@linux.intel.com>
 <20180618055941.GC31141@dell>
 <e387da06-1b73-a497-be59-9c25df9bb7f9@linux.intel.com>
 <20180704064130.GB20176@dell>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <7fecc267-eef2-e4ad-bb74-14c3e8e5877b@linux.intel.com>
Date: Thu, 5 Jul 2018 09:33:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180704064130.GB20176@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2018 16:33:42 -0000

Hi Lee,

Thanks for your review. Please see my inline answers.

On 7/3/2018 11:41 PM, Lee Jones wrote:
> On Mon, 18 Jun 2018, Jae Hyun Yoo wrote:
> 
>> On 6/17/2018 10:59 PM, Lee Jones wrote:
>>> On Thu, 14 Jun 2018, Jae Hyun Yoo wrote:
>>>
>>>> Thanks for the review. Please see my inline answers.
>>>>
>>>> On 6/12/2018 11:30 PM, Lee Jones wrote:
>>>>> On Fri, 01 Jun 2018, Jae Hyun Yoo wrote:
>>>>>
>>>>>> This commit adds PECI client mfd driver.
>>>>>>
>>>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>>>> Cc: Andrew Jeffery <andrew@aj.id.au>
>>>>>> Cc: James Feist <james.feist@linux.intel.com>
>>>>>> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
>>>>>> Cc: Joel Stanley <joel@jms.id.au>
>>>>>> Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
>>>>>> ---
>>>>>>     drivers/mfd/Kconfig             |  11 ++
>>>>>>     drivers/mfd/Makefile            |   1 +
>>>>>>     drivers/mfd/peci-client.c       | 205 ++++++++++++++++++++++++++++++++
>>>>>>     include/linux/mfd/peci-client.h |  60 ++++++++++
>>>>>>     4 files changed, 277 insertions(+)
>>>>>>     create mode 100644 drivers/mfd/peci-client.c
>>>>>>     create mode 100644 include/linux/mfd/peci-client.h
> 
> [...]
> 
>>>>>> +/**
>>>>>> + * Architectures other than x86 cannot include the header file so define these
>>>>>> + * at here. These are needed for detecting type of client x86 CPUs behind a PECI
>>>>>> + * connection.
>>>>>> + */
>>>>>> +#define INTEL_FAM6_HASWELL_X   0x3F
>>>>>> +#define INTEL_FAM6_BROADWELL_X 0x4F
>>>>>> +#define INTEL_FAM6_SKYLAKE_X   0x55
>>>>>> +#endif
>>>>>> +
>>>>>> +#define LOWER_NIBBLE_MASK      GENMASK(3, 0)
>>>>>> +#define UPPER_NIBBLE_MASK      GENMASK(7, 4)
>>>>>> +
>>>>>> +#define CPU_ID_MODEL_MASK      GENMASK(7, 4)
>>>>>> +#define CPU_ID_FAMILY_MASK     GENMASK(11, 8)
>>>>>> +#define CPU_ID_EXT_MODEL_MASK  GENMASK(19, 16)
>>>>>> +#define CPU_ID_EXT_FAMILY_MASK GENMASK(27, 20)
>>>>>
>>>>> In the case of X86 based devices, are these being redefined?
>>>>>
>>>>
>>>> No define even in x86 arch build. These masks just for PECI use cases.
>>>> Also, the CPUs in this implementation is not for local CPUs, but for
>>>> remote CPUs which are connected through PECI interface. It also means
>>>> that this code can be running on non-x86 kernel too.
>>>
>>> This is starting to sound like a 'remoteproc' driver, no?
>>
>> This is driver for remote Intel CPUs that are behind in PECI connection.
> 
> Sounds like 'remoteproc' to me.
> 

No. It's not a remoteproc. The remote Intel CPUs means host server CPUs
that are running a completely separated OS. This implementation is for
BMC (Board Management Controllers) kernel for monitoring host server
machine's Intel CPU, not for multiprocessing.

>>>>>> +enum cpu_gens {
>>>>>> +	CPU_GEN_HSX = 0, /* Haswell Xeon */
>>>>>> +	CPU_GEN_BRX,     /* Broadwell Xeon */
>>>>>> +	CPU_GEN_SKX,     /* Skylake Xeon */
>>>>>> +};
>>>>>> +
>>>>>> +static struct mfd_cell peci_functions[] = {
>>>>>> +	{
>>>>>> +		.name = "peci-cputemp",
>>>>>> +		.of_compatible = "intel,peci-cputemp",
>>>>>> +	},
>>>>>> +	{
>>>>>> +		.name = "peci-dimmtemp",
>>>>>> +		.of_compatible = "intel,peci-dimmtemp",
>>>>>> +	},
>>>>>> +};
>>>>>
>>>>> A couple of temp sensors?  This isn't looking very MFD-like.
>>>>>
>>>>> What makes this an MFD?
>>>>>
>>>>
>>>> Currently it has only a couple of temp sensors but it's just one of
>>>> PECI function. Other PECI functions will be added later so it's the
>>>> reason why it should be an MFD. Please see the following PECI sideband
>>>> functions that I introduced in the cover letter of this patch set.
>>>>
>>>> * Processor and DRAM thermal management
>>>> * Platform Manageability
>>>> * Processor Interface Tuning and Diagnostics
>>>> * Failure Analysis
>>>
>>> Are these all devices in their own right?
>>>
>>> Will they each have drivers associated with them?
>>>
>>> Is there a datasheet for this PECI device?
>>>
>>
>> Temperature monitoring driver which I'm trying to upstream should be
>> added into hwmon subsystem, but other function drivers should be added
>> as a platform driver or as a something else, so it is the reason why I
>> made this MFD driver because these function drivers are separated but
>> use the same device - the remote CPU - actually. Datasheet is available
>> through http://www.intel.com/design/literature.htm with an NDA process.
>> Intel is providing the datasheet to HW vendors.
> 
> I logged in an searched for "PECI".  These were my results:
> 
>    https://i.imgur.com/y86S96I.png
> 

You may need a CNDA:

https://www.intel.com/content/www/us/en/forms/design/registration-privileged.html

Thanks,

Jae
