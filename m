Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::135; helo=mail-it1-x135.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gnWpUp1w"; 
 dkim-atps=neutral
Received: from mail-it1-x135.google.com (mail-it1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 442yMf3TyDzDqGX
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 19:53:49 +1100 (AEDT)
Received: by mail-it1-x135.google.com with SMTP id f10so15885856ita.4
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 00:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+qA4EOfQ6V174CHYJCsxUGdhui6FfFl6HDFpMitdrjk=;
 b=gnWpUp1wqfNYLzZ0wXU6ThGVK0Lvy8s+/62FL9mOlugfOrxVCMC6mFyMUege1Ouj0l
 8A+FjXg29dV6cB+1+8ciEfiFcbe8Z/z+K9CG5xdGba8V+WA4+faP1cRs7H+L6fUTg6Vn
 EH3nfq60Js3tNqpDmBcpSR6mzTlWFVBgVQvAkNUgwCoBELWd9gtxV6OPue6hV546b4OU
 HBkwOnM77oEPd0QSZmsK/BFTaQw0bUFgBbTQ0CU1RndOhx1T9vHgZWEhuufP186jecgZ
 AhDUbQo9IeMKzYY/ukX+F/r0bSuIjX+2azKM6s0530X+zSPJCB04RWOs/KB4adg7waXH
 jz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+qA4EOfQ6V174CHYJCsxUGdhui6FfFl6HDFpMitdrjk=;
 b=De2eA9G5U81qpg0AzJvRY+NHBs+b4OuXangmpzV3pFYYda4foWY5yQ6nHmOJvXDhFL
 o8Ht0lvhv6cm2vDSd9AODvG1qihuJYO/9T8T9T3wlApTaxA9LbPGMy0h8h7zf3Joldrq
 kOJgxK5pGOMpTOR0sJ+DJRVIgON06Ud8LKfFHlEImsphRQ2uCPtoEZlKlSQFVUTETjMk
 Y+zHBxNGF37f8cry44fOV6GghosEHCg3C/NotNiasgcrKdpr0asFHSGZDiY94pir9M3S
 xRmM8M201eLQBNHiFGHq8418hdVR+SvuAr4M03BUKOmh2X5KO9pFmznZj8N5mGTfpslI
 2rbQ==
X-Gm-Message-State: AHQUAua0/Og4lw+4iKMiNwIvfX6UXyWLPsFFr80fIgFnaQELkn1e/05R
 L7MP1hXCpQ36XmRfl7r7zDG9C7QBDuci9fJ8QOIMDIOO
X-Google-Smtp-Source: AHgI3IaYdoaTkVuMchn9u+QZtFdF9G0r1K3z6vWdhoE7spzYetj3dvs1SRjD6uD5QDYBhFz3wTHs40dPu8ayNOpgxME=
X-Received: by 2002:a6b:8d55:: with SMTP id p82mr12778524iod.171.1550480027596; 
 Mon, 18 Feb 2019 00:53:47 -0800 (PST)
MIME-Version: 1.0
References: <06f35a3e-2d73-f973-8a45-fd38282fd1ed@gmail.com>
 <CAARXrtmRpsTEQAWdBEvXTxvzOwAJ7RoHqGWdcA66NPUii9AZBw@mail.gmail.com>
In-Reply-To: <CAARXrtmRpsTEQAWdBEvXTxvzOwAJ7RoHqGWdcA66NPUii9AZBw@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 18 Feb 2019 16:53:29 +0800
Message-ID: <CAARXrtmh6DtangQEMohT1C5BEy3bdMkZd6cLRnJcBez=eXs4kg@mail.gmail.com>
Subject: Re: 2.6 Release announcement
To: krtaylor <kurt.r.taylor@gmail.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 18 Feb 2019 08:53:51 -0000

It turns out that 2.6.0 tag is on `thud` branch instead of master:

    $ git branch -a --contains tags/2.6.0
      remotes/origin/thud

Hopefully, we could fix this.

On Mon, Feb 18, 2019 at 4:48 PM Lei YU <mine260309@gmail.com> wrote:
>
> Hi Brad, Kurt,
>
> The 2.6.0 tag is a bit weird, that `git describe` does not correctly get the
> latest tag:
>
>     $ git describe
>     2.6.0-rc1-242-g073a600a0
>
> This results in `/etc/os-release` to report the build is not from the 2.6.0
> tag but from 2.6.0-rc1.
>
> Some investigations:
>
> * Both `git describe --tags` and `git describe --abbrev=0 --tags` shows the
> latest tag is `2.6.0-rc1`:
>
>     $ git describe --tags
>     2.6.0-rc1-242-g073a600a0
>     $ git describe --abbrev=0 --tags
>     2.6.0-rc1
>
> * The only way to get the latest tag is with below command:
>
>     $ git describe --tags $(git rev-list --tags --max-count=1)
>     2.6.0
>
> * It indicates that the tag 2.6.0 is not on the master branch.
>
>     $ git branch --contains tags/2.6.0
>
>     $ git branch --contains tags/2.6.0-rc1
>     * master
>
> Could you help to check and hopefully fix this?
>
> Thanks!
>
> On Sat, Feb 16, 2019 at 2:44 AM krtaylor <kurt.r.taylor@gmail.com> wrote:
> >
> > I have not been successful (yet) in trying to get access to our
> > openbmc.org website for adding things like announcements. So, I created
> > a quick release announcement on my personal blog to spread the great
> > news about all the hard work that went into this release!
> >
> > http://www.kurttaylor.com/blog/2019/02/openbmc-2-6-release/
> > or
> > https://twitter.com/kurtrtaylor/status/1096473964350791681
> >
> > Kurt Taylor (krtaylor)
> >
