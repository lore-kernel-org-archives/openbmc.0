Return-Path: <robh@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=robh@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40R4NF61QjzF1vZ
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 00:33:01 +1000 (AEST)
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
 [209.85.216.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B9D92184B
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 14:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B9D92184B
Authentication-Results: mail.kernel.org;
 dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=robh@kernel.org
Received: by mail-qt0-f178.google.com with SMTP id p9-v6so2005550qtn.0
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 07:32:58 -0700 (PDT)
X-Gm-Message-State: ALQs6tC795j7X7PG6zF88JSlPhN03/Y6rwSWcoDRim+upfNlN/evsOrW
 Ciq5fTgbxDHJfAhbkfat8uRS+Ou0luOThCmmOg==
X-Google-Smtp-Source: AB8JxZofHBqyvBHb2njxYwn38G/wCrguuoEyYSf05I4g6jrYD//8Mkq4eM0egP2d49kLP2ZCltC5ozZ8F/fFhVkzGGY=
X-Received: by 2002:aed:26c3:: with SMTP id
 q61-v6mr2526486qtd.60.1524061977109; 
 Wed, 18 Apr 2018 07:32:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.228 with HTTP; Wed, 18 Apr 2018 07:32:36 -0700 (PDT)
In-Reply-To: <6ff697e8-cd20-e551-da13-b614cc39f900@linux.intel.com>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-8-jae.hyun.yoo@linux.intel.com>
 <20180416181423.t4vf7sugv6z3aw5h@rob-hp-laptop>
 <aee4e04c-885f-b1d8-9e85-9e741551342f@linux.intel.com>
 <287e0fd9-b631-2602-2785-7b8aaed7a6b9@linux.intel.com>
 <6ff697e8-cd20-e551-da13-b614cc39f900@linux.intel.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Apr 2018 09:32:36 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLcxEnCOywTtU14G4=6A5m6G=KH3oi8m1VxKSEdxuv-ww@mail.gmail.com>
Message-ID: <CAL_JsqLcxEnCOywTtU14G4=6A5m6G=KH3oi8m1VxKSEdxuv-ww@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] Documentation: dt-bindings: Add documents for
 PECI hwmon client drivers
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Andrew Lunn <andrew@lunn.ch>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fengguang Wu <fengguang.wu@intel.com>, 
 Greg KH <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Haiyue Wang <haiyue.wang@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>, 
 Jason M Biils <jason.m.bills@linux.intel.com>, Jean Delvare <jdelvare@suse.com>,
 Joel Stanley <joel@jms.id.au>, Julia Cartwright <juliac@eso.teric.us>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Milton Miller II <miltonm@us.ibm.com>, 
 Pavel Machek <pavel@ucw.cz>, Randy Dunlap <rdunlap@infradead.org>, 
 Stef van Os <stef.van.os@prodrive-technologies.com>, 
 Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, 
 devicetree@vger.kernel.org, Linux HWMON List <linux-hwmon@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 18 Apr 2018 14:33:02 -0000

On Tue, Apr 17, 2018 at 3:40 PM, Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
> On 4/16/2018 4:51 PM, Jae Hyun Yoo wrote:
>>
>> On 4/16/2018 4:22 PM, Jae Hyun Yoo wrote:
>>>
>>> On 4/16/2018 11:14 AM, Rob Herring wrote:
>>>>
>>>> On Tue, Apr 10, 2018 at 11:32:09AM -0700, Jae Hyun Yoo wrote:
>>>>>
>>>>> This commit adds dt-bindings documents for PECI cputemp and dimmtemp
>>>>> client
>>>>> drivers.
>>>>
>>>>
>
> [...]
>
>>>>> +Example:
>>>>> +    peci-bus@0 {
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <0>;
>>>>> +        < more properties >
>>>>> +
>>>>> +        peci-dimmtemp@cpu0 {
>>>>
>>>>
>>>> unit-address is wrong.
>>>>
>>>
>>> Will fix it using the reg value.
>>>
>>>> It is a different bus from cputemp? Otherwise, you have conflicting
>>>> addresses. If that's the case, probably should make it clear by showing
>>>> different host adapters for each example.
>>>>
>>>
>>> It could be the same bus with cputemp. Also, client address sharing is
>>> possible by PECI core if the functionality is different. I mean, cputemp and
>>> dimmtemp targeting the same client is possible case like this.
>>> peci-cputemp@30
>>> peci-dimmtemp@30
>>>
>>
>> Oh, I got your point. Probably, I should change these separate settings
>> into one like
>>
>> peci-client@30 {
>>      compatible = "intel,peci-client";
>>      reg = <0x30>;
>> };
>>
>> Then cputemp and dimmtemp drivers could refer the same compatible string.
>> Will rewrite it.
>>
>
> I've checked it again and realized that it should use function based node
> name like:
>
> peci-cputemp@30
> peci-dimmtemp@30
>
> If it use the same string like 'peci-client@30', the drivers cannot be
> selectively enabled. The client address sharing way is well handled in PECI
> core and this way would be better for the future implementations of other
> PECI functional drivers such as crash dump driver and so on. So I'm going
> change the unit-address only.

2 nodes at the same address is wrong (and soon dtc will warn you on
this). You have 2 potential options. The first is you need additional
address information in the DT if these are in fact 2 independent
devices. This could be something like a function number to use
something from PCI addressing. From what I found on PECI, it doesn't
seem to have anything like that. The 2nd option is you have a single
DT node which registers multiple hwmon devices. DT nodes and drivers
don't have to be 1-1. Don't design your DT nodes from how you want to
partition drivers in some OS.

Rob
