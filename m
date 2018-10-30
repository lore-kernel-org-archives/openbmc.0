Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rnGLDCds"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42kf8H0lwszDrWW
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 15:47:10 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id x4so9886316otg.3
 for <openbmc@lists.ozlabs.org>; Mon, 29 Oct 2018 21:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LR/wjsPVpYhexbr5PWqQBTg3Pm64KJquqWRp9cK2w08=;
 b=rnGLDCds6U8BbUEk71FrVl43aSv/pI+YJQJieO+oK2SDjQqNYCMYQMe1sgU+r72ra4
 tAMFJsCRRSC/SpPCGlqJEuOsaUBNsxc1eJ9Qt9KwQK84PcqPIWyX+UJTp9TfX4hS9Km0
 7ko/xScX1Z+mvnfkM48XMy5lqfpVVg81KtEenw32zd+cmci2tVjyYbb9TL4ON4lWLvhV
 YtBvCq/GbtUaFFDdIp1rNk5FnnxpiJM3hRX7GY21qigNJ/O2V6go2LhjDLHits9RSNfI
 IUQ2+MqmcffTjPVP9xuu7zBlQmb1ozhKJmzCOHmQkOVf7FJ68GPPX7mI7yjc0Ef0YIQu
 yMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LR/wjsPVpYhexbr5PWqQBTg3Pm64KJquqWRp9cK2w08=;
 b=Z5oSnDfE01Jnz6YjC26OwUPxAUN3S4nBacu+mTYwGENSi7HmR+y/fCUlmaUh0oM8jg
 w0E+wCq0NHIn7YMgpu+Sf3qyE/BZOPBkl1GRWu6PbGwOn6j/xBuXGt6m5QTzeEEVrwzy
 XfHgz5uN9BqFsV3J1ex1Lg25w4f/WC7q4i4Whc1Q/hvvqfrgOHGLGjRyIVDx5XVVnga9
 tphgLsgwrDK4HBKgC1QCDprt6Q1zfQzr2dHzgJRwvxbHeRaFYLNiDri89IXBNt5PjZok
 7CGJcrOu950zMMpfUvqLUlY7WDaz4mD3pznW6Nz5xdXBIqB+DUYIko29kNpna5XoQ9fA
 g4wg==
X-Gm-Message-State: AGRZ1gIdW7TjLXkhjmYLEfec0usBrlRwwTQID0CSzGACNP3sp+mXGroj
 KyTB9HZEkh6noDrQU69rxVG2/Ssewf30dNjeO2A=
X-Google-Smtp-Source: AJdET5f/ucSJpdVtDK+X91Vu/laeVKwSi0BiGDcGf25+AbxUFJsVZPUxUgNnEvZ04YE8X8oxAHXv+UvsqkYfuDq44HQ=
X-Received: by 2002:a9d:1ea5:: with SMTP id n34mr9903160otn.160.1540874828547; 
 Mon, 29 Oct 2018 21:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAEx7e2SGZWe5ba9=0rSFc1-ArS9uPDhn8oLFSZMT4ygX968t9w@mail.gmail.com>
In-Reply-To: <CAEx7e2SGZWe5ba9=0rSFc1-ArS9uPDhn8oLFSZMT4ygX968t9w@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 30 Oct 2018 12:46:54 +0800
Message-ID: <CAARXrtkbSKRQ0wB+HkpLA_4EDx9rizeOuL7unTOSpkgytChFuQ@mail.gmail.com>
Subject: Re: OpenBMC Raspberry Pi
To: truongmd@gmail.com
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
X-List-Received-Date: Tue, 30 Oct 2018 04:47:11 -0000

This is really great!
Looking from the changes, it seems to support not only RPi3, but all RPi models?
On Tue, Oct 30, 2018 at 5:52 AM M. D. Truong <truongmd@gmail.com> wrote:
>
> Hi all,
>
> OpenBMC on Raspberry Pi seems to have a bit of interest as a
> stand-alone reference platform. The source has teased the possibility
> of running OpenBMC on an RPI, so I bit and took a few cycles to make
> it work. On a GitHub fork of OpenBMC code, sitting on the
> "raspberrypi-cm3" branch are some patches that will build a working
> distribution.
>
> https://github.com/truongmd/openbmc/tree/raspberrypi-cm3
>
> The README.md file has most of useful notes on building the code and
> bringing it up on a device. I'm looking for feedback on changes before
> pushing the code upstream. Features is a completely separate area for
> discussion.
>
> This was a great learning experience and I hope it's useful for others.
>
>
> Cheers,
> My
