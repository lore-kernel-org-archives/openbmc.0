Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yt8lJ21m5zDsPs
 for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2017 09:08:58 +1100 (AEDT)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Dec 2017 14:08:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,374,1508828400"; d="scan'208";a="14083488"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by orsmga001.jf.intel.com with ESMTP; 07 Dec 2017 14:08:48 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH 4/6] Documentation: dt-bindings,hwmon: Add Aspeed PECI
 hwmon
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20171206210313.7138-1-jae.hyun.yoo@linux.intel.com>
 <1512607269.2808930.1196642712.54A8CC54@webmail.messagingengine.com>
Message-ID: <6c6cee6d-16e0-4f94-0e3e-da4030ed5f2d@linux.intel.com>
Date: Thu, 7 Dec 2017 14:08:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1512607269.2808930.1196642712.54A8CC54@webmail.messagingengine.com>
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
X-List-Received-Date: Thu, 07 Dec 2017 22:09:01 -0000



On 12/6/2017 4:41 PM, Andrew Jeffery wrote:
> On Thu, 7 Dec 2017, at 07:33, Jae Hyun Yoo wrote:
>> This commit add dt-bindings and hwmon documents for Aspeed PECI
>> hwmon.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>>   .../bindings/hwmon/aspeed-peci-hwmon.txt           | 89
>>   ++++++++++++++++++++++
>>   Documentation/hwmon/aspeed-peci-hwmon              | 64 ++++++++++++++++
>>   2 files changed, 153 insertions(+)
>>   create mode 100644
>>   Documentation/devicetree/bindings/hwmon/aspeed-peci-hwmon.txt
>>   create mode 100644 Documentation/hwmon/aspeed-peci-hwmon
> 
> I'd recommend splitting out these changes, it will make upstream a bit
> happier. I'd recommend sending upstream as soon as possible as well.
> 

Okay, no problem. I'll split these out. Also, I will add upstream
maintainers as well from the v2 patch set.

>>
>> diff --git
>> a/Documentation/devicetree/bindings/hwmon/aspeed-peci-hwmon.txt
>> b/Documentation/devicetree/bindings/hwmon/aspeed-peci-hwmon.txt
>> new file mode 100644
>> index 000000000000..a20a82f3380c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/aspeed-peci-hwmon.txt
>> @@ -0,0 +1,89 @@
>> +* ASPEED PECI (Platform Environment Control Interface) hwmon driver.
>> +
>> +Dependency:
>> +- This driver uses ASPEED PECI kernel misc driver as a controller
>> interface
>> +  which can be enabled by setting CONFIG_ASPEED_PECI as yes.
>> +
>> +Required properties:
>> +- multi-functional device body: "aspeed,ast2400-peci" or
>> "aspeed,ast2500-peci"
>> +       - aspeed,ast2400-peci: Aspeed AST2400 family PECI MFD
>> +       - aspeed,ast2500-peci: Aspeed AST2500 family PECI MFD
>> +- compatible: "aspeed,ast2400-peci-hwmon" or "aspeed,ast2500-peci-hwmon"
>> +       - aspeed,ast2400-peci-hwmon: Aspeed AST2400 family PECI hwmon
>> +       - aspeed,ast2500-peci-hwmon: Aspeed AST2500 family PECI hwmon
>> +- cpu-id: Should contain CPU socket ID
>> +       - 0 ~ 7
>> +
>> +Optional properties:
>> +- show-core: If this property is 1, core temperature attributes will be
>> +             enumerated.
>> +       0 or 1 (default: 1)
>> +            In fact, these will be appeared when first reading on other
>> attr
>> +            happens because it needs cpu info reading. The number of
>> generated
>> +            core attrs depends on the number of cores of the cpu
>> package.
> 
> A couple of points here:
> 
> It seems show-core is actually a boolean property. In this case you
> don't need to describe a value; you can simple measure the presence or
> absence of the property in the node rather than assigning the property 0
> or 1.
> 

Agreed. Will fix it.

> Separately, from the description it sounds like the hwmon attributes
> will appear "dynamically", i.e. after probe time. If that's not the case
> then disregard the following, but i expect this will have a tough time
> upstream. probe() should do the reads and determine the number of
> attributes required. Whilst I think you're right to document this
> behaviour, I don't think the bindings documentation is the right place
> for it
> 

You described it correctly. Actually, it tries to create core
temperature attributes when probe() is called but in case of CPU
offline, it can't create these attributes because it can't retrieve
physical core numbers information from the CPU, so the creation
will be deferred after the first reading on an another attribute
happens when the host CPU is back online. It's kind of a PECI
restriction.

I agree with you that the bindings documentation isn't the right place
to describe it. Will move it into hwmon documentation.

