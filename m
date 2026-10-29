Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D45606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 04:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Sebinxlh
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFWpd0T1Hz3048;
	Thu, 29 Oct 2026 15:44:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793249048;
	cv=none; b=eanNzi3HG7VFPBq8JZISIoZBPzkLHu0euyuSAes3jE7z/BIwLnKxGNEE4V6wE7lcY5st+miJTOdFnBiKVJwSwW2wgOQ3m+ohb+q/9R395k6IS30aaIrEEgyzhuFl5mwmlMHwsKaDYuJosAV8aiSWl1enduS54IXzGhve8Oxs9yIwjNUCJz/DMrg9y+GJ6b+w11rqPu5qLmg4r6gWeYpnOE3bfoy/9DYIijNTIy3m+H5gfK8cS8FzI6Mq77FuKYTeeQRfYrKFhw6pIZCfmwKYNAEYYXVjf0J4mnhggF1URjIUpsan8oQ54ciMfFynDuunQGQgV7nOonyiPqI3vqDaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793249048; c=relaxed/relaxed;
	bh=1MFSEf6tgDcUyruMzdoNFlGhiDOV8nLHkTChvWp1qqw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z/n8De8bwAViuVz5pT2ywcwBXBmzftMJfiqRufK1vgrrzVdbMfCNZtnaomjA5iACQhxnrg+KzoMhmxzqgMHFB5PwhZwSK0xxygFNcTitdlzQnibzqys6sztpUg/grvO8rhCniCcu9BNl2Hx/1PUblEMh9X1848LBFXb/++CYuySqeDhsA7ebchUaMbu/UESOg/VcYegjUKkQQUGfNejybdt4b57lrfsRcpKwb3mEJgDdeMvmuI+/PibuDj1YMDTgJBfNhgMwauMta9OKDJgKbKIF7CoFiH04sZr6b1q7/2/S2AKWHEPrOzc+3D9vP35MJjNg9lcmkhjAMK0ohLgO7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Sebinxlh; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Sebinxlh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFWpb4R42z2yh4
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 15:44:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793249045;
	bh=1MFSEf6tgDcUyruMzdoNFlGhiDOV8nLHkTChvWp1qqw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SebinxlhMNJkkhsdjhFECWNg+KByKV8Se1hrXUY7cmY5YwBIAgjzjQnjeYv1zywAe
	 xpjbyOmsep6YoR+mFhb6VmpOauhvR/8oy5xateGgMIiZcBwQdDHQZd8SWNG4pM0kW0
	 HncAlJ1SqTvHM7wzcVDa3xKt5dbF3u7ZnQNVRjvUB6L5eq/zbCHz0NMB2h5Zevpoub
	 xp9pk9wGHlZqso4iUKrMMZdqatW1bJpaowvlUitDEKFM3iZrIuPta6hK8+/hsDF0K1
	 5teeTIOSQBEnq5ZEgVpRQER3dDoLelMuqp98Udeo3rOrd43FWriDm1bcTVXnbYS+WX
	 j+xYdnylv9R7w==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6369070D46;
	Thu, 29 Oct 2026 12:44:03 +0800 (AWST)
Message-ID: <e0aa46eed23f6ee906030dcf6b8af73938bab8b1.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.18 4/6] spi: aspeed: Centralize address
 decoding region management
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Vince Chang <vince_chang@aspeedtech.com>, openbmc@lists.ozlabs.org, 
	tan.siewert@9elements.com
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, joel@jms.id.au, Mark Brown
	 <broonie@kernel.org>
Date: Thu, 29 Oct 2026 15:14:02 +1030
In-Reply-To: <20261029013428.277816-5-vince_chang@aspeedtech.com>
References: <20261029013428.277816-1-vince_chang@aspeedtech.com>
	 <20261029013428.277816-5-vince_chang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-10-29 at 09:34 +0800, Vince Chang wrote:
> @@ -527,41 +504,24 @@ static int aspeed_spi_chip_adjust_window(struct
> aspeed_spi_chip *chip,
> =C2=A0			 chip->cs, size >> 20);
> =C2=A0	}
> =C2=A0
> -	aspeed_spi_get_windows(aspi, windows);
> -
> =C2=A0	/* Adjust this chip window */
> -	win->offset +=3D local_offset;
> -	win->size =3D size;
> +	aspi->chips[chip->cs].ahb_window_size =3D size;
> =C2=A0
> -	if (win->offset + win->size > aspi->ahb_window_size) {
> -		win->size =3D aspi->ahb_window_size - win->offset;
> -		dev_warn(aspi->dev, "CE%d window resized to %dMB",
> chip->cs, win->size >> 20);
> +	total_window_size =3D 0;
> +	for (cs =3D 0; cs < aspi->data->max_cs; cs++)
> +		total_window_size +=3D aspi-
> >chips[cs].ahb_window_size;
> +
> +	if (total_window_size > aspi->ahb_window_size) {
> +		aspi->chips[chip->cs].ahb_window_size -=3D
> (total_window_size -
> +							=C2=A0 aspi-
> >ahb_window_size);
> +		dev_warn(aspi->dev, "CE%d window resized to %zdMB",
> +			 chip->cs, aspi->chips[chip-
> >cs].ahb_window_size >> 20);
> =C2=A0	}


This produces the following warning when building for arm64:

   In file included from ../include/linux/device.h:15,           =20
                    from ../include/linux/platform_device.h:13,  =20
                    from ../drivers/spi/spi-aspeed-smc.c:13:
   ../drivers/spi/spi-aspeed-smc.c: In function =E2=80=98aspeed_spi_chip_ad=
just_window=E2=80=99:
   ../drivers/spi/spi-aspeed-smc.c:517:37: warning: format =E2=80=98%zd=E2=
=80=99 expects argument of type =E2=80=98signed size_t=E2=80=99, but argume=
nt 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-=
Wformat=3D]
     517 |                 dev_warn(aspi->dev, "CE%d window resized to %zdM=
B",
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   ../include/linux/dev_printk.h:110:30: note: in definition of macro =E2=
=80=98dev_printk_index_wrap=E2=80=99
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);               =
        \
         |                              ^~~                      =20
   ../include/linux/dev_printk.h:156:61: note: in expansion of macro =E2=80=
=98dev_fmt=E2=80=99
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_=
fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~=
~~~              =20
   ../drivers/spi/spi-aspeed-smc.c:517:17: note: in expansion of macro =E2=
=80=98dev_warn=E2=80=99
     517 |                 dev_warn(aspi->dev, "CE%d window resized to %zdM=
B",               =20
         |                 ^~~~~~~~                              =20
   ../drivers/spi/spi-aspeed-smc.c:517:63: note: format string is defined h=
ere
     517 |                 dev_warn(aspi->dev, "CE%d window resized to %zdM=
B",
         |                                                             ~~^
         |                                                               |
         |                                                               lo=
ng int
         |                                                             %d

It's not clear to me that there's an existing upstream fix for it.

Andrew

