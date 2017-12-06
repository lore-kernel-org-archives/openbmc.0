Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ysY7h0r1dzDrcV
 for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2017 09:24:31 +1100 (AEDT)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Dec 2017 14:24:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,369,1508828400"; d="scan'208";a="13760485"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga001.jf.intel.com with ESMTP; 06 Dec 2017 14:24:28 -0800
Subject: Re: [PATCH 1/6] Documentation: dt-bindings: Add Aspeed PECI
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20171206210240.6996-1-jae.hyun.yoo@linux.intel.com>
 <1512596529.2031041.1196482120.33305149@webmail.messagingengine.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <ef423282-b374-5a49-1c50-53e2e8add58b@linux.intel.com>
Date: Wed, 6 Dec 2017 14:24:28 -0800
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1512596529.2031041.1196482120.33305149@webmail.messagingengine.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Dec 2017 22:24:32 -0000


On 12/6/2017 1:42 PM, Andrew Jeffery wrote:
> Hi Jae Hun Yoo,
> 
> Nice work! Some comments below
> 
> On Thu, 7 Dec 2017, at 07:32, Jae Hyun Yoo wrote:
>> This commit adds a dt-bindings document for Aspeed PECI.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>>   .../devicetree/bindings/misc/aspeed-peci.txt       | 52
>>   ++++++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>   create mode 100644
>>   Documentation/devicetree/bindings/misc/aspeed-peci.txt
>>
>> diff --git a/Documentation/devicetree/bindings/misc/aspeed-peci.txt
>> b/Documentation/devicetree/bindings/misc/aspeed-peci.txt
>> new file mode 100644
>> index 000000000000..af950d72a48c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/aspeed-peci.txt
>> @@ -0,0 +1,52 @@
>> +* ASPEED PECI (Platform Environment Control Interface) misc driver.
>> +
>> +Hardware Interfaces:
>> +- This driver implements support for the ASPEED AST2400/2500 PECI which
>> has the
>> +  following features:
>> +       - Directly connected to APB bus
>> +       - Intel PECI 3.1 compliant (PECI 3.0 for AST2400)
>> +       - Maximum packet length is 256 bytes (Baseline transmission unit)
>> +       - Support up to 8 CPUs and 2 domains per CPU
>> +       - Integrate PECI compliant I/O buffers, can connect to PECI bus
>> directly
>> +       - Transmit buffer 32 bytes and receive buffer 32 bytes
>> +
>> +Required properties:
>> +- compatible: "aspeed,ast2400-peci" or "aspeed,ast2500-peci"
>> +       - aspeed,ast2400-peci: Aspeed AST2400 family PECI control
>> interface
>> +       - aspeed,ast2500-peci: Aspeed AST2500 family PECI control
>> interface
>> +- reg: Should contain PECI registers location and length
>> +- interrupts: Should contain PECI interrupt
>> +
>> +Optional properties:
>> +- msg_timing_nego: Message timing negotiation period
> 
> Typically we use '-' rather than '_' as a separator in property names. I
> notice your example uses '-'; please change the documentation.
> 

Ah, I missed this part. Thanks for your pointing it out.

> Separately, what unit is this property working with? Clock cycles? It's
> not clear what picking any particular value means.
> 
> The two problems apply to the next few properties as well:
> 

Sure, I'll fix all these and will add more details.

>> +       0 ~ 255 (default: 1)
>> +- addr_timing_nego: Address timing negotiation period
>> +       0 ~ 255 (default: 1)
>> +- rd_sampling_point: Read sampling point selection
>> +       0 ~ 15 (default: 8)
> 
>> +- clk_div: Clock divider for 24MHz clock source
>> +       0: Divide by 1   <- default
>> +       1: Divide by 2
>> +       2: Divide by 4
>> +       3: Divide by 8
>> +       4: Divide by 16
>> +       5: Divide by 32
>> +       6: Divide by 64
>> +       7: Divide by 128
> 
> What is the purpose of the clock divider? To derive the peci bus
> frequency? If so, you should instead use the generic 'bus-frequency'
> property, and implement support in the driver to derive the described
> frequency from the upstream clock rate and the value of bus-frequency
> specified in the devicetree node. That is, derive the divisor value and
> program it into the hardware. You should also document the 'clocks' and
> 'clock-names' properties here in order to describe the upstream clock
> 

Yes, right. I totally agree with you. I'll add calculation logic for bus 
clock into driver. Thanks!

>> +- cmd_timeout_ms: Command timeout in units of ms
>> +       1 ~ 60000 (default: 1000)
> 
> This is a contrast to your properties above in the the unit is clear,
> which is good.
> 
>> +
>> +Example:
>> +       peci: peci@1e78b000 {
>> +               compatible = "aspeed,ast2500-peci", "syscon",
>> "simple-mfd";
> 
> If you need it to be a syscon you should say so in the documentation as
> well as the example. But:
> 
> Do you actually need a syscon here? why? Do we need to share these
> registers across multiple drivers? I'd be surprised if this controller
> fits the syscon description.
> 
> If you want a regmap you can create one inside the driver without
> affecting the devicetree. But I'd also question why you want one - they
> introduce overhead where you probably don't need it.
> 

I simply added a syscon to use syscon_node_to_regmap api but I didn't 
consider the issue you pointed out. I'll remove the syscon and will make 
driver to use devm_regmap_init_mmio instead.

> Cheers,
> 
> Andrew
> 

Thanks a lot for sharing your time on reviewing this. Will address all 
you pointed out.

BR,

Jae

>> +               reg = <0x1e78b000 0x60>;
>> +               reg-io-width = <4>;
>> +               interrupt-controller;
>> +               interrupts = <15>;
>> +               msg-timing-nego = <1>;
>> +               addr-timing-nego = <1>;
>> +               rd-sampling-point = <8>;
>> +               clk-div = <0>;
>> +               cmd-timeout-ms = <1000>;
>> +       };
>> +
>> -- 
>> 2.15.1
>>
