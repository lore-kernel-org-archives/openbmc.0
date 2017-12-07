Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yt8mx1JNzzDsPs
 for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2017 09:10:24 +1100 (AEDT)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Dec 2017 14:10:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,374,1508828400"; d="scan'208";a="14083807"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by orsmga001.jf.intel.com with ESMTP; 07 Dec 2017 14:10:21 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH 5/6] ARM: dts: aspeed: peci-hwmon: Add Aspeed PECI hwmon
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20171206210323.7185-1-jae.hyun.yoo@linux.intel.com>
 <1512607468.2810029.1196681760.040FD30F@webmail.messagingengine.com>
Message-ID: <cb8e0fa4-82fa-e2b4-86f2-2a098515e37e@linux.intel.com>
Date: Thu, 7 Dec 2017 14:10:21 -0800
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1512607468.2810029.1196681760.040FD30F@webmail.messagingengine.com>
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
X-List-Received-Date: Thu, 07 Dec 2017 22:10:26 -0000


On 12/6/2017 4:44 PM, Andrew Jeffery wrote:
> 
> 
> On Thu, 7 Dec 2017, at 07:33, Jae Hyun Yoo wrote:
>> This commit adds Aspeed PECI hwmon node into aspeed-g4 and
>> aspeed-g5.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>>   arch/arm/boot/dts/aspeed-g4.dtsi | 64
>>   ++++++++++++++++++++++++++++++++++++++++
>>   arch/arm/boot/dts/aspeed-g5.dtsi | 64
>>   ++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 128 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi
>> b/arch/arm/boot/dts/aspeed-g4.dtsi
>> index d45f6b67fecc..f9904c2ee5d9 100644
>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> @@ -250,6 +250,70 @@
>>   				clk-div = <0>;
>>   				cmd-timeout-ms = <1000>;
>>   				status = "disabled";
>> +
>> +                               peci_hwmon0: peci-hwmon-cpu0 {
>> +                                       compatible =
>> "aspeed,ast2400-peci-hwmon";
>> +                                       cpu-id = <0>;
>> +                                       show-core = <1>;
>> +                                       dimm-nums = <16>;
>> +                                       status = "disabled";
>> +                               };
>> +
>> +                               peci_hwmon1: peci-hwmon-cpu1 {
> 
> I feel like this is all better left to the platform dts rather than
> describing then disabling host topology in the SoC dtsi. This applies to
> the g5 dtsi as well.
> 
> Cheers,
> 
> Andrew
> 

Agreed. It is already described in a documentation as an example. I'll
remove these default disabled settings from g4 and g5 so that each
platform can selectively enable these.

Thanks,

Jae

>> +                                       compatible =
>> "aspeed,ast2400-peci-hwmon";
>> +                                       cpu-id = <1>;
>> +                                       show-core = <1>;
>> +                                       dimm-nums = <16>;
>> +                                       status = "disabled";
>> +                               };
>> +
>> +                               peci_hwmon2: peci-hwmon-cpu2 {
>> +                                       compatible =
>> "aspeed,ast2400-peci-hwmon";
>> +                                       cpu-id = <2>;
>> +                                       show-core = <1>;
>> +                                       dimm-nums = <16>;
>> +                                       status = "disabled";
>> +                               };
>> +
>> +                               peci_hwmon3: peci-hwmon-cpu3 {
>> +                                       compatible =
>> "aspeed,ast2400-peci-hwmon";
>> +                                       cpu-id = <3>;
>> +                                       show-core = <1>;
>> +                                       dimm-nums = <16>;
>> +                                       status = "disabled";
>> +                               };
>> +
>> +                               peci_hwmon4: peci-hwmon-cpu4 {
>> +                                       compatible =
>> "aspeed,ast2400-peci-hwmon";
>> +                                       cpu-id = <4>;
>> +                                       show-core = <1>;
>> +                                       dimm-nums = <16>;
>> +                                       status = "disabled";
>> +                               };
>> +
>> +                               peci_hwmon5: peci-hwmon-cpu5 {
>> +                                       compatible =
>> "aspeed,ast2400-peci-hwmon";
>> +                                       cpu-id = <5>;
>> +                                       show-core = <1>;
>> +                                       dimm-nums = <16>;
>> +                                       status = "disabled";
>> +                               };
>> +
>> +                               peci_hwmon6: peci-hwmon-cpu6 {
>> +                                       compatible =
>> "aspeed,ast2400-peci-hwmon";
>> +                                       cpu-id = <6>;
>> +                                       show-core = <1>;
>> +                                       dimm-nums = <16>;
>> +                                       status = "disabled";
>> +                               };
>> +
>> +                               peci_hwmon7: peci-hwmon-cpu7 {
>> +                                       compatible =
>> "aspeed,ast2400-peci-hwmon";
>> +                                       cpu-id = <7>;
>> +                                       show-core = <1>;
>> +                                       dimm-nums = <16>;
>> +                                       status = "disabled";
>> +                               };
>>   			};
>>   
>>   			timer: timer@1e782000 {
>> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi
>> b/arch/arm/boot/dts/aspeed-g5.dtsi
>> index c75998ef759c..749ed252f71e 100644
>> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
>> @@ -301,6 +301,70 @@
>>   				clk-div = <0>;
>>   				cmd-timeout-ms = <1000>;
>>   				status = "disabled";
>> +
>> +                               peci_hwmon0: peci-hwmon-cpu0 {
>> +                                       compatible =
>> "aspeed,ast2500-peci-hwmon";
>> +                                       cpu-id = <0>;
>> +                                       show-core = <1>;
>> +                                       dimm-nums = <16>;
>> +                                       status = "disabled";
>> +                               };
>> +
>> +                               peci_hwmon1: peci-hwmon-cpu1 {
>> +                                       compatible =
>> "aspeed,ast2500-peci-hwmon";
>> +                                       cpu-id = <1>;
>> +                                       show-core = <1>;
>> +                                       dimm-nums = <16>;
>> +                                       status = "disabled";
>> +                               };
>> +
>> +                               peci_hwmon2: peci-hwmon-cpu2 {
>> +                                       compatible =
>> "aspeed,ast2500-peci-hwmon";
>> +                                       cpu-id = <2>;
>> +                                       show-core = <1>;
>> +                                       dimm-nums = <16>;
>> +                                       status = "disabled";
>> +                               };
>> +
>> +                               peci_hwmon3: peci-hwmon-cpu3 {
>> +                                       compatible =
>> "aspeed,ast2500-peci-hwmon";
>> +                                       cpu-id = <3>;
>> +                                       show-core = <1>;
>> +                                       dimm-nums = <16>;
>> +                                       status = "disabled";
>> +                               };
>> +
>> +                               peci_hwmon4: peci-hwmon-cpu4 {
>> +                                       compatible =
>> "aspeed,ast2500-peci-hwmon";
>> +                                       cpu-id = <4>;
>> +                                       show-core = <1>;
>> +                                       dimm-nums = <16>;
>> +                                       status = "disabled";
>> +                               };
>> +
>> +                               peci_hwmon5: peci-hwmon-cpu5 {
>> +                                       compatible =
>> "aspeed,ast2500-peci-hwmon";
>> +                                       cpu-id = <5>;
>> +                                       show-core = <1>;
>> +                                       dimm-nums = <16>;
>> +                                       status = "disabled";
>> +                               };
>> +
>> +                               peci_hwmon6: peci-hwmon-cpu6 {
>> +                                       compatible =
>> "aspeed,ast2500-peci-hwmon";
>> +                                       cpu-id = <6>;
>> +                                       show-core = <1>;
>> +                                       dimm-nums = <16>;
>> +                                       status = "disabled";
>> +                               };
>> +
>> +                               peci_hwmon7: peci-hwmon-cpu7 {
>> +                                       compatible =
>> "aspeed,ast2500-peci-hwmon";
>> +                                       cpu-id = <7>;
>> +                                       show-core = <1>;
>> +                                       dimm-nums = <16>;
>> +                                       status = "disabled";
>> +                               };
>>   			};
>>   
>>   			timer: timer@1e782000 {
>> -- 
>> 2.15.1
>>
