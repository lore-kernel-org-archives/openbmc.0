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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40QQlJ67PlzDrDT
 for <openbmc@lists.ozlabs.org>; Tue, 17 Apr 2018 23:17:15 +1000 (AEST)
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
 [209.85.216.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D737A2184D
 for <openbmc@lists.ozlabs.org>; Tue, 17 Apr 2018 13:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D737A2184D
Authentication-Results: mail.kernel.org;
 dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=robh@kernel.org
Received: by mail-qt0-f182.google.com with SMTP id l11so9683995qtj.10
 for <openbmc@lists.ozlabs.org>; Tue, 17 Apr 2018 06:17:13 -0700 (PDT)
X-Gm-Message-State: ALQs6tAEA8tfZiPXFAg1g5ONSMJyg4beFKb34Z5Z8VbJTsQt03KQQBP7
 wrsb0Z+ckQKoNMqCVDGRY8FZgh91UiYUvx7v4Q==
X-Google-Smtp-Source: AIpwx4802ncWWEWk0pJFFsJpjoTSZiUW0j3gsDUlj2tpHMj0vxmkfyQVbhsjL9XI5daoDWXmFS0uHePb+CjLbsHbOoI=
X-Received: by 10.200.67.210 with SMTP id w18mr2402978qtn.327.1523971032932;
 Tue, 17 Apr 2018 06:17:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.228 with HTTP; Tue, 17 Apr 2018 06:16:52 -0700 (PDT)
In-Reply-To: <53ff5b2b-eba8-8311-64a9-abd4bc72226d@linux.intel.com>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-5-jae.hyun.yoo@linux.intel.com>
 <20180416181035.rcjvt4rlrwaj5yxf@rob-hp-laptop>
 <53ff5b2b-eba8-8311-64a9-abd4bc72226d@linux.intel.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 17 Apr 2018 08:16:52 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+1wC-KhXPeCSNhCeCih6=CatJbyumO51ucD17Rt7qofw@mail.gmail.com>
Message-ID: <CAL_Jsq+1wC-KhXPeCSNhCeCih6=CatJbyumO51ucD17Rt7qofw@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] Documentations: dt-bindings: Add a document of
 PECI adapter driver for Aspeed AST24xx/25xx SoCs
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
X-List-Received-Date: Tue, 17 Apr 2018 13:17:17 -0000

On Mon, Apr 16, 2018 at 6:12 PM, Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
> On 4/16/2018 11:10 AM, Rob Herring wrote:
>>
>> On Tue, Apr 10, 2018 at 11:32:06AM -0700, Jae Hyun Yoo wrote:
>>>
>>> This commit adds a dt-bindings document of PECI adapter driver for Aspeed
>>> AST24xx/25xx SoCs.

[...]

>>> +- clocks            : Should contain clock source for PECI controller.
>>> +                     Should reference clkin.
>>> +- clock_frequency   : Should contain the operation frequency of PECI
>>> controller
>>> +                     in units of Hz.
>>> +                     187500 ~ 24000000
>>
>>
>> This is the frequency of the bus or used to derive it? It would be
>> better to specify the bus frequency instead and have the driver
>> calculate its internal freq. And then use "bus-frequency" instead.
>>
>
> I agree with you. Actually, it is being used for operation frequency setting
> of PECI controller module in SoC so it's different from the meaning of
> "bus-frequency". I'll change it to "operation-frequency".

No, now you've gone from a standard property name to something custom.
Why do you need to set the frequency in DT if it is not related to the
interface frequency?

Rob