>> +- dimm-nums: Should contain the number of DIMM slots that attached to
>> the CPU
>> +            which is indicated by cpu-id.
>> +       0 ~ 16 (default: 16)
>> +            In case of 0, DIMM temperature attrs will not be enumerated.
>> +
>> +Example:
>> +       peci: peci@1e78b000 {
>> +               compatible = "aspeed,ast2500-peci", "simple-mfd";
>> +
>> +               peci_hwmon0: peci-hwmon-cpu0 {
>> +                       compatible = "aspeed,ast2500-peci-hwmon";
>> +                       cpu-id = <0>;
>> +                       show-core = <1>;
>> +                       dimm-nums = <16>;
>> +               };
>> +
>> +               peci_hwmon1: peci-hwmon-cpu1 {
>> +                       compatible = "aspeed,ast2500-peci-hwmon";
>> +                       cpu-id = <1>;
>> +                       show-core = <1>;
>> +                       dimm-nums = <16>;
>> +               };
>> +
>> +               peci_hwmon2: peci-hwmon-cpu2 {
>> +                       compatible = "aspeed,ast2500-peci-hwmon";
>> +                       cpu-id = <2>;
>> +                       show-core = <1>;
>> +                       dimm-nums = <16>;
>> +               };
>> +
>> +               peci_hwmon3: peci-hwmon-cpu3 {
>> +                       compatible = "aspeed,ast2500-peci-hwmon";
>> +                       cpu-id = <3>;
>> +                       show-core = <1>;
>> +                       dimm-nums = <16>;
>> +               };
>> +
>> +               peci_hwmon4: peci-hwmon-cpu4 {
>> +                       compatible = "aspeed,ast2500-peci-hwmon";
>> +                       cpu-id = <4>;
>> +                       show-core = <1>;
>> +                       dimm-nums = <16>;
>> +               };
>> +
>> +               peci_hwmon5: peci-hwmon-cpu5 {
>> +                       compatible = "aspeed,ast2500-peci-hwmon";
>> +                       cpu-id = <5>;
>> +                       show-core = <1>;
>> +                       dimm-nums = <16>;
>> +               };
>> +
>> +               peci_hwmon6: peci-hwmon-cpu6 {
>> +                       compatible = "aspeed,ast2500-peci-hwmon";
>> +                       cpu-id = <6>;
>> +                       show-core = <1>;
>> +                       dimm-nums = <16>;
>> +               };
>> +
>> +               peci_hwmon7: peci-hwmon-cpu7 {
>> +                       compatible = "aspeed,ast2500-peci-hwmon";
>> +                       cpu-id = <7>;
>> +                       show-core = <1>;
>> +                       dimm-nums = <16>;
>> +               };
>> +       };
> 
> Example is probably a little verbose. You get the same effect with
> describing just two sockets.
> 

Yes it is. I'll fix it like you said.

>> +
>> diff --git a/Documentation/hwmon/aspeed-peci-hwmon
>> b/Documentation/hwmon/aspeed-peci-hwmon
>> new file mode 100644
>> index 000000000000..2debf1353e74
>> --- /dev/null
>> +++ b/Documentation/hwmon/aspeed-peci-hwmon
>> @@ -0,0 +1,64 @@
>> +Kernel driver aspeed-peci-hwmon
>> +===============================
>> +
>> +Supported chips:
>> +       ASPEED AST2400/2500
>> +
>> +Author:
>> +       Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> +
>> +
>> +Hardware Interfaces
>> +-------------------
>> +
>> +This driver uses ASPEED PECI kernel misc driver as a controller
>> interface which
>> +can be enabled by setting CONFIG_ASPEED_PECI as yes.
>> +
>> +
>> +Description
>> +-----------
>> +
>> +This driver implements support for the ASPEED AST2400/2500 PECI hwmon.
>> +
>> +
>> +sysfs files
>> +-----------
>> +
>> +temp1_input            Provides current die temperature of the CPU
>> package.
>> +temp1_max              Provides thermal control temperature of the CPU
>> package
>> +                       which is also known as Tcontrol.
>> +temp1_crit             Provides shutdown temperature of the CPU package
>> which
>> +                       is also known as the maximum processor junction
>> +                       temperature, Tjmax or Tprochot.
>> +temp1_crit_hyst                Provides the hysteresis value from
>> Tcontrol to Tjmax of
>> +                       the CPU package.
>> +
>> +temp2_input            Provides current DTS thermal margin to Tcontrol
>> of the
>> +                       CPU package. Value 0 means it reaches to Tcontrol
>> +                       temperature. Sub-zero value means the die
>> temperature
>> +                       goes across Tconrtol to Tjmax.
>> +temp2_min              Provides the minimum DTS thermal margin to
>> Tcontrol of
>> +                       the CPU package.
>> +temp2_lcrit            Provides the value when the CPU package
>> temperature
>> +                       reaches to Tjmax.
>> +
>> +temp3_input            Provides current Tcontrol temperature of the CPU
>> +                       package which is also known as Fan Temperature
>> target.
>> +                       Indicates the relative value from thermal monitor
>> trip
>> +                       temperature at which fans should be engaged.
>> +temp3_crit             Provides Tcontrol critical value of the CPU
>> package
>> +                       which is same to Tjmax.
>> +
>> +temp4_input            Provides current Tthrottle temperature of the CPU
>> +                       package. Used for throttling temperature. If this
>> value
>> +                       is allowed and lower than Tjmax - the throttle
>> will
>> +                       occur and reported at lower than Tjmax.
>> +
>> +temp[100-127]_input    Provides current core temperature.
>> +temp[100-127]_max      Provides thermal control temperature of the core.
>> +temp[100-127]_crit     Provides shutdown temperature of the core.
>> +temp[100-127]_crit_hyst        Provides the hysteresis value from
>> Tcontrol to Tjmax of
>> +                       the core.
>> +
>> +temp[200-215]_input    Provides current temperature of the DDR DIMM.
> 
> I think you're going to struggle getting support for the discontinuities
> in the numbering.
> 

The current Skylake architecture supports up to 28 physical cores and 16
DIMM slots but it could be changed in the next or later architecture so
it is the reason why I put some numbering margin between them. Would it
be better to remove these discontinuities in the numbering?

> Cheers
> 
> Andrew
> 

Thanks a lot,

Jae

>> +
>> -- 
>> 2.15.1
>>
