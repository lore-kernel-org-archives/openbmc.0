Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fPTVplSQ"; 
 dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Vk506sKkzF1PQ
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 06:03:00 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id u12-v6so3075649pfn.12
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 12:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nsj+QTtutsE1tbqCvdkf/MZeqIs43vSV/8oS5HdlYk4=;
 b=fPTVplSQ+3BYXUr+JzbX7/PncplLo17v0CFewZpllyFSjyMG0aoHvwu7iZ23WImCxz
 19YB+/b1VRClwkBe4WcDQzYlKvv/4kwKkxDjEa3oL4f19VcegkA2DuYec2bQmvGRlpcZ
 O1iso0SENOVdXkAGLEdyxFZHPtptT+BbRV3bEB40i7tJd2gFvMxhTWZwJnWs8jLiIcGf
 6NhCzlyLkPtXQAbttYIR4U6ggYjipmIbX1sW8UFjtJZe9MC900LVBTxVi03GAZICDnVm
 XLQLHZLIdujt2R900ReZo1XMn081tKY41dvmhNJ1Vcm/BjB+makkCPVptC29+dYbhuMP
 CdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nsj+QTtutsE1tbqCvdkf/MZeqIs43vSV/8oS5HdlYk4=;
 b=PYYX2Ggp6qraWxzpky+lEUfOPLB7rS/ecSJ+V13rSkOy9znoUXzUtjxYozhQ9ivNGf
 4fecHr/4+w4xciKdUz2gXSBK3A8K0AvOo8y3RVTmnjPxUD9WHbLx0lCp/C7d8Hg+BCXV
 ESIzPTuD1kcvAL88BpPAxSGYIqtDyYI0McHA4zdVMCCMxJyEXM6PpbuWthNJY2mw9Pdy
 RAJi/3lpD8ELKswIJ07AxWN9QA/j/6LYNQWxjvdgyqaYKGFdDi0zykOIg1I4+uwE7Th4
 wKIyyanGeeefssG5JCbNTOJAcpNiO4irUE+4cDyTgAHItPoHttQOPoFqJeTigzLWjghw
 uh2A==
X-Gm-Message-State: ABuFfogFAgrvNzvY9ZymaF71myHNpMi6zXuD4Vy8LADKQMbapx13n9qt
 tXPL+j5H101F4d20jN00oy7Z75Yc/8tAZrKQKHUnQXglKIA=
X-Google-Smtp-Source: ACcGV62FEkZ609U63IlBevmVkUQd5/2feyRt0rd0o0hlZ+jqaqzkkcF46omJWH4g+nnUXsTEbSo7bd8pxzMBTTlwQ7Y=
X-Received: by 2002:a63:9507:: with SMTP id
 p7-v6mr31059630pgd.449.1539198178658; 
 Wed, 10 Oct 2018 12:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyKtrecZeAypPcjY7qi6rBqj_cPwPosFRds=wYpeHW8wA@mail.gmail.com>
 <9dc677b3c95c2bc7e7c5a11a97df49a7@linux.vnet.ibm.com>
 <CAO=notx9Sncg2w68Z=OTsMAWJtoyENc2KUZJfz-8vDCGhJ7afA@mail.gmail.com>
 <CAO=notwU5z2bb2C51s=8PEEuwgqUjNa3bctNH12P=GVmMaHkRw@mail.gmail.com>
 <CAO=notzG9PMZTry+WHP1SJoxA2O=5GFGjGmCpMr3CiTWHgmD5g@mail.gmail.com>
 <ede9c4021b68a264677f4e7b84ae21fb@linux.vnet.ibm.com>
 <CAO=notyRwEgvK88DrOcssVt-=c6_ETdpqTvDPR0J-CmiPQXvxg@mail.gmail.com>
In-Reply-To: <CAO=notyRwEgvK88DrOcssVt-=c6_ETdpqTvDPR0J-CmiPQXvxg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 10 Oct 2018 12:02:46 -0700
Message-ID: <CAO=noty_B_-Jv5tYk1RfKqQHFiDNrWMmqyzCbL3jtYb=ORvs_Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 10 Oct 2018 19:03:01 -0000

On Wed, Oct 10, 2018 at 12:01 PM Patrick Venture <venture@google.com> wrote:
>
> On Wed, Oct 10, 2018 at 12:00 PM Matt Spinler
> <mspinler@linux.vnet.ibm.com> wrote:
> >
> > On 2018-10-10 13:50, Patrick Venture wrote:
> > > On Wed, Oct 10, 2018 at 11:46 AM Patrick Venture <venture@google.com>
> > > wrote:
> > >>
> > >> On Wed, Oct 10, 2018 at 11:45 AM Patrick Venture <venture@google.com>
> > >> wrote:
> > >> >
> > >> > On Wed, Oct 10, 2018 at 11:38 AM Matt Spinler
> > >> > <mspinler@linux.vnet.ibm.com> wrote:
> > >> > >
> > >> > > On 2018-10-02 10:28, Patrick Venture wrote:
> > >> > > > I've sent a bunch of recipe renames, but I'm still updating each with
> > >> > > > an individual tested footer.  I will try marking them all as WIP now
> > >> > > >
> > >> > > > Patrick
> > >> > >
> > >> > >
> > >> > > Hi Patrick,
> > >> > >
> > >> > > I think you broke master with these.  For example, the phosphor-rest
> > >> > > recipe - it has a default url-config.json, and then a layer specific file gets
> > >> > > applied from the meta-ibm layer, like:
> > >> > >
> > >> > > meta-ibm/recipes-phosphor/interfaces/phosphor-rest/url_config.json
> > >> > >
> > >> > > However, from the log.do_unpack from the phosphor-rest build, it doesn't
> > >> > > look there, it now only looks in phosphor-rest%.  So any override directory without
> > >> > > a % isn't being found.
> > >> >
> > >> > Interesting that the CI didn't catch the break since witherspoon is
> > >> > one of the systems built via it.  But I'll take a look.
> >
> > Yea, our current automated test bucket can't catch this.  (shows there
> > is still room for improvement)
> >
> >
> > >>
> > >> Although I have had configuration files disappear when the wildcard is
> > >> missing from the directory, the recipe normally complains about being
> > >> unable to find the file.  For a file override, if there's already that
> > >> file - presumably then it wouldn't complain.
> >
> > The latter is what's happening here.
> >
> > >
> > > I've fired off a witherspoon build locally from openbmc HEAD, and will
> > > report back.  Very few of the recipes were updated in this fashion so
> > > I'm not terribly worried about a general breakage.
> >
> > Thanks for looking.  I'm not sure if there's an easy way to find these
> > cases.
>
> This specific case is difficult to catch but, it's something that's
> avoided for most of the renames, so at least there's that.  Future
> changes though -- one will just have to be more cognizant of matching
> output.
>
> >
> > >
> > >>
> > >> >
> > >> > >
> > >> > > I haven't looked to see what all is broken yet and in how many layers,
> > >> > > at least our phosphor-rest and phosphor-gevent, which is why the web UI stopped
> > >> > > working on witherspoon.  Not sure if any other systems are also having problems.
> > >> > >
> > >> > >
> >

Given it looks like I've already staged the fixes to this, we just
need to move those forward and when it settles, it should all be
copacetic.
