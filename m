Return-Path: <xow@google.com>
Received: from mail-qt0-x231.google.com (mail-qt0-x231.google.com
 [IPv6:2607:f8b0:400d:c0d::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tysY33gK0zDqJ8
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 13:00:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RtSvnMgs"; 
 dkim-atps=neutral
Received: by mail-qt0-x231.google.com with SMTP id x49so117067247qtc.2
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 18:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=rbQ55sJiLoDdBC1WsGohRIo5meUIqRSuq6CemKju1wQ=;
 b=RtSvnMgsU//TMa1LPbU3lH+JvYSAn10sKei9S9MnmsLbyGuhJkVPp531xmp9kKTJSX
 Mq1INIB2mXwYrdZHtHUzfqWH8QAp23owALRBKyK8EyyvRY8qcMG/17v4TevdOTewyQ20
 O6RzXgh+97xwOLFTtAN540jbu+y2jMuOswrV7vi4uUnHZv+dXct8wYoQO4XsL4tgNQtU
 OV8JwAlvlwUFomCg0trfM86FMk61o19sKqg6cUZvHrtQVmas22OG35iUl0f86nxHqDfP
 6OwmHNr/gZpHFAldJzq2izh89q1A4yVb9mzK/MiFpm2HZGPsE5BzeHCo4yupt7hmG9va
 p3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=rbQ55sJiLoDdBC1WsGohRIo5meUIqRSuq6CemKju1wQ=;
 b=ABb/3qhuw2/epBNPmcWpRKOPwGXrPsBIA5lZrUjGGIXnxAZ6PoKZ2bnFeHr7VqsdZv
 vjjMWxvaMeKCTgZXgq3ViZZ5j6J6sOhxSnR3nWJ3yZ0X6B73xtHbaiUtkHnxgfirbF5G
 E45fis0iBK8eD3Yjq0UGORjK8C167mWFCPOJFkbMZTBAoQdhIpCsB3VAoU6cnS++fHRD
 SDyq8wwokuAzpYTUv99KaLD9j/TV99qbMVQkzMwoVuLzpvSpPLVehC6xVtcD/lihEMAl
 RE1sxYN7MPVZGkcnRTVSqzJvS/XjuaXb6AYyPStOeOeUiBhKkvfoowgeViWDehm+Uvww
 l+vw==
X-Gm-Message-State: AIkVDXL+KLUoLPLLkEmcjVDRIsz0TqCPOI+RN+irZjzu/j6XAgZugSsmldbsznlj/jZo0kMMnuo/VG4VwEBlHrom
X-Received: by 10.200.57.27 with SMTP id s27mr5288144qtb.230.1484100020209;
 Tue, 10 Jan 2017 18:00:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.18 with HTTP; Tue, 10 Jan 2017 18:00:19 -0800 (PST)
In-Reply-To: <1484006630.12800.5.camel@aj.id.au>
References: <20161110013556.8542-1-andrew@aj.id.au>
 <CAPH-5w7O7+65OWEWARC7ihwhoPnqBRe8z_4R3KWRS-nNHsBw-w@mail.gmail.com>
 <1484006630.12800.5.camel@aj.id.au>
From: Xo Wang <xow@google.com>
Date: Tue, 10 Jan 2017 18:00:19 -0800
Message-ID: <CAPH-5w7BGz63j5FcwCcfQoMTaH2eaonU64Y64j6xgHq3Pqwa9g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 0/4] SuperIO and Host Interface Controllers
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC <openbmc@lists.ozlabs.org>, 
 Cyril Bur <cyrilbur@gmail.com>
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
X-List-Received-Date: Wed, 11 Jan 2017 02:00:24 -0000

Hi Andrew,

On Mon, Jan 9, 2017 at 4:03 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Xo,
>
> On Mon, 2017-01-09 at 15:11 -0800, Xo Wang wrote:
>> Hi folks,
>>
>> > On Wed, Nov 9, 2016 at 5:35 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > Hello,
>> >
>> > This series adds some sysfs drivers exposing parts of the LPC controller. The
>> > patches are pretty bare-bones in that they provide zero sanity checking and
>> > leave decisions entirely to userspace. They're also slightly tedious, so I
>> > expect (hope) their current form will be short-lived.
>> >
>> > Cheers,
>> >
>> > Andrew
>> >
>> > Andrew Jeffery (4):
>> >   misc: Expose Aspeed SuperIO scratch registers (SCRxSIO)
>> >   misc: Add partial Aspeed LPC Host Interface Control (HIC) driver
>> >   arm: aspeed: dt: Add SuperIO scratch register nodes
>> >   arm: aspeed: dt: Add LPC Host Interface Controller nodes
>> >
>> >  arch/arm/boot/dts/aspeed-g4.dtsi |  10 ++
>> >  arch/arm/boot/dts/aspeed-g5.dtsi |  10 ++
>> >  drivers/misc/Kconfig             |  14 +++
>> >  drivers/misc/Makefile            |   2 +
>> >  drivers/misc/aspeed-hic.c        | 198 +++++++++++++++++++++++++++++++++++++++
>> >  drivers/misc/aspeed-scrsio.c     | 141 ++++++++++++++++++++++++++++
>> >  6 files changed, 375 insertions(+)
>> >  create mode 100644 drivers/misc/aspeed-hic.c
>> >  create mode 100644 drivers/misc/aspeed-scrsio.c
>> >
>> > --
>> > 2.9.3
>> >
>> > _______________________________________________
>> > openbmc mailing list
>> > openbmc@lists.ozlabs.org
>> > https://lists.ozlabs.org/listinfo/openbmc
>>
>> I noticed that this driver wasn't merged. Was there a change of plan
>> to how LPC controller functionality should be exported?
>>
>> This is still useful for us to set up memboot and to listen for port
>> 80 post codes.
>
> Cyril has reworked the HICR parts of the memboot function here:
>
> https://lists.ozlabs.org/pipermail/openbmc/2016-December/006089.html
>
> It would be good to get your feedback the approach. Cyril is going to
> send out another revision shortly and will Cc you.
>
> As for the post codes these patches didn't expose the PCCRs in sysfs -
> have you modified them?

We don't have code that touch PCCRs. I was waiting to see how these
drivers would go and discuss with Jagha how she would like to
implement that part of her POST code work.

>
> Regardless, given Cyril now has a better approach for the LPC Host
> Interface Controller we should probably rethink the approach for
> SuperIO scratch registers and PCCRs. These patches were always just
> hacks and Joel had to pushed me to send them out.
>
> Andrew

cheers
xo
