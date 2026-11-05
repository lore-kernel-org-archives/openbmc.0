Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D6E606A31B
	for <openbmc@archiver.kernel.org>; Thu,  5 Nov 2026 22:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=W4+qP5kH
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jLHCg0Gngz2xRm;
	Fri, 06 Nov 2026 09:33:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793887011;
	cv=none; b=elJLp7wM7YCCPAphR5YLC5iwGKKm+Gq4Zf6KMYMw8nkLbwOiCNdQ5DTYVopC5n+1uectnJuH+ZivLV7mjZgQa+lX8i9/oleMkMceg3G3cNC05vuUp5M117STqjnh/2s5rHiFmyQ0feP8eEqpoZt46V7jG8fWLjEmrBNX935MDKW1wNGeZYlk+16NmZ9gifbiCmj1Wpom0tr+VdPKslZsg5DTzE7iGxE3UnF3eaJV5WS5BJx8E1eY95889CqHTF5rPmOeC+xt6PlXX6MY7B0K/CK/fPeg89hXXKB/rJoA0Y+RgqrLa7IIW3nS+f+GouoowC/9VWTkeK9O0MMpoX6afg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793887011; c=relaxed/relaxed;
	bh=8TiKAvJXB1NGH1N8fdTjOIOAtKyqlHUX1XLSobFGMdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6Ol2I0IbHr6fM+yi8LAp8yaunJsVR1uhAN1ZCVh3SkiYiJ/acE53EwgZYVCzBLYsfw0CW5lQhORhLKBgVi0Y6FR25sIKxLBM4yA3Jubyh1UTwCrPYaaKbJh/k2Uql3Eq0bZlZQuAXDfjRMFPY5P+pkwvmAjrO851AX2IwPJCgMCDSkQE1n+BliRnBT/OTcKTM3wnAm2uwOec4wUl3V6DiOATZ6sDJuRzmwm8obHNnf/C8qMqo4cgr0o3ajMQE6kZa6c+vKlFvdjAqoizmZ/ZJ1TSB8nnU9mA9k3kVN7Ifrlh08N9RWdAUfdO8mMh1NUjeIsRV6MrFE/ZDAc8qKnqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=W4+qP5kH; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=W4+qP5kH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jL3l56kJXz2xLt
	for <openbmc@lists.ozlabs.org>; Fri, 06 Nov 2026 00:56:48 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so22586745e9.3
        for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2026 05:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793887004; x=1794491804; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8TiKAvJXB1NGH1N8fdTjOIOAtKyqlHUX1XLSobFGMdc=;
        b=W4+qP5kHh4hQPqOsl5t7q6mkO4KbmWFVkJsyek3rkoKOVEge35dck3kZifRCmrydWm
         v2So9Q0bySYZLIo6RxQcr0sg4cRlQ5yPWBf+7jp4JjKg2mK/MdgM5p5r9d/2yoHIF5sR
         rbDdowwTd0zsDP38//uGYo9hxdqNjRhE1nZreJZmo8PyYGzZg4+h9HWtModGYvzrXiUl
         blqlD9k1Z75cCeV5N5j1wdt7tu9gHVg1zbFbY893mO43qeV1KgMFhj0mxLOxqLlRbbNZ
         79WRBmzMCLb0CTiLRetQzohLy2iu0uyfDTe1mruj/AiAiAUyx013XQEhf9Azfl7/UHNM
         +8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887004; x=1794491804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TiKAvJXB1NGH1N8fdTjOIOAtKyqlHUX1XLSobFGMdc=;
        b=yxqe7tmMU2Ddl/ArfI/EVemZTVjLDAOTcX08F9Uwh3n8/92mHZRPgitiLe8I6HR5iG
         gvJkLafT+4rwAGYkQLYTSNznwu2aaNxNeilhFRIxynIgMn/+Jbl+p57Z+kTt9lW4Z0Hz
         efv3TM4uXeIKngEbxES/l1WM0qHxMGLOjnAgrAt8eyEHKJkZZUyQo2fUhWAx3xpb8uNk
         6/OEy//CyaDviUw5h8yvePaCkK5a1l1xni29Z0ix9ZotXZOO09um0tpRCXmfMD7LMKM9
         rGC5wDOAc6RHtghU6nH1qer5aFakuQAL0m63fcBoHL8Sfbb14URiwrkcQeLdOmbKLBq2
         7Nbw==
