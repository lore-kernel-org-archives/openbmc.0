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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40QcZg6D6HzF204
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 06:40:24 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Apr 2018 13:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,464,1517904000"; d="scan'208";a="192266805"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.150])
 ([10.7.153.150])
 by orsmga004.jf.intel.com with ESMTP; 17 Apr 2018 13:40:18 -0700
Subject: Re: [PATCH v3 07/10] Documentation: dt-bindings: Add documents for
 PECI hwmon client drivers
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Rob Herring <robh@kernel.org>
Cc: Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fengguang Wu <fengguang.wu@intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Haiyue Wang
 <haiyue.wang@linux.intel.com>, James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Joel Stanley <joel@jms.id.au>,
 Julia Cartwright <juliac@eso.teric.us>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Milton Miller II <miltonm@us.ibm.com>, Pavel Machek <pavel@ucw.cz>,
 Randy Dunlap <rdunlap@infradead.org>,
 Stef van Os <stef.van.os@prodrive-technologies.com>,
 Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-8-jae.hyun.yoo@linux.intel.com>
 <20180416181423.t4vf7sugv6z3aw5h@rob-hp-laptop>
 <aee4e04c-885f-b1d8-9e85-9e741551342f@linux.intel.com>
 <287e0fd9-b631-2602-2785-7b8aaed7a6b9@linux.intel.com>
Message-ID: <6ff697e8-cd20-e551-da13-b614cc39f900@linux.intel.com>
Date: Tue, 17 Apr 2018 13:40:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <287e0fd9-b631-2602-2785-7b8aaed7a6b9@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 17 Apr 2018 20:40:28 -0000

On 4/16/2018 4:51 PM, Jae Hyun Yoo wrote:
> On 4/16/2018 4:22 PM, Jae Hyun Yoo wrote:
>> On 4/16/2018 11:14 AM, Rob Herring wrote:
>>> On Tue, Apr 10, 2018 at 11:32:09AM -0700, Jae Hyun Yoo wrote:
>>>> This commit adds dt-bindings documents for PECI cputemp and dimmtemp 
>>>> client
>>>> drivers.
>>>

[...]

>>>> +Example:
>>>> +    peci-bus@0 {
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>> +        < more properties >
>>>> +
>>>> +        peci-dimmtemp@cpu0 {
>>>
>>> unit-address is wrong.
>>>
>>
>> Will fix it using the reg value.
>>
>>> It is a different bus from cputemp? Otherwise, you have conflicting
>>> addresses. If that's the case, probably should make it clear by showing
>>> different host adapters for each example.
>>>
>>
>> It could be the same bus with cputemp. Also, client address sharing is 
>> possible by PECI core if the functionality is different. I mean, 
>> cputemp and dimmtemp targeting the same client is possible case like 
>> this.
>> peci-cputemp@30
>> peci-dimmtemp@30
>>
> 
> Oh, I got your point. Probably, I should change these separate settings 
> into one like
> 
> peci-client@30 {
>      compatible = "intel,peci-client";
>      reg = <0x30>;
> };
> 
> Then cputemp and dimmtemp drivers could refer the same compatible 
> string. Will rewrite it.
> 

I've checked it again and realized that it should use function based 
node name like:

peci-cputemp@30
peci-dimmtemp@30

If it use the same string like 'peci-client@30', the drivers cannot be 
selectively enabled. The client address sharing way is well handled in 
PECI core and this way would be better for the future implementations of 
other PECI functional drivers such as crash dump driver and so on. So 
I'm going change the unit-address only.

Thanks,

Jae
