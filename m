Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fGkenh/t"; 
 dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VkTS1TLlzF0fg
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 06:20:43 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id f29-v6so3116854pff.5
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 12:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YupN3XHF0yUMcSerlebTzTy1H0gDNTwpyoqIACeHWCU=;
 b=fGkenh/tv5rZmjIsJafmwfqPpLOquv8cW6v5Yulw0yveWO+kuXaNQIIJAIpbrkfVaV
 nChrY4HZCv5xPRNi47zTwhYOMj8+UvhkCws6idaaZM4i2SARFw9bWJe0ocKTIbwmwBZT
 ABWQ4ImMFY6Pzktutb2mkD7ribouxTAH0xwU40FL6sxnl/lOxJTXdarEoZ/VxXVkQj2k
 /T1kBoxp7dsCBpGZKaQSZCPyTtTu1k7M7K+OIIRNgPK9b5wr3SUJSbyYPKCTCNFC49RX
 8llGpw9BCZ8XgrD1+nrgPslN7b4VZZsFPvw97gRko254V0O977BwfDJvbtmH6jzsH7HE
 +mwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YupN3XHF0yUMcSerlebTzTy1H0gDNTwpyoqIACeHWCU=;
 b=qPqaXS3HuByeQdWIECa2zE+osYR9KZLIycuewK8SJr3yzNOH9NtvB89Yau1TPyc7Xt
 2pjpyeutLrl/vLl7XUC6JfCb7svQG+88TfpdX1tG+XOEoAilg1FA9snEctYcx3fRTbIu
 Rb4gtkYCiWrk8dmOsMBmh66Ye/hQR1rQqSsMLJJbI0vgrsdwLzQNMmP7AvVV1m5OPooK
 nT7rPhmO7vBLJAHGyk8aV4gu4l86fNP9XSseHAv4MzeytygWf1SKm4IkPprkkqcFbJCO
 IV+hygyathAJ2JV70rUonczI6oygRW3yyJfW/lqvHyax3Lf+0wEuRVjG49rr9UPm7ZCP
 t+nw==
X-Gm-Message-State: ABuFfogZn7NB7RHGQI0XD4YrQC8KBhpbqjBW9jw3sbfEZzKsiVZSuGKC
 WzxXH5eZh1x3aaObX/f1sEA8m6aMUGRq6WLIjQKazmb+lZk=
X-Google-Smtp-Source: ACcGV62hg0QXYNIDOQbGQWWetmVlPXBAnfQ5QbsmahMbVfMpJAQqsHdG7lq8d5KIZHZVI392XKGld+MHDFg44Q9gPxM=
X-Received: by 2002:a63:e818:: with SMTP id
 s24-v6mr29706861pgh.90.1539199241593; 
 Wed, 10 Oct 2018 12:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyKtrecZeAypPcjY7qi6rBqj_cPwPosFRds=wYpeHW8wA@mail.gmail.com>
 <9dc677b3c95c2bc7e7c5a11a97df49a7@linux.vnet.ibm.com>
 <CAO=notx9Sncg2w68Z=OTsMAWJtoyENc2KUZJfz-8vDCGhJ7afA@mail.gmail.com>
 <CAO=notwU5z2bb2C51s=8PEEuwgqUjNa3bctNH12P=GVmMaHkRw@mail.gmail.com>
 <CAO=notzG9PMZTry+WHP1SJoxA2O=5GFGjGmCpMr3CiTWHgmD5g@mail.gmail.com>
 <ede9c4021b68a264677f4e7b84ae21fb@linux.vnet.ibm.com>
 <CAO=notyRwEgvK88DrOcssVt-=c6_ETdpqTvDPR0J-CmiPQXvxg@mail.gmail.com>
 <CAO=noty_B_-Jv5tYk1RfKqQHFiDNrWMmqyzCbL3jtYb=ORvs_Q@mail.gmail.com>
 <15eff4674f364d8a4f47a07bf0b60066@linux.vnet.ibm.com>
