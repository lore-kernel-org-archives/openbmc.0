Return-Path: <openbmc+bounces-2391-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F84C5AD5A
	for <openbmc@archiver.kernel.org>; Wed, 12 Aug 2026 23:48:51 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hL4vH3Vb6z3brZ;
	Thu, 13 Aug 2026 09:48:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1786552217;
	cv=none; b=SYuwbc+fRSfywPewVgQI3nNw5HayOHPJLj1gCfMrDYAuWDeqZxvhQBepnKvCjxzHk4dds28ikUvptPJpF5rA0CIQnqJ4PNVWlv6z1w5mWMG0OLc1V7j1Bh0z4427wYVOAtlMAUvJaSgqkKRnIRJ9cAWtg+6SSHFgVJFt/8Z/J9H1yNyShXlMfIKkViv9JJuEBhr2v2Q2PPsMfQZ7anzUcob2FkPk8EUN5e8fd+43maYeEHAnyEuOkehh/uZXe3Ayv88YpOY28DKYrjFxDhnWe7t7W0HHEsSLmLp2WcaPJDYGiafzSWqhSzgLrh1S+djamS5AhJP0scdGJQwVZ+Rxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1786552217; c=relaxed/relaxed;
	bh=SmkTZ3IeMxC+OXIAB9iDoircMZw2Dwc6lMPotGUqEQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffPdfuDZZN3bH+BwJIh8Fxc7QDVqcrh0D+ptEJH9Pk9KDOWa0RbEh9JcFqdEMGECkacdpbrjITZ3RDw0hbB7CnG50mN+cisiZAiCiVAZpsCak2CT0ibW9cDupcresDQT4SO4ETClVNA/4zdG/ZIGmxYMyeYhqQ/PQ3wvF0x4/jPtIqwmwXgbUzML5KlH0yHoSpP92WcY1Zxy1C0L3CSnqDitx9gENO0z5kjMH6Pe/2m7h2GUN8Lm+WeGWyd0lEl2jGCRNaRSsP2e08XLatE3YPqECUtuf5UL7cWnE0929VOcuVmgZGFnSW4i4hIH13dikBAx8q1tYhASDPPrn5XE6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fjXEMS53; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fjXEMS53;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hKv9K4SQTz2yv8
	for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2026 02:30:11 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so11514325e9.1
        for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2026 09:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786552203; x=1787157003; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmkTZ3IeMxC+OXIAB9iDoircMZw2Dwc6lMPotGUqEQg=;
        b=fjXEMS534ck9UzA1OjeCnYjWY3sVFQXRtzrtxOdbeusbUIzLxE31xIJoCV3Hpm97Rg
         U7LdhoUeelF2D8xN+IN10kdCqLGTWQprdPsJwVhvlAQR1ZoSDu8buJDx+mVPg3CiRyc9
         4sShXerHU2KkEzFfstmBfAnz81XuIZtz56cCzNSCvcgDony4ttihJH8n7s5Oczl0LEDB
         bvMwYL62Z9KNQfvVJhbS74fs/U/p1mJyIfoPxAUWlJS5fF1PdU4CROllyWccr6r+YcLG
         ITa7EhWce0LGlxc2G1IWu+4UkEIlnR+vvXRwjKg2KZIM+vN7peIpN8x2LHCfxoDk/mh+
         FdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786552203; x=1787157003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmkTZ3IeMxC+OXIAB9iDoircMZw2Dwc6lMPotGUqEQg=;
        b=pzvLL0y8JsVJJbLksTeCW2oY1mixVndrgrG4VGLEvYYOiHMHVUIs0Kzm6CLCAPB8zA
         q7uUP4gYl5kPa3oV3cBcUhWznBLEcUGzv/ABZDcgUhmuIMy2uaCyPSHRhWly1HeNOLif
         xLg7krHdvEZupZnEY2t89kjqQALYvH8GeFfxeevbCXv9eHER33VyHBSM4tKBXcKjnJxl
         5z5y2omdON7299z0QbDyPOJgE0HaGabxTrTNkIOS9mwAR0srFrI3z/uzwhldBfYmKnZH
         bObNSf4x5xEWxmL/IXGWVSWAqEaVltlSMLb/2SZtnhqDhQNmuuPc0hsmFFe1g3Os79uY
         ZU6A==
X-Forwarded-Encrypted: i=1; AHgh+RrFk4U+scYkgcrTMGS+IHE3IdryAzmPI+ciV/Kq2gqGxwzR5VNDqeDkfZp+OO8HYhIawMGGTFyX@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwK0huk6PD4X57tMPI5Lf1tIubUVWepeQKGzpIduxL4O63SxhWs
	CWYs1Py6U2qdqUvpcLg85nAbZsSrAMSmp6iI0pQ4BffG9JcraIJo43ZFeLt6FnnQ1dQ=
