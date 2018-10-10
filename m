Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Io2mVw4G"; 
 dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Vjkg3X2SzF110
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 05:47:07 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id r64-v6so3060830pfb.13
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 11:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zliP6NDUF0V+oTAz7udhAUjZDWvW7rM4SaIj2xYAhRA=;
 b=Io2mVw4GE5xlG3VJUEtKigo7sinjNfOojGqgzJDYHRckiuKDxKzXmmsZd6jNd58ASZ
 pPHmQyFbfPI7k8RLkk0+EFaJW0CPQm7hcNn/YuJqKzY2MS/vywSatw+wRqHPluPiD2Gy
 Kqu+MwYLlEsyUQeOduH+qjd4APBndodYnaIYvoIcWH6kcz34F8Fb7KHpef75by4aB6iU
 3+pz9crUR0XMuJ/3Gr8uznHAOJ6GfWgkHpifbFzm3oBvPWMinVA6muTZEZJ6Yyy2y/Lh
 dtGapHft+/CERwZiiCUi1JkPUmJHWxv79HuFpRhSDeqf7YccKwYACGNfUn7F3LmC9SUz
 HlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zliP6NDUF0V+oTAz7udhAUjZDWvW7rM4SaIj2xYAhRA=;
 b=EKIbMOH72zItaiQI0IFWi8SougvyMnlA91iEBhDcCa3cZUZdMSas8Aw0Wq71FIdItI
 8pm8Hruvy8Z69U9W6LzTdPfJIZsWIQsCjWPpPWD8dsNGg4yOllkkEigcVt38xxX1vqEs
 TsYWYuGTtdYtCc32p9DdOHS35UXf52rs1AVOTz7Hkru8tM/+Ks2w159k2JcCfaGjIWhL
 9UU23kEvfNZoqT2i7AbKYdm3ouCuLgtTmxlmXcSNsZ66Deuy2ge3YSdDZU1Py+aJtytq
 Tp46w97YnH8sAFw1iRSBHneupT+Iy2dwTlZqNABB+AR0Ta6k8VhOMK/dUX0DERUv8MnV
 yLPg==
X-Gm-Message-State: ABuFfogYiuZg20FoYrdEw6MGnepwygi93CsNv0cn0SxLjhZufJgstw6T
 gHdnyzKbmwiDD8cDZ/N1keshssmLviEyiJaZTKwHwA==
X-Google-Smtp-Source: ACcGV62im9Kl8YuiFt9QYs9Qm3KjXc83QA5bM5y6Lugijg8qopdmkrazuIQHWcxQqgcBZVLl9IrWwoOehy/JLHK7694=
X-Received: by 2002:a63:e818:: with SMTP id
 s24-v6mr29608038pgh.90.1539197225195; 
 Wed, 10 Oct 2018 11:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyKtrecZeAypPcjY7qi6rBqj_cPwPosFRds=wYpeHW8wA@mail.gmail.com>
 <9dc677b3c95c2bc7e7c5a11a97df49a7@linux.vnet.ibm.com>
 <CAO=notx9Sncg2w68Z=OTsMAWJtoyENc2KUZJfz-8vDCGhJ7afA@mail.gmail.com>
In-Reply-To: <CAO=notx9Sncg2w68Z=OTsMAWJtoyENc2KUZJfz-8vDCGhJ7afA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 10 Oct 2018 11:46:53 -0700
Message-ID: <CAO=notwU5z2bb2C51s=8PEEuwgqUjNa3bctNH12P=GVmMaHkRw@mail.gmail.com>
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
X-List-Received-Date: Wed, 10 Oct 2018 18:47:07 -0000

On Wed, Oct 10, 2018 at 11:45 AM Patrick Venture <venture@google.com> wrote:
>
> On Wed, Oct 10, 2018 at 11:38 AM Matt Spinler
> <mspinler@linux.vnet.ibm.com> wrote:
> >
> > On 2018-10-02 10:28, Patrick Venture wrote:
> > > I've sent a bunch of recipe renames, but I'm still updating each with
> > > an individual tested footer.  I will try marking them all as WIP now
> > >
> > > Patrick
> >
> >
> > Hi Patrick,
> >
> > I think you broke master with these.  For example, the phosphor-rest
> > recipe - it has a default url-config.json, and then a layer specific file gets
> > applied from the meta-ibm layer, like:
> >
> > meta-ibm/recipes-phosphor/interfaces/phosphor-rest/url_config.json
> >
> > However, from the log.do_unpack from the phosphor-rest build, it doesn't
> > look there, it now only looks in phosphor-rest%.  So any override directory without
> > a % isn't being found.
>
> Interesting that the CI didn't catch the break since witherspoon is
> one of the systems built via it.  But I'll take a look.

Although I have had configuration files disappear when the wildcard is
missing from the directory, the recipe normally complains about being
unable to find the file.  For a file override, if there's already that
file - presumably then it wouldn't complain.

>
> >
> > I haven't looked to see what all is broken yet and in how many layers,
> > at least our phosphor-rest and phosphor-gevent, which is why the web UI stopped
> > working on witherspoon.  Not sure if any other systems are also having problems.
> >
> >
