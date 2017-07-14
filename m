Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x8Bks0NkkzDqg2
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 22:26:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sO/tVNQ2"; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id o202so12137305itc.1
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 05:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=K3JtGKSt4TxAj21A9zOahYGumyHhuqqghhdiu8vGZMI=;
 b=sO/tVNQ2bHFiJASYCuw6kjd3UI47/PkZO9GnGt4kiD3ElSbstq/EMpHk8EaP3ywzKz
 G2sgFHqb24vy/esttMW+U3D3ryn+CF+zy2xEdXYZWAyzpoDaH1jTF/ceVNm0WFhGzeYs
 a1XDRReZxO09YzKwEwKMVGYvILlicY37I4aeoZy5sx5j5IQLlGyRfXk3eRRYgX6Gdbag
 319jRWPSAcqkGTFv8TzJwh6w5JyaC32FKwQgU3C5b/qJ78B0lQrHPJNsl40rzRqurjBK
 cLiDi/Uw1qfbfK7pIB6NI4NqFz9I3cGNa522k1VCC+5nB5+SxRjjx4xmvmGf/99RZzRY
 CSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=K3JtGKSt4TxAj21A9zOahYGumyHhuqqghhdiu8vGZMI=;
 b=nVZVBKISr+ufHvWKLfOswphvBEPV0BK4s8iMd0xg4cXXLjaquNJb0EjK9pk4kerC2l
 V2QQ2gccWerVjH1fsAefBVLAenNKQWPwYFmtNDmtH4uYZtek1pYVc7iAti5t9QntX1fo
 YM9AQ9zO205o6FZOKTiB4+w470mATa+XbjCUjPW0H+AXcLS+zm+lAmUhSt69TQsW4rdt
 0EkDAagHxj3vKBmbJEciZ82VGev5mOmdaOxfXREOoEmIEIFiVtJsHB0Ma27SKjNRgVkx
 C1OdB1jHi06AbDGUP/ZBI9z1S8IJH0oFJ7vdSFgMOgK1SdQz47UrVawfTjn3NX+zCKEq
 mDBg==
X-Gm-Message-State: AIVw1127uNYZkH2O9mo1aB4IuN5b1iiR2SjWcWsAueu4H1HLd6pleGgb
 l/xNnVAre/mbe1eFOM3MjotpWDUvDA==
X-Received: by 10.107.143.198 with SMTP id r189mr7749427iod.23.1500035199982; 
 Fri, 14 Jul 2017 05:26:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.170.160 with HTTP; Fri, 14 Jul 2017 05:26:39 -0700 (PDT)
In-Reply-To: <CACPK8XdMbJsov9o-OWHNw8RPwXSJgMuVrdouT5w8zQAne7omkQ@mail.gmail.com>
References: <1499889964-23262-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XdMbJsov9o-OWHNw8RPwXSJgMuVrdouT5w8zQAne7omkQ@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 14 Jul 2017 07:26:39 -0500
Message-ID: <CALLMt=qt-Rqwik6Ta3AvRbd5wNE3S6JTQY3hQxHiXQ0WEbUZoQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add FSI devices for Zaius
To: Joel Stanley <joel@jms.id.au>
Cc: Eddie James <eajames@linux.vnet.ibm.com>, Xo Wang <xow@google.com>, 
 "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 14 Jul 2017 12:26:45 -0000

On Wed, Jul 12, 2017 at 8:04 PM, Joel Stanley <joel@jms.id.au> wrote:
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

Verified that this with https://gerrit.openbmc-project.xyz/#/c/5258/
allowed me to get the occ thermal sensors via phosphor-hwmon.

Tested-by: Andrew Geissler <geissonator@gmail.com>
