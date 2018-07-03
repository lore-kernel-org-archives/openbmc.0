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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Kr0k6dMKzF1MY
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 02:58:14 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jul 2018 09:58:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,304,1526367600"; d="scan'208";a="52355493"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by fmsmga008.fm.intel.com with ESMTP; 03 Jul 2018 09:58:11 -0700
Subject: Re: [PATCH linux-next v6 01/13] dt-bindings: Add a document of PECI
 subsystem
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
References: <20180621193721.20588-1-jae.hyun.yoo@linux.intel.com>
 <20180621193947.20645-1-jae.hyun.yoo@linux.intel.com>
 <20180703164731.GA9150@rob-hp-laptop>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <ba9f5c8a-17a7-f450-5f13-b1e9e5529f15@linux.intel.com>
Date: Tue, 3 Jul 2018 09:58:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180703164731.GA9150@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2018 16:58:16 -0000

Hi Rob,

Thanks for the review. Please see my inline answer.

On 7/3/2018 9:47 AM, Rob Herring wrote:
> On Thu, Jun 21, 2018 at 12:39:47PM -0700, Jae Hyun Yoo wrote:
>> This commit adds a document of generic PECI bus, adapter and client
>> driver.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
>> Reviewed-by: James Feist <james.feist@linux.intel.com>
>> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
>> Cc: Andrew Jeffery <andrew@aj.id.au>
>> Cc: Joel Stanley <joel@jms.id.au>
>> ---
>>   .../devicetree/bindings/peci/peci.txt         | 60 +++++++++++++++++++
>>   1 file changed, 60 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/peci/peci.txt
>>
>> diff --git a/Documentation/devicetree/bindings/peci/peci.txt b/Documentation/devicetree/bindings/peci/peci.txt
>> new file mode 100644
>> index 000000000000..5583aa80b78a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/peci/peci.txt
>> @@ -0,0 +1,60 @@
>> +Generic device tree configuration for PECI buses
>> +================================================
>> +
>> +Required properties:
>> +- compatible     : Should be "simple-bus".
>> +- #address-cells : Should be present if the device has sub-nodes.
>> +- #size-cells    : Should be present if the device has sub-nodes.
>> +- ranges         : Should contain PECI controller registers ranges.
>> +
>> +Example:
>> +	peci: peci@10000000 {
>> +		compatible = "simple-bus";
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0x0 0x10000000 0x1000>;
>> +	};
> 
> I don't think you need this section. It's just the parent of the
> controller, right?
> 

Right. I'll drop this section out.

Thanks a lot,

Jae

>> +
>> +Generic device tree configuration for PECI adapters
>> +===================================================
>> +
>> +Required properties:
>> +- #address-cells : Should be <1>. Read more about client addresses below.
>> +- #size-cells    : Should be <0>. Read more about client addresses below.
>> +
>> +The cells properties above define that an address of CPU clients of a PECI bus
>> +are described by a single value.
>> +
>> +Example:
>> +	peci0: peci-bus@0 {
>> +		compatible = "vendor,soc-peci";
>> +		reg = <0x0 0x1000>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +	};
>> +
>> +Generic device tree configuration for PECI clients
>> +==================================================
>> +
>> +Required properties:
>> +- compatible : Should contain name of PECI client.
>> +- reg        : Should contain address of a client CPU. Address range of CPU
>> +	       clients starts from 0x30 based on PECI specification.
>> +
>> +Example:
>> +	peci-bus@0 {
>> +		compatible = "vendor,soc-peci";
>> +		reg = <0x0 0x1000>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		peci-client@30 {
>> +			compatible = "vendor,peci-client";
>> +			reg = <0x30>;
>> +		};
>> +
>> +		peci-client@31 {
>> +			compatible = "vendor,peci-client";
>> +			reg = <0x31>;
>> +		};
>> +	};
>> -- 
>> 2.17.1
>>
