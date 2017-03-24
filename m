Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqBPg0HF8zDqBv
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 16:12:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PY3rMtbH"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id d191so446873ywe.1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 22:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=gzHqZyohmYrQ/fze/uoiszQvT5w8ByqjI4wEFS7HT/8=;
 b=PY3rMtbHEZfr+N5SyFVIG7FFgCs2+83rAnMZfcrCooQJVAp0wJgvHdnbg+dEwInV/v
 Mzq9Y/nZL5L2Z7C8jyEwRYc7ZW/NQpt5IH3KGiddIxBebsdJIm8CsMvnfALMFll+VgZv
 /c8kcdM4BE+wLndpsklbzgfU8Z8FZ86ui7DeINivqIwHhiLV1tC6eet0LehLxaL6WRKN
 78wtnPoIPoer8VVHF3u1AH9Jj/NHaxC6yPnVZcJeC908ZTTwBTvtmayPf7YeuWGUgTkM
 n1JLqoqQZWey2RbMY48j4pY0BabQpz1yomsMGXi7DkO5ZRdwjQ8Cfn3h2dIF5tE32mnr
 9ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=gzHqZyohmYrQ/fze/uoiszQvT5w8ByqjI4wEFS7HT/8=;
 b=Pl9cm9vip0sj6hXgzLWucjE7xgMm7CN4Z8aq1I2umUVx+sEWnNPMJuBRyO8/Z3K/Hh
 tSgSdJ3/e63bDdo/lDJGHthyUkz8c6y9qHmXA7UbUUEWluXxSH/yJTwYfGAE/Cas8huo
 3gqb2C51Ty5OwZZSNOqNXRMhjPyoTc8GUSHdMtlgRFw8trhjEdkdvM517T5AaetPO8p8
 abMPNgOkmyVjiA/0aNhuhwLLB9HM9QKzUhkqlMmJt7U2hK8e+c2LLx9F64MErysdmmfq
 7chq7sKDjMTdMiV+bCO6VVlPAo/g1Jp5+75Fgy5L/6uShnRfyF5F+bfNJxnHZL9MfZVp
 zTSg==
X-Gm-Message-State: AFeK/H2kjDsiPuoTp7tmH+i8RpiuVrrPDycXh/KdQa/tB2KmkMtzfpDOKL/cZtdR9+nE56kvNRSqHd7Oe1KU1g==
X-Received: by 10.129.73.65 with SMTP id w62mr4401461ywa.288.1490332356906;
 Thu, 23 Mar 2017 22:12:36 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.37.197 with HTTP; Thu, 23 Mar 2017 22:12:16 -0700 (PDT)
In-Reply-To: <1490258557-16803-2-git-send-email-clg@kaod.org>
References: <1490258557-16803-1-git-send-email-clg@kaod.org>
 <1490258557-16803-2-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Mar 2017 15:42:16 +1030
X-Google-Sender-Auth: E6rcv3NTslamb4JGmUbrFgq9z2Q
Message-ID: <CACPK8XfmJvdMwZLr6yQXwNd_52bQmaV3jAD03Z5ckNNX_Fxu1w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 1/3] mtd: spi-nor: aspeed: fix the AST2400
 SMC window size
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 24 Mar 2017 05:12:39 -0000

On Thu, Mar 23, 2017 at 7:12 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> The window of the Aspeed AST2400 SMC Controller to map chips on the
> AHB Bus has a 256MB size. 64MB is the default size for the first chip
> select and not the full window range: [ 0x20000000 - 0x2FFFFFFF ].
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspee=
d-smc.c
> index 75397e0a0084..d5d8b2d6e06b 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -51,7 +51,7 @@ static void aspeed_smc_chip_set_4b_spi_2400(struct aspe=
ed_smc_chip *chip);
>  static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip);
>
>  static const struct aspeed_smc_info fmc_2400_info =3D {
> -       .maxsize =3D 64 * 1024 * 1024,
> +       .maxsize =3D 256 * 1024 * 1024,
>         .nce =3D 5,
>         .hastype =3D true,
>         .we0 =3D 16,
> --
> 2.7.4
>