In-Reply-To: <15eff4674f364d8a4f47a07bf0b60066@linux.vnet.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 10 Oct 2018 12:20:30 -0700
Message-ID: <CAO=notxEPd1FHoZrAu44SB+hoRpp-zK9C1ivKukadFw8SWaG=w@mail.gmail.com>
Subject: Re: Recipe Renames, etc
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 10 Oct 2018 19:20:45 -0000

On Wed, Oct 10, 2018 at 12:17 PM Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
>
> On 2018-10-10 14:02, Patrick Venture wrote:
> > On Wed, Oct 10, 2018 at 12:01 PM Patrick Venture <venture@google.com>
> > wrote:
> >>
> >> On Wed, Oct 10, 2018 at 12:00 PM Matt Spinler
> >> <mspinler@linux.vnet.ibm.com> wrote:
> >> >
> >> > On 2018-10-10 13:50, Patrick Venture wrote:
> >> > > On Wed, Oct 10, 2018 at 11:46 AM Patrick Venture <venture@google.com>
> >> > > wrote:
> >> > >>
> >> > >> On Wed, Oct 10, 2018 at 11:45 AM Patrick Venture <venture@google.com>
> >> > >> wrote:
> >> > >> >
> >> > >> > On Wed, Oct 10, 2018 at 11:38 AM Matt Spinler
> >> > >> > <mspinler@linux.vnet.ibm.com> wrote:
> >> > >> > >
> >> > >> > > On 2018-10-02 10:28, Patrick Venture wrote:
> >> > >> > > > I've sent a bunch of recipe renames, but I'm still updating each with
> >> > >> > > > an individual tested footer.  I will try marking them all as WIP now
> >> > >> > > >
> >> > >> > > > Patrick
> >> > >> > >
> >> > >> > >
> >> > >> > > Hi Patrick,
> >> > >> > >
> >> > >> > > I think you broke master with these.  For example, the phosphor-rest
> >> > >> > > recipe - it has a default url-config.json, and then a layer specific file gets
> >> > >> > > applied from the meta-ibm layer, like:
> >> > >> > >
> >> > >> > > meta-ibm/recipes-phosphor/interfaces/phosphor-rest/url_config.json
> >> > >> > >
> >> > >> > > However, from the log.do_unpack from the phosphor-rest build, it doesn't
> >> > >> > > look there, it now only looks in phosphor-rest%.  So any override directory without
> >> > >> > > a % isn't being found.
> >> > >> >
> >> > >> > Interesting that the CI didn't catch the break since witherspoon is
> >> > >> > one of the systems built via it.  But I'll take a look.
> >> >
> >> > Yea, our current automated test bucket can't catch this.  (shows there
> >> > is still room for improvement)
> >> >
> >> >
> >> > >>
> >> > >> Although I have had configuration files disappear when the wildcard is
> >> > >> missing from the directory, the recipe normally complains about being
> >> > >> unable to find the file.  For a file override, if there's already that
> >> > >> file - presumably then it wouldn't complain.
> >> >
> >> > The latter is what's happening here.
> >> >
> >> > >
> >> > > I've fired off a witherspoon build locally from openbmc HEAD, and will
> >> > > report back.  Very few of the recipes were updated in this fashion so
> >> > > I'm not terribly worried about a general breakage.
> >> >
> >> > Thanks for looking.  I'm not sure if there's an easy way to find these
> >> > cases.
> >>
> >> This specific case is difficult to catch but, it's something that's
> >> avoided for most of the renames, so at least there's that.  Future
> >> changes though -- one will just have to be more cognizant of matching
> >> output.
> >>
> >> >
> >> > >
> >> > >>
> >> > >> >
> >> > >> > >
> >> > >> > > I haven't looked to see what all is broken yet and in how many layers,
> >> > >> > > at least our phosphor-rest and phosphor-gevent, which is why the web UI stopped
> >> > >> > > working on witherspoon.  Not sure if any other systems are also having problems.
> >> > >> > >
> >> > >> > >
> >> >
> >
> > Given it looks like I've already staged the fixes to this, we just
> > need to move those forward and when it settles, it should all be
> > copacetic.
>
> Those patches do indeed fix it.  Glad everything is already done.
> Thanks!

So rarely is a problem brought up the solution to which is already in
the queue.  It's like, winning $10 :D

>
