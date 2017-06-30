Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wzRLj25PMzDr60
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 16:23:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="slinb5dY"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="T+ztySU4"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 24AF320C1A;
 Fri, 30 Jun 2017 02:23:55 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 30 Jun 2017 02:23:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=X6HSPbpSx0mYUdWtxi9jn1Zk9aOts4VfuMWR9RRIF
 Ms=; b=slinb5dY6a+ja/JhuEBgumKnnZcDh9l1fOeUiUP0/oevnFGVHN0FuirAr
 MGMBJc3IiI34TD2HLxvBESAfzhIr8Y1e8PMJb9XjBPgJzfRBciBRIFu7TK0T9Suq
 Zkgyl87hiVbva9Kf6TKKO3SI7huVTMN15WwTkN7/UfKGw+B7yNACcB3LFSFoZX0k
 6dugkIcEF4md03rPS8bEZhZXlqvLlIehS3Co72rTDRe8EmODKWjqB9qz9J1NTKu2
 iOLxdZE0EGUlm+ZFaTeE1DrHLr9HR4KPoW0zv6byPGrU0sgzyxUnvbKGLRV3GCma
 OJuM+l6OzIkYFaDxfLoRZ04qnjprA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=X6HSPbpSx0mYUdWtxi
 9jn1Zk9aOts4VfuMWR9RRIFMs=; b=T+ztySU4EB8jj9eAVenhmbzZb1zR639i9+
 NulVfQtfDUlu5FeA2CD2VQ4MmpTjuvyHEEtxIor6k8VbUhbQiKmhA2t18XdTsKqX
 QKFvHI3UPq9UTY62b3CNYHTj4PcpZr7XLjIjzBsmwEAlvKHs/K2ifn1tqGbjVWbW
 PYXskb7aSpg0epru1apcJ8sZBsJ5C9d17XcxZjoqnHSuVEPZThxG8AxiyXITvr86
 w4lkfV91YOeEy6viU2F416i1cx+Cc1RpZ19uc9UVhgIFdQ0/z+QsldXERpQ19Rv4
 ZnDTBKcJoxtsXluinmC/5mukWZlm5LosGZrEkdWOLXvNrF7xkRZw==
X-ME-Sender: <xms:e-5VWd7HtDHeHGWbIM6qZ0Ebcub9ZQcggkerdSoW6Tp7gYmMgQ8DYA>
X-Sasl-enc: Rx9aExSohvXWkdep/DOdqnW8Z6LXtXZAM0SRu4A0tQ9H 1498803834
Received: from keelia (ppp118-210-130-225.bras1.adl6.internode.on.net
 [118.210.130.225])
 by mail.messagingengine.com (Postfix) with ESMTPA id 197C87E32F;
 Fri, 30 Jun 2017 02:23:52 -0400 (EDT)
Message-ID: <1498803825.5203.23.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] aspeed-g5: add gpiolib irqchip support.
From: Andrew Jeffery <andrew@aj.id.au>
To: Vadim Pasternak <vadimp@mellanox.com>, Mykola Kostenok
 <c_mykolak@mellanox.com>, Joel Stanley <joel@jms.id.au>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Fri, 30 Jun 2017 15:53:45 +0930
In-Reply-To: <AM4PR05MB33301315344DDE9F1ED9F775A2D30@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <20170629133239.17711-1-c_mykolak@mellanox.com>
 <1498786763.5203.17.camel@aj.id.au>
 <AM4PR05MB33301315344DDE9F1ED9F775A2D30@AM4PR05MB3330.eurprd05.prod.outlook.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Qm5c0xfkgDly93v5Kwl5"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 30 Jun 2017 06:23:57 -0000


--=-Qm5c0xfkgDly93v5Kwl5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-06-30 at 04:44 +0000, Vadim Pasternak wrote:
> > Sorry, I don't understand the need for this; CONFIG_GPIOLIB_IRQCHIP is
> > already selected by CONFIG_GPIO_ASPEED, which is enabled by the
> > aspeed_g5_defconfig. I don't think we need to do this here.
> >=20
> > Further, what problem are you trying to solve? From my testing GPIO
> > interrupts are functional.
> >=20
>=20
> We have the number of CPLDs with the internal interrupt control
> logic. Interrupts on top routed through the particular GPIO to SoC.
> The motivation was to specify top aggregation interrupt for CPLD
> driver in DTS with GPIO pin number and convert it in driver with
> gpio_to_irq and connect irq to CPLD interrupt handler.

Okay; you'll likely want to use gpio*d*_to_irq(), as gpio_to_irq() is
part of the legacy GPIO infrastructure. It doesn't look like you need
GENERIC_IRQ_CHIP to access gpiod_to_irq(), the existing GPIOLIB
dependency should be enough.

If we did need configuration changes, my preference would be to put
them in a defconfig rather than in the arch Kconfig.

Cheers,

Andrew
--=-Qm5c0xfkgDly93v5Kwl5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZVe5yAAoJEJ0dnzgO5LT5KnAQAKfqAHDuKfVFtDMRW/TLTj0n
Y9GzUnRsjKaveLbOWlKLxKFmyYSYPUehpQ6QGSHlH1zwkIzb+g50oeqlc74noXY4
1uAPPcJzLV4bHSrPYr5yB1HPQTKiHzmSS/axfsvxCQhLg1rcBbm4Brfvl2lY6XBL
paPrcxGmZUuck3CfZk7WaU4V4RrnlEkGVJI2lenI5DcizLjRgH3Y9W5/TPB8EtqJ
lIPLa8ObHwf7TYgh/cNGqFO7JI/JRPvm37VLVzEDhRcjjkVJS3oLs6zjiJ3Zr1Qr
m+TlFK+8+OAN4xWGHyi160hOr6cgUJxw9s4rxAaZSpOtc8Hph4rw1iWtQd+yfz3v
lJ7Uyds7sNw+AQsvEJtcO/MDo30IuJPBuc5FpCba0oZLLxvxGkDkYA7srsvY6Zkf
ttCXwW3wKrjPnQqWeh/lm3tCbQiY8gnnCXI9ylQ2SWMZzkvpWzfoaws/ols6CMb5
NNxTKna8ukDqccZ37BRAGTNoATL2+9As0EYaqnuDyMnRr8tLdl3myQ+AHF00Iwrh
d4X+yE4EhzkWQLSCc1iau+dxe+vCt8MI29FID7Qm6GxzHJ7zU0d+Uh56mcRSzm/K
5pfchXecuyyxS+gpxjB7r3K07l2G742E3TYXjz94jdQ7OsVdy9r+pjYpcxq6l4X4
PUqOxacvfROMKaOzkrWW
=u5ht
-----END PGP SIGNATURE-----

--=-Qm5c0xfkgDly93v5Kwl5--
