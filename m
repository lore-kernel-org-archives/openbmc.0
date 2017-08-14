Return-Path: <brendanhiggins@google.com>
Received: from mail-oi0-x229.google.com (mail-oi0-x229.google.com
 [IPv6:2607:f8b0:4003:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xW1s937NKzDqm5
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 13:52:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BJDWz2lH"; 
 dkim-atps=neutral
Received: by mail-oi0-x229.google.com with SMTP id x3so74335837oia.1
 for <openbmc@lists.ozlabs.org>; Sun, 13 Aug 2017 20:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ZbEjEUBn08q/SKm0EWItrmVoWBqWVnqUJKUPflmUUyA=;
 b=BJDWz2lH6pYcYnMcopcD8wHlxn/YASY8aB/p7sALl5T05fkGECF5qfI8CHwtzzTbNE
 mkEr1OWcXEuPYS5unw9lcZg+hO8V1VsWl3NoFdtsKqS89xbKhSxf2A4dLVbKW+yh7hYc
 4HszKbOVFcbhQWhOPUBdpoih57auCthhHoBLJgCV1fU9KmCuWjUbY/lKw0kwkSxpz3Dc
 7fMrDfhJvKgsgbmXFXjbunVHEcGY4FEWCdYElSISafov3AxbWuqS4chDtRX/055wNBRU
 nLPbIVGCQoMEq2Yl4euvESjI94BAR0/ypRPGgCqrTerX3s+ByntQpNMqzQKQV3IgHpwO
 Lx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZbEjEUBn08q/SKm0EWItrmVoWBqWVnqUJKUPflmUUyA=;
 b=qji+aAPh9YQwSNVEQdF+ApaJxZp0vFaqunEJ0OCwnYXTUjjgwVz18BIqx2Xc5B58J3
 YJerqatGXhZ8QUWiFRMalDggdzt0dqWhgk6bn8CIUvoUEIQckroEofT7bnoJkaPHxLgn
 o3NhtB1fHHCLjpnMq6DMOe14LR6D0s9LAeFYUUzCV7GZEWYy4EwIBdfjXZzmy+w7SwOF
 YEWaKwtUy/u7eaTVPV0CwalsWUmwGOF6zzID3h73yLSCZZ4YeKKJPT0whjudVxu44l9M
 daa4UsGd36tVnIBHCXYN0ndE+uz1kfNQYu8W6QS32UfqwTsrm1mk698M6mPaUwIkl47Y
 c1CA==
X-Gm-Message-State: AHYfb5iqPeeFv2h8psP0Evn74SqyX/tbKyPM4Uf59hRqlXHz9qvYr4lH
 tsPC6nBZx0MMWmcXmox3G39R67WjAwj1
X-Received: by 10.202.244.129 with SMTP id s123mr27249190oih.318.1502682746555; 
 Sun, 13 Aug 2017 20:52:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.168.69.205 with HTTP; Sun, 13 Aug 2017 20:52:26 -0700 (PDT)
In-Reply-To: <20170812113013.2ajkurbj7ongg5cq@ninjato>
References: <20170728204558.6455-1-brendanhiggins@google.com>
 <20170728204558.6455-2-brendanhiggins@google.com>
 <CAPLgG==69mNpqoqKUf-0tT4iJJ5-aCg+1uaAoLJ5QSe+8LGYkw@mail.gmail.com>
 <CAPLgG=kUxfriYRq-fc+AD=eo1T+6xa4imzda7Fd_aXmAb2pD3Q@mail.gmail.com>
 <CAFd5g45O7rJymFgnWj3SnSKhCvXoX4_xCO8FqeBFCe0-Du9AYg@mail.gmail.com>
 <20170812113013.2ajkurbj7ongg5cq@ninjato>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Sun, 13 Aug 2017 20:52:26 -0700
Message-ID: <CAFd5g470uRHdW_ZgN3MkCW8=ztow7vJobtye5-BBbUN+=R9SUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] i2c: aspeed: add proper support fo 24xx clock
 params
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Rick Altherr <raltherr@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Joel Stanley <joel@jms.id.au>, Robi Buranyi <rburanyi@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-i2c@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Aug 2017 03:52:30 -0000

On Sat, Aug 12, 2017 at 4:30 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> That being said, I could implement this as a custom clock subclass, which
>> would probably be cleaner that what I have done.
>
> Shall I wait for that one or do you want this patch to be included?
> I don't mind, your call here...
>

Let's go ahead with this patch. I do not have too much experience with the
clock stuff, so I imagine that will probably take some back and forth.

Thanks!
