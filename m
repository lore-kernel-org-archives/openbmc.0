Return-Path: <SRS0=1wFR=KQ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02D1C433ED
	for <openbmc@archiver.kernel.org>; Fri, 21 May 2021 00:12:10 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DC7E6109F
	for <openbmc@archiver.kernel.org>; Fri, 21 May 2021 00:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DC7E6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmRqs0xLmz3bsF
	for <openbmc@archiver.kernel.org>; Fri, 21 May 2021 10:12:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jHMAj+TP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=dwaipayanray1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jHMAj+TP; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm5PD6f4Xz2xtl
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 20:21:19 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id e2so12736256ljk.4
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 03:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K2cc8lrs7KTJ2rzXzsJVI1VFEnWT2ol2a83/8eM7dQs=;
 b=jHMAj+TPqUK6uCBdJ9yQMBnfh/ME17wsDvCEiziK9Mqs5YOmrpQcTkvOKoGM6tydQZ
 PqIpkU7FieU5u2Fv93H0TxQnA6ZzjXE3M84osHh0Y9hn7J6suhFrrPy7xxpI2NdBAAwT
 JZ2oxbt/Xv2Y/EnBUPNYNXmIVhe8Wj6YS64ldN7h7Nu07LxSPBvku/2tRTwXgnG+KkdZ
 UeKMv4ZNXcaWC/BjjYEol9GE47uU6MMUWIaH0rPbcOs1BLP6Hjvc9QC+ngHIpWpKEE6c
 qs7cGnGNQoZc6EhD7XDRLkf1lEYp26BStuc6kj4NgZ/myUBqoaL6yA4AN49/9yz8hxaO
 2mCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K2cc8lrs7KTJ2rzXzsJVI1VFEnWT2ol2a83/8eM7dQs=;
 b=q/zXU2VJoMRkSBPksuuTCKg31vfKU0aTrOeUtksPyNVH+3MW+/5oohKQB9wJzlJdHi
 mbYN5XelvTQ3jDj/GEdr1LJMZg2H83RP1qj0fVdTvR69Zue2x5+mN5xArc+6RYnDwSFs
 +Sctd6HJsZ0lzcSeXJlRy9z71uQlYWEOiA/3gTbJRei3V85PR7G5YyacETToz7IJ2GM3
 Px/NtFuC3ZarRACR2BR0okx2OBJ2mdHT2aZ2a2vlaRImjp3MmKUVcIquddDCcklqkOSE
 y8LiWyP2ANOl2bdXUhh3n1iaL8A57S2daWY1vib+3EfRie1FRwHdVMEDBvs+tQ59EWg+
 KFwQ==
X-Gm-Message-State: AOAM531hldvRqvts1Rop5MPWu9cREYi65SkrWU/sXGkkNblrFysBN4N7
 CDgHZCggdQ7f5bbxeosjKZUMgQhOuX+iZKnkAJw=
X-Google-Smtp-Source: ABdhPJzP0EzigPL60MzO730q2rJB5lyvpkC19VIvrAuQao49kViHZ8hbh47wf1reVrYu9RHb2Jjpg9oWxOU3efr1j7g=
X-Received: by 2002:a2e:1602:: with SMTP id w2mr2572231ljd.510.1621506073369; 
 Thu, 20 May 2021 03:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210520015704.489737-1-andrew@aj.id.au>
 <CAKXUXMxTnz6edBLpBgqOo6uUiSGm8rULH9P8G24xx2OhP_Yb6A@mail.gmail.com>
 <a0d1f44a-c8ff-4108-af34-6455b5683262@www.fastmail.com>
 <CABJPP5C7ZokRycaE0aAvUv3BfOJqOvPyqn-P0bbPdyCfnuuESw@mail.gmail.com>
 <72ed5aa8-bca5-451d-9458-48735fc17b84@www.fastmail.com>
