Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq6G5043dzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 13:05:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="omqslS9w"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZxqwEdJX"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6137E20CEA;
 Thu, 23 Mar 2017 22:05:46 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 23 Mar 2017 22:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=j11ZIpKB8rbRXw9rpfiBUEjIkFWIoYHoX5eNol1Hp
 Ho=; b=omqslS9wH4gaZxj51+ie2YzYwneDDyZiuY9lSrssaBWjRG+iKh5JX807W
 KYObEHa+L1ZVtd/gpYUnzS703rxLlsKDJFJyi1mUM7yc6eEwxwDnSbGWgzkvfrvv
 gSeLavZ5wgBiLqabw7s5mkVTg9ZwQrh2jHpZ4yzKQ4NwwpujgI3kX8OsbHC9QQqx
 8r/78MtME1JQrfDQRysRNX1v46c8GM3ugGtrV5I5XkUnIO20sjcqarC8QCW1mX/x
 1PKv/ohIlbO3CkUvsmS5P8pb2XMX39pbeUjh6robPjrh91z2rjeQRmNbSTn5fis8
 4R1bTd5XmuAIv3mho5Np1MwzxA1SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=j11ZIpKB8rbRXw9rpf
 iBUEjIkFWIoYHoX5eNol1HpHo=; b=ZxqwEdJXIUBjBtovZ6OEgIwMTXkgFvgTgZ
 ivCs6wIH3h+foYnGIapJZxbwF8NpDXMAribJgF4stdMiJUElZma2z8GBoFDm+MMa
 wJqaZluCghzAHB0f23jdqJ+8zQP8Stg5RztdrlE014dzgbQ4EWW0xCV+plvV32Ul
 10rySgU/HduB7k2MDKbUdCl8DV3AOdkZj1v31Fy06Fz9Dti5RUTg0M7jPjZ3rzQR
 Rd1dnsi2xghPjVE0NetBJCUc6lJMdF9vHfkb7Z8BreLYBbg/H1j+K1aCXWqx5JLm
 +J8SNkDsvbySncZMdouad9zomFiYfkeudgjaTvSE4JrVfEFsJiNA==
X-ME-Sender: <xms:-n7UWOcJuwwuKWlO3FO1zlOw-bUiAFkI-n8K5ind5Zk3hKSDnFZ4hA>
X-Sasl-enc: iyFOvP/28qwHJRSoVzmTmhwx8k5sJD5MltevQSGEfdi9 1490321145
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BA7D9244DA;
 Thu, 23 Mar 2017 22:05:44 -0400 (EDT)
Message-ID: <1490321135.3847.6.camel@aj.id.au>
Subject: Re: [PATCH] ARM: aspeed: Disable UCD90160 in the Witherspoon
 devicetree
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, Xo Wang <xow@google.com>
Cc: openbmc@lists.ozlabs.org
Date: Fri, 24 Mar 2017 12:35:35 +1030
In-Reply-To: <20170324011322.31837-1-andrew@aj.id.au>
References: <20170324011322.31837-1-andrew@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-I+lJX52pgWZp+PNN4YD+"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Fri, 24 Mar 2017 02:05:49 -0000


--=-I+lJX52pgWZp+PNN4YD+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Xo: Adding you in case you've seen any issues with Zaius that may
benefit from a similar work-around in the short term.

The associated userspace changes for Witherspoon are here:

https://gerrit.openbmc-project.xyz/#/q/topic:unbound-ucd+status:open

Andrew

