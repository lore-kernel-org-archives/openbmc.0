Return-Path: <mine260309@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vP1nz125tzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 14:28:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XQXN2qH2"; 
 dkim-atps=neutral
Received: by mail-qk0-x242.google.com with SMTP id p22so757146qka.3
 for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2017 19:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=mMeKS3pctPEYSCkiuaz5rGFQBzqMyl8CIjO7PirTXIQ=;
 b=XQXN2qH2Nzni+wScIQCfDecdlF+5SUdz9OS8I7X76FmdT/H3M3jIygZX+bHmb5iRMS
 c3z0s6XgjoDPZIoejjfaaQu28H/1MX8mAI+ptR9y3toxFvpHoTL8I8gh5cPTBgaLDCj3
 xVa8yygAfCdxga0K//HINfBUkbTt7v7cl3NeupmA9OgqYGZpiPVcdovwuagMTEczqm/+
 OgHBjhfZp58tz46dgSPq8flRSBhF5mjY4x8p986UzCji/QboeIF+kIAkLpzVQD0Zodsf
 IjbTdBR6KvNZtw/AYAt3OxSY8skpSWQb5ZfoaqxrD44zfJv9xJYhbd5BGPfwp50jKzVz
 H52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=mMeKS3pctPEYSCkiuaz5rGFQBzqMyl8CIjO7PirTXIQ=;
 b=SBXunzhGPzScWd0g/eG/EFdbRigrXIqDfL0ZqU/SMSsu/Pm3A4xpyL1zMILwe2WMYJ
 pT9Woxlo0139Us8YQJ8NvpL3qU2yR4i/LkrXKSDz+JhI5tecdQh3ZJPqPbp56jSbWN4v
 /1rlKRkeCN+oiRA9Y9D13Ii78biVZKIcCKKcldvPxROZkCN+BGO/DMIg+LOmhAkPEznt
 t5sMjSDapfuHRHedx014ObPY3ysJ3RfomBdRqjOF9r34s9+YIOIuE+EvRHuomJpJTwX1
 7JV3hr7me9tscLEMDDHG1lwWfV9bveNlbDucyLdApQtNTAegykkDs0dM4qN9yzSLVGzP
 mMwQ==
X-Gm-Message-State: AMke39nZV1IvONFg7dpWI0F319Em7RTIAKPpJzAiov/6Hbq+IQEL5veDeOc8aA5BEQW6vgSRvzMyFQ9rz2Yp/w==
X-Received: by 10.55.220.199 with SMTP id v190mr98898qki.42.1487215700430;
 Wed, 15 Feb 2017 19:28:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.122 with HTTP; Wed, 15 Feb 2017 19:28:20 -0800 (PST)
In-Reply-To: <1487208079.3661.32.camel@aj.id.au>
References: <1487057409-19872-1-git-send-email-mine260309@gmail.com>
 <1487208079.3661.32.camel@aj.id.au>
From: Mine <mine260309@gmail.com>
Date: Thu, 16 Feb 2017 11:28:20 +0800
Message-ID: <CAARXrtmEEajwOp4p6bNE4Qummj_M9nxP7R-UOmNXSQKA2UCv_w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 2/3] ARM: dts: aspeed: romulus: Add
 fsi-master GPIO bindings
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Feb 2017 03:28:23 -0000

Hi Andrew,

On Thu, Feb 16, 2017 at 9:21 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Lei,
>
> On Tue, 2017-02-14 at 15:30 +0800, Lei YU wrote:
>> Define the pins used on Romulus by the FSI GPIO master.
>>
>> > Signed-off-by: Lei YU <mine260309@gmail.com>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> index f47eb63..bc13ad9 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> @@ -1,7 +1,7 @@
>>  /dts-v1/;
>>
>>  #include "aspeed-g5.dtsi"
>> -#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>>
>>  / {
>> >     model = "Romulus BMC";
>> @@ -31,6 +31,17 @@
>> >             };
>> >     };
>>
>> > +   fsi-master {
>> > +           compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
>> +
>> > +           status = "disabled";
>> +
>> +             clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
>
> This looks okay
>
>> +             data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
>
> According to my Romulus datasheet, FSI_SOFT_DAT is GPIOE0 and GPIOAA2
> doesn't appear to be connected. Am I looking at an out-of-date
> datasheet? Did something change here?

Romulus FSI_SOFT_DAT is always GPIOAA2 (from GPIO Romulus 20161102.xls
to GPIO Romulus 20170112.xls, and I confirm that FSI is working with
this config.
Maybe you were referring Witherspoon's GPIO, where FSI_SOFT_DAT is GPIOE0?

>
>> +             mux-gpios = <&gpio ASPEED_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
>> > +           enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
>> +             trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
>
> These three also look okay to me.
>
> Andrew
>
>> +     };
>>  };
>>
>>  &fmc {
