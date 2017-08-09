Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xS1nn5HX7zDqtM
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 16:39:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AA4XBctT"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="p6pixRA7"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9243821C22;
 Wed,  9 Aug 2017 02:39:07 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 09 Aug 2017 02:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=fccj3QHexLSa662Fsy3J4criB8vmHNmfWeTGXmsmF
 hU=; b=AA4XBctT20L+J7MmoIyjMo3iMARE6zZkJ113gG94Gsle2gzinNOonl4P7
 NISSWN1kwxrKt8nb2y/cWDKtx10Wei5tdgiwy4gDmgVdrXTHPf5y/9EA0CDFIu5q
 f3zxZ6/w/kxV4KHQ1DddNaw7mMUei8oQSvHUwRPC0jabLLAjOuaCbNnBZctltg7e
 hgWGCotadWAQk8jUI9s/hF8USN1omhd1NFZFJ8+uGPhZQEps4sSb3sXnYcsXIy1F
 3R0bOSxRQsY4zKNJZKVsp6fjZdlnVFXs3NEdRv8BtgYuUsczdrrh5iBiHNpcSvTG
 LK0J7h46lF7v7p4a/HQtZPoshOUYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=fccj3QHexLSa662Fsy
 3J4criB8vmHNmfWeTGXmsmFhU=; b=p6pixRA7RYckcm4bK40ivKtkCo9FlNpSO2
 OsHw7rI93X+HTAxQ5ohmvXB6PArroOBiGVfSPkUoEk+FqlSsxS9FSfMx9S4aNyY/
 5IwaVTV7sa0mHIx5gNwVjQYdE5tPzB1+VRqinfxgQ5L5KmBuzvMmEO8/ggrTo50C
 ZRok3yjKh6fPfXCELYP5dDoCX9S4rrC8mkpREdLQmwj6kXMkrz5YOxwhTIr6nSqJ
 kqEFbwtZY2a8w7BWhe9QNz5d2LNj2YY3+yJnnM+reEF7VnYsomF4qGEbB1T+xQBh
 CHuYqIRAXRGrLGVe/7Vl6F/+VIKgylUjdp2wfdTlyU+hUoLY1PKw==
X-ME-Sender: <xms:C66KWenxXf1RCk3mk1li-wjIZjgoV8SHcIiJTEhnn9vaUHj__8kB2w>
X-Sasl-enc: qcrieKU9CsN922CVtMCUS8AHGh1Cim7WQEBZT7uUgiv3 1502260746
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 43E81244B4;
 Wed,  9 Aug 2017 02:39:03 -0400 (EDT)
Message-ID: <1502260737.7946.8.camel@aj.id.au>
Subject: Re: [PATCH for 2.11 v2 2/2] ARM: aspeed_soc: Propagate silicon-rev
 to watchdog
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 joel@jms.id.au,  ryan_chen@aspeedtech.com, f4bug@amsat.org,
 openbmc@lists.ozlabs.org
Date: Wed, 09 Aug 2017 16:08:57 +0930
In-Reply-To: <20170809062828.3673-3-andrew@aj.id.au>
References: <20170809062828.3673-1-andrew@aj.id.au>
 <20170809062828.3673-3-andrew@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8XhJjBNpGSdVp8W+1GiW"
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
X-List-Received-Date: Wed, 09 Aug 2017 06:39:10 -0000


--=-8XhJjBNpGSdVp8W+1GiW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ugh, disregard this one; I changed the subject and reissued `git
format-patch`, which naturally doesn't overwrite any existing patch in
the output directory and so the old one got sent as well.

Andrew

On Wed, 2017-08-09 at 15:58 +0930, Andrew Jeffery wrote:
> This is required to configure differences in behaviour between the
> AST2400 and AST2500 watchdog IPs.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> =C2=A0hw/arm/aspeed_soc.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 3034849c80bf..79804e1ee652 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -183,6 +183,8 @@ static void aspeed_soc_init(Object *obj)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&=
s->wdt[i], sizeof(s->wdt[i]),
> TYPE_ASPEED_WDT);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add=
_child(obj, "wdt[*]", OBJECT(&s->wdt[i]),=20
> NULL);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus=
(DEVICE(&s->wdt[i]),
> sysbus_get_default());
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_prop_set_uint32(DEV=
ICE(&s->wdt[i]), "silicon-rev",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sc->in=
fo->silicon_rev);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->ftgmac100, sizeof(s->=
ftgmac100),
> TYPE_FTGMAC100);
--=-8XhJjBNpGSdVp8W+1GiW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZiq4BAAoJEJ0dnzgO5LT5tA4P/065hV+GiIoAUi6VRVPPiKoA
KxXA3jfMAELdwniWC2XhCIBPr2pFXMLqLOGTwqRBs8tDR/+RF9/0EnyfxA9rDB2S
PmNyFfHiwmRlDn8nD9Sn7kYzM/JzHGQuKMjlLZHLSfU+B+y8mWUMdvujkp7NoFwx
MoNvJsq9y0eqDUsk4VEZd/MqJNhhuNylLmVd1ptsQRGDpHYSk+5dSvyq2/y4FjRU
OYY/5Dt9m86WA70Yiesyr0UgPaQ2u+/F9hCzienHLwnWgdJGaCVsCbIWQDZ9eDRi
IcpFUhVBcfjF4xwV5U0iuo2mbUBXdPtFU32EJJmVtaSMbD5PpGgFjOYd1sK4TEsu
SLRaQQ8TRMLfXqyS5hlrD3cEmF2aicJFpriLzVFJYFqtb8eX26hsTjPglbQC2DBg
OSyybGeU3YSiZvkzzQym4kktsxgQ1hM5NSLzqlxQjwWfc440fLgkPK3Iq0tNm6w8
eEKFEnfzB41mZ7zgVlJu8wB47ZP/pKNJZuZO8520bSRuiMuUC+NvqWQhoRV707jp
INWX7JDilvqDF/0VpETfEAatslAoRmbSItOrNbxwv6CTzyApmR4tqhbGeH9Upmj7
/t0jH9P4DjC9JX3g94Fz73rVimh0DzhMrcICeWnChqygcIBTo2B1LwXS7oc9W7nc
nQFRyMwa+RWGaFZo/uf5
=sEhT
-----END PGP SIGNATURE-----

--=-8XhJjBNpGSdVp8W+1GiW--