In-Reply-To: <72ed5aa8-bca5-451d-9458-48735fc17b84@www.fastmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 20 May 2021 15:51:00 +0530
Message-ID: <CABJPP5AMPL22dJ2YKNqdTtHrTJRr=SKnxo05PKn9FoveNX7tow@mail.gmail.com>
Subject: Re: [PATCH] Documentation: checkpatch: Tweak BIT() macro include
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 21 May 2021 10:10:39 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, May 20, 2021 at 3:15 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 20 May 2021, at 18:47, Dwaipayan Ray wrote:
> > On Thu, May 20, 2021 at 12:55 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > >
> > >
> > > On Thu, 20 May 2021, at 16:28, Lukas Bulwahn wrote:
> > > > On Thu, May 20, 2021 at 3:57 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > > >
> > > > > While include/linux/bitops.h brings in the BIT() macro, it was moved to
> > > > > include/linux/bits.h in [1]. Since [1] BIT() has moved again into
> > > > > include/vdso/bits.h via [2].
> > > > >
> > > > > I think the move to the vDSO header can be considered a implementation
> > > > > detail, so for now update the checkpatch documentation to recommend use
> > > > > of include/linux/bits.h.
> > > > >
> > > > > [1] commit 8bd9cb51daac ("locking/atomics, asm-generic: Move some macros from <linux/bitops.h> to a new <linux/bits.h> file")
> > > > > [2] commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO")
> > > > >
> > > > > Cc: Jiri Slaby <jirislaby@kernel.org>
> > > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > >
> > > > Looks sound to me.
> > > >
> > > > I would prefer a bit of word-smithing the commit message by just
> > > > removing the references:
> > > >
> > > > So:
> > > >
> > > > > While include/linux/bitops.h brings in the BIT() macro, it was moved to
> > > > > include/linux/bits.h in commit 8bd9cb51daac ("locking/atomics, asm-generic: Move some macros from <linux/bitops.h> to a new <linux/bits.h> file"). Since that commit, BIT() has moved again into
> > > > > include/vdso/bits.h via commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO").
> > > > >
> > > > > I think the move to the vDSO header can be considered a implementation
> > > > > detail, so for now update the checkpatch documentation to recommend use
> > > > > of include/linux/bits.h.
> > > > >
> > > >
> > > > And then drop references [1] and [2].
> > > >
> > > > Andrew, what do you think?
> > >
> > > I mostly did this because initially I wrapped the commit message and
> > > checkpatch spat out errors when it failed to properly identify the
> > > commit description for [1]. But, leaving the description unwrapped
> > > inline in the text feels untidy as it's just a work-around to dodge a
> > > shortcoming of checkpatch.
> > >
> > > With the reference style the long line moves out of the way and
> > > checkpatch can identify the commit descriptions, at the expense of
> > > complaints about line length instead. But the line length issue was
> > > only a warning and so didn't seem quite so critical.
> > >
> > > While the referencing style is terse I felt it was a reasonable
> > > compromise that didn't involve fixing checkpatch to fix the checkpatch
> > > documentation :/
> > >
> >
> > Hey,
> > Can you share which wrap around caused the checkpatch errors
> > to be emitted? We can try to fix that.
> >
> > I was able to wrap it without checkpatch complaining. You might consider
> > replacing it with this if you wish?
> >
> > While include/linux/bitops.h brings in the BIT() macro, it was moved to
> > include/linux/bits.h in commit 8bd9cb51daac ("locking/atomics, asm-generic:
> > Move some macros from <linux/bitops.h> to a new <linux/bits.h> file").
>
> This wording works because the commit description is only split across
> two lines. With the wording I had it was split across three, and this
> caused checkpatch to barf. If we do this:
>

Yes it won't work for 3 lines. We are checking only for an additional line
for split commit descriptions. Might be a thing to improve in the future.

> While include/linux/bitops.h brings in the BIT() macro, it was moved to
> include/linux/bits.h in commit 8bd9cb51daac ("locking/atomics, asm-generic:
> Move some macros from <linux/bitops.h> to a new <linux/bits.h>
> file").
>
> we get:
>
> ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 8bd9cb51daac ("locking/atomics, asm-generic: Move some macros from <linux/bitops.h> to a new <linux/bits.h> file")'
> #7:
> include/linux/bits.h in commit 8bd9cb51daac ("locking/atomics, asm-generic:
>
> total: 1 errors, 0 warnings, 8 lines checked
>
> Anyway, I've replaced the commit message with your suggestion:
>
> https://lore.kernel.org/linux-doc/20210520093949.511471-1-andrew@aj.id.au/
>
> Thanks for work-shopping it :)
>

Thanks for the patch :)

Dwaipayan.
