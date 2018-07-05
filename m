Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41M3Tv0HvpzF2WZ
 for <openbmc@lists.ozlabs.org>; Fri,  6 Jul 2018 02:39:14 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jul 2018 09:39:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,313,1526367600"; d="scan'208";a="213690027"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga004.jf.intel.com with ESMTP; 05 Jul 2018 09:39:12 -0700
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
 <20180704064230.GC20176@dell>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <9588aeb6-0290-56b1-9a80-287c028c19fd@linux.intel.com>
Date: Thu, 5 Jul 2018 09:39:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180704064230.GC20176@dell>
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
X-List-Received-Date: Thu, 05 Jul 2018 16:39:15 -0000

On 7/3/2018 11:42 PM, Lee Jones wrote:
> On Mon, 18 Jun 2018, Jae Hyun Yoo wrote:
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
>>
>>> [...]
>>>
>>>>>> +static struct peci_driver peci_client_driver = {
>>>>>
>>>>> I'm pretty sure this will be NAKED by the platform Maintainer.
>>>>
>>>> Does it have problems? Can you please give me a hint?
>>>
>>> New bus types are usually only added for well defined, heavily used
>>> buses which AFAIK all have their own subsystems.  Why can't you use
>>> one of the existing bus types?  Platform is the most frequently used.
>>>
>>
>> I implemented this PECI drivers as a simple platform drivers in V1 but
>> I had to change it to follow other maintainers' suggestions. I believe
>> driver core maintainers are reviewing the PECI subsystem implementation
>> code in this patch set as well.
> 
> I don't see this discussion.  How is it progressing?
> 

v1:
https://lkml.org/lkml/2018/1/9/1088

v2:
https://lkml.org/lkml/2018/2/21/983

v3:
https://lkml.org/lkml/2018/4/10/750

v4:
https://lkml.org/lkml/2018/5/21/717

v5:
https://lkml.org/lkml/2018/6/1/732
https://lkml.org/lkml/2018/6/1/733
https://lkml.org/lkml/2018/6/1/734
https://lkml.org/lkml/2018/6/1/736
https://lkml.org/lkml/2018/6/1/737
https://lkml.org/lkml/2018/6/1/738
https://lkml.org/lkml/2018/6/1/740
https://lkml.org/lkml/2018/6/1/742
https://lkml.org/lkml/2018/6/1/743
https://lkml.org/lkml/2018/6/1/744
https://lkml.org/lkml/2018/6/1/745
https://lkml.org/lkml/2018/6/1/746
https://lkml.org/lkml/2018/6/1/747

v6:
https://lkml.org/lkml/2018/6/21/596

Thanks,

Jae
