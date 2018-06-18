Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418d1d3B3dzF0Pd
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 03:12:04 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2018 10:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,240,1526367600"; d="scan'208";a="50853753"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga006.jf.intel.com with ESMTP; 18 Jun 2018 10:11:59 -0700
Subject: Re: [PATCH linux-next v5 07/13] dt-bindings: mfd: Add a document for
 PECI client mfd
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>, Joel Stanley
 <joel@jms.id.au>, Vernon Mauery <vernon.mauery@linux.intel.com>
References: <20180601182216.23894-1-jae.hyun.yoo@linux.intel.com>
 <20180613061637.GI5278@dell>
 <2b5bbf01-8c9c-bb06-4559-00dae61d95de@linux.intel.com>
 <20180618060306.GD31141@dell>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <fa5a5714-f363-93df-4314-a140eb85747a@linux.intel.com>
Date: Mon, 18 Jun 2018 10:11:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180618060306.GD31141@dell>
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
X-List-Received-Date: Mon, 18 Jun 2018 17:12:06 -0000

On 6/17/2018 11:03 PM, Lee Jones wrote:
> On Thu, 14 Jun 2018, Jae Hyun Yoo wrote:
> 
> [...]
> 
>>>> +Example:
>>>> +	peci-bus@0 {
>>>
>>> 0?
>>>
>>
>> Because the actual reg value of the peci bus is reg = <0x0 0x60> but
>> anyway it's an example.
>>
>>>> +		#address-cells = <1>;
>>>> +		#size-cells = <0>;
>>>
>>> No 'reg' property?
> 
> 0 is fine, but you really should have a 'reg' property.
> 

Okay, I'll add reg setting example.

>> This is the actual peci bus node which is a parent of this MFD node:
>> 	peci0: peci-bus@0 {
>> 		compatible = "aspeed,ast2500-peci";
>> 		reg = <0x0 0x60>;
>> 		#address-cells = <1>;
>> 		#size-cells = <0>;
>> 		interrupts = <15>;
>> 		clocks = <&syscon ASPEED_CLK_GATE_REFCLK>;
>> 		resets = <&syscon ASPEED_RESET_PECI>;
>> 		clock-frequency = <24000000>;
>> 		msg-timing = <1>;
>> 		addr-timing = <1>;
>> 		rd-sampling-point = <8>;
>> 		cmd-timeout-ms = <1000>;
>> 	};
>>
>>>> +		< more properties >
>>>
>>> Remove this.
>>
>> I dropped all other properties into < more properties > because I want
>> to show the #address-cells and #size-cells to state its sub-nodes
>> should have a single unique reg value. Should I remove this line or the
>> whole parent node?
> 
> Just drop the properties which are unimportant for the example.  You
> do not need to replace them with anything, especially with a non-DT
> compliant string.
> 

Okay, I'll fix it. Thanks a lot!

>>>> +		peci-client@30 {
>>>> +			compatible = "intel,peci-client", "simple-mfd";
>>>> +			reg = <0x30>;
>>>> +		};
>>>> +
>>>> +		peci-client@31 {
>>>> +			compatible = "intel,peci-client", "simple-mfd";
>>>> +			reg = <0x31>;
>>>> +		};
>>>> +	};
>>>
> 
