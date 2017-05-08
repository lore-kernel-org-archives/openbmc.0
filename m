Return-Path: <trini@konsulko.com>
Received: from mail-qt0-x22c.google.com (mail-qt0-x22c.google.com
 [IPv6:2607:f8b0:400d:c0d::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMCY76fvPzDqK7
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 05:41:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="LZ8ixGua";
 dkim-atps=neutral
Received: by mail-qt0-x22c.google.com with SMTP id t26so43468020qtg.0
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 12:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UqSU1JyhOH+fThdGnI3o4pKwIz0DWqgOxodpGaSwUcQ=;
 b=LZ8ixGuaKqDJxfXFEreaOwj1T33lMP47R9NGG/5iDtJOOAElRBqk6J1dMkiTEKCkND
 /TYbAV4Tcbhpe49wNUDQmvpnHc9C67Q7ZnGhODO1FUPZqgeDucClgct5w9ORJ3HyHke3
 fsQHxtVaQOOlVQid617Fkt2qLW2c8x4QlVivs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UqSU1JyhOH+fThdGnI3o4pKwIz0DWqgOxodpGaSwUcQ=;
 b=HXQZvopWo3VITBrY50ICHK+mbrdk+EGgty/YcZS+tGKCdyPMmlrn37mn42bU38TGXQ
 lRTV7Gc8mEONK/n86BuQ5gxjkA15LyZ5UsHBqwEs87vbERiuxvSUH8DFyCkWNfUwJEQR
 R8iFzYpf3mQ/O9IlLzC1grEv/bKTr4LWwHPoqSHX+keiMVCmbzbsIUP08X9NxYKkf8cG
 zLMqypdJ0Zg0CYoRP8qTn0w4kF/+3wdvawQHQu/LklAl7vTuxxN3NXNgNXONCbqRfQYe
 T5e5hQlcjF7tm3q1Ubg5foenSf8dGeNAd6ZWJ2oEvA8H48+v4ucEsvkmY8oKcNwH4aui
 lNMA==
X-Gm-Message-State: AODbwcAah0HajhwqI5aotRZh5poF7+3mHyynDfYQMSByAtuIfxh+ve6J
 rq1GFYMe88ALDA==
X-Received: by 10.200.4.147 with SMTP id s19mr15118258qtg.50.1494272473801;
 Mon, 08 May 2017 12:41:13 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id u51sm11358876qta.56.2017.05.08.12.41.13
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 08 May 2017 12:41:13 -0700 (PDT)
Date: Mon, 8 May 2017 15:42:56 -0400
From: Tom Rini <trini@konsulko.com>
To: maxims@google.com
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [U-Boot,v1,11/15] aspeed: Add I2C Driver
Message-ID: <20170508194256.GN12511@bill-the-cat>
References: <20170417190034.71945-12-maxims@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="HxsxUUve8i+TuXFZ"
Content-Disposition: inline
In-Reply-To: <20170417190034.71945-12-maxims@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Mon, 08 May 2017 19:41:16 -0000


--HxsxUUve8i+TuXFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 12:00:30PM -0700, maxims@google.com wrote:

> Add Device Model based I2C driver for ast2500/ast2400 SoCs.
> The driver is very limited, it only supports master mode and
> synchronous byte-by-byte reads/writes, no DMA or Pool Buffers.
>=20
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Acked-by: Heiko Schocher <hs@denx.de>

Applied to u-boot/master, thanks!

--=20
Tom

--HxsxUUve8i+TuXFZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZEMo/AAoJEIf59jXTHXZSCTkP/jilj4jCRacnrE1e4yB8tdy0
R9LbqIU9D4HzJmFAimtS9M8oN2fSBwsUG/6ugk36d8Jm+ajyuf5NHjptaG3Y4a+z
jWTRXFF89CQ5cuogMWjbfOdSSpXafF1rEW9heIlw3i2ytmNQlhGn+H2QiiDY2Dak
E1BnMMKA23s1Y2Rekf7nsD+0DCiZyzD/1nlvVLRLhg1Zhq8RagQp9ZP1sUrYliTJ
oCgsf1dMZte52c+XsfI5ZkAF5ltH6Gd5Tj/qPCBY9XPvwhjDlLuWGDPJrNddqZSK
N2mAzoafkRcB1QSZKPCvhQFNYTAB4rVv6PDImNQzuym0V2KYwQ76XcoHxeLjL5MT
gEBYEHBGIIfiQtKol8SSn/132/uUuyxr+ebSi4+3IYE5YcyxHcEkoxXDYWXvn1m2
/YXshmwFpxE8w9u7juq2dzKZojzDM7ZwvcRuLG7U1ol0FskzNfv7FvZDEQdJzGhv
Mx/7yql3GdMpUQ5+6RoI3lsvKYgqgHSiv+SrqC2viqumM4EkkIFM0Awno1xaQSZo
4n8uSxlcY9Px0EbjupBVGhlx2EtmuypCwERIeP2Dd//6+m+XEUfJzATs/OCe/QCz
Djhz4ECgpNgPeyxT4gAce39zHCzt4NyEQSRy6yOFV3SJH12ZDOQs0C6Wmp/x7pXT
PgMaOp7yziXn5M5ob6RH
=nN8t
-----END PGP SIGNATURE-----

--HxsxUUve8i+TuXFZ--
