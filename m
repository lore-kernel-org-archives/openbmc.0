Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x22f.google.com (mail-yb0-x22f.google.com
 [IPv6:2607:f8b0:4002:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPcZT57JVzDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 13:35:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N9u7qRRN"; 
 dkim-atps=neutral
Received: by mail-yb0-x22f.google.com with SMTP id o65so9323879ybo.2
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 18:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=chqml4IoQaXbk27KE7oPVB4YqVnghM/LnmEjVOKBXlw=;
 b=N9u7qRRNH2RTVuMPAMpTROj4P3HQoCh3nckSFQD63uFRJ4nLC1XrWcbqkaKv4T5fuE
 R0Qeez8zAsHhuff2do8Y6ZKqBmVc8+ZG3dDbNapjwL7Sx4+T77BzmJp6crnw0aAtbPQI
 yO1jfMKZnldEwipU4Yv3Lya7GVgvZe9EWaLyBmA6ECl2XE1GUwAgvqLmM36lXhoXPnRQ
 N3tBAHnvQrOwN17GBIrM2CwVc9l7SMKdrX1sCiQ/z5/tSpIIk6LAP9slUv9Atbcwb7lA
 0fK7cpNLx7z6cP3MvM2o7Ttdl6XPjclngmbf0lXIhShN5Ta7ZuB1PxMtA05tne/I2d3N
 lzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=chqml4IoQaXbk27KE7oPVB4YqVnghM/LnmEjVOKBXlw=;
 b=QCZjszBplT9YZ5tbudKedWgwly337dQRcqycmnBV6TxUnYIE17R/JMSxr8jfT9f/P4
 T8Pv0koWmLVYN8pd+rGWwmSeBpU1Hen9FD6ccgyNxSIxhUuywIY2VqMBImrd20eQ2MZM
 Ey6rQjRJBc+ZJxBH7WeQ0pclRTvWjL3lnld/MudRwQJ7b5Jx6VI7JqyvcmYklO41hsEe
 88wbT6cpeyWMS9/0H/qWsVaVSJBJqKXZZ72K6qqIwOcGuy+3/4Drw2Nd7CRjmisbmaC1
 FEgmJ9YhNPVP848hLTMEKJdzcpEUVUEUgRzux9/wOJTL1fjyj2nTw49siWS42RswSdl3
 xqBw==
X-Gm-Message-State: AMke39mwHmA5oUs4kZsCK8QCl32PycTGhSkM7zQJE6vTymoyQsxQW5s/hNrvScSzoDBH8TzfzRIVUhWITC7cTg==
X-Received: by 10.37.70.66 with SMTP id t63mr4204189yba.196.1487298925773;
 Thu, 16 Feb 2017 18:35:25 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Thu, 16 Feb 2017 18:35:05 -0800 (PST)
In-Reply-To: <CALQ6q7Zf=OHFaZFxDVR0W6y0GxmnXddK0px2M69muY10guQMvA@mail.gmail.com>
References: <CALQ6q7Zf=OHFaZFxDVR0W6y0GxmnXddK0px2M69muY10guQMvA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Feb 2017 13:05:05 +1030
X-Google-Sender-Auth: qrVLOMeofnYXMi3lEu3x-kTyCO4
Message-ID: <CACPK8XdN-RT-v8M8jf=Pk-PTMM5jZeVwn_j0A3AxGw7-PkcHJQ@mail.gmail.com>
Subject: Re: AST2500 Watchdog Timer Device Tree Entry
To: Nolan Hergert <nolan.hergert@gmail.com>
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
X-List-Received-Date: Fri, 17 Feb 2017 02:35:30 -0000

Hey Nolan,

On Fri, Feb 17, 2017 at 5:31 AM, Nolan Hergert <nolan.hergert@gmail.com> wrote:
> To Joel in particular,

Feel free to put me in To if you want my attention. Your email bubbles
up the to of my to-read list when you do so.

> Thanks for making a WDT driver for the Aspeed chips already! It makes diving
> into these things a lot easier.

No worries :) I'm glad our hard work is paying off.
>
> I didn't understand some of the things in the aspeed-g5.dtsi file though:
>
> wdt1: wdt@1e785000 {
> compatible = "aspeed,ast2500-wdt";
> reg = <0x1e785000 0x1c>;
> };
>
> wdt2: wdt@1e785020 {
> compatible = "aspeed,ast2500-wdt";
> reg = <0x1e785020 0x1c>;
> status = "disabled";
> };
>
> wdt3: wdt@1e785040 {
> compatible = "aspeed,wdt";
> reg = <0x1e785074 0x1c>;
> status = "disabled";
> };
>
>
>   * Register lengths are 0x1C instead of 0x20. The skipped register in the
> datasheet for AST2500 is determining which hw modules to reset, which sounds
> like something we'd want to configure.'

You're correct. We are ignoring this feature of the ast2500 watchdog
IP with the current driver. I believe this an oversight; we should add
the functionality when matching against the "aspeed,ast2500-wdt"
compatible string.

>   * wdt3 compatible string is different.
>   * wdt3 register offset appears wrong.

That's for picking these up. I suspect no one has tried to enable WDT3
so we have not hit the issue. These are both bugs in the device tree.

If you're in a position to contribute fixes to any of these issues I
encourage you to submit patches. The fixes should go upstream first,
and then we can backport the patches to the openbmc tree.

I've got some documentation about how our kernel development process
works. Please have a read. Any and all feedback is welcome!

 https://github.com/openbmc/linux/wiki/DevelopmentProcess
 https://github.com/openbmc/linux/wiki/SubmittingPatches

Cheers,

Joel
