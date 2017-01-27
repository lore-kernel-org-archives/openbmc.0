Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x244.google.com (mail-ot0-x244.google.com
 [IPv6:2607:f8b0:4003:c0f::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v8nzd08L3zDqG9
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2017 16:54:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SYF7VKHI"; 
 dkim-atps=neutral
Received: by mail-ot0-x244.google.com with SMTP id f9so29961629otd.0
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2017 21:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=TIzNctGHkeYPKhjC+k5nqdQD/hQ4SwKlF1cr0kyoB7E=;
 b=SYF7VKHIAZ/0KHSDz0q5rzB8FjxmrBuovl5LonKOY8lQm30PXXnK+fMpxOINo0gh9P
 qrhxrcN6J2LwNETj29hzkKscJ2+JKtvudJQfpBGquuPpNZErQWUhA8Jvcm+jgiw3RpxC
 speBoUdCW/RW/7baVnwutp0F+a/Oc632/B/SRDWWPkyMqoTko8EQwSznuVvMuHxz3Gct
 PmgbFPFKY0TWQmebKQGAeGk58fdJVCXzUyrWcQS7JwaVR98xzkiQ7kS6jQ0oiTL5LIFB
 7suGupc5+0xpKJsbstRbQr8gNmWc9KmyUyANAqpSc/AfkZPHqrsF+Ah/7W2FMK2d6Z7Y
 yIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=TIzNctGHkeYPKhjC+k5nqdQD/hQ4SwKlF1cr0kyoB7E=;
 b=Ojn1ym3inwvG+3ang7JM1DLZaXu5V0r/Au3ET/YNJENl4SwFV92evDnbSroe+DInbi
 xJPBJ/yDcF1hWMvD+nHvQRDsufL0sn0sExSN4kkc0TD4eVvIqspvY0th4H4zMdcc0f+p
 h4RieJJwzVDjZyJM8aC1Q4UHIBGgtSePc4V1CX0ffrvzeBiXdkDRfXQgLfZfakB3Ulco
 Yr/idq3xg+0YJ9BENeFc4mFdu4YKyCDdtw71YaLGFflk7G9SA14WzF1J06OIyPhR/Fpe
 ihOGNqF/rzz5DBJoQbcLDxNM82kn9djhyL2NkLrOwl8UGmjcTwuVc+fxCvhJp4hglQfe
 GlOg==
X-Gm-Message-State: AIkVDXI/Igx+Of3DkF8bRhYkQEGwMLO64Kb59Qoa08ESQnXAApayzn2WihJWOOqNbn3G8F26P5gXWNz6dOFaDQ==
X-Received: by 10.157.46.67 with SMTP id c3mr3372239otd.163.1485496458782;
 Thu, 26 Jan 2017 21:54:18 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Thu, 26 Jan 2017 21:53:58 -0800 (PST)
In-Reply-To: <20170127042442.28994-1-andrew@aj.id.au>
References: <20170127042442.28994-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 27 Jan 2017 16:53:58 +1100
X-Google-Sender-Auth: DMTCeMVwMXUcGeOW1QmOKBQuwgs
Message-ID: <CACPK8XcWri+cZ39yZYyYUb-kHM=j8yjRSh8GgcZ6CpW6=5hgMg@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: aspeed: Add banks Y, Z, AA, AB and AC
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 27 Jan 2017 05:54:21 -0000

On Fri, Jan 27, 2017 at 3:24 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> This is less straight-forward than one would hope, as some banks only
> have 4 pins rather than 8, others are output only, yet more (W and
> X, already supported) are input-only, and in the case of the g4 SoC bank
> AC doesn't exist.
>
> Add some structs to describe the varying properties of different banks
> and integrate mechanisms to deny requests for unsupported
> configurations.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
>
> Since v2:
>
> Drop linux/gpio.h include and change away from using GPIOF_* macros
>
> Since v1:
>
> Fix types for for_each_clear_bit() iteration
>
>  drivers/gpio/gpio-aspeed.c | 173 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 159 insertions(+), 14 deletions(-)
