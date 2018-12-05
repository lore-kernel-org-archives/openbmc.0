Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43928m1F8bzDqtZ;
 Thu,  6 Dec 2018 02:04:35 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2018 07:04:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,317,1539673200"; d="scan'208";a="125312616"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.122.128.138])
 ([10.122.128.138])
 by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2018 07:04:33 -0800
Subject: Re: [PATCH v2] clk: aspeed: Mark lclk (LPC) and espiclk (eSPI) as
 critical
To: Stephen Boyd <sboyd@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Michael Turquette <mturquette@baylibre.com>, chyishian.jiang@gmail.com,
 "# 3.4.x" <stable@vger.kernel.org>, linux-clk@vger.kernel.org,
 vijaykhemka@fb.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20181204185054.24053-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8XcwMMoxG6vhDhUU8RYGABx7rtBoxJvp2yDhHeD-PemdqA@mail.gmail.com>
 <154395687459.88331.13570416457347078441@swboyd.mtv.corp.google.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <697a184b-ef99-a46e-bf98-4d339b3aafd8@linux.intel.com>
Date: Wed, 5 Dec 2018 09:04:30 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <154395687459.88331.13570416457347078441@swboyd.mtv.corp.google.com>
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
X-List-Received-Date: Wed, 05 Dec 2018 15:05:13 -0000

On 12/4/2018 2:54 PM, Stephen Boyd wrote:
> Quoting Joel Stanley (2018-12-04 12:51:43)
>> Hi Jae,
>>
>> On Wed, 5 Dec 2018 at 05:20, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>>
>>> These interfaces are used by host to talk to BMC, and the clock
>>> source is from the host, usually from PCH. So this commit marks
>>> the lclk as critical to make it able to be enabled. Also, it marks
>>> espiclk too because eSPI is sharing the same interface with LPC.
>>
>> While this is true on the platform you have in mind, on other
>> platforms this is not the case. They do not use eSPI, and LCLK is
>> enabled by the driver that is used to configure LPC
>> (drivers/misc/aspeed-lpc-ctrl.c):
>>
>>   lpc_ctrl: lpc-ctrl@0 {
>>       compatible = "aspeed,ast2400-lpc-ctrl";
>>       reg = <0x0 0x80>;
>>       clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>>   }
>>
>> I wonder if we need a device tree binding to describe which clocks are critical.
> 
> A binding to describe critical clks has been rejected in the past. I
> don't think we need to have it here either? More information on why
> things are being marked critical will be helpful to see if we need to
> re-open that discussion again.
> 
>>
>> Stephen, please don't merge this patch yet.
>>
> 
> Sure.
> 

Hi Stephen and Joel,

Thanks for blocking this patch. We checked that LCLK gate can be opened
by enabling lpc-ctrl node without using this change. Please drop this
patch.

Thanks,
Jae
