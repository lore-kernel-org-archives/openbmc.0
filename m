Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="YizIM5Sz"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fRdM3Jt3zDqN3
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 00:39:49 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id y6so1575277plt.1
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dz6Hs5PzotlKKLJRP8IiVP08dgLfmBBiRCh8WSw6slI=;
 b=YizIM5SzDIY3Vuc1zmMR0/L2UbV07M0yMDB9b7X2eEYjr1BhHB9dsRCLbA0lDOhI0j
 0pzwC1pxtCHRDvnOD6HMupzDC7LOHFupBs9HfwH+QrO1dJNJwJsuXg99EYb1Y67SrMzm
 HrMjVqa1cbH0mftYvnV8hMGrN17y5un60ngwpfOdTMjyEkHOrXPP41S1k0XVVc2V2Ujk
 /PQoWaIgAtbrtAmPSxK+wPJAr6lc42+6P5k4hs2IpFfRMVh1pC6qjAYUrEINGR8SGziJ
 EkeuerL35OayTP5L6AvKEilh1b6AtXB8l+Z8RH8wFqDdAmjd7wKPVvx5+ay7FpbX8aLQ
 YNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dz6Hs5PzotlKKLJRP8IiVP08dgLfmBBiRCh8WSw6slI=;
 b=NL6HOl9lgWY+UJLsoHzX5duFYWJBAAzCXBfbhLrGFCj9o21UbmJ7gPpM1ORG97VXYM
 gH9PSX0c7zYyAGJFYFIRw+1O7/TvSTBOPUupqXVGGq+xpDcqoAp6geW07SsnBwGMerCB
 dfAqRZdH4JvkrwC5vIqOkJPE9HENRqUeP3IF+v/Zh6GCQixbeLj06Ax/r0uOhLYnsMA4
 WINJlHtOI56EKSUcrVtwwdMFb4mvIqbTZQprImgEw5t8FrhMRkEVTv141pt4vBOf10tD
 Fulp47y8+FB/fjqM+LsayPC93J0uTJ7HKfrjE96+L3BKSUl2IwnsVDPet1uP/E7NMWRe
 m8kg==
X-Gm-Message-State: APjAAAXJC94CX6HQercMrj/THLTQEErsS/qbqcEaDhPCOpb/lkjdWnP8
 CeYJwtwgTZmamledi8MxZrZgKfgiX7GEgB6pqwh2fg==
X-Google-Smtp-Source: APXvYqzO7mn2jRulxkLBZE8p7xUeMdnyFJbI6+AUoLtTWuMkSD4x21pyq+dedkF0imE5ieuB8yArpKIAAe9OIRqYSzY=
X-Received: by 2002:a17:902:778a:: with SMTP id
 o10mr32580671pll.135.1554907186443; 
 Wed, 10 Apr 2019 07:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxhe24e8-1dTcspD_H7xTy49yEnnn-gJbUciekirzKC_w@mail.gmail.com>
 <CACPK8XfwP_DwqthSwgFGMjqRepGkC1XdziZ+eEds=6ND_Ov71Q@mail.gmail.com>
In-Reply-To: <CACPK8XfwP_DwqthSwgFGMjqRepGkC1XdziZ+eEds=6ND_Ov71Q@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 10 Apr 2019 07:39:35 -0700
Message-ID: <CAO=notwAcxqFTN31Ecfd50rkjKm9X7PQsTFAP4Rc_xvN0wALUQ@mail.gmail.com>
Subject: Re: transitioning from 4.17.18 to 5.0.6
To: Joel Stanley <joel@jms.id.au>
Cc: Jeremy Kerr <jk@ozlabs.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 10 Apr 2019 14:39:52 -0000

On Tue, Apr 9, 2019 at 7:17 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 9 Apr 2019 at 16:35, Patrick Venture <venture@google.com> wrote:
> >
> > HI, I ran into some weirdness when transitioning from 4.17.18 to 5.0.6
> > with the quanta-q71l board.  More specifically now my host can't talk
> > to the BMC via ipmi-bt.  All it returns is 0xd5.  on the BMC itself, I
> > can talk to ipmid file via dbus, and btbridge is running.
> >
> > Has anyone else run into weirdness?
>
> I've not seen that.
>
> My only guess is there is an issue with clocking. Can you try booting
> the machine with clk_ignore_unused in your kernel command line?

I'll give it a shot, although IPMI not working is odd since the
LPC_CLK is enabled.  But yeah, I'll try that today and reply back,
thanks.

>
> >
> > I am seeing:
> >
> > [    4.645814] ipmi-bt-host 1e789140.ibt: Found bt bmc device
> > [    4.650341] ipmi-bt-host 1e789140.ibt: Using IRQ 32
> >
> > The dts file I'm using is basically identical to the upstream one, and
> > my defconfig is also nearly identical to what's in meta-aspeed for the
> > ast2400.
> >
> > Patrick
