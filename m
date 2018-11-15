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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42ws0W0vmFzF25Y
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 06:30:50 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2018 11:30:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,237,1539673200"; d="scan'208";a="89636727"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga007.jf.intel.com with ESMTP; 15 Nov 2018 11:30:47 -0800
Subject: Re: [HELP] ipmi-kcs didn't work
To: qianlihu <wangzhiqiang8906@gmail.com>
Cc: openbmc@lists.ozlabs.org
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
 <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
Date: Thu, 15 Nov 2018 11:30:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
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
X-List-Received-Date: Thu, 15 Nov 2018 19:30:53 -0000

On 11/14/2018 5:49 PM, qianlihu wrote:
> Hi,Jae
> 
>>
>> Hi,
>>
>> On 11/14/2018 2:38 AM, qianlihu wrote:
>>> Hi,
>>>
>>> I add ipmi kcs node,but it didn't work
>>>
>>> here is the patch for dts.
>>>
>>>           lpc_bmc: lpc-bmc@0 {
>>> -               compatible = "aspeed,ast2500-lpc-bmc";
>>> +               compatible = "aspeed,ast2500-lpc-bmc", "simple-mfd", "syscon";
>>> +
>>>                   reg = <0x0 0x80>;
>>> +               reg-io-width = <4>;
>>> +
>>> +               #address-cells = <1>;
>>> +               #size-cells = <1>;
>>> +               ranges = <0x0 0x0 0x80>;
>>> +
>>> +               kcs3: kcs3@0 {
>>> +                       compatible = "aspeed,ast2500-kcs-bmc";
>>> +                       reg = <0x0 0x80>;
>>> +                       interrupts = <8>;
>>> +                       kcs_chan = <3>;
>>> +                       kcs_addr = <0xca2>;
>>
>> Probably, you should add a clock setting for KCS H/W block into here.
>>
>>          clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>>
> I tried ,but it didn't work．
> 
>> Cheers,
>>
>> Jae
>>
>>> +                       status = "disabled";
>>> +
>>> +               };
>>>           };
>>>
>>> +&kcs3 {
>>>                            +       status = "okay";
>>>           +};
>>>
>>>
>>> The device node /dev/ipmi-kcs3 is created.
>>>
>>>
>>> root@sanjose:/tmp# ./kcsbridged --vv --d /dev/ipmi-kcs3
>>> Debug logging
>>> Starting
>>> Registering dbus methods/signals
>>> Requesting dbus name: org.openbmc.HostIpmi
>>> Getting dbus file descriptors
>>> Opening /dev/ipmi-kcs3
>>> Creating timer fd
>>> Entering polling loop
>>> Processed 1 dbus events
>>> Processed 1 dbus events
>>> Processed 1 dbus events
>>> Processed 1 dbus events
>>> Processed 1 dbus events
>>> Processed 1 dbus events
>>> Processed 1 dbus events
>>>
>>> but there is nothing output.
>>>
> 
> this is the dmesg info
> 
> root@sanjose:~# dmesg |grep kcs
> [    2.052340] aspeed-kcs-bmc: channel=3 addr=0xca2 idr=0x2c odr=0x38 str=0x44
> 
> I also checked the hardtrap:
> 0x1e6e2070[bit25]  enabled the lpc mode
> 
> I'm sure the IO port is 0xca2.
> 
> 
> should I config the pin for LPC,I checked the ibt node,it didn't.
> 
> 
> thank you
> 
> --qianlihu
> 

Try below fix on clk-aspeed.c

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 596136793fc4..b55d35e3eb5e 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -95,7 +95,7 @@ static const struct aspeed_gate_data aspeed_gates[] = {
         [ASPEED_CLK_GATE_DCLK] =        {  5, -1, "dclk-gate", 
NULL,   CLK_IS_CRITICAL }, /* DAC */
         [ASPEED_CLK_GATE_REFCLK] =      {  6, -1, "refclk-gate", 
"clkin", CLK_IS_CRITICAL },
         [ASPEED_CLK_GATE_USBPORT2CLK] = {  7,  3, "usb-port2-gate", 
NULL,   0 }, /* USB2.0 Host port 2 */
-       [ASPEED_CLK_GATE_LCLK] =        {  8,  5, "lclk-gate", 
NULL,   0 }, /* LPC */
+       [ASPEED_CLK_GATE_LCLK] =        {  8,  5, "lclk-gate", 
NULL,   CLK_IS_CRITICAL }, /* LPC */
         [ASPEED_CLK_GATE_USBUHCICLK] =  {  9, 15, "usb-uhci-gate", 
NULL,   0 }, /* USB1.1 (requires port 2 enabled) */
         [ASPEED_CLK_GATE_D1CLK] =       { 10, 13, "d1clk-gate", 
NULL,   0 }, /* GFX CRT */
         [ASPEED_CLK_GATE_YCLK] =        { 13,  4, "yclk-gate", 
NULL,   0 }, /* HAC */

In my experiments on my system, LCLK was not enabled due to the null
parent dependency so I added CLK_IS_CRITICAL flag to enable the clk.

LPC interface is default pin pad setting of AST2500 so you might not
need a pinctrl setting on it if you didn't change it's pin pads to GPIO
or eSPI.

Cheers,
Jae