X-Gm-Gg: AR+sD10nlu5hifCxkTG0kOeb16bdsfrY2tf1NhaGDnE5Fe1Vn/WcoLtCvMRsEEcaAns
	Tl19lnH/gj776VWgmb3vaZ0K262aV3ywGydwdvSG8ZQyrG+GLJaD/ImUUfc1DAoTbu8esSC0jSS
	e1yo5CUukXsOTcrfCIbyOmIdeRdcehaTJQHdxEkvJSqdBF12zEag51PITjxftBpIGRPelAk4UFz
	hehq2EK0rE8sRZ3hhbUGWrmLCHqjPEbSeuSCLcFM7/4NIS/le5akbAq0H+4ANs3RPK0EnsC4LLT
	mXXROjONczkFkcugFRKWqO4nKZYKGahhJvukproJyxCvex9LL1pyAfqY7UEee75BD7AYFVkK+L4
	DXhfvi6LoHOowPp5dJL4g71OEDtvq4f9IhRu/vZrH+KS5RtJuab24cX3j7qX0YrGHUO9raeEDbi
	XKzaAv/w22TBUyw3ohSPEzhIGMMVVx3/gN+xotETWoSx4em8SPYU6wW8nG3wqLo2lSDz+18OHCa
	y0Ui58+6FFfT1a/MtrvS3y/xGUeihUhnIree12DhXYqyEU0WHM=
X-Received: by 2002:a05:600c:b85:b0:498:2b1f:e0c6 with SMTP id 5b1f17b1804b1-4997c12caffmr92430045e9.18.1786552202335;
        Wed, 12 Aug 2026 09:30:02 -0700 (PDT)
Received: from localhost (p200300f65f017104d14d09407ec2ee4e.dip0.t-ipconnect.de. [2003:f6:5f01:7104:d14d:940:7ec2:ee4e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49981aba3e3sm4063945e9.0.2026.08.12.09.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 09:30:01 -0700 (PDT)
Date: Wed, 12 Aug 2026 18:30:00 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "M, Krishnamoorthi" <krishnamoorthi.m@amd.com>
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, 
	broonie@kernel.org, linux-spi@vger.kernel.org, akshata.mukundshetty@amd.com, 
	bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	corbet@lwn.net, linux-doc@vger.kernel.org, skhan@linuxfoundation.org, 
	andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: [RFC PATCH 1/4] espi: add core bus framework
Message-ID: <anye28kId4k8pxBv@monoceros>
References: <20260804115259.4065638-1-krishnamoorthi.m@amd.com>
 <20260804115259.4065638-2-krishnamoorthi.m@amd.com>
 <anSGjRK8spayFnKw@monoceros>
 <0f7469b8-8275-4061-b336-97cbce41ff82@amd.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2paxlrpjxbcfpa7x"
Content-Disposition: inline
In-Reply-To: <0f7469b8-8275-4061-b336-97cbce41ff82@amd.com>


--2paxlrpjxbcfpa7x
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/4] espi: add core bus framework
MIME-Version: 1.0

Hello,

On Wed, Aug 12, 2026 at 06:20:29PM +0530, M, Krishnamoorthi wrote:
> On 8/6/2026 7:01 PM, Uwe Kleine-K=F6nig wrote:
> > On Tue, Aug 04, 2026 at 05:22:56PM +0530, Krishnamoorthi M wrote:
> > > [...]
> > > +const struct bus_type espi_bus_type =3D {
> > > +	.name	=3D "espi",
> > > +	.match	=3D espi_bus_match,
> > > +	.uevent	=3D espi_bus_uevent,
> > > +	.probe	=3D espi_bus_probe,
> > > +	.remove	=3D espi_bus_remove,
> > > +};
> > > +EXPORT_SYMBOL_GPL(espi_bus_type);
> >=20
> > Do you really need this exported?
>=20
> Yes, it is required. Controller and slave drivers built as modules refere=
nce
> espi_bus_type directly when registering devices. Without the export they
> fail to link.

I would have expected that

	drv->driver.bus =3D &espi_bus_type;

in __espi_register_driver() is enough for drivers to not have to use
that symbol directly?

Best regards
Uwe

--2paxlrpjxbcfpa7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp8n4YACgkQj4D7WH0S
/k4Ymwf+OtbJNAPe3Ou/27KwbxJa7KENRUomWmPpgocqBVTa4ITzi7yNWHl4gAqS
n5Xc9dI8tHJ49x6eepGWEp56WN4iknHSvv4VfsYY1q3IiP0BA7wHPGNtXoWIHOAa
4o7paa8rCqvUEEnsWHx6t7NgF4d9H3ByZLukSoHjbEaMGXR8k4sAoIZl6OP1zHLL
sDcIp43PhG5JIYLJA+zNDa/GcsWt7GAOI61w0iEk642G+3Sp4LU4Aeml8sLnCZwv
z5mEpWndwlZQ5q6u+eQBlADmahJtNTb4U9cwNydL7sdyQFKIWhpQEIlpaBbpzcKH
rwtLLuNJ9v2D8mdQKMK2Yod5Qp7vCg==
=HyN7
-----END PGP SIGNATURE-----

--2paxlrpjxbcfpa7x--

