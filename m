Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZxqD5cV1zDsZP
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 11:03:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Rje73May; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=pZUmDmOe; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id BC1A320556;
 Thu, 15 Sep 2016 21:03:18 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Thu, 15 Sep 2016 21:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=ll42k
 ZOloP3Ptvp7IhT0Y5aiv3A=; b=Rje73May86tMslC6S5qWFpr29fycJrKoSFCPb
 QLUDUg5XS1BaZS50A6sVLMjHjGo82eSvFrYG/GK6s1Yat1NVvUEwPDb+0G16kslT
 4ZWUiDX3RnPK4qVGWwvfX6yFvXCtYECKhzph4pTNpjJnt68rfdqSslbYyo6lw2HR
 aKLkkc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=ll42kZOloP3Ptvp7IhT0Y5aiv3A=; b=pZUmD
 mOeZZcEfP+tGeHBDYOYS1New5WQrshakmfSG9Wah6Vr7edaMB8mlpvjzQ0u/iBW1
 LH2pKiYCmAfOy7un2ykUrMf7FbA1hYtWCoQoK76tvNi49dny9ojWQG0r8C/iuRjP
 8Jqf9aOgI9QfkXQipjPdtcF3aBHJcGH3lTGuqc=
X-Sasl-enc: IQoATYsx3Klx44eZNM6HcwcPnCKC+idMrT4GGCbNwRRm 1473987797
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 64D15F2D29;
 Thu, 15 Sep 2016 21:03:17 -0400 (EDT)
Message-ID: <1473987793.13249.17.camel@aj.id.au>
Subject: Re: [PATCH 05/16] arm/dts: Remove mac hardware checksum from Firestone
From: Andrew Jeffery <andrew@aj.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>, openbmc@lists.ozlabs.org
Date: Fri, 16 Sep 2016 10:33:13 +0930
In-Reply-To: <712861897.194624.1473971675913.JavaMail.zimbra@raptorengineeringinc.com>
References: <712861897.194624.1473971675913.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-NIo9dHaGHuk5TY1wYXX7"
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
X-List-Received-Date: Fri, 16 Sep 2016 01:03:21 -0000


--=-NIo9dHaGHuk5TY1wYXX7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-09-15 at 15:34 -0500, Timothy Pearson wrote:
> =C2=A0BMC Board

A couple of nits:

Some of your subjects appear to exceed the recommended max width and
are wrapping into the body. Ideally these should be shortened to around
50 characters (recommended by `git help commit`).

>=20
> Hardware checksumming doesn't work.

Perhaps the subject should say 'Disable' rather than 'Remove'; it feels
odd seeing an addition in the patch when the subject claims remove :)

Anyhow,

Acked-by: Andrew Jeffery <andrew@aj.id.au>

>=20
> Without this patch pings work but more complex network interactions like =
SSH
> fail.
>=20
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |=C2=A0=C2=A0=C2=A0=
=C2=A02 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/bo=
ot/dts/aspeed-bmc-opp-firestone.dts
> index 2ec9e44..ae1a633 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -51,6 +51,8 @@
> =C2=A0
> =C2=A0&mac0 {
> =C2=A0	status =3D "okay";
> +
> +	no-hw-checksum;
> =C2=A0};
> =C2=A0
> =C2=A0&i2c0 {
--=-NIo9dHaGHuk5TY1wYXX7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX20TRAAoJEJ0dnzgO5LT5a8wQAKf+7TRCUFx8dTSCASitvkv7
myoQepenWYeBXZP0HRPWouCQ4Cs+ahFCsElqQefUyH/fAjwHiONDYX2LPqrFsv8f
XIt9XpkR5R9ftwBS7b5anZYSiXiNN5kxGe29E5g67Kp8wt/o9BSlxKonUL3ZDT0a
5mJZbR54qvhI0iqnKBVX/4pq362LjUV4y08LzWzsEdNEUmvQUIsEO2/vut0H15Jk
0TZcOXkHfpLkfptsYKGpH71mSSUMzbAp75zLXFu68QVwn8pefoYb3E7ex0F10Jtf
tBZUjiw5vjLa19R+8VwLNm2gMjSSdPplHPWliEhiApvw/3XB1RDjPpwQrYxuQJX3
G0x02eyrBkTiLvIQOTb4qdV/Kif3CgKiup/IA29So325C2IpvMIcFw8NnP6IFzbm
KLrhIG5Oq1YDR2Jab7TTl/bN/8+gV2VDoOzDKYWcAceBWHB7q6SdnIjblvFcgCnQ
IyykyLwF9FJWtiFdDe4JbU4bzPSPwdcKzsRh3HVFxL7ahZvbMC3AwkFKC+2B8deK
VXRSF1GqRfHEivFpXuB0td+kbLinM5eBKgdrL9pyOwNPA4eaHnJCC4zV6N4U9IEz
dSH4ot+5nlKM9dNIMrvRGAJL1TDGFVdsFpZ71mI/JDR08pHKlb6QFegWtS2HM9u2
kmcuSNj6EH3tHM393lav
=HGxP
-----END PGP SIGNATURE-----

--=-NIo9dHaGHuk5TY1wYXX7--
