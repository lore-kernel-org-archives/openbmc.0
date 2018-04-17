Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40QfTT4sHbzF1RD
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 08:06:04 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Apr 2018 15:06:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,464,1517904000"; d="scan'208";a="192288160"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.150])
 ([10.7.153.150])
 by orsmga004.jf.intel.com with ESMTP; 17 Apr 2018 15:06:02 -0700
Subject: Re: [PATCH v3 04/10] Documentations: dt-bindings: Add a document of
 PECI adapter driver for Aspeed AST24xx/25xx SoCs
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
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 Linux HWMON List <linux-hwmon@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-5-jae.hyun.yoo@linux.intel.com>
 <20180416181035.rcjvt4rlrwaj5yxf@rob-hp-laptop>
 <53ff5b2b-eba8-8311-64a9-abd4bc72226d@linux.intel.com>
 <CAL_Jsq+1wC-KhXPeCSNhCeCih6=CatJbyumO51ucD17Rt7qofw@mail.gmail.com>
 <f07623c4-5f0c-4ab1-f761-44bd702bbdf0@linux.intel.com>
Message-ID: <584aca6c-c87a-ff7a-2fdc-3c742236be60@linux.intel.com>
Date: Tue, 17 Apr 2018 15:06:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <f07623c4-5f0c-4ab1-f761-44bd702bbdf0@linux.intel.com>
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
X-List-Received-Date: Tue, 17 Apr 2018 22:06:06 -0000

On 4/17/2018 11:16 AM, Jae Hyun Yoo wrote:
> On 4/17/2018 6:16 AM, Rob Herring wrote:
>> On Mon, Apr 16, 2018 at 6:12 PM, Jae Hyun Yoo
>> <jae.hyun.yoo@linux.intel.com> wrote:
>>> On 4/16/2018 11:10 AM, Rob Herring wrote:
>>>>
>>>> On Tue, Apr 10, 2018 at 11:32:06AM -0700, Jae Hyun Yoo wrote:
>>>>>
>>>>> This commit adds a dt-bindings document of PECI adapter driver for 
>>>>> Aspeed
>>>>> AST24xx/25xx SoCs.
>>
>> [...]
>>
>>>>> +- clocks            : Should contain clock source for PECI 
>>>>> controller.
>>>>> +                     Should reference clkin.
>>>>> +- clock_frequency   : Should contain the operation frequency of PECI
>>>>> controller
>>>>> +                     in units of Hz.
>>>>> +                     187500 ~ 24000000
>>>>
>>>>
>>>> This is the frequency of the bus or used to derive it? It would be
>>>> better to specify the bus frequency instead and have the driver
>>>> calculate its internal freq. And then use "bus-frequency" instead.
>>>>
>>>
>>> I agree with you. Actually, it is being used for operation frequency 
>>> setting
>>> of PECI controller module in SoC so it's different from the meaning of
>>> "bus-frequency". I'll change it to "operation-frequency".
>>
>> No, now you've gone from a standard property name to something custom.
>> Why do you need to set the frequency in DT if it is not related to the
>> interface frequency?
>>
>> Rob
>>
> 
> Actually, the interface frequency is affected by the operation frequency
> but there is no description of its relationship in datasheet. I'll check
> again about the detail to ASPEED chip vendor and will use
> 'bus-frequency' if available.
> 

I investigated it more deeply. Basically, by the spec, PECI bus speed
cannot be set as a fixed speed. A PECI bus can have a wide speed range
from 2Kbps to 2Mbps which is dynamically set by a handshaking sequence
between an originator and clients called 'timing negotiation' in spec.
This timing negotiation behavior happens on every single transaction so 
the bus speed also can vary on every transactions. So I'm thinking a 
custom property name for it, 'peci-clk-frequency' if it is acceptable.

Thanks,

Jae
