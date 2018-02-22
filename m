Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znLjP2ZpGzF1cV
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 04:20:52 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2018 09:20:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,378,1515484800"; d="scan'208";a="32799172"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2018 09:20:47 -0800
Subject: Re: [PATCH v2 1/8] [PATCH 1/8] drivers/peci: Add support for PECI bus
 driver core
To: Greg KH <gregkh@linuxfoundation.org>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, jdelvare@suse.com,
 linux@roeck-us.net, benh@kernel.crashing.org, andrew@lunn.ch,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
 <20180221175853.GA22320@kroah.com>
 <7f152459-a232-e62a-3c34-e995f8c85d63@linux.intel.com>
 <20180222065455.GA2428@kroah.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <9bd825f4-8497-4e2a-b8ea-56888df754e7@linux.intel.com>
Date: Thu, 22 Feb 2018 09:20:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180222065455.GA2428@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Feb 2018 17:20:58 -0000

On 2/21/2018 10:54 PM, Greg KH wrote:
> On Wed, Feb 21, 2018 at 12:42:30PM -0800, Jae Hyun Yoo wrote:
>> On 2/21/2018 9:58 AM, Greg KH wrote:
>>> On Wed, Feb 21, 2018 at 08:15:59AM -0800, Jae Hyun Yoo wrote:
>>>> This commit adds driver implementation for PECI bus into linux
>>>> driver framework.
>>>>
>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>> ---
>>>
>>> Why is there no other Intel developers willing to review and sign off on
>>> this patch?  Please get their review first before asking us to do their
>>> work for them :)
>>>
>>> thanks,
>>>
>>> greg k-h
>>>
>>
>> Hi Greg,
>>
>> This patch set got our internal review process. Sorry if it's code quality
>> is under your expectation but it's the reason why I'm asking you to review
>> the code. Could you please share your time to review it?
> 
> Nope.  If no other Intel developer thinks it is good enough to put their
> name on it as part of their review process, why should I?
> 
> Again, please use the resources you have, to fix the obvious problems in
> your code, BEFORE asking the community to do that work for you.
> 
> greg k-h
> 

Okay. I'll take our internal review process again on this patch set and 
collect more credit tags before submitting v3.

Thanks for your advice!

Jae
