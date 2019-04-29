Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t96X0YsYzDq5t
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 02:27:14 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 09:27:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,410,1549958400"; d="scan'208";a="135391919"
Received: from unknown (HELO [10.7.153.148]) ([10.7.153.148])
 by orsmga007.jf.intel.com with ESMTP; 29 Apr 2019 09:27:11 -0700
Subject: Re: [PATCH dev-5.0 0/4] Improve stability of Aspeed video engine
 driver - 2nd phase
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
References: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8XdOBgGrR6EKj4rP3VhnwiCrFGAn33n6XTrU1UR3kJSigA@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <66b34da6-5d17-aa0b-0bcf-21ce9049fca4@linux.intel.com>
Date: Mon, 29 Apr 2019 09:27:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdOBgGrR6EKj4rP3VhnwiCrFGAn33n6XTrU1UR3kJSigA@mail.gmail.com>
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
X-List-Received-Date: Mon, 29 Apr 2019 16:27:16 -0000

On 4/29/2019 12:27 AM, Joel Stanley wrote:
> Hi Jae,
> 
> On Thu, 25 Apr 2019 at 22:20, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> This patch series improves stability of Aspeed video engine driver by fixing
>> interrupt handling logic and by reducing noisy log printings in the driver.
> 
> NIce work. Did you post these for upstream inclusion?
> 
> I suggest doing that now. I can apply these to dev-5.0 once we have an
> ack from Eddie.

Hi Joel,

Thanks for your review. I'll upstream it after Eddie's patch
upstreaming. Will submit the 1st phase and this 2nd phase series
altogether then.

Thanks,
Jae

> Cheers,
> 
> Joel
> 
> 
> 
>>
>> Jae Hyun Yoo (4):
>>    media: aspeed: remove IRQF_SHARED flag
>>    media: aspeed: reduce noisy log printing outs
>>    media: aspeed: remove checking of VE_INTERRUPT_CAPTURE_COMPLETE
>>    media: aspeed: clear interrupt status flags immediately
>>
>>   drivers/media/platform/aspeed-video.c | 35 ++++++++++++---------------
>>   1 file changed, 16 insertions(+), 19 deletions(-)
>>
>> --
>> 2.21.0
>>
