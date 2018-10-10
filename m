Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="e/9ymvIZ"; 
 dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Vk3n5cVPzF1PQ
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 06:01:57 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id n31-v6so2941455pgm.7
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 12:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uGX08MU2ZkmB2ifBgt29uAzE3vut7IJRq9OVKpKMHzo=;
 b=e/9ymvIZmd10meSWBqHu8AZ9IK/MvAf3O9P8AsQzf2ZpwL01BfGxaHP69EIP+OgWoe
 iDLnq+oLsRV05RByLDdn3UB1L0v+uHWh3Q2vIBtYh4VpTHzLMKCv7FRwaA3JM2AOaSjb
 7lyf7VlsLY18cfocxy5JOc6/g2wEoAnT2oJr/PDfvr/6LerH4fJNJLl9kHJZIxQ2WanZ
 pjL4DTbSQ1+VP2/nU09pXWHl2/P1Z7gGdKr707pRrHGYk40ivGH3kwR8juyRsKwqekfv
 IaN+mgNZmDpde5anxkAFIgLc61ZCit0Ge2356lPvSSwUnaNySgTHexDHjgCRgbSaK+wo
 1Kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uGX08MU2ZkmB2ifBgt29uAzE3vut7IJRq9OVKpKMHzo=;
 b=Sva2QSJ3OO2ctVVlKfcU+0KVf4UGSfYh7kJzryukq7h/P3vWUpD/Y/3VB7mAecsQic
 FL5ciWCfsUMUvqawDuEPUFMxVoS7iY1df8snm3R4BSroMb7DLiPjWyUIFVMQx4EyHzIo
 KEnzemIPnDw0Qe+SIX6MjHfQ5XXQYOwvx8ZGyQwrZx64SjYOC8Rnhs35OeuYxGSe1n7X
 viGGJHvXcA5rjarxFetsvMfvjfRpz6/sa6REUg6QhbzqwdYNKJJCGIfj3SqaMlqT1XVc
 espM1w2oP+jNuS/PjdxUgTzUKM44HB3xxkG0BBv/8GAumWMoUmS/MM9z2hu2Fk7mANeE
 fNsg==
X-Gm-Message-State: ABuFfoi1XCWKJTyL3uiCeb4dJL+HQ/H8Hus0u5vwSpXyRVTWrPIpyMfz
 TjUHMqRMcFCMDsL38iGbdDz27rCqNn0P4IuvlXzsvIkaJ3g=
X-Google-Smtp-Source: ACcGV63uFk3teJ5M/OFV1QfqowhjIzb07xiLLQIK8FIL7EI1VIcEPlTijD4m0AyI18esJJVLPucgYveXnkJMN6otQfI=
X-Received: by 2002:a62:18a:: with SMTP id
 132-v6mr36070214pfb.207.1539198115805; 
 Wed, 10 Oct 2018 12:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyKtrecZeAypPcjY7qi6rBqj_cPwPosFRds=wYpeHW8wA@mail.gmail.com>
 <9dc677b3c95c2bc7e7c5a11a97df49a7@linux.vnet.ibm.com>
 <CAO=notx9Sncg2w68Z=OTsMAWJtoyENc2KUZJfz-8vDCGhJ7afA@mail.gmail.com>
 <CAO=notwU5z2bb2C51s=8PEEuwgqUjNa3bctNH12P=GVmMaHkRw@mail.gmail.com>
 <CAO=notzG9PMZTry+WHP1SJoxA2O=5GFGjGmCpMr3CiTWHgmD5g@mail.gmail.com>
 <ede9c4021b68a264677f4e7b84ae21fb@linux.vnet.ibm.com>
In-Reply-To: <ede9c4021b68a264677f4e7b84ae21fb@linux.vnet.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 10 Oct 2018 12:01:43 -0700
Message-ID: <CAO=notyRwEgvK88DrOcssVt-=c6_ETdpqTvDPR0J-CmiPQXvxg@mail.gmail.com>
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
X-List-Received-Date: Wed, 10 Oct 2018 19:01:58 -0000

On Wed, Oct 10, 2018 at 12:00 PM Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
>
> On 2018-10-10 13:50, Patrick Venture wrote:
> > On Wed, Oct 10, 2018 at 11:46 AM Patrick Venture <venture@google.com>
> > wrote:
> >>
> >> On Wed, Oct 10, 2018 at 11:45 AM Patrick Venture <venture@google.com>
> >> wrote:
> >> >
> >> > On Wed, Oct 10, 2018 at 11:38 AM Matt Spinler
> >> > <mspinler@linux.vnet.ibm.com> wrote:
> >> > >
> >> > > On 2018-10-02 10:28, Patrick Venture wrote:
> >> > > > I've sent a bunch of recipe renames, but I'm still updating each with
> >> > > > an individual tested footer.  I will try marking them all as WIP now
> >> > > >
> >> > > > Patrick
> >> > >
> >> > >
> >> > > Hi Patrick,
> >> > >
> >> > > I think you broke master with these.  For example, the phosphor-rest
> >> > > recipe - it has a default url-config.json, and then a layer specific file gets
> >> > > applied from the meta-ibm layer, like:
> >> > >
> >> > > meta-ibm/recipes-phosphor/interfaces/phosphor-rest/url_config.json
> >> > >
> >> > > However, from the log.do_unpack from the phosphor-rest build, it doesn't
> >> > > look there, it now only looks in phosphor-rest%.  So any override directory without
> >> > > a % isn't being found.
> >> >
> >> > Interesting that the CI didn't catch the break since witherspoon is
> >> > one of the systems built via it.  But I'll take a look.
>
> Yea, our current automated test bucket can't catch this.  (shows there
> is still room for improvement)
>
>
> >>
> >> Although I have had configuration files disappear when the wildcard is
> >> missing from the directory, the recipe normally complains about being
> >> unable to find the file.  For a file override, if there's already that
> >> file - presumably then it wouldn't complain.
>
> The latter is what's happening here.
>
> >
> > I've fired off a witherspoon build locally from openbmc HEAD, and will
> > report back.  Very few of the recipes were updated in this fashion so
> > I'm not terribly worried about a general breakage.
>
> Thanks for looking.  I'm not sure if there's an easy way to find these
> cases.

This specific case is difficult to catch but, it's something that's
avoided for most of the renames, so at least there's that.  Future
changes though -- one will just have to be more cognizant of matching
output.

>
> >
> >>
> >> >
> >> > >
> >> > > I haven't looked to see what all is broken yet and in how many layers,
> >> > > at least our phosphor-rest and phosphor-gevent, which is why the web UI stopped
> >> > > working on witherspoon.  Not sure if any other systems are also having problems.
> >> > >
> >> > >
>
