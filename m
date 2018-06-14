Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4169W930NxzDrpC
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jun 2018 03:25:40 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2018 10:25:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,222,1526367600"; d="scan'208";a="63215466"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2018 10:25:38 -0700
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
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <2b5bbf01-8c9c-bb06-4559-00dae61d95de@linux.intel.com>
Date: Thu, 14 Jun 2018 10:25:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180613061637.GI5278@dell>
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
X-List-Received-Date: Thu, 14 Jun 2018 17:25:42 -0000

Thanks for the review. Please check my answers inline.

On 6/12/2018 11:16 PM, Lee Jones wrote:
> All s/mfd/MFD/
> 

Got it. Will fix it.

>> This commit adds a dt-bindings document for PECI client multi-function
>> device.
> 
> Multi-Function Device
> 

Will fix it.

>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> Cc: Andrew Jeffery <andrew@aj.id.au>
>> Cc: James Feist <james.feist@linux.intel.com>
>> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
>> Cc: Joel Stanley <joel@jms.id.au>
>> Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
>> ---
>>   .../devicetree/bindings/mfd/peci-client.txt   | 23 +++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/peci-client.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/peci-client.txt b/Documentation/devicetree/bindings/mfd/peci-client.txt
>> new file mode 100644
>> index 000000000000..4eb8f6bb6ca4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/peci-client.txt
>> @@ -0,0 +1,23 @@
>> +* Intel PECI client bindings
> 
> Now it the time to expand on what a "PECI client" is.
> 

Okay, I'll add more description about the "PECI client".

>> +Required properties:
>> +- compatible : Should be "intel,peci-client", "simple-mfd".
>> +- reg        : Should contain address of a client CPU. Address range of CPU
>> +	       clients is starting from 0x30 based on PECI specification.
> 
> s/is starting/start/
> 

Will change it to "Address range of CPU clients starts from ...".

>> +Example:
>> +	peci-bus@0 {
> 
> 0?
> 

Because the actual reg value of the peci bus is reg = <0x0 0x60> but
anyway it's an example.

>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
> 
> No 'reg' property?
> 

This is the actual peci bus node which is a parent of this MFD node:
	peci0: peci-bus@0 {
		compatible = "aspeed,ast2500-peci";
		reg = <0x0 0x60>;
		#address-cells = <1>;
		#size-cells = <0>;
		interrupts = <15>;
		clocks = <&syscon ASPEED_CLK_GATE_REFCLK>;
		resets = <&syscon ASPEED_RESET_PECI>;
		clock-frequency = <24000000>;
		msg-timing = <1>;
		addr-timing = <1>;
		rd-sampling-point = <8>;
		cmd-timeout-ms = <1000>;
	};

>> +		< more properties >
> 
> Remove this.
> 

I dropped all other properties into < more properties > because I want
to show the #address-cells and #size-cells to state its sub-nodes
should have a single unique reg value. Should I remove this line or the
whole parent node?

>> +		peci-client@30 {
>> +			compatible = "intel,peci-client", "simple-mfd";
>> +			reg = <0x30>;
>> +		};
>> +
>> +		peci-client@31 {
>> +			compatible = "intel,peci-client", "simple-mfd";
>> +			reg = <0x31>;
>> +		};
>> +	};
> 
