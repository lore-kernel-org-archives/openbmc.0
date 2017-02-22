Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSzR60T8xzDqM2
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 00:55:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vUDdpNTL"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id 2so228692ywn.3
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 05:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Myao1KQ1CcXj2DazOINyaRViF+i5MAZ7s8wo4PlxaNo=;
 b=vUDdpNTLWpIFftYTNTR+neybz8UybjwguVaygYM0P+BMak3vc4Z6DFULbJIgazsmf+
 x3azmXXHG6asdSo3hbQYEGISkKoL0Z0SWMiya/jvABLoJ+qhwlZEuF4wdfpOR28pcDBX
 5bLAomrhTSXeTQbN7dN7Uo3Vi7ecTvfCugBV/HQt4X0W41c33MHQkymCRy+88sYhN3RA
 40zb1g49zyV0AwjQbz6fb4zzU19bZNwe2AoDusk3tSMbukhwCX59FOLtOyaa4p/r77Is
 n8Q7udavp6vGWsMsQa/yrJL8pFo4KXeUVfbdEPCvsmpi79ajogzlTOvWSto2cnblenkO
 xRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Myao1KQ1CcXj2DazOINyaRViF+i5MAZ7s8wo4PlxaNo=;
 b=gpZ2MFEYo8IWO4jywg1LsV8w8htPJjtsd0WgRPGMsAdiVg0mu+GfBQfaa+lLPjXhO2
 G+adjRP1RIjWfeDpZKT/z9LFXWCUu7SEl0wpNNHqU/r0dsMiQbM/I5d2FTQi2gpd51+f
 xhJl1YHANRFXO+6El+mn5bbXMUSHmBGuz6lVagdKDAI5QgkL+9KO+ApNdQuvOa9s/gdU
 k6m5ZIaOPk2zxHUlytA8VgJHkBf4kiwqCbgraR2/kia4+DaOWIvHpmOYYMDhEUpCN4Ss
 kD+41xywRuhDmXMWguX6A5p6BqCnTPoMYCbNlT+VZmL+svg9042zdl3Ggt5+cgfJSFhA
 kPCw==
X-Gm-Message-State: AMke39kAx5b3Kzs58gj7X9XEwGgACMs3OU8cvKfmDd8EJL5kl99tlm3nkmHskwcPpqxzBmRg7gdla8cSvOLFpA==
X-Received: by 10.129.91.194 with SMTP id p185mr23828397ywb.50.1487771743470; 
 Wed, 22 Feb 2017 05:55:43 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Wed, 22 Feb 2017 05:55:23 -0800 (PST)
In-Reply-To: <CAARXrt=B9UiGqNcRxhrnetRo6fAA3mYG+acOf71sovJxXVBauQ@mail.gmail.com>
References: <20170221051259.18383-1-joel@jms.id.au>
 <CAARXrt=B9UiGqNcRxhrnetRo6fAA3mYG+acOf71sovJxXVBauQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Feb 2017 00:25:23 +1030
X-Google-Sender-Auth: bm5ZowIl2URr-Uy69R5t3-LUiWE
Message-ID: <CACPK8XdQVj=TeFFKOH0Rn8j0ykEvuEmUet1Y7RtXFOJdWRex+w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 1/2] ARM: dts: aspeed: Fix RAM size in
 Romulus and Witherspoon
To: Mine <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cyril Bur <cyrilbur@gmail.com>,
 Xo Wang <xow@google.com>
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
X-List-Received-Date: Wed, 22 Feb 2017 13:55:46 -0000

On Tue, Feb 21, 2017 at 5:30 PM, Mine <mine260309@gmail.com> wrote:
> Acked-by: Lei YU <mine260309@gmail.com>

Thanks for the ack Lei. Applied to dev-4.7.

> I think Zaius uses 512MiB RAM as well.
> Xo Wang could you help to confirm?

Zaius currently has 1GB. It may drop down to 512MB with future
revisions, but we will handle that from u-boot.

As it currently stands u-boot is updating the device tree for us so
the number we're putting in here is only used when eg. booting from
Qemu without u-boot.

Cheers,

Joel

>
> On Tue, Feb 21, 2017 at 1:12 PM, Joel Stanley <joel@jms.id.au> wrote:
>> They both contain 512M of RAM. Early bringup Witherspoons did have 1G,
>> but all machines we are using now have 512M.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 2 +-
>>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> index 85e545110be6..58baf87454e2 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> @@ -17,7 +17,7 @@
>>         };
>>
>>         memory {
>> -               reg = <0x80000000 0x40000000>;
>> +               reg = <0x80000000 0x20000000>;
>>         };
>>
>>         fsi-master {
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index 4b2d8aa8abb6..2cbdeba88908 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -17,7 +17,7 @@
>>         };
>>
>>         memory {
>> -               reg = <0x80000000 0x40000000>;
>> +               reg = <0x80000000 0x20000000>;
>>         };
>>
>>         reserved-memory {
>> --
>> 2.11.0
>>
