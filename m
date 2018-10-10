Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="r9EsX2j+"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VjpG1ZTZzF10f
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 05:50:14 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id q17-v6so2951334plr.8
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 11:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MMlEdC1iIYkhMc4VlXRw/xjf84uc0vxJY7irJUZLUfo=;
 b=r9EsX2j+HnXOQCLstaXbeZT1hoLMRQbq/buzU54VSEPHWpcPeuEUVhQp8DMJGtg+uc
 BOplHtHALBiU7T8HmRBiSNEX0AX8cJlIBnlc9g6G8V0a5EwnpN1DSQOzDSfWGPKrRAGu
 Z8H40v7zgaC1FjIn96Yrc/nJFbubLMjdgMH+B7suraruW0am7GHcPUaT1Lps14RmkODr
 wiEzyGR0UdNQn6vxEs2ACeYp79ZPJZM7VX/ALe+nf8qOUKdaR6c9GQm3ZXZpZEBRiGtC
 t/VSxvpyKDC928OStYoSVQpfV1d+ZcuKSXeV0Nlm3Wh1YXjKZdOfGzADZf6Q0Wxh7yvr
 Zgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MMlEdC1iIYkhMc4VlXRw/xjf84uc0vxJY7irJUZLUfo=;
 b=LXu/kIyZktddjrYXx+FixlZ7IGTKvS+/RPiUE+62pj5lb+pNVEWHsrZmgKMslTyMC4
 fv9aCGDPfISE1fcereqD/NjluAkaN4DzWVS5dVrSGHnDyAG5ni4sIbqbRvL0fMKa9pmB
 0vKeUp7cC8g5OPOOWb5G93LSNzN6P7PpLR33wPEXkhxYe9AlOSYaKhqQXJ1KXp3ZF2XU
 ZpLcsPmtZBrP2ditkryDi4/tGTtszQnLgQMj8oW/EXTN3gk0eR8vy39hf2depIGZ3QIX
 cAkrSxI3EKPztQS+D1/GsylVWnV6rRqhQXrX5LbTjWMUuKEjm9YeMnm8wmAd2k97mvkU
 9wAA==
X-Gm-Message-State: ABuFfojysIrUdw22onev3KgPjWnconvjBlYnIHkA0tp2yeAKpgZjUzjA
 UaFh6eFG85QyNFZ7N61BUQi0VHa1yK4DyWgFmuJbMGEihP8=
X-Google-Smtp-Source: ACcGV62Hg6+x8U1x+7PU4OaciT7CKW9l3MjayzO0DlJ3TcCRhUKDdFE+9bdBxUDnffLXV1iL6A9CPzT4oBFwJDk0Yr8=
X-Received: by 2002:a17:902:9a98:: with SMTP id
 w24-v6mr34766134plp.109.1539197412143; 
 Wed, 10 Oct 2018 11:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyKtrecZeAypPcjY7qi6rBqj_cPwPosFRds=wYpeHW8wA@mail.gmail.com>
 <9dc677b3c95c2bc7e7c5a11a97df49a7@linux.vnet.ibm.com>
 <CAO=notx9Sncg2w68Z=OTsMAWJtoyENc2KUZJfz-8vDCGhJ7afA@mail.gmail.com>
 <CAO=notwU5z2bb2C51s=8PEEuwgqUjNa3bctNH12P=GVmMaHkRw@mail.gmail.com>
In-Reply-To: <CAO=notwU5z2bb2C51s=8PEEuwgqUjNa3bctNH12P=GVmMaHkRw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 10 Oct 2018 11:50:00 -0700
Message-ID: <CAO=notzG9PMZTry+WHP1SJoxA2O=5GFGjGmCpMr3CiTWHgmD5g@mail.gmail.com>
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
X-List-Received-Date: Wed, 10 Oct 2018 18:50:15 -0000

On Wed, Oct 10, 2018 at 11:46 AM Patrick Venture <venture@google.com> wrote:
>
> On Wed, Oct 10, 2018 at 11:45 AM Patrick Venture <venture@google.com> wrote:
> >
> > On Wed, Oct 10, 2018 at 11:38 AM Matt Spinler
> > <mspinler@linux.vnet.ibm.com> wrote:
> > >
> > > On 2018-10-02 10:28, Patrick Venture wrote:
> > > > I've sent a bunch of recipe renames, but I'm still updating each with
> > > > an individual tested footer.  I will try marking them all as WIP now
> > > >
> > > > Patrick
> > >
> > >
> > > Hi Patrick,
> > >
> > > I think you broke master with these.  For example, the phosphor-rest
> > > recipe - it has a default url-config.json, and then a layer specific file gets
> > > applied from the meta-ibm layer, like:
> > >
> > > meta-ibm/recipes-phosphor/interfaces/phosphor-rest/url_config.json
> > >
> > > However, from the log.do_unpack from the phosphor-rest build, it doesn't
> > > look there, it now only looks in phosphor-rest%.  So any override directory without
> > > a % isn't being found.
> >
> > Interesting that the CI didn't catch the break since witherspoon is
> > one of the systems built via it.  But I'll take a look.
>
> Although I have had configuration files disappear when the wildcard is
> missing from the directory, the recipe normally complains about being
> unable to find the file.  For a file override, if there's already that
> file - presumably then it wouldn't complain.

I've fired off a witherspoon build locally from openbmc HEAD, and will
report back.  Very few of the recipes were updated in this fashion so
I'm not terribly worried about a general breakage.

>
> >
> > >
> > > I haven't looked to see what all is broken yet and in how many layers,
> > > at least our phosphor-rest and phosphor-gevent, which is why the web UI stopped
> > > working on witherspoon.  Not sure if any other systems are also having problems.
> > >
> > >
