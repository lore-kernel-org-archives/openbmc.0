Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="WmSqxJ4N"; 
 dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44PLMJ1JDlzDqDQ
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 17:57:15 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id h39so1340291qte.2
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 23:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=zQ3nOmhvHPRgOegrn7lX1/ohQ0ZE0tJLny/Ck1fqt7M=;
 b=WmSqxJ4Nd+r43Wy6syPAFfioR9VttkCY3akEnnVO2u3bM6sn62JKJUupF4L6lqh8/O
 RO7DAqFvNoWsDzzEvE5yMW+gbaTkjcIqmSzT3WkYetfasZchKI7MzyDrkWVXJatKoVgW
 Bj2Y5+UJTmoU6f0VsWWwz8wVFYkdHCRYzEorc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=zQ3nOmhvHPRgOegrn7lX1/ohQ0ZE0tJLny/Ck1fqt7M=;
 b=epbPUCgIgY/mtUFI/4Cw9MEx1ryCQbtYst3nNVoB9AECmNXxSY9k5Wu5aMmEfi+zLT
 WLZCOKU3TAVeRZxtEzRoBpd7DLREkbXDvMkZZ6f0luTPe932hftMH3kSRnMXqDFFp6ie
 4CpcU+/ohS4CkQk2y5gTfTxKpsgFt63Q0Blx07kZBH8KorhfPJwPjteMGjcU3z2sffNi
 Y/ONwyi0SLCQ6UhGQ2Yp2ZeYyzcjL385L6bekhanVFV5nBl498PROoliGUyK4C7g3XeA
 w1qMLH9OvZb2elBYxQOaaT7e+eTxyTkBl7wex7aSZmaSVOOtGaVO1myw+rJx19uyBows
 4fGQ==
X-Gm-Message-State: APjAAAVDenmZW23ka6LzT+49mO94ZBeeJXzLOPpsKfiR8896e95dal6u
 c1TAMH3Nywjx7xim8zMbFLyR4IHxCsQPv5b5IBE=
X-Google-Smtp-Source: APXvYqz25tR/cPIkWb5fXx1zxrVJEn0PSOcnPxbVAHAunepOXLMcIoUzgb0A9YJOAvIiMx6eFvRrlY0Iw7SBl96Y/co=
X-Received: by 2002:aed:3641:: with SMTP id e59mr5460445qtb.235.1553065030938; 
 Tue, 19 Mar 2019 23:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XdnESPUxPqX005x64sCehJTPyBw9vnCyHk7UP8vMrz1vg@mail.gmail.com>
 <819d0ff4-7ed5-8527-bd92-1ff468f699ed@linux.intel.com>
In-Reply-To: <819d0ff4-7ed5-8527-bd92-1ff468f699ed@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 20 Mar 2019 06:56:59 +0000
Message-ID: <CACPK8XdkV=n6WRZXQv3OX=F=AVUhy2ULjCT_ceU3eCc9DahOMQ@mail.gmail.com>
Subject: Re: Moving to Linux Kernel 5.0
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Tao Ren <taoren@fb.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 20 Mar 2019 06:57:17 -0000

On Mon, 18 Mar 2019 at 22:29, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> > It's been a few releases since we bumped, so I'm going to publish a
> > 5.0 based tree this week. I've done some testing on the machine I have
> > (OpenPower Romulus ast2500) and it looks good.
> >
> > I'll be rebasing without discarding patches for this release. That
> > means if you have non-mainline patches it will still be there for
> > dev-5.0. Next release we will do a cleanout, so please ensure your out
> > of tree patches are on the upstream lists for 5.2 now.
> >
> I see the out of tree PECI patches are still in dev-5.0. Thanks much
> for rebasing it while you make the kernel update. I checked that
> dev-5.0 kernel works well in my machine.
>
> Again, thanks for your effort!

Thanks for the kind words Tao and Jae.

I've done some further testing on Palmetto (ast2400) as well as
Romulus, and with Jae's testing I think it looks good to go. I have
pushed the dev-5.0 branch to openbmc github, and submitted a patch to
Gerrit to move us to this new base:

 https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/19335

The 4.19 tree is now closed. Please address future patches to the 5.0 tree.

Cheers,

Joel
