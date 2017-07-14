Return-Path: <xow@google.com>
Received: from mail-wm0-x236.google.com (mail-wm0-x236.google.com
 [IPv6:2a00:1450:400c:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x8Sg22nM0zDqlg
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jul 2017 08:54:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iBXpZIbd"; 
 dkim-atps=neutral
Received: by mail-wm0-x236.google.com with SMTP id w126so31774555wme.0
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 15:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=yZDpi+pfkFaHafZKz8BBBY9rAa3IhB8MeIUerN6mMtA=;
 b=iBXpZIbd3Pc+WnTu9E3cA9fcqGNv1h/cfhXJl1OxX+PmH5r1erGY2T/CHv+QHj0e+J
 UbnDzM1VFgPwKpboV703z+HxdG1JUHaSuZTqZIbus+ayCkMNSjCuSpLvqOoVu+ilYpbS
 J+d25ffOHRKRC7UcPKzjkndIQ6DCL6IswugxMl9aS0E/eHmiUaXvpP+jlvBoNOxnz2Rw
 qve4Xcwia13j08MkQowVuEzPLue7rCZG3MuYpWF8UpKcmbyVLeIliflQQzjoq+H++osD
 hOiyyiM15Tns3mMXH6SOJV4WWzZGPoj3KfS/6HcwZcNaY10sg1Sn0+Dc0dY8QxDmkd28
 R47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=yZDpi+pfkFaHafZKz8BBBY9rAa3IhB8MeIUerN6mMtA=;
 b=OIikp4rU1zIszr62jDqavoL2fI57hqfhQ791aKEjzv7YQF8uWafiSthGRn2awoqluP
 oZvOzwp6ypxXJ38IdluzS3KiGYDi9HeZ3AmUX35zh36MZpf2jJmw1eO7c2YY0iW8cnMR
 06OgUR7xycGMFMT8nYTfbMYzcWMOapAwH6lM9QzZSLFpEwQ+WXOf4RNFmVrZhbLR6Er4
 7y90HEZDkEGbp34WP7GleM+F/sZ1HsOpqiimvgRFrmakoR08J9dv4NAJ6PCMT6VK1N+W
 LFcF4jrJxVkXIhD6rqIfqCr9lOhPQIZO0zYZhIr7wvnbE9pBmTp53t3p6cYYGGUC0wZ0
 DxIA==
X-Gm-Message-State: AIVw113pc+jSUZ/F57Klq3qRyiu0pmroldJl+RLN828uh8wL7y3dtt3X
 264nZMwIGbZMSnKbhmOKgcawZpqLT8Nt
X-Received: by 10.28.128.16 with SMTP id b16mr272986wmd.79.1500072859126; Fri,
 14 Jul 2017 15:54:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.87.82 with HTTP; Fri, 14 Jul 2017 15:54:18 -0700 (PDT)
In-Reply-To: <CACPK8XdMbJsov9o-OWHNw8RPwXSJgMuVrdouT5w8zQAne7omkQ@mail.gmail.com>
References: <1499889964-23262-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XdMbJsov9o-OWHNw8RPwXSJgMuVrdouT5w8zQAne7omkQ@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Fri, 14 Jul 2017 15:54:18 -0700
Message-ID: <CAPH-5w4TQnpAby2q2nFi58iCUtB9c07mHx+nOHdAN4676OtN4w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add FSI devices for Zaius
To: Joel Stanley <joel@jms.id.au>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 14 Jul 2017 22:54:23 -0000

On Wed, Jul 12, 2017 at 6:04 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Thu, Jul 13, 2017 at 5:36 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Missing label, properties, and include file.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>
> Hey Xo, can I get an ack on this?
>
> Cheers,
>
> Joel
>

Ah, missed this.

Thanks.

Acked-by: Xo Wang <xow@google.com>

>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> index c620015..750ec12 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> @@ -71,10 +71,10 @@
>>                 };
>>         };
>>
>> -       gpio-fsi {
>> +       fsi: gpio-fsi {
>>                 compatible = "fsi-master-gpio", "fsi-master";
>> -
>> -               status = "okay";
>> +               #address-cells = <2>;
>> +               #size-cells = <0>;
>>
>>                 /*
>>                  * These 2 GPIOs are set per board revision in aspeed.c.
>> @@ -96,6 +96,8 @@
>>         };
>>  };
>>
>> +#include "ibm-power9-cfam.dtsi"
>> +
>>  &fmc {
>>         status = "okay";
>>         flash@0 {
>> --
>> 1.8.3.1
>>
