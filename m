Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZp336R5WzDqhc
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 14:12:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=iwohGhdz; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=qFxysDVg; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1A25FBEE;
 Thu, 23 Jun 2016 00:12:45 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Thu, 23 Jun 2016 00:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=K0AAE
 zs6DyhZFyhE4H3aksO95eM=; b=iwohGhdzHfBoQjrzFVQqL0Uilzn63QZs1lkPo
 8NVj18QorV4IqBX2VsEdtIhOtD8D6Dyt/7ykqjOE1RUW2sotKS6lSmxUaNH+I1eu
 qPfuz3MUJOwysJ7QTPKz7OJJOjW7BKv09HaxI7/3qQJHxO5rRJH6S3o9MCob02EH
 0qbQe8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=K0AAEzs6DyhZFyhE4H3aksO95eM=; b=qFxys
 DVgUgASBGKzTSvlvVSIaErI4covxO+g383QCV/UIaKAnDG/i0kkEfYKdaT0oKFxF
 o3pqdUOaT/RZwhV+n57bsTA4Z9fLwluPH0VWHahWQMI0SZaA6PPsNDsZy2SFpZ1m
 vrYfCMlQOtvQGZvSPNhwf/ozhb/g3XZ1kZWc4U=
X-Sasl-enc: pSQ6i7yOjzv6Cxv9D6GctS6goYnV9T8WMg0RKszz0Zk+ 1466655163
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id A7DBECC078;
 Thu, 23 Jun 2016 00:12:41 -0400 (EDT)
Message-ID: <1466655157.23740.36.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 01/18] Add pflash parallel build fix patch
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, miltonm@us.ibm.com
Date: Thu, 23 Jun 2016 13:42:37 +0930
In-Reply-To: <20160623003038.2361-2-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-2-openbmc-patches@stwcx.xyz>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-3mNxFGgEG7Pt5sVa1fUf"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jun 2016 04:12:48 -0000


--=-3mNxFGgEG7Pt5sVa1fUf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>=20
> This resolves https://github.com/openbmc/openbmc/issues/325
>=20
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Brad's sent this to the skiboot list, maybe we should just hold off
until it's submitted there and drop this patch from the series?

Andrew

> ---
> =C2=A0.../common/recipes-bsp/pflash/pflash.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A01 +
> =C2=A0...-Fix-ARM-build-failure-with-parallel-make.patch | 28
> ++++++++++++++++++++++
> =C2=A02 files changed, 29 insertions(+)
> =C2=A0create mode 100644 meta-openbmc-machines/meta-
> openpower/common/recipes-bsp/pflash/pflash/0007-external-Fix-ARM-
> build-failure-with-parallel-make.patch
>=20
> diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-
> bsp/pflash/pflash.bb b/meta-openbmc-machines/meta-
> openpower/common/recipes-bsp/pflash/pflash.bb
> index 496e900..ec43b4f 100644
> --- a/meta-openbmc-machines/meta-openpower/common/recipes-
> bsp/pflash/pflash.bb
> +++ b/meta-openbmc-machines/meta-openpower/common/recipes-
> bsp/pflash/pflash.bb
> @@ -11,6 +11,7 @@ SRC_URI +=3D "file://0003-external-Fix-pflash-install
> -target.patch"
> =C2=A0SRC_URI +=3D "file://0004-external-Remove-m64-from-shared-CFLAGS-on=
-
> ARM.patch"
> =C2=A0SRC_URI +=3D "file://0005-external-Create-shared-rules.mk.patch"
> =C2=A0SRC_URI +=3D "file://0006-external-Add-dynamically-linked-
> pflash.patch"
> +SRC_URI +=3D "file://0007-external-Fix-ARM-build-failure-with-
> parallel-make.patch"
> =C2=A0
> =C2=A0LIC_FILES_CHKSUM =3D
> "file://${S}/LICENCE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
> =C2=A0
> diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-
> bsp/pflash/pflash/0007-external-Fix-ARM-build-failure-with-parallel-
> make.patch b/meta-openbmc-machines/meta-openpower/common/recipes-
> bsp/pflash/pflash/0007-external-Fix-ARM-build-failure-with-parallel-
> make.patch
> new file mode 100644
> index 0000000..a9d219c
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-openpower/common/recipes-
> bsp/pflash/pflash/0007-external-Fix-ARM-build-failure-with-parallel-
> make.patch
> @@ -0,0 +1,28 @@
> +From 55749b091414e0cf2691bd8f72c4cb48235b51c3 Mon Sep 17 00:00:00
> 2001
> +From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> +Date: Mon, 20 Jun 2016 20:31:07 -0400
> +Subject: [PATCH] external: Fix ARM build failure with parallel make
> +
> +Arch headers need to be linked in before compiling.
> +
> +Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> +---
> + external/common/rules.mk | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/external/common/rules.mk b/external/common/rules.mk
> +index 5558cd3..bb12fd5 100644
> +--- a/external/common/rules.mk
> ++++ b/external/common/rules.mk
> +@@ -67,7 +67,7 @@ arch_clean:
> +=C2=A0
> + $(ARCH_SRC): | common
> +=C2=A0
> +-$(ARCH_OBJS): common-%.o: common/%.c
> ++$(ARCH_OBJS): common-%.o: common/%.c $(ARCH_LINKS)
> +=C2=A0	$(Q_CC)$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@
> +=C2=A0
> + common-arch_flash.o: $(ARCH_OBJS)
> +--=C2=A0
> +1.8.3.1
> +
--=-3mNxFGgEG7Pt5sVa1fUf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXa2G1AAoJEJ0dnzgO5LT5qEMQAJH/vZbJnPVIT8Nq/r0t/y0N
nmGspad2HsaMHvFy/WcTUa6hljjncnqCyjOnLDKAnth7auM0DyR7TyuYnxvPak6l
gW54x0LSqDscKUjaPDiiJn9wIM4E2ypzphKtWDEmBlrqM/2iuLeeb6Y8rBB7I6S6
O6a/H97YPGjneUbL+dyl9F6GBq1qxl6xDYWb2+V1uyRAi+xsV1Kf9f6gg+kQvXHf
fdxsAwD9X2qr9FCZoub7yOR4Cl1DRLtubm0eGPD7flzryeL/H/acWUS9D1vptRcL
vR/2LLr6SMYzI24IRnOYx10DubuTCz9GRPYtkZTrIU4t+ocPFp/4xoZ3nuFJGphl
Hw9O+NPe8841g0fDr/uS3DGTyMaUT6sQYqaIFl+kblDp/jtr/LCmQCMft3YRa6Qg
pVnhi3fvlZNWRbruQTan8NBzdBiu3ZXbGnD9606LlxhzHTnPmD2ohanQqYthsg7C
DV3/trHxjMeJhA25Cfb136GlhyE7ll5YhFtftLt43dLVEWCvUAUuTXACkqQa4920
CdzFOOkFgvWeUkN8+JC9GZR4Oos3zIwKdlrmiEGa2o1ySjohtOf/V+o/smazV9AJ
NqZnADnF6e3HU1jWcdn+YVBQyg4sWM1WPCP1WL5GVszwDH4WgblCtWs6+8/cfOAM
zkIhD6XEn7B8h5ocZ4zy
=FTVb
-----END PGP SIGNATURE-----

--=-3mNxFGgEG7Pt5sVa1fUf--
