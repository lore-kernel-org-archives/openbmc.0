Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40X2S83PS0zF24t;
 Fri, 27 Apr 2018 02:23:35 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Apr 2018 09:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,330,1520924400"; d="scan'208";a="223602105"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by fmsmga005.fm.intel.com with ESMTP; 26 Apr 2018 09:23:31 -0700
Subject: Re: [PATCH linux dev-4.13] clk:aspeed: Fix reset bits for PCI/VGA and
 PECI
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20180424224056.23384-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xe99zZ9Q0Y2HqoaGDXigBaZpkTcbfRe=gvsR5x6XMWzYA@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <5d5faa4a-bffe-5a3f-39e6-b45eebcbb4db@linux.intel.com>
Date: Thu, 26 Apr 2018 09:23:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xe99zZ9Q0Y2HqoaGDXigBaZpkTcbfRe=gvsR5x6XMWzYA@mail.gmail.com>
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
X-List-Received-Date: Thu, 26 Apr 2018 16:23:37 -0000

Hello Joel,

On 4/25/2018 6:55 PM, Joel Stanley wrote:
> Hello Jae,
> 
> On 25 April 2018 at 08:10, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>> This commit fixes incorrect setting of reset bits for PCI/VGA and
>> PECI modules.
>>
>> 1. Reset bit for PCI/VGA is 8.
>> 2. PECI reset logic is missing so added bit 10 as its reset bit.
> 
> Great find!
> 
> Can you please send these upstream as a fix? Apply to 4.17-rc2, and
> use get_maintainers.pl to identify the lists to send it to.
> 
> Also add:
> 
> Fixes: 15ed8ce5f84e ("clk: aspeed: Register gated clocks")
> Cc: stable <stable@vger.kernel.org>
> 

Thanks! I'll send it to upstream maintainers after adding the tags.

>> +++ b/include/dt-bindings/clock/aspeed-clock.h
>> @@ -43,8 +43,8 @@
>>   #define ASPEED_RESET_ADC               2
>>   #define ASPEED_RESET_JTAG_MASTER       3
>>   #define ASPEED_RESET_MIC               4
>> -#define ASPEED_RESET_PWM               5
>> -#define ASPEED_RESET_PCIVGA            6
>> +#define ASPEED_RESET_PECI              5
>> +#define ASPEED_RESET_PWM               6
> 
> This numbers form the kernel ABI, so we shouldn't be changing them.
> However, none of the mainline device trees use PCIVGA, so we can
> rename that without breaking any one.
> 
> If we leave PWM as 5, and rename PCIVGA to PECI, we won't break any
> existing device trees.
> 
> Cheers,
> 
> Joel
> 

Got it. I'll rename the PCIVGA to PECI with Keeping the PWM.

Thanks,

Jae

> 
>>   #define ASPEED_RESET_I2C               7
>>   #define ASPEED_RESET_AHB               8
>>   #define ASPEED_RESET_CRT1              9
>> --
>> 2.7.4
>>