X-Forwarded-Encrypted: i=1; AKwUvBzB1J4EJhN6kMik77CsTJe+ozUjB4zftNfGhmG2j5ON+N5mcSLJK0g7H/J/m69XcJ295khV6tC2@lists.ozlabs.org
X-Gm-Message-State: APuU4Z8RorZllJpT/YBVofKnS84riz80LZtxQnhBETUGdEly1vLQ/t7t
	NKR3Dpx+562NNk4JPKvLhlf476nJWNimcxowE9GUxNxL7jNTUmasCnO7aNhf7P2jsgY=
X-Gm-Gg: AYBFou01hvL/v1FmM/vg6geNTLnPBD/wIUFXcgnYthV0LFI+7UREqzXvC4qcHJ1MpFz
	45Ir45u1DGu6hi6mtFPqEehoJGEmaJW1TJdWBRNHWXdwyzPy6VsKs68LoyT6NYlFOdJZFa757Vi
	52yZUEubFj/fB3S0jH8N+4Z4ce7XJHi9YhM2OL0d1iDUT8uLX8xPtrAmcpaKR/asYGYAuqiWTg8
	tcojPqydx3Eq/JDmS1NzBsZoVqTcoQ/2RoeZZyWIiV2ZuibbSvzJrZX6g5V7oQyfuDkb6PBy02t
	K/AngiGr3G8peDZG2mF+FYVzzoIgaQF7JH9Qctpt3/aDo+kJJ3XzBe9WNon8KQs8+EvEzt39JYr
	0oG6nppQiemNadzv3ZufzsCWR7b9Q5gIpzXrHASxkY8KiS0rZ2XRhXXx7++GBYAKXd8inx7JT+3
	sdyIc9aU59VA60lLYemYE+BBdxutNoAayge6Ht9N+5vHIwVKZsmAzrUwbQ+Up5mc92+goHX33dE
	9GC2qAq/9vvFLM6WKZuXMn4VkWiKhLDgR3ej5zaaNf2+ZXXl2qHhWLQ0BEL000MoIoxnN2BsuNr
	sYLH9woqA79vO5KdpmhUd10midE2
X-Received: by 2002:a05:6000:25f0:b0:48e:4f1e:5e24 with SMTP id ffacd0b85a97d-48e6e2e75b0mr38836163f8f.14.1793887003590;
        Thu, 05 Nov 2026 05:56:43 -0800 (PST)
Received: from localhost ([194.213.108.7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48feda20567sm10969363f8f.51.2026.11.05.05.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:56:42 -0800 (PST)
Date: Thu, 5 Nov 2026 14:56:39 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Akhila Kavi <akavi@axiado.com>
Cc: Sammai Chakravarthy <schakravarthy@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tzu-Hao Wei <twei@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH net-next 2/2] net: mctp: Add Axiado AX3005 IRoT MCTP
 transport driver
Message-ID: <auyKnmpiL7ZSJkgs@monoceros>
References: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
 <20261101-mctp-transport-irot-ax3005-v1-2-36ceb822f01e@axiado.com>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2v5unmaqs7i3rrwd"
Content-Disposition: inline
In-Reply-To: <20261101-mctp-transport-irot-ax3005-v1-2-36ceb822f01e@axiado.com>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--2v5unmaqs7i3rrwd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH net-next 2/2] net: mctp: Add Axiado AX3005 IRoT MCTP
 transport driver
MIME-Version: 1.0

On Sun, Nov 01, 2026 at 06:00:58AM -0800, Akhila Kavi wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h> as it pulls in a lot of
unneeded dependencies.
<linux/platform_device.h> already provides of_device_id so you can just
drop it. Alternatively if you want to go full iwyu, include
<linux/device-id/of.h> instead.

Best regards
Uwe

--2v5unmaqs7i3rrwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsixQACgkQj4D7WH0S
/k68lAf/S7Au5tx54BaHhFIyr9rnWPJhc+OMWG/KaFglaxrdG2WQeAImkDXsQr88
Akm6VVPKYQBh50KUi2muuoNafteiCwHcq9JtSo2+R9q/d75TDEKggJICOxF7DYzs
wTbn+hGwOmxGwHjpR0nNW8uQWUyIhk0irXV3NsQkMhikal9x5T8XOesQJnoZA3bT
UEzoa1NXgZD0o4T+sQSLjMueCbC8OkC7GrhuMqiNG6OzWo42mecP4cY4li4MxjqP
rFj3ymSSJzaGlEtZoe9+m0986qi8/JUOkyh26I1QR8xsjKpq194Y55T4uLnlklID
EsuWtThrtvbozh5Kxnz8O9aFUEb1xw==
=onVy
-----END PGP SIGNATURE-----

--2v5unmaqs7i3rrwd--

