Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XnxGm9+7"; 
 dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428CZK3T4RzF3HX
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 02:05:45 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id f1-v6so9948917plt.4
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 09:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xK10lsdfbQwSJh68p7/x5kvFfJtTr8NU4J+Nf+ynnag=;
 b=XnxGm9+7jLDzIfnXqGQmd+I3Ts9ih+Grwt0shh6Hgt4CjGIcP3ppSJoKt5yJGeriBn
 Bs8mARQUB9ZxEY/odgQS1494NC4AC6drIfyxkfSPfkG4n84KxxD37w85MT2sHfl0XImx
 KJC5dRoioTaRDW033Y/6U8+3d0/kOBySEfNz6nWUT9hmUlzT6RjVlf9xDFPgoLj9RJhn
 FkJArxYpD9BV+HfKVl9bJa28D/EcQZiaBLT/VoV9OoqRPmqD0OyHH33PNavn9UUtylrL
 ybtkGAgjuvPcm77fmEjU8hhd7v6GM1R9R7JScAKC7kx3aVW3lFs6zsJWK12d4pPYZcnB
 aASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xK10lsdfbQwSJh68p7/x5kvFfJtTr8NU4J+Nf+ynnag=;
 b=tNDctmTCGhy3dbCF7KJGtf2QIeFO9JCw1PLpV17NR8qZ0RrZVh7J6AXmmn9bI/kX73
 XXDPZfbeWD5sWwungWI3nw00DxtVd2n0rChOx0frLD7jPVf/vMAVLf48uoDrh+XCujuH
 6kf7E5KBxINVSWCMEXIJiMCWk6VaKljIMIFtI3kzJzajve89WZhj0KrS4AAZHpqH+21R
 aBqHluC8CgjUN/TVuznYSA5ihRejuKsCsJ2IHbl7P60rMoCHbz1rUVwmObelKfz6Qd/B
 v4IgpHjdUZ3HZG7DNWZee1DWMhExcPs60BTK3Xv52RID5/SmWnS9GrkfWf1ARz6KZ1xv
 H9KQ==
X-Gm-Message-State: APzg51Bk6I31ohhENWU6AGYoC4B+KxPBAVgERqss+lFG5DhLY9cBxhhX
 NMH3TQPpKMuUJGYFsGQg5PHm4NU14TaEX/mJjPikvw==
X-Google-Smtp-Source: ANB0VdbtEY9Pk5mSVjP2ax3DMPqIH+DUClWW7bKJlfgasj/TMzQdabDwyeHfQDXcqOhRMXWBHJxgcBpm/PSlRi4j6NA=
X-Received: by 2002:a17:902:9a82:: with SMTP id
 w2-v6mr6328207plp.109.1536595543074; 
 Mon, 10 Sep 2018 09:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxW6Yq+uct7quRtNjFfp0DeyrsqXuYJh1uuBx-cDEa_MQ@mail.gmail.com>
 <5D7FB144-D237-41CF-B911-CB2A9818A91A@fuzziesquirrel.com>
In-Reply-To: <5D7FB144-D237-41CF-B911-CB2A9818A91A@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 10 Sep 2018 09:05:31 -0700
Message-ID: <CAO=notxDMD=CokqnGPUg6uw9Py9WuTLA70di8EU0XSCcUkN_bg@mail.gmail.com>
Subject: Re: tiny package --
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2018 16:05:46 -0000

On Mon, Sep 10, 2018 at 5:39 AM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
> > On Sep 8, 2018, at 12:01 PM, Patrick Venture <venture@google.com> wrote=
:
> >
> > Brad;
> >
> > I was looking at publishing a single-header file from a package
> > containing only that header file.  In this case, "oemgoogle.hpp" into
> > the same place that phosphor-host-ipmid installs its headers so that
> > any google-ipmi-* packages could store their OEM numbers in one file
> > (upstream).
> >
> > Downstream we store that file in our phosphor-host-ipmid mirror.
> >
> > The advice I seek is -- it doesn't seem worth creating a separate
> > repository for one file, but I know it's a frowned upon practice to
> > store code in the bitbake repository -- but in this case, I feel like
> > it may be appropriate.  Does that make sense?
>
> Obviously it will work just fine but I probably wouldn=E2=80=99t allow it=
 in
> the IBM or phosphor layers, out of fear of it being used as a counter
> example or justification for a future change that isn=E2=80=99t quite so =
harmless.
> But it is truly _your_ layer, so you can do whatever you want.
>
> >
> > I'm thinking:
> > meta-google/recipes-google/ipmi/google-ipmi-header.bb
> > meta-google/recipes-google/ipmi/google-ipmi-header/configure.ac
> > meta-google/recipes-google/ipmi/google-ipmi-header/Makefile.am
> > meta-google/recipes-google/ipmi/google-ipmi-header/oemgoogle.hpp
> >
> > Patrick
>
> Why is the number hardcoded at all?  Could it be a configure option or
> command line option?

I could definitely add the number to each daemon or library, however
having a single source of the numbers is valuable to avoid accidental
collisions.

>
> If those don=E2=80=99t work, as a fall-back can we just put the header in=
 the
> upstream phosphor-host-ipmid repository as you=E2=80=99ve done downstream=
?

I started with this approach and it was rejected by the maintainers,
because the numbers reserved for Google code (even shared upstream)
"didn't belong" in phosphor-host-ipmid.

>
> My two cents is that one of these three options would be simpler.

I agree that having the header file just in phosphor-host-ipmid would
be easier, and I'd like to do effectively that (I'd really really
rather just do that exact thing).  Having a single file to point to is
a nice solution.  I'm working on upstreaming more Google-"only" code
for others.  I imagine, some of it will stay Google-only, while others
will get phosphor-ized over time.  It's difficult to know what today
you'll really need tomorrow.  And if nobody ever uses something but
us, I still would rather the world have a chance to use it or comment
on it, or improve it.

>
> -brad
