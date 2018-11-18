Return-Path: <olof@lixom.net>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2607:f8b0:4864:20::143; helo=mail-it1-x143.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="ynES27Hd"; 
 dkim-atps=neutral
Received: from mail-it1-x143.google.com (mail-it1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42ylhC46JbzF3VC
 for <openbmc@lists.ozlabs.org>; Mon, 19 Nov 2018 08:38:18 +1100 (AEDT)
Received: by mail-it1-x143.google.com with SMTP id p11-v6so5788964itf.0
 for <openbmc@lists.ozlabs.org>; Sun, 18 Nov 2018 13:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BxQfJW2kQdDn9A8wc85LDvFA3SC8nq6Od4NzrYEAoJQ=;
 b=ynES27HdNbD0PVHV7e69Z6p+PkDuc3Z3O9gikWL42ver/F7A+g6u2hZMRjufdP7dCe
 cs4RL2LRIRynYY4zOPoIo7SU6BFAoFzjR/By2L+BUpgQGqbMVSgiQnNx/3oMWjmZOlzp
 WpDy1x1a45njNNjwaBpgE7n861BD2GhnBQxOGXg6ECn7fKT6X9lamyepvTOji12OxXyU
 Bb0Bwfd6lZB8CZvngiaUbGma6MCc1vgFFiiSMRHh3qFdMGzg737BZUW4M7zjjAFsLGB0
 oH5LRN9QLjL5/jMdFy07SDZK4lB2SCU18Ta09viWiGTchdPY7U6fTMO/7edvQ20jBBmc
 Vx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BxQfJW2kQdDn9A8wc85LDvFA3SC8nq6Od4NzrYEAoJQ=;
 b=iJX4Kaj7G8bSK5ieZT4XR1FQMnOp9tywZmIxqEdg61mzvq9UtHSjgbw6qaqbTTb+Wz
 MPuvAD6sh4SYYRKHFKW2j/k8C5bVko8HJf4q0Q5/Ycx961a0yj9eS9Y1pKqSqjqFLsOB
 rLMJmvW5Ho8mmRStBVXifP9ED51qMCFehqq79mtNxuRORNoIMh7oBdlT5T+dSqCUtuoF
 mf6YuZL+EfA4Yi5WBHTNXqFNL02eWFHsPwb4gL8J+OhUcrqM3laDU+Aq2LdETUderSyK
 89ftusIpNOmEy5ifGEoXQwM7jO8nM3ZZoK2mh0AREABbBK3dx7lNlNiaoUtbQr+3QamO
 V0fA==
X-Gm-Message-State: AA+aEWbkaf12bT+kabFt41m7AdJ4DOzs3KlNi0u1ZtycMgmsJPM4gjzC
 I5yYyxMWUuYcHa9SazEuMO+x+ecoTWkjDBp6bYYckA==
X-Google-Smtp-Source: AFSGD/VEIjaT9N/As1AsNw4gk8J1eUCLRva679IbhP/2U4zsXGR6nh3xazg3mo0p+3ZqZBKyy+rWtX6gWNN51bkCooo=
X-Received: by 2002:a24:28d2:: with SMTP id h201mr2453929ith.136.1542577096014; 
 Sun, 18 Nov 2018 13:38:16 -0800 (PST)
MIME-Version: 1.0
References: <20181118123504.83082-1-tmaimon77@gmail.com>
 <20181118123504.83082-2-tmaimon77@gmail.com>
In-Reply-To: <20181118123504.83082-2-tmaimon77@gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Sun, 18 Nov 2018 13:38:05 -0800
Message-ID: <CAOesGMjUJ1+qmbPWcVFm1F_F0fcdg-54YY6o4iK=PYWoAuEczA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] spi: npcm: fix uninitialized 'val' warning in
 receive function
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, yuenn@google.com, venture@google.com, 
 brendanhiggins@google.com, avifishman70@gmail.com, 
 Joel Stanley <joel@jms.id.au>, linux-spi@vger.kernel.org,
 openbmc@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 21 Nov 2018 14:31:18 +1100
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
X-List-Received-Date: Sun, 18 Nov 2018 21:38:21 -0000

On Sun, Nov 18, 2018 at 4:36 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Fix uninitialized 'val' warning receive function, send function
> has been modify to be aligned with the receive function.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/spi/spi-npcm-pspi.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
> index 6dae91091143..f75df49ab84e 100644
> --- a/drivers/spi/spi-npcm-pspi.c
> +++ b/drivers/spi/spi-npcm-pspi.c
> @@ -199,11 +199,11 @@ static void npcm_pspi_send(struct npcm_pspi *priv)
>         wsize = min(bytes_per_word(priv->bits_per_word), priv->tx_bytes);
>         priv->tx_bytes -= wsize;
>
> -       if (priv->tx_buf) {
> -               if (wsize == 1)
> -                       iowrite8(*priv->tx_buf, NPCM_PSPI_DATA + priv->base);
> +       if (priv->tx_buf && wsize) {

In general, doing an early:
        if (!condition)
                return;

is a pattern we prefer in the kernel. Setting up the assumptions at
the beginning of the function makes it easier to follow the code flow,
and saves a level of indentation.

It's a matter of taste though, and this function has only one level.
So, either way is OK. Just mentioning it.

>                 if (wsize == 2)
>                         iowrite16(*priv->tx_buf, NPCM_PSPI_DATA + priv->base);
> +               else
> +                       iowrite8(*priv->tx_buf, NPCM_PSPI_DATA + priv->base);

I think this is broken? If wsize is something else than 1 or 2, you'll
do a one-byte write but advance the buffer pointer with a different
amount.

It'll be fairly tricky to debug if this ever happens (it shouldn't,
but still). This is why I added a WARN_ON_ONCE() in my patch instead.


-Olof
