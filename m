Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bvPIzixt"; 
 dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42mnWQ1CCVzF37D
 for <openbmc@lists.ozlabs.org>; Sat,  3 Nov 2018 03:26:09 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id o14-v6so1195132pgv.7
 for <openbmc@lists.ozlabs.org>; Fri, 02 Nov 2018 09:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l8en79qvJ0ML2MZ6ztZ3DTWEW/aSzlvoaWti9xkf1/U=;
 b=bvPIzixtlUNyBoHAR017Lf+9JCc5iMZ0BppntBBR10aCOSz4PZTxzBvh1ttwD44qpR
 Dz+uJ/OGdjYJHt6SFOwppWlEzTWKiuNko+l5oqPsCqEjNAS2SUpn95OU8/jrLOHSvZRv
 g0eQ2KT9jnB/LjyD04ed7LS86DkWnQzfo8YGlCAHMeMtEZr4unKHqxOz8jV6nEI42BYo
 yQUoZ1d3j+RooTc4ChgsflLN6RsSbmgM5N1Of6HEsspOv1Xw1Z7i9J1WiHmOuRkLi/94
 wswDz6SN0B+cnzTrY+Ebt6+FV0sUGVx/cmMJQd5cUzWQkwECU3bP6x0hDUTvem4k52Hb
 xW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l8en79qvJ0ML2MZ6ztZ3DTWEW/aSzlvoaWti9xkf1/U=;
 b=DGPwvwSB78I5Bg+t+db4F8F4SFHH1cnFTUIi1YlWmSRjTjzOa7sCVm7KJVv+UDMHih
 v1LP+BW10iqb7itfHa44frkucgTU6nq1iK5YzBp19M4nrzjXYiSZTJu5G1TcP2Brjp/4
 gNq4zozrDDUBFS1Y2hhexl+yEwA1BCSekOdND7hwqYE+6AS9QHw4ssqmAcZRKuqV2KJ2
 Dwrqg/FNRU+gF0gtLSPLiJ1lCe5yoptwvuKAEBBQkWJ7HhK0Hw2UWIzruECuQYnp7j6K
 +101HURUZsJ8bN8a9nM/o6tVcwA8/lSVKOFlIrWnUzB0fSd0LlvkcUx+valTBsBp5lEq
 OCpQ==
X-Gm-Message-State: AGRZ1gLYCtRKG4vx6ug2myb5qOxDnXm0mhDv0LEpWuzzyqqElKGfo7cJ
 /xN+iIs3hO5QaIPxh2BTSCZY2FWEYmRw+N/d9AM8Ig==
X-Google-Smtp-Source: AJdET5eHG4MJfq3m3ESY3bvNRTthMeI002J+k49g4/ef79W4TbzetwwLHo4tdgqG6S9YAIhsnzLcpjqRZ5weEtjTndc=
X-Received: by 2002:a62:9f90:: with SMTP id
 v16-v6mr12459841pfk.207.1541175967033; 
 Fri, 02 Nov 2018 09:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notx84Tdf4VPZ1pBHpDtvjmUgtDDVqYJRKpkJLyCpNQD35A@mail.gmail.com>
 <F617D21F-D401-48DC-864C-811280521390@fuzziesquirrel.com>
In-Reply-To: <F617D21F-D401-48DC-864C-811280521390@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 2 Nov 2018 09:25:55 -0700
Message-ID: <CAO=notzO2+KpRpTk9stxs=7r+ZXYMugEnCodSKZCkBqS6hBO5w@mail.gmail.com>
Subject: Re: The Great Recipe Rename of 2018
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Fri, 02 Nov 2018 16:26:11 -0000

On Fri, Nov 2, 2018 at 2:26 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> Hi Patrick
>
> > On Oct 26, 2018, at 1:13 PM, Patrick Venture <venture@google.com> wrote:
> >
> > The great recipe rename of 2018 is nearly at an end.  If you're a
> > downstream maintainer like myself, when you rebase onto this you'll
> > have quite a few local items to fix.  For any recipe that is bbappend
> > on a git recipe, you can use the version wildcard approach to solve
> > the mismatch "recipe_%.bbappend"
> >
> > At this point, I haven't touched a few recipes:
> > meta-openpower/recipes-bsp/pdbg/pdbg_1.0.bb <-- versioned, so ok.
> > meta-phosphor/recipes-devtools/iotools/iotools_1.6.bb <-- versioned, so ok.
> >
> > And I haven't yet addressed a recipe inclusing the skiboot.inc for its
> > source***I may still do this.
> >
> > Patrick
>
> Just wanted to say thanks for helping to get these fixed up properly!

No problem.

Currently only two patches remain.  One should be fine to merge, the
other.  IF anyone has any ideas -- if I change the PV to some things,
and not others, the PERLVERSION for that recipe gets set to None and
the build fails. I played around with it and it's weird.  The fact
that PV is a human way to shorten PERLVERSION is, I think, a red
herring, ...

https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/14986

>
> -brad
