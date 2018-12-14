Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iwrzfeiK"; 
 dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43GY1R5BRkzDqC9
 for <openbmc@lists.ozlabs.org>; Sat, 15 Dec 2018 01:32:59 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id e12so5561906otl.5
 for <openbmc@lists.ozlabs.org>; Fri, 14 Dec 2018 06:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e3ZMlF6J//aPiVemM0FnjZL6S/idhW4sF+MVh3ZLxkw=;
 b=iwrzfeiKNimQd8Q4EDr7NSWZQRVtvxs7ybZAg+YoAZJITO7JIGsoQ1IEhBiOy0T59j
 f3qbYpz8oVxrvgguBGU2mkob3VStVoxndvi/jkd+GMjT+P7EKLSH6CKKsbOia3pYynXz
 BY86Uo1StzfRBarWN1OSzV1hxC7yDGDJNat249d0/dXy8poY9149wx2yfOrejGFd92E5
 LsRUY6Pyk9SCrK8BqFO0l9XBJsgtsVlUAptyifuwWVDDBY1+yN0qT2mrpnXUOPXK2MFg
 q+ysAUYBpUi7Vl3kKGSGFLSwetCQV5MP9qfLU7T2ScrSY+BQBc/tOq3QzHnnr3VBRF6d
 h5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e3ZMlF6J//aPiVemM0FnjZL6S/idhW4sF+MVh3ZLxkw=;
 b=Wql1cnO0c8RKYHbLY+jNtZte05zEtwT0lKdTyn+pkcvNnsDRq0HtKMi62fGrXtxaU7
 tAKdHN/dPMk6Kc//YerhxWaKHE0kzSgVS4Tb5rLznqguDvdpIknalNJ8zkxiAEXAVQ29
 o45flkfitEZPzC2CzIp4NIgWf7xglRTT7EVyhWETlMBIGjcxxdp7mPQBa+noKtzWBA0j
 ciA6032qV5yvha3vXZ5AN4TIdOaIzHCjABtkJd2FDMB+ofrLcN0yC1j387CLx9IbJUQe
 5Mj6/K6vWOzSU+Cxl5BgF9QlGCCbAVc5vwXMUsk64ce7uYVD0+NUhA2e7cR83gRm1ncC
 h7fA==
X-Gm-Message-State: AA+aEWYDuCoGzUOpzW0xaRN3lgyMYoifeC/LtwwM4eJNqUVQ/K4k9ifO
 0OGGjXWuOrE/xHwJAnqgpcQYQB+dLu2rUYixnZQ=
X-Google-Smtp-Source: AFSGD/XAdacLb9nOPddJF+8Rxh7HkJgEqPm82h70XPNH9JnYfFIkMcukJVBSWpiuEeaYTV2JIAoA5Om/+zJomYapq/A=
X-Received: by 2002:a9d:71c9:: with SMTP id z9mr2308378otj.294.1544797977297; 
 Fri, 14 Dec 2018 06:32:57 -0800 (PST)
MIME-Version: 1.0
References: <CAEx7e2SGZWe5ba9=0rSFc1-ArS9uPDhn8oLFSZMT4ygX968t9w@mail.gmail.com>
 <CALLMt=r4nUdFHTNeiemhdM1zrRVt5-zc41mG2APBC-N2YO4TOQ@mail.gmail.com>
 <40db2dd4-a10e-901d-d652-473ef75649b7@andrewnesbit.org>
In-Reply-To: <40db2dd4-a10e-901d-d652-473ef75649b7@andrewnesbit.org>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 14 Dec 2018 08:32:41 -0600
Message-ID: <CALLMt=rgaTDEmuZQr0QmgbnosdqkFundRYu=wa_nMPXw1gJLbA@mail.gmail.com>
Subject: Re: OpenBMC Raspberry Pi
To: ullbeking@andrewnesbit.org
Cc: truongmd@gmail.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 14 Dec 2018 14:33:01 -0000

On Thu, Dec 13, 2018 at 9:56 AM Andrew Luke Nesbit
<ullbeking@andrewnesbit.org> wrote:
>
> On 13/12/2018 13:34, Andrew Geissler wrote:
> > On Mon, Oct 29, 2018 at 4:52 PM M. D. Truong <truongmd@gmail.com> wrote:
>
> [...]
>
> >> On a GitHub fork of OpenBMC code, sitting on the
> >> "raspberrypi-cm3" branch are some patches that will build a working
> >> distribution.
> >>
> >> https://github.com/truongmd/openbmc/tree/raspberrypi-cm3
> >
> > Hey My, this is great. Especially for people looking to get started
> > with OpenBMC. Raspberry pi's are easy to get and very
> > affordable.
>
> Yes, indeed this is fantastic!!  I have a spare RPi 3B+ plus a lot of
> accessories that I bought for a different project that never worked out.
>  Now I can try using this for OpenBMC, which is much more exciting to me
> anyway, than that other project was, and the people here are much nicer!
>
> > Any chance you were going to upstream these changes to
> > the OpenBMC project so we could have them officially in
> > the code base?
>
> Andrew, I've been gradually getting involved with OpenBMC at my own
> pace, and finally have a little more time than I did six months ago.  (I
> was ill over New Year, then I changed jobs, etc.  I've been very busy
> with other things than computers recently ;-)
>
> Please let me know if there's anything I can do to help.  I'd be happy
> to test, write docs, perform reproducible builds, and engineer
> infrastructure.

Hey Andrew, great to see the excitement for the project. I think for this
particular piece of work, what we really need is to take the commits
from the fork and start submitting them to the appropriate upstream
repositories within openbmc. With our recent meta- split into
individual repos, there will be some work to map those changes to
the right place.

>
> I'm a production engineer by profession (much like an SRE) and I am
> considering getting involved with the OpenBMC Infrastructure Workgroup.

The more the merrier, our next meeting will be 1/9/19!

>
> >> The README.md file has most of useful notes on building the code and
> >> bringing it up on a device. I'm looking for feedback on changes before
> >> pushing the code upstream. Features is a completely separate area for
> >> discussion.
>
> My RPi is the RPi 3B+.  Will this work out-of-the-box with your branch?
>
> >> This was a great learning experience and I hope it's useful for others.
>
> Congratulations on this great achievment!! :-)
>
> Deep down I'm a fan of Orange Pi, so if all goes well I will look into
> porting it to OPi :-)
>
> Kind regards,
>
> Andrew
> --
> OpenPGP key: EB28 0338 28B7 19DA DAB0  B193 D21D 996E 883B E5B9
