Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::241; helo=mail-qk0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KSHYlLro"; 
 dkim-atps=neutral
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zZZxx39n1zF0sN
 for <openbmc@lists.ozlabs.org>; Mon,  5 Feb 2018 15:54:29 +1100 (AEDT)
Received: by mail-qk0-x241.google.com with SMTP id d18so31085877qke.7
 for <openbmc@lists.ozlabs.org>; Sun, 04 Feb 2018 20:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to; bh=LuGu0B46CYS9Ij8pOsBHCirZkqnr4VPDSL2XnRGHy1Y=;
 b=KSHYlLro9R0w3K2hfPEbKnDfuVOF1uK0QRWHXXGHOk0pD0+aPa5tkJefHvZ/jf9yDw
 iry7JEBY3zFp0nfG+3ETx2Lc4bfBhK0rfsl1fKKadFLy7hudebeUasvuoiIlFqPgcoue
 Q3tilElAjFkfVCf6fahdsc0n0a1YDdqghBaAhNZg+PtdFYfZff/C9FMA/tJ0qXHwprM1
 LC7jgq/2viciq1rB7PzPxApRhQNHwIFv7IT28tZrX8jgYjk+NuoaCCBZC1+q71kEW3ip
 HCm66r/ieYeh5kCsfurkMp0F3EX2ZWEK7LRgn4rrOT8Mcc5r8DoO6mIL71Cr4FBylqCw
 tA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to;
 bh=LuGu0B46CYS9Ij8pOsBHCirZkqnr4VPDSL2XnRGHy1Y=;
 b=mCKKQf8499j0LnTCl+TtDudry06hsyCVn+8t6GtnMUj2OOUoawrdqs2XAUGBcoZ8Pn
 jTeqhMJrCQiprBVjvLXNY7QHg8zIOvaibGSSI70TGnd7AAngwCdsbpSGrQEbZy4Uty/n
 3wR8ib+30pMODvqFl4aQBaLEGs6XdcbojZXZT9yCDW0UlP2FJCAx460kZnLdQB4Iy81u
 TLGAB7n/zP2DE2qhceTHwjUgJt3u2OYcavCNjjrkO58AUFJonBtGhqKkE8su2S9BlkBS
 ZgI1QaN5RWaGIIUsf3G27DTtEoQP4U064mvy3vmynwUxFM+1f9ukbzKnaMDuHgqmlAy8
 2XPg==
X-Gm-Message-State: AKwxytePmK/RP3UVoLFCsSeT2sXhX2MFGALjWhLiE6ipf7iI/Dsste1j
 u4qpqgAxMaThKH98dPfeTZoUwoW1OSG/26lhY/+CMjwH
X-Google-Smtp-Source: AH8x226iLwqEC3+IO8ssnndT0mqP8j+954rx2NoVIFjyP0wSoo5C85E3HT31W35UUnkGxPbzWOn8z14o1ytXH/ShcOQ=
X-Received: by 10.55.95.198 with SMTP id t189mr68690091qkb.273.1517806466690; 
 Sun, 04 Feb 2018 20:54:26 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.49.157 with HTTP; Sun, 4 Feb 2018 20:54:06 -0800 (PST)
In-Reply-To: <CACPK8XfOsJMfF0_PXMRgxsb_BSz8pK91k661iyTiA2f=jd6=hw@mail.gmail.com>
References: <20180131023947.24832-1-joel@jms.id.au>
 <20180131023947.24832-2-joel@jms.id.au>
 <CACPK8XfOsJMfF0_PXMRgxsb_BSz8pK91k661iyTiA2f=jd6=hw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Feb 2018 15:24:06 +1030
X-Google-Sender-Auth: wNbm00r6xHbAVkjxeQUfWIjqoPQ
Message-ID: <CACPK8XfUex6YjXm-Evhi16k03Q7jka2RDMZsD_pzQVeoEXpkLw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: aspeed: Add IPMI BT node
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Feb 2018 04:54:30 -0000

On Wed, Jan 31, 2018 at 1:24 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Wed, Jan 31, 2018 at 1:09 PM, Joel Stanley <joel@jms.id.au> wrote:
>> The IPMI BT device part of the LPC interface and is used for
>> communication with the host processor.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>> v2:
>>  Fix bt reg node. It should be an offset from the lpc_host address,
>>  not the actual address of the iBT
>>
>>  arch/arm/boot/dts/aspeed-g4.dtsi | 7 +++++++
>>  arch/arm/boot/dts/aspeed-g5.dtsi | 7 +++++++
>>  2 files changed, 14 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
>> index e6f4047142a8..7e0da0b8cd12 100644
>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> @@ -246,6 +246,13 @@
>>                                                 reg = <0x20 0x24 0x48 0x8>;
>>                                         };
>>
>> +                                       ibt: ibt@140 {
>> +                                               compatible = "aspeed,ast2400-ibt-bmc";
>> +                                               reg = <0xc0 0x18>;
>> +                                               interrupts = <8>;
>> +                                               status = "disabled";
>> +                                       };
>> +
>>                                         mbox: mbox@180 {
>>                                                 compatible = "aspeed,ast2400-mbox";
>>                                                 reg = <0x180 0x5c>;
>> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
>> index b7b42c7c89e1..f1b2fa204873 100644
>> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
>> @@ -299,6 +299,13 @@
>>                                                 reg = <0x20 0x24 0x48 0x8>;
>>                                         };
>>
>> +                                       ibt: ibt@140 {
>
> I forgot to update the node name.

Andrew did an over the shoulder review of this patch. He said that
with the node name fixed:


Acked-by: Andrew Jeffery <andrew@aj.id.au>
