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
 by lists.ozlabs.org (Postfix) with ESMTPS id 435z1Q02B3zDr9C
 for <openbmc@lists.ozlabs.org>; Sat,  1 Dec 2018 02:31:36 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Nov 2018 07:31:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,299,1539673200"; d="scan'208";a="118239016"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.122.128.138])
 ([10.122.128.138])
 by fmsmga002.fm.intel.com with ESMTP; 30 Nov 2018 07:31:33 -0800
Subject: Re: [HELP] ipmi-kcs didn't work
To: Samuel Jiang <chyishian.jiang@gmail.com>,
 Vijay Khemka <vijaykhemka@fb.com>, qianlihu <wangzhiqiang8906@gmail.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
 <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
 <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
 <A5419381-84F9-490A-8BF0-70C513741ECF@fb.com>
 <e63c758f-2eec-9e28-9381-4e28d2d8bb64@linux.intel.com>
 <4780f022-1c80-4b53-9eb1-0e3fe313c6a2@Spark>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <db5cfcea-972d-2f50-05f4-266ab2c8f310@linux.intel.com>
Date: Fri, 30 Nov 2018 09:31:29 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <4780f022-1c80-4b53-9eb1-0e3fe313c6a2@Spark>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 30 Nov 2018 15:33:15 -0000

On 11/29/2018 9:00 PM, Samuel Jiang wrote:
> Hi Jae,
> 
> We also encountered the same situation a month ago.
> We try to enable the LPC clock on devicetree to resolve this problem not 
> direct modify clock driver.
> 
> lpc_ctrl: lpc-ctrl@0 {
>   compatible = "aspeed,ast2500-lpc-ctrl”;
>   reg = <0x0 0x80>;
>   clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>      status = “okay”;
> };
> 
> However, I’m not sure which is better for LPC_CLCK setting.
> Whether we should modify driver if original data is enabled or should 
> enable on the device tree, correct?
> 
> 

Hi Samuel,

Yes, you are right. I realized that kcs_bmc_aspeed.c doesn't have any
clock control code so adding a clocks setting into kcs dtsi code doesn't
make any help. Also, it was the reason why the change is needed on
clk-aspeed.c. Enabling lpc_ctrl node you suggested seems a right way.

Hi Vijay,
Can you please try the way Samuel suggested after removing changes I
gave you. Samuel's solution looks good to me.

Thanks,
Jae

> Thanks,
> 
> Samuel Jiang
> On Nov 30, 2018, 2:58 AM +0800, Jae Hyun Yoo 
> <jae.hyun.yoo@linux.intel.com>, wrote:
>> On 11/29/2018 12:42 PM, Vijay Khemka wrote:
>>> Try below fix on clk-aspeed.c
>>>
>>> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
>>> index 596136793fc4..b55d35e3eb5e 100644
>>> --- a/drivers/clk/clk-aspeed.c
>>> +++ b/drivers/clk/clk-aspeed.c
>>> @@ -95,7 +95,7 @@ static const struct aspeed_gate_data aspeed_gates[] = {
>>> [ASPEED_CLK_GATE_DCLK] = { 5, -1, "dclk-gate",
>>> NULL, CLK_IS_CRITICAL }, /* DAC */
>>> [ASPEED_CLK_GATE_REFCLK] = { 6, -1, "refclk-gate",
>>> "clkin", CLK_IS_CRITICAL },
>>> [ASPEED_CLK_GATE_USBPORT2CLK] = { 7, 3, "usb-port2-gate",
>>> NULL, 0 }, /* USB2.0 Host port 2 */
>>> - [ASPEED_CLK_GATE_LCLK] = { 8, 5, "lclk-gate",
>>> NULL, 0 }, /* LPC */
>>> + [ASPEED_CLK_GATE_LCLK] = { 8, 5, "lclk-gate",
>>> NULL, CLK_IS_CRITICAL }, /* LPC */
>>> [ASPEED_CLK_GATE_USBUHCICLK] = { 9, 15, "usb-uhci-gate",
>>> NULL, 0 }, /* USB1.1 (requires port 2 enabled) */
>>> [ASPEED_CLK_GATE_D1CLK] = { 10, 13, "d1clk-gate",
>>> NULL, 0 }, /* GFX CRT */
>>> [ASPEED_CLK_GATE_YCLK] = { 13, 4, "yclk-gate",
>>> NULL, 0 }, /* HAC */
>>>
>>> In my experiments on my system, LCLK was not enabled due to the null
>>> parent dependency so I added CLK_IS_CRITICAL flag to enable the clk.
>>>
>>> LPC interface is default pin pad setting of AST2500 so you might not
>>> need a pinctrl setting on it if you didn't change it's pin pads to GPIO
>>> or eSPI.
>>>
>>> Cheers,
>>> Jae
>>>
>>> Jae,
>>> Are you planning to upstream this patch as it is needed for kcsbridge 
>>> to work. Also aspeed-g5 dtsi file.
>>
>> Okay, I'll submit this patch and dtsi patch to community.
>>
>> Thanks,
>> Jae
>>
>>>
>>> Regards
>>> -Vijay
>>>
>>>
