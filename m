Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS9MX5T0NzDqBV
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 17:19:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="C2wf2pqp"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id l16so9130393ywb.2
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 22:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=mBEzReo0BlnAearXknbRFFaYELZyCAc3uhzMqCAAXXI=;
 b=C2wf2pqpcTghJtX3xBI/YK3lm9dRJzTwSOiu5JUuWQtQnesy2hQIBPO/zwb2e3ZXEL
 xuhzRX8/A5vjvUfzjhjEV/jHmFBJcZbaqOxDEM1P5P87UTn6oysGyyFxGXSmNOSrca3+
 sKIoMySmueJRnZgbtJ1iDhT+uS0uPgmuvsF4XysBpe3VU6gRDBti+VSdMAioMiwHb4PD
 d2Fl97uhk15Bp57pHQiuNIvDjc9eW/wdNnXKvXpYooy7eD2gpdq+BTyYJFkQBBbAThpZ
 lCFuW4T6MgI+Ws55htgnCGCFxIJW4bktL5zzc4LYARrMkhw6B/r3jbfopWvCiZOTmiY7
 Wc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=mBEzReo0BlnAearXknbRFFaYELZyCAc3uhzMqCAAXXI=;
 b=KGABipWkO3+jXkHoGKZ1aorTYyX05s3sAMo/sgBCmbz4xUgCxuMaPIagyyNJnVZjvA
 x7UqzcUegqxeLuE97fGTqdMWvrWQ8UJ9tVedCJXR7867Aa+DCauKDD9A20WfiKRc0oSr
 Ws4hLvt5Zsg/uWuCufKGAOuDWfTfuPQ+/tC2VLo3+IU8OikYnUliUrTb9arvtdeoBWTu
 YF2U2A+lOKR9eJ3n6H095lVixNWIFNNcmVLR5ZZ0S2yauvinOfgI0oeQe1bqEYnkMJ9Z
 EW9LVK4yUA3tfQuGg5gln/HuaEQt+XmDUd/t0e5aKB14ShUoxnmYVLJ+5muDaN5DhH2G
 dcSA==
X-Gm-Message-State: AMke39kJo8R2BwYTtEphY8poEOItnuPIrIr3IEriJbMomydwd/5jtiZapC5sH+QHKhLjeGEl9aQdMqfym1in8A==
X-Received: by 10.129.118.82 with SMTP id j18mr18746174ywk.10.1487657990352;
 Mon, 20 Feb 2017 22:19:50 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Mon, 20 Feb 2017 22:19:29 -0800 (PST)
In-Reply-To: <CACPK8XfNP560Koh=TCCEu7rWkFU0pFuBBN7J2bB3-0PYo2atyg@mail.gmail.com>
References: <20170214005104.11940-1-andrew@aj.id.au>
 <20170214005104.11940-2-andrew@aj.id.au>
 <CACPK8XfNP560Koh=TCCEu7rWkFU0pFuBBN7J2bB3-0PYo2atyg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Feb 2017 16:49:29 +1030
X-Google-Sender-Auth: X1YDlp77N0HSS9ja9lQntAWmHvE
Message-ID: <CACPK8XePTmdNj8cUQvUpH_HywzaozbDOX_AUZebStj6vCOYwHg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2 1/3] ARM: dts: aspeed-g5: Add SoC Display
 Controller node
To: Andrew Jeffery <andrew@aj.id.au>, Xo Wang <xow@google.com>,
 Lei YU <mine260309@gmail.com>, Matthew Conolly <mattconolly@fb.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, Rick Altherr <raltherr@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 21 Feb 2017 06:19:53 -0000

On Fri, Feb 17, 2017 at 1:59 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Tue, Feb 14, 2017 at 11:21 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> (cherry picked from commit daf042580a0dacd894a3825dd6f048364fd66770)
>> [AJ: Reworked to disable GFX in the dtsi, as it is missing from the 2520]
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> Acked-by: Joel Stanley <joel@jms.id.au>
>
> Xo, can we get your ack for the Zaius change.
>
> Lei, please review for Romulus.
>
> Matthew, please review for the Facebook board.

There was no objection so I've gone ahead and merged this patch to dev-4.7.

Cheers,

Joel

>
>> ---
>>  arch/arm/boot/dts/aspeed-ast2500-evb.dts         | 4 ++++
>>  arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts    | 4 ++++
>>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 4 ++++
>>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
>>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 4 ++++
>>  arch/arm/boot/dts/aspeed-g5.dtsi                 | 9 +++++++++
>>  6 files changed, 29 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> index 9d88f3aadbc6..1999a06eec80 100644
>> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> @@ -79,3 +79,7 @@
>>                 reg = <0x4d>;
>>         };
>>  };
>> +
>> +&gfx {
>> +       status = "okay";
>> +};
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
>> index e6d61c3abd80..9e48c4a1313c 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
>> @@ -198,3 +198,7 @@
>>         status = "okay";
>>         /* CPLD at reg = <3E> */
>>  };
>> +
>> +&gfx {
>> +       status = "okay";
>> +};
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> index c23627ec5e84..947cfeb02457 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> @@ -155,3 +155,7 @@
>>  &vuart {
>>         status = "okay";
>>  };
>> +
>> +&gfx {
>> +       status = "okay";
>> +};
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index 4b2d8aa8abb6..76b738dd0c6b 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -273,3 +273,7 @@
>>  &vuart {
>>         status = "okay";
>>  };
>> +
>> +&gfx {
>> +       status = "okay";
>> +};
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> index e1c9b3f4fe44..e22701bfe5fc 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> @@ -343,3 +343,7 @@
>>  &vuart {
>>         status = "okay";
>>  };
>> +
>> +&gfx {
>> +       status = "okay";
>> +};
>> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
>> index e1994c9e38c3..b73503c866aa 100644
>> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
>> @@ -1005,6 +1005,15 @@
>>                                 reg = <0x1e6e202c 0x4>;
>>                         };
>>
>> +                       gfx: display@1e6e6000 {
>> +                               compatible = "aspeed,ast2500-gfx", "syscon";
>> +                               reg = <0x1e6e6000 0x1000>;
>> +                               reg-io-width = <4>;
>> +
>> +                               /* AST2520 doesn't have GFX, so disable */
>> +                               status = "disabled";
>> +                       };
>> +
>>                         sram@1e720000 {
>>                                 compatible = "mmio-sram";
>>                                 reg = <0x1e720000 0x9000>;      // 36K
>> --
>> 2.9.3
>>
