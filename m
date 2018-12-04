Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 438W173PyTzDqWn;
 Wed,  5 Dec 2018 05:41:46 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2018 10:41:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,315,1539673200"; d="scan'208";a="106960764"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.122.128.138])
 ([10.122.128.138])
 by fmsmga008.fm.intel.com with ESMTP; 04 Dec 2018 10:41:42 -0800
Subject: Re: [PATCH] clk: aspeed: Mark lclk (LPC) and espiclk (eSPI) as
 critical
To: Stephen Boyd <sboyd@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Michael Turquette <mturquette@baylibre.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Samuel Jiang <chyishian.jiang@gmail.com>, stable@vger.kernel.org,
 linux-clk@vger.kernel.org, Vijay Khemka <vijaykhemka@fb.com>,
 linux-arm-kernel@lists.infradead.org
References: <20181204172357.23665-1-jae.hyun.yoo@linux.intel.com>
 <154394694584.88331.12700815292714558990@swboyd.mtv.corp.google.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <823c0ad5-a03c-86ea-f089-556420e9878a@linux.intel.com>
Date: Tue, 4 Dec 2018 12:41:38 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <154394694584.88331.12700815292714558990@swboyd.mtv.corp.google.com>
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
X-List-Received-Date: Tue, 04 Dec 2018 18:41:48 -0000

On 12/4/2018 12:09 PM, Stephen Boyd wrote:
> Quoting Jae Hyun Yoo (2018-12-04 09:23:57)
>> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
>> index 596136793fc4..01633ad85683 100644
>> --- a/drivers/clk/clk-aspeed.c
>> +++ b/drivers/clk/clk-aspeed.c
>> @@ -95,7 +95,7 @@ static const struct aspeed_gate_data aspeed_gates[] = {
>>          [ASPEED_CLK_GATE_DCLK] =        {  5, -1, "dclk-gate",          NULL,   CLK_IS_CRITICAL }, /* DAC */
>>          [ASPEED_CLK_GATE_REFCLK] =      {  6, -1, "refclk-gate",        "clkin", CLK_IS_CRITICAL },
>>          [ASPEED_CLK_GATE_USBPORT2CLK] = {  7,  3, "usb-port2-gate",     NULL,   0 }, /* USB2.0 Host port 2 */
>> -       [ASPEED_CLK_GATE_LCLK] =        {  8,  5, "lclk-gate",          NULL,   0 }, /* LPC */
>> +       [ASPEED_CLK_GATE_LCLK] =        {  8,  5, "lclk-gate",          NULL,   CLK_IS_CRITICAL }, /* LPC */
>>          [ASPEED_CLK_GATE_USBUHCICLK] =  {  9, 15, "usb-uhci-gate",      NULL,   0 }, /* USB1.1 (requires port 2 enabled) */
>>          [ASPEED_CLK_GATE_D1CLK] =       { 10, 13, "d1clk-gate",         NULL,   0 }, /* GFX CRT */
>>          [ASPEED_CLK_GATE_YCLK] =        { 13,  4, "yclk-gate",          NULL,   0 }, /* HAC */
>> @@ -103,7 +103,7 @@ static const struct aspeed_gate_data aspeed_gates[] = {
>>          [ASPEED_CLK_GATE_UART1CLK] =    { 15, -1, "uart1clk-gate",      "uart", 0 }, /* UART1 */
>>          [ASPEED_CLK_GATE_UART2CLK] =    { 16, -1, "uart2clk-gate",      "uart", 0 }, /* UART2 */
>>          [ASPEED_CLK_GATE_UART5CLK] =    { 17, -1, "uart5clk-gate",      "uart", 0 }, /* UART5 */
>> -       [ASPEED_CLK_GATE_ESPICLK] =     { 19, -1, "espiclk-gate",       NULL,   0 }, /* eSPI */
>> +       [ASPEED_CLK_GATE_ESPICLK] =     { 19, -1, "espiclk-gate",       NULL,   CLK_IS_CRITICAL }, /* eSPI */
> 
> Can you please add a comment in the code as well so that we can easily
> recall why such clks are marked critical a year from now without having
> to do git archaeology.
> 

Okay, I'll add a comment.

Thanks,
Jae
