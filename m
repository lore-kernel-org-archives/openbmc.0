Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td4vt5TkzzDvk4
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 14:30:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="wIsZ/cw4"; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id 20so10650017uak.0
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 19:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=cyWC/avPDSouy/kbQWGPRHwoIOUZwYsPbwVgIMCIZ9I=;
 b=wIsZ/cw4yXJfsqNXhLSmDw+KGHvFttEZo7yzquEI2YDM5UelaJ23UZyAG1AHYoi1FG
 qpQLTVKW+xScNPgZyPeY5v3cIHCnu2USb+sQSEa81ZEKlQUyKMHdpSd0ADMlocsSwuKt
 d4C+kfQ9vliU+H6+S+JTBQz9niJv1tcWU4Db32Owkq6PtUkYsA68G+FjfFCSBLSa9iqa
 t+4euynLblBdPtsdesZfmjD+9Fz42thhIncURcAVg8BC9FKd7zWEJAs1IaRLL3tHrYhT
 VQPwEh8o/OgbJetU1VmokGWxRSg5KeaB0yCNHikNoJ4d0WpqKYBw08drpQst0zzAnNeP
 DXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=cyWC/avPDSouy/kbQWGPRHwoIOUZwYsPbwVgIMCIZ9I=;
 b=D8V+/K2/EXPmv8UdN4RkhqjPgCsphgRhc06KZlFU4r4ILg0oN0Cqe7kBiYRHzvxWtl
 E32OWbsjhXgzv2kv3yo4XsVLiHK9ZaC6+36fPlmDptKhsupBfaenFtIWvywzwjxzEr7Q
 BDpPqDVHoBMmwtuHqNtDjiOPggJFn1pzG/BCoZok5OCOJFgAnMWFahxH6S2SXfxSEosa
 LcfmqCZTPjusk5gstFZ2KOiBaJ0C9kIEj+0EtB75LKxgNsWeLC7nAKDPOhu6c+j8iPw8
 rqPVvtu314gaZ+m4cUUvPpT/yH9x/v1/zQFi5Og+Ez7m8KVhywX2yMnYxLVYIB1rvwdq
 nfFw==
X-Gm-Message-State: AKaTC01jFInJLZrVYszsRuJDRLQlBqWBsY6TpPUMGHSPeFj1H3978WhEjQ/iMcbX0iqS6m+Z1A/yUqS0wrmvaA==
X-Received: by 10.176.82.181 with SMTP id v50mr66294492uav.31.1481599800113;
 Mon, 12 Dec 2016 19:30:00 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Mon, 12 Dec 2016 19:29:39 -0800 (PST)
In-Reply-To: <1481598705.10426.3.camel@gmail.com>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
 <20161209054323.7320-2-cyrilbur@gmail.com>
 <CACPK8Xc11u=ym0LrRGdN5YrzAiN0Knz68b4q9SdXPVn7+vOBtA@mail.gmail.com>
 <1481598705.10426.3.camel@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Dec 2016 14:29:39 +1100
X-Google-Sender-Auth: BshM8YT-3_PeWug2jtkJPdMyRLA
Message-ID: <CACPK8XfoPV51WMHiXgFJ6gCyZDr5s+FGP3uDgKxvF6phimafyg@mail.gmail.com>
Subject: Re: [PATCH linux 1/3] ARM: dts: aspeed: Update palmetto device tree
To: Cyril Bur <cyrilbur@gmail.com>
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
X-List-Received-Date: Tue, 13 Dec 2016 03:30:03 -0000

On Tue, Dec 13, 2016 at 2:11 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
>> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> > @@ -17,7 +17,30 @@
>> >         };
>> >
>> >         memory {
>> > -               reg = <0x40000000 0x10000000>;
>> > +               reg = <0x40000000 0x20000000>;
>> > +       };
>>
>> Can you send this in a separate patch? It should go into the tree
>> now.
>>
>
> Yep, should I send just for palmetto?
>
> Do you have a list of other platforms? I figure all the ast2400 based
> aspeed-bmc-opp-* should get this change, should I include them all in
> one patch or all individually?

One patch will do. I checked all of the machines and they all have
512MB (minus bits that I assume are reserved for framebuffers, etc.):

Barreleye: 499020 kB
Palmetto: 424204 kB
Firestone: 416020 kB
Garrison: 416012 kB

Cheers,

Joel
