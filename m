Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ngf43e/y"; 
 dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 421Ysh68m0zF2vT
 for <openbmc@lists.ozlabs.org>; Fri, 31 Aug 2018 06:26:00 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id b12-v6so4340035plr.8
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 13:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sGqZnUrtXb5iSdMxmltFXzoFPX1D3IG8telGMNzN5QE=;
 b=Ngf43e/yFhB3HIOMJ7Z5s4HzMppNx2Hvj9w8ZK9WuLhIm545JUJjcgDn/O0b5jK1Rx
 xqAMBFM1tnDyVb/cShr4yRd7iPueeD40330lF39QfaYd0NhZx42e0+tLO/GVpihW7D2Y
 wIHbp1Mu7Kvf7HTkTSBvCgbhILThr/XK7i+DcfhMwjya+oFM87P3WeII4csf4Ygo2wTB
 7rHRP3lSWPrl3gzK9+i/qxG7VEPwHfGo9Ea/iZrb/Pl1gqK8PQ1+kJ0v+SVj5DVXElEJ
 gJDstUuduj3XFlWN7eIYJI1e648bi4SeaDtEKfSb1yMhMTg+w6aeXUJhfvncVtba+wOw
 9seQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sGqZnUrtXb5iSdMxmltFXzoFPX1D3IG8telGMNzN5QE=;
 b=rZ34qTNfSFQgVQjNPKUBoPbE2Vk0+rDdQMDwhNcnopHpVgkWKsY3JiUTE5nJznkpID
 jLDWyQ4g5gAdJwwkO07TZmtA0l5Vlyrl/j21roy8Z4Y94jSme0sy8RQe9hnDyQ/jyJy5
 t/aZoZVdrypXVWQkoC8lyu+gOwvAgLVnBpMWrdGS0PFl/eEBpREnSArYdIPWA2oHxgLL
 bIeq6buF2UXz4lLzDrQxY1OdTAF1mlLc5rm8rJkmILGvcCurWBJt+QjP3YBeyjhKn5IN
 BMUGemtssIbVdbN2WUgNlZn58+B5Ke0e72MwD2rwdGAs5fZptUCW9b50aXrhVf5Pqul0
 Fpcg==
X-Gm-Message-State: APzg51DF1FePT+ctogkV/iPm2qe33HrQbGxsNpJdGGULzhS1RhFlhJ+l
 1G20yZ1snT4ToFE2BiP5c36U/FZgs4Pgo9EQ3VXBzm8H+8c=
X-Google-Smtp-Source: ANB0VdZ3jVLBMGuUXy5QaM0NRIaAC6jeBUoaUsTm5q0/s6Ut87gVL065rk4dRrwqYgIdlKYkZnuoLfpPtnYp36KJuGk=
X-Received: by 2002:a17:902:9a06:: with SMTP id
 v6-v6mr11831442plp.316.1535660758677; 
 Thu, 30 Aug 2018 13:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=XaO=t=UuSDjcgZ=Nkh9J7vTQJPEAMG5=_Ca7ukRVekA@mail.gmail.com>
 <CAO=notxjAAF0w70yrmFffNQchEmdcexWjAt9xftiwaRw6-aM7Q@mail.gmail.com>
 <CAARXrt=fojNyiYiZn2qC+8O9nw9AvjT7ux4vtFP9cf4m7GM0Qw@mail.gmail.com>
 <CAO=notzau4N3HLTyGy0YpUBNXy8UvV+8DBN4xQN_yEJ_5wFT=A@mail.gmail.com>
In-Reply-To: <CAO=notzau4N3HLTyGy0YpUBNXy8UvV+8DBN4xQN_yEJ_5wFT=A@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 30 Aug 2018 13:25:47 -0700
Message-ID: <CAO=notyKPdWUmo+rmaqEF8UgWOdr9q1nidQugxaS2xFt5DpnXA@mail.gmail.com>
Subject: Re: Feature request in phosphor-pid-control
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 30 Aug 2018 20:26:02 -0000

On Thu, Aug 30, 2018 at 1:17 PM Patrick Venture <venture@google.com> wrote:
>
> On Thu, Jun 14, 2018 at 7:21 PM Lei YU <mine260309@gmail.com> wrote:
> >
> > > So, this change really is just, "don't fail if you can't find the
> > > sensor during start-up, and keep trying until it shows up"
> > >
> > > Does that follow?
> >
> > Pretty much close.
> > More like "in any case, don't fail if you can't find the the sensor, and keep
> > trying".
> > Note this is applicable to sensors that are unavailable.
> >
> > For sensors that are expected to be treated as fault, it should trigger
> > failsafe, and this is discussed in Ed's mail.
> >
> > Putting it together, the feature request is splitted:
> > 1. For sensors without operation status, we can config them as optional, so
> >    they do not trigger failsafe;
> > 2. For sensors with operation status, do not trigger failsafe if it is
> >    unavailable; trigger failsafe if it is fault.
>
> Just bumping this back to the top of my list.  I don't know that I'll
> have to time to restructure the initialization of sensors until a few
> weeks from now.  However, I'm bumping this now because I'm doing some
> phosphor-pid-control work again and it's a good time to think about
> these features -- since I'm already cracking it open.

https://github.com/openbmc/phosphor-pid-control/issues/2
