Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ELDOa25u"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="M7zRQ25o"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCx2T64hBzDr4T
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 16:23:29 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 45F7820BCD;
 Fri, 13 Oct 2017 01:23:27 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 13 Oct 2017 01:23:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=cMKsKdokiZsJpbOHPAx7l49pHana7B6spsgAEGXC3A8=; b=ELDOa25u
 XZ6REgt6vCkyyoD0q8vL+jB9uKUpf69HuvFvnKtBEDDzvJEhwAcmLXsFdNGGbi2I
 13BY1q7cK1WvB+zitnyxHz2hty3GfsvLPN8PWVhfqz12jWoqhTTls+BCG1d0ikGQ
 m7HugoBZYqkzRup1JaPuOlz+7UHG+PHxXMwaetIDSKf5gWMRtQOpkytUFweJQFl+
 4Fco67V2vLhmveUZbuyu+R5wdvmIkxLCYCDTcMtoiT6NjPbWVfA8ux6yzAMwpE1u
 vBtf9iMvygOEbtIFxleMUVKcgXHBzppO8O23PI+g/gnLXpKh0aDs3xziSeV06qS6
 fDIb/Vyf5W+S6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=cMKsKdokiZsJpbOHPAx7l49pHana7
 B6spsgAEGXC3A8=; b=M7zRQ25oxmWDPHt0f6qatG+xBGKqPu2Xb5UgUcsyil1b0
 3qfX8ZDzifZ0DaD9Wtw96kpVJcQw7naqJaJHXWaCFD4/g+yhlOjjjVsDJYvlfvxU
 D092T0m0FxvcvC8iiehyLlv6ii3P9jMHahZ547PX7gD2iGJMrDdVdWpKW1B1F8Ql
 Iw3DgZ18r4n0n0QlQg9I5gZqKdHKU3uoqow2LOwyCg8zt2vnRglRCnZ/UpRG/DqE
 l4EQbwbVAD/74jMzoRWDvkiXOZZC6DSg7IEs/Z2Rg8kH3TCr20MCqJCOyMku1+r8
 1w0jd2CyHEh9b3AOLTPN5sTv1hbAhqF3+qrEB9BNw==
X-ME-Sender: <xms:z03gWf5crWFbVhMaFd0GXGpuwETwb2r0_pO5nAXttA1apGAjOXMipg>
Received: from keelia23 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id CB90124738;
 Fri, 13 Oct 2017 01:23:25 -0400 (EDT)
Message-ID: <1507872202.5452.199.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: firstone: Fix occ and i2c
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
Date: Fri, 13 Oct 2017 15:53:22 +1030
In-Reply-To: <1507774637-13084-1-git-send-email-mine260309@gmail.com>
References: <1507774637-13084-1-git-send-email-mine260309@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-B+uxmz965maT1UWirAlX"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Oct 2017 05:23:32 -0000


--=-B+uxmz965maT1UWirAlX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-12 at 10:17 +0800, Lei YU wrote:
> 1. Use updated p8 occ driver;
> 2. Enable i2c buses that are used.
>=20
> Signed-off-by: Lei YU <mine260309@gmail.com>

Applied to dev-4.10 with a typo fix for 'firstone' in the subject

Cheers,

Andrew

> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 15 ++++++++++-----
> =C2=A01 file changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index d52b528..93ad3ea 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -117,6 +117,7 @@
> =C2=A0
> =C2=A0&i2c2 {
> =C2=A0	// i2c mux
> +	status =3D "okay";
> =C2=A0};
> =C2=A0
> =C2=A0&i2c3 {
> @@ -217,8 +218,8 @@
> =C2=A0	status =3D "okay";
> =C2=A0
> =C2=A0	// turismo
> -	occ@50 {
> -		compatible =3D "ibm,occ-i2c";
> +	occ-hwmon@50 {
> +		compatible =3D "ibm,p8-occ-hwmon";
> =C2=A0		reg =3D <0x50>;
> =C2=A0	};
> =C2=A0
> @@ -232,9 +233,9 @@
> =C2=A0	status =3D "okay";
> =C2=A0
> =C2=A0	// turismo
> -	occ@50 {
> -		compatible =3D "ibm,occ-i2c";
> -		reg =3D <0x50>;
> +	occ-hwmon@51 {
> +		compatible =3D "ibm,p8-occ-hwmon";
> +		reg =3D <0x51>;
> =C2=A0	};
> =C2=A0
> =C2=A0	tmp423@4c {
> @@ -260,10 +261,12 @@
> =C2=A0
> =C2=A0&i2c9 {
> =C2=A0	// 4 way mux
> +	status =3D "okay";
> =C2=A0};
> =C2=A0
> =C2=A0&i2c10 {
> =C2=A0	// 4 way mux
> +	status =3D "okay";
> =C2=A0};
> =C2=A0
> =C2=A0&i2c11 {
> @@ -304,10 +307,12 @@
> =C2=A0
> =C2=A0&i2c12 {
> =C2=A0	// i2c hub PCA9516A
> +	status =3D "okay";
> =C2=A0};
> =C2=A0
> =C2=A0&i2c13 {
> =C2=A0	// i2c hub PCA9516A
> +	status =3D "okay";
> =C2=A0};
> =C2=A0
> =C2=A0&gpio {
--=-B+uxmz965maT1UWirAlX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ4E3KAAoJEJ0dnzgO5LT5QD4QAIxt/C0he8ysRE2U7AsycuLi
OvcMamU46C085jprMMt1PYI5SHuN2M2KA0qs0irWLX/kMmKzb0X8niaG2LTo27Up
QfWszT4qVzEJt5ih356T39MsjbzK3Epei1RbJ4qDVd0qdMDjmz9rzLGwCBmeTU3J
DWzrUG2RSndiRmCd0lVtFf0fySpL5kB4SQNM67WTh7Hdi+R72OT+EujBY+FP6Dm6
GpPLwxdlOyfGCff6qyYMgQ7f2Ym9uF0xUPxMYtlDjkwlwaoAELBvP/B9DcQx+0Kr
VnL9WR6HynsHi3BcJX4ypa5Zs2GsBEdeG4gFwn3A0SFMTWtX87dk5RdANk3Co3Kf
H4gX5cbSdM/j6WpJwcqcpmAo0ijXlsBGbPObCdgpJ8sB/RhkYJs3OrhndMinlNvn
6XqE+bFG/pGunrVrYSWCP4AFQ4I7RTVxxwE6webDpv4Zq3OGMAqZR0+vWuHGjtx+
DMCbUlDWo+L6Kgzew17/2yU2dyP6ISg2xQtE0cWpHXgPEF/x8Fb+ctETIlPvFeHI
nLHRgBHbjg/x9umLubj4s+zkWmYtBeMGh/tEqqTXjmB759fdXCz9R9bzJW01UULT
xeD8+pENTorv2eeAQ/ClBmbt6QUu/wGiHR0Ndx3lyaPuUZv/HsvM6ELV8cjx2HKC
+Znpd2QctHh4aNV9OLN9
=pwm3
-----END PGP SIGNATURE-----

--=-B+uxmz965maT1UWirAlX--