On Fri, 2017-03-24 at 11:43 +1030, Andrew Jeffery wrote:
> This is a work-around for [1]. Binding the UCD9000 driver to the device (=
and
> possibly the sequence of unbinding, poking the UCD90160 via i2cset, then
> re-binding the UCD9000 driver) appears to have some negative effects.
> Instrumenting the transactions with reads of the PMBus status tree lead t=
o
> the following observations under "normal" operation.
>=20
> [1] https://github.com/openbmc/openbmc/issues/832
>=20
> UCD9000/PMBus core sending unsupported commands:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:42:50 wit=
herspoon kernel: ucd9000 11-0064: Device ID UCD90160|2.3.4.0000|110603
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:42:50 wit=
herspoon kernel: i2c i2c-11: Status byte indicates error: 0x3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:42:50 wit=
herspoon kernel: i2c i2c-11: Unknown error
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:42:50 wit=
herspoon kernel: i2c i2c-11: CML status: 0x80
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:42:50 wit=
herspoon kernel: i2c i2c-11: Invalid Or Unsupported Command Received
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:42:50 wit=
herspoon kernel: i2c i2c-11: Transfer failed: -5, status was 0x3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:42:50 wit=
herspoon kernel: i2c i2c-11: Aborting retries after 1 attempts, returning e=
rror -5
>=20
> Reading the status bytes off the UCD90160 gives -EBADMSG:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:21 wit=
herspoon kernel: i2c i2c-11: Error reading PMBUS_STATUS_BYTE: -74
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:56 wit=
herspoon kernel: i2c i2c-11: Error reading PMBUS_STATUS_CML: -74
>=20
> "Other comms fault" errors:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:56 wit=
herspoon kernel: i2c i2c-11: Status byte indicates error: 0x3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:56 wit=
herspoon kernel: i2c i2c-11: Unknown error
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:56 wit=
herspoon kernel: i2c i2c-11: CML status: 0x82
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:56 wit=
herspoon kernel: i2c i2c-11: Other comms fault
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:56 wit=
herspoon kernel: i2c i2c-11: Invalid Or Unsupported Command Received
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:56 wit=
herspoon kernel: i2c i2c-11: Transfer failed: -5, status was 0x3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:56 wit=
herspoon kernel: i2c i2c-11: Retrying transfer (attempt 1)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:57 wit=
herspoon kernel: i2c i2c-11: Status byte indicates error: 0x3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:57 wit=
herspoon kernel: i2c i2c-11: Unknown error
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:57 wit=
herspoon kernel: i2c i2c-11: CML status: 0x2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:57 wit=
herspoon kernel: i2c i2c-11: Other comms fault
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:57 wit=
herspoon kernel: i2c i2c-11: Retrying transfer (attempt 1)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:59 wit=
herspoon kernel: i2c i2c-11: Status byte indicates error: 0x3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:59 wit=
herspoon kernel: i2c i2c-11: Unknown error
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:59 wit=
herspoon kernel: i2c i2c-11: CML status: 0x80
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:59 wit=
herspoon kernel: i2c i2c-11: Invalid Or Unsupported Command Received
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:59 wit=
herspoon kernel: i2c i2c-11: Transfer failed: -5, status was 0x3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jan 24 06:43:59 wit=
herspoon kernel: i2c i2c-11: Aborting retries after 1 attempts, returning e=
rror -5
>=20
> Reduce our problems by communicating with the UCD90160 as little as possi=
ble.
> With the associated userspace change, the only communication will be appl=
ying
> the VCS work-around.
>=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/=
boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 4d26d4702a34..69d5897dbfde 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -253,6 +253,7 @@
> > =C2=A0	};
> =C2=A0
> > =C2=A0	ucd90160@64 {
> > +		status =3D "disabled";
> > =C2=A0		compatible =3D "ti,ucd90160";
> > =C2=A0		reg =3D <0x64>;
> > =C2=A0	};
--=-I+lJX52pgWZp+PNN4YD+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJY1H7vAAoJEJ0dnzgO5LT5QJgQALiJcezOA1c3w9ueOga1Vt65
23SNaCVrqcjGriozftln6R//Yn8IneKuvp8u+dYHiezAB2/YNvyCBq3/xoOz87fF
pDQ8dycfOMUVvLJudC3TyCOLpHIbJugoNjBKCvwjlEckWzdup4rADAh/Fk4AKuWr
GSeq6UnVIrWTSqSUE7rwVM1X1Je9kWgo5ljO5mpbRF1oHzcAqJqs6Ak1PRfIlSz6
JCmkZ7zpetpDzuEW6mDxmyHgjtp1FxWoWQDYVjN1ALwXxgmOW5VCvZlYIeSE6NpW
8S8JIK28wTmOZRr7vIBcU3XIlRXVCg7heIplLJb5iuP3gsaCirfPU0yYVdQJEL15
2mCopuGrkdrRa6iX6jaGLaImfPBPGVb78VDhvYWqqcJY0GUjPJIDjWcMReyFr70C
gRKo90kBg60jHQc4fhpso+11sAI9MgTgwJ4dwwYnpn45ih199FguYwWS+3sTBpLI
b2BiO0RkkeHrTU6EkEim0ES91c4xEE5l3LbUQmhNV9d+Ac6q3VPN+sibz6wTr1nF
Vmf9atJQ1+ej/YuAByiWPNFDbdAB0hLRRqZHjBCkgkDTOahGGRitf7hf7vZ1L8OO
raQ8+rLTbOl+by69MJ8JmYZWyTXf6sZ1xsXFAE3/fyZYbPQFBUKXmAWgnycCMVVn
muwMdHq+xnEs839bcb6H
=qrBP
-----END PGP SIGNATURE-----

--=-I+lJX52pgWZp+PNN4YD+--
