Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::232; helo=mail-qt0-x232.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SAVEQRPj"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="iv0Ps0Aj"; 
 dkim-atps=neutral
Received: from mail-qt0-x232.google.com (mail-qt0-x232.google.com
 [IPv6:2607:f8b0:400d:c0d::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wklz1Ws9zDrbH
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 18:49:02 +1000 (AEST)
Received: by mail-qt0-x232.google.com with SMTP id m5-v6so22270048qti.1
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 01:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=fY3hELR06uAIE5EqdzSThNWvaTbGnfJU1gdKN+CwH/4=;
 b=SAVEQRPjXBI91oiIyPoNMjxMI4dBgkJxi0KV+d+hBlm/7PGykvHDoP2n23AVZyHMiw
 8ljkaXmj0Z7BbZGrNLsZ/m6Fl4hpmcu2rBDbQWZjUX1+qKwqQ7kf1fCzQ8HO10Mmm4Ew
 iHol8Jgl7Ex//RAJEz5vPMal9lihLOfvEJM/WYSd5a+Cr2HtQt8wSi3YWp+yQMTyJaft
 KdwflFBNJvBkKASrjkqNgzQG8hKQwx2t6+pAUzgiTmHsVkvYsKetcHYHnr7449mfcc8i
 EITCwXNNfa8vYEie8fLsSJpD68e13h+Ig1crtexMYnCdmuFJN2nTdUKKGMI3nA+QxFcb
 KQAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=fY3hELR06uAIE5EqdzSThNWvaTbGnfJU1gdKN+CwH/4=;
 b=iv0Ps0AjKphl/XWXG5z31IprmsDvCt+EjrMQF7ET0o4JiWXOv11vpNuug0zXMx5hOP
 xFxY9yLaIW5n8gX5IZ0+A4jiYm9ffdhp5eeTL2GsOdH+CktlPi1DxwqAn27YWiJ5nwS+
 osMnrycR7CV1nosfiiPwnBJIVnmPibWY44+Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=fY3hELR06uAIE5EqdzSThNWvaTbGnfJU1gdKN+CwH/4=;
 b=HOjnSqHofDvG2vUXlxuIv8jZG0lxyantgMJ0lLs0GRHbTLG3o/BvsT+XaUhiYs1Vu+
 Tyav9y+esl8a3GsXbivTkGOq2NDJ2FB6ERalpox0fEhEIXo8qgPnkx2Bt9ZXTRRelcXS
 VEsSdwwMmsrjdBTFk9LmQrZCUyIHveX5Ve56tRH1ucthGgI/nGwVPjWVFIc/MYW/hJkD
 KnrQr0J0dEFF14iW1zd9JXhS6ARWgmJCFzzzob08XFW2DdAa0Koakk3+0NvcVmxkm+hm
 nWMQJLUDcd/5aLPrTQfu+R6I/jdrtJOkdA5aHQW+TGknpDFbVu/8o4mObI0Oocxx8fZu
 TiXw==
X-Gm-Message-State: APt69E3w5A96S96fDlICEmtvigLB8V/LOr+fvMf+jejjiSd8ZxIoJcOO
 cDeuQhRJaHwMq/2eWF3UWEy9o4sWYNbQ5NcBEQw=
X-Google-Smtp-Source: ADUXVKJTrCGmM/Nkq8IHBMJhKJMlA0cs5wFW4PYptJy0XkuBrkgk1+/XSTbWUZH/tP0OF/AsPRSRgctYjsamMAFFEk0=
X-Received: by 2002:ac8:65c6:: with SMTP id
 t6-v6mr1633068qto.347.1527670140109; 
 Wed, 30 May 2018 01:49:00 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Wed, 30 May 2018 01:48:39
 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 30 May 2018 18:18:39 +0930
X-Google-Sender-Auth: JqPGUOSVMcztYMv7OtpFCku3Srk
Message-ID: <CACPK8XfTDqprASF==8wjeH+KnpECiJHrSiQ9ugYuBEe+RM4tgw@mail.gmail.com>
Subject: Re: Linux kenrel: Moving to a 4.17 base
To: Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2018 08:49:04 -0000

Hello Tao,

On 30 May 2018 at 17:57, Tao Ren <taoren@fb.com> wrote:
> This is great news! I'm from Facebook OpenBMC team, and I'm working on enabling your Linux tree in Facebook OpenBMC and later contributing fixes back to the community.

Thank you for the feedback.

> I found a lot of good documents about how to contribute code, but I cannot find information regarding branching strategy and release timeline. For example,
>
> 1) what are the major reasons/factors to trigger the version upgrade (4.10 to 4.13 and then 4.17)?
>
> 2) Are we planning to keep OpenBMC linux kernel in-sync with Torvalds's tree or linux stable tree?
>
> 3) Since we are discussing OpenBMC release schedule in another thread, I'm curious how to align linux tree with OpenBMC release schedule? For example, creating tags for OpenBMC releases?

Last year I came up with a development process that aimed for very
regular rebasing on upstream:

 https://github.com/openbmc/linux/wiki/DevelopmentProcess#openbmc-kernel-maintainer

This was optimistic. In practice, I've not had the time to do this as
often as I would like. We have spent a lot of effort in the past year
on is getting code upstream, so that moving to a new base is as easy
as possible.

I would like to propose we try to move to the new kernel base as
mainline makes a new release. This would mean a three monthly cadence,
with the trigger being the tagging of the final release.

By keeping in sync with upstream, we will have community support from
the stable tree. I will merge these point releases (the z in x.y.z, eg
4.17.z) in as they are released.

My goal is to have OpenBMC products shipping mainline kernels with no
further patches. We are very close to this goal for OpenPower Power9
machines, and I look forward to supporting other platforms achieve
this too.

A non-goal is to maintain a long-lived stable tree, as this takes time
away from the first goal.

Cheers,

Joel
