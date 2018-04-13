Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Mf470BklzDqws;
 Fri, 13 Apr 2018 10:37:10 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Apr 2018 17:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,444,1517904000"; d="scan'208";a="220040536"
Received: from haiyuewa-mobl1.ccr.corp.intel.com (HELO [10.239.196.80])
 ([10.239.196.80])
 by fmsmga006.fm.intel.com with ESMTP; 12 Apr 2018 17:37:06 -0700
Subject: Re: openbmc Digest, Vol 32, Issue 32
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 openbmc-request@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 benh@kernel.crashing.org
References: <mailman.355.1523511154.2391.openbmc@lists.ozlabs.org>
 <45b6959c-5743-744f-d4d6-4f40984f1323@linux.intel.com>
 <1523579417.2617274.1336331832.4088E66A@webmail.messagingengine.com>
From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <ecd541ac-0912-6fb9-bb50-a096d037f721@linux.intel.com>
Date: Fri, 13 Apr 2018 08:37:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1523579417.2617274.1336331832.4088E66A@webmail.messagingengine.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
X-List-Received-Date: Fri, 13 Apr 2018 00:37:12 -0000

Hi Andrew,

I thought it just needed a memory map function for some special
SoC registers. I truly learn more from this security design. :)

Thanks.

BR,
Haiyue


On 2018-04-13 08:30, Andrew Jeffery wrote:
> Hi Haiyue,
>
> On Thu, 12 Apr 2018, at 17:25, Wang, Haiyue wrote:
>> Hi Andrew,
>>
>> Facebook uses the 'devmem' utility and python script to implement the
>> soc register
>>
>> read and write in a simple way. And the yocto layer is also very clear
>> like different
>>
>> chip vendor and common parts.
>>
>>
>> Kernel device tree upstream is also very slow, we needs two parts
>> (device tree + user app)
>>
>> to finish the soc setting. But Facebook just uses user app, this
>> development is fast, and
>>
>> simple is the best.
>>
>>
>> Well, just for sharing what I found, I may misunderstood the BIG idea
>> after this kernel
>>
>> patch design. :-)
> Ben's covered the main points, but yes, what was implicit was we're looking to improve the security of the BMC. I'll try to make sure I'm more explicit in the future.
>
> Cheers,
>
> Andrew
