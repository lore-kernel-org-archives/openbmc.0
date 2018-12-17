Return-Path: <truongmd@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::341; helo=mail-ot1-x341.google.com;
 envelope-from=truongmd@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XGQZezjs"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Jd1T2zQ3zDqgB
 for <openbmc@lists.ozlabs.org>; Tue, 18 Dec 2018 10:40:10 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id f18so13900298otl.11
 for <openbmc@lists.ozlabs.org>; Mon, 17 Dec 2018 15:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UefExtctvJOCJfRwc4lz1bk5PYQ0Ikpk2pZxDYaRGOM=;
 b=XGQZezjsOD/LLLdGmCGWaasIVkLSg8v6VtBSf3/kE/LAUZdyqLqHi3uihCcmzfPTYE
 41+/6NwTD7PVqQ94cbCVPJr33L2MesK9dFlBqPry+pcKokldxiIgEBUKvSOlWmsZNSTu
 niQURl71kZcZij/7B5r0gALnWVFOjV5T1rOatEvsoajm7xjT1cZfVmrXAsgVQIa+sl9M
 uJamyb5/+G2MsZ8Uqw9wKITPIxBXYpx40Ly/IVsXqFPa8R5CyMVTHNOfB0ukNePXNpWT
 wajq4RubDaKldnAkMk8863UlIPPQ6DSf7ohdSR/SeB9I18SKjV348/Gr5ipexQZUprUm
 TRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UefExtctvJOCJfRwc4lz1bk5PYQ0Ikpk2pZxDYaRGOM=;
 b=EAHDvbCT7/1RD+4IeN5F+jkaeSs68QNliLERc9HkoSf4MmnkCNeeyybeidQ92WZ/NA
 s+6oqInBeVYxX3S73dabkNp95HtRYpVUhBrz9xKoLjuH7mG0btWBrmy8bO5IiT9Ygm0w
 Y7wjBHXPW4oHqUapF2UsxmUevIHWgxPiHhg9dqeU+gDycdYtzDWsVNoqJUHkDV5QB9FS
 c7NUBxnqQrIU0IAfkd+3yw3m7dzCDvdLm3Jg2l0k8uJQ1A55m3vkDfsWtH+9+OfC2h16
 Wd47DybvVIdlKpv17H+kuC99ZgdFub2cEMaN5/tt1YtxGf6DANGWWPJTfQIO8FisiBbE
 /lvg==
X-Gm-Message-State: AA+aEWaoje9BNX83Cwv2TZKN//RMKMNL09qTZ9xo0+RxDndRQr0u9QTt
 FacpO9r18K/j/s+OKMbzEtoEzkef6YiWgQc74Ms=
X-Google-Smtp-Source: AFSGD/U2VRlCGpVljOhIhuELniR7ikKBz46LiTtveZuBh8nF1noBgiQPyoMXUI1hRA4KU0oeEvcDtdH6zzuvVN/qsCU=
X-Received: by 2002:a9d:325:: with SMTP id 34mr11187749otv.94.1545090008233;
 Mon, 17 Dec 2018 15:40:08 -0800 (PST)
MIME-Version: 1.0
References: <CAEx7e2SGZWe5ba9=0rSFc1-ArS9uPDhn8oLFSZMT4ygX968t9w@mail.gmail.com>
 <CALLMt=r4nUdFHTNeiemhdM1zrRVt5-zc41mG2APBC-N2YO4TOQ@mail.gmail.com>
In-Reply-To: <CALLMt=r4nUdFHTNeiemhdM1zrRVt5-zc41mG2APBC-N2YO4TOQ@mail.gmail.com>
From: "M. D. Truong" <truongmd@gmail.com>
Date: Mon, 17 Dec 2018 15:39:57 -0800
Message-ID: <CAEx7e2TWbytH1xCKwDSqx-VRQPqqLXiRieaRS-pFUo1OvD2VwA@mail.gmail.com>
Subject: Re: OpenBMC Raspberry Pi
To: geissonator@gmail.com
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Mon, 17 Dec 2018 23:40:14 -0000

Hi Andrew,

Thanks for bringing this back to top-of-mind! I'll start shuffling the
patches upstream for inclusion into the official codebase over the
next few days.

Cheers,
My
On Thu, Dec 13, 2018 at 5:34 AM Andrew Geissler <geissonator@gmail.com> wrote:
>
> On Mon, Oct 29, 2018 at 4:52 PM M. D. Truong <truongmd@gmail.com> wrote:
> >
> > Hi all,
> >
> > OpenBMC on Raspberry Pi seems to have a bit of interest as a
> > stand-alone reference platform. The source has teased the possibility
> > of running OpenBMC on an RPI, so I bit and took a few cycles to make
> > it work. On a GitHub fork of OpenBMC code, sitting on the
> > "raspberrypi-cm3" branch are some patches that will build a working
> > distribution.
> >
> > https://github.com/truongmd/openbmc/tree/raspberrypi-cm3
>
> Hey My, this is great. Especially for people looking to get started
> with OpenBMC. Raspberry pi's are easy to get and very
> affordable.
>
> Any chance you were going to upstream these changes to
> the OpenBMC project so we could have them officially in
> the code base?
>
> >
> > The README.md file has most of useful notes on building the code and
> > bringing it up on a device. I'm looking for feedback on changes before
> > pushing the code upstream. Features is a completely separate area for
> > discussion.
> >
> > This was a great learning experience and I hope it's useful for others.
> >
> >
> > Cheers,
> > My
