Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vF3K06vb3zDqBX
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 15:09:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="FoPqXBme"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CEDpWkc4"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 51F772099D;
 Thu,  2 Feb 2017 23:09:06 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 02 Feb 2017 23:09:06 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=G5g/iECtrLoRlVjw5IoL4FWofIs=; b=FoPqXB
 meImHP9xytdGJWnAvObWdb33IohOZBM/EEvWoCrFsOIO+n9Th0gXlcWRLKnf5sAN
 qF/+PbmTm/R9/ikqfP3UH9Zal6beLyLFyxCBZ5OCSzwBLROGvB4E1fdQevKm/8yQ
 BK1/mpx//5KSIAbft6OXSsoDtqphEuzWRdAx0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=G5g/iECtrLoRlV
 jw5IoL4FWofIs=; b=CEDpWkc45y+G9btU3T1HgLNCMo305IeBWXBE0jIVlQiMYN
 5BoyJpUGnxv/rrJcC9GKcAumWAhBH2951aP2wPfMUrH7W3h7J/0U8dQT1dtBup/8
 cZd34edpHHnWKDWS3ZoUMxVmjdP7QigbbW2ZQ6Y2D8yldmhzpjMMLxpAUD2Ic=
X-ME-Sender: <xms:YgKUWGNaKSFgsjrqI_T7cSUCIkkoYF-2IdKoBuoUWDC9GwYY0yc_ew>
X-Sasl-enc: KyJOiTdnEl0C5TEJDrmJ/3Bx+nzRzJq9ebSjI4rSbUX2 1486094945
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6FC4B7E077;
 Thu,  2 Feb 2017 23:09:04 -0500 (EST)
Message-ID: <1486094940.7271.5.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 00/14] Update GPIO and pinctrl to upstream
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org, Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Fri, 03 Feb 2017 14:39:00 +1030
In-Reply-To: <20170203035716.646-1-andrew@aj.id.au>
References: <20170203035716.646-1-andrew@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-dk+6oNgDNoME8YKxwolu"
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
X-List-Received-Date: Fri, 03 Feb 2017 04:09:09 -0000


--=-dk+6oNgDNoME8YKxwolu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I've aborted the sending of this series. `git send-email` will by
default Cc people who have tags on the patches, most of which are
cherry-picked backports from upstream. This resulted in the backport
series being sent to the GPIO/pinctrl maintainer, who is already
stressed enough as it is[1].

I'll resend in a moment.

Apologies for the noise.

Andrew

[1] https://lists.ozlabs.org/pipermail/openbmc/2017-February/006366.html

On Fri, 2017-02-03 at 14:27 +1030, Andrew Jeffery wrote:
> Hi Joel,
>=20
> This series gets the GPIO and pinctrl subsystems of dev-4.7 into the same=
 state
> as upstream. A handful of patches reset things back to mainline, and then
> patches applied by the GPIO and pinctrl maintainer are cherry-picked in.
>=20
> The series has three checkpatch warnings, one for "lack" of Kconfig symbo=
l
> description in 2/14 (which simply resets some state to match mainline), a
> second for a duplicate S-o-B tag in 5/14 and another regarding commit mes=
sage
> line length in 6/14. I've added my S-o-B twice in 5/14 because the patch
> doesn't backport cleanly and I had to remove some code. The commit messag=
e
> warning in 6/14 is for a link to the upstream patch and isn't appropriate=
 to
> wrap.
>=20
> Other than that, it builds with aspeed_g{4,5}_defconfigs and boots in Pal=
metto
> and Romulus QEMU machines. The cherry-picked patches have been tested on
> Palmetto and AST2500EVB hardware.
>=20
> Please review.
>=20
> Cheers,
>=20
> Andrew
>=20
> Andrew Jeffery (13):
> =C2=A0 gpio: aspeed: dt: Reset bindings to mainline
> =C2=A0 gpio: aspeed: Reset to mainline
> =C2=A0 aspeed: dt: Mark GPIO controller as interrupt-controller
> =C2=A0 gpio: aspeed: Add banks Y, Z, AA, AB and AC
> =C2=A0 gpio: aspeed: Remove dependence on GPIOF_* macros
> =C2=A0 aspeed: g5: dt: Update GPIO pin range to mux banks Y, Z, AA, AB, A=
C
> =C2=A0 pinctrl: aspeed: Reset to mainline
> =C2=A0 pinctrl: aspeed: dt: Fix compatibles for the System Control Unit
> =C2=A0 pinctrl: aspeed: Read and write bits in LPC and GFX controllers
> =C2=A0 pinctrl: aspeed-g4: Add mux configuration for all pins
> =C2=A0 pinctrl: aspeed-g5: Add mux configuration for all pins
> =C2=A0 pinctrl: aspeed: Fix kerneldoc return descriptions
> =C2=A0 pinctrl: aspeed: g4: Fix mux configuration for GPIOs AA[4-7], AB[0=
-7]
>=20
> Joel Stanley (1):
> =C2=A0 gpio: aspeed: Make bank names strings
>=20
> =C2=A0.../devicetree/bindings/gpio/gpio-aspeed.txt=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A020 +-
> =C2=A0.../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |=C2=A0=C2=A091 =
++++++-
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A0=C2=A01 +
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A0=C2=A03 +-
> =C2=A0drivers/gpio/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A013 +-
> =C2=A0drivers/gpio/gpio-aspeed.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 299 ++++++++++++++-------
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A063 ++---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A076 ++++--
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 216 +++++++--------
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A048 ++--
> =C2=A010 files changed, 507 insertions(+), 323 deletions(-)
>=20
--=-dk+6oNgDNoME8YKxwolu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYlAJcAAoJEJ0dnzgO5LT5nAUQAI6B/mSRc89XOh/mdQQYKvd0
yAwd+Dc9kxISfTyN+D1pHziZSqoKcwtXSnLDddVw3GaSB3Xdu90pyMl7nEMnjeia
TAKNOH120rZvAdUiGByxJSMCambiFnCkIFyb18z9gwOxNG7ObOVE8k+u+raGOzBT
HSwzHl5UWmHExXXC1tLV8QB54bAkR+KDii0pRo/sgGm/qG3w+diTOeVm8BDH5cp/
tTuR1IT0sCfzqxSXOwp6bX4rLL7xkJIoUcjq/09QB2ANglhwHpq3FF6ZQSKt4A8a
S06rzIXYuiAgMrNvclFyWOT0DC6t2zWmhxdHumWcytvZYRc3dgkU+c2UzIIrpYMQ
aNa4jSdVd3Hu4XtBwdiO4Vh6Z2MSlzj+u+KTkIBYe6G2lJV/0nMcpOpV+p0LNuNa
dN6BD15FcW6+TdVu1ExZsU/xV7Ya9zFHT2S6d8lWWMGjTDmhPCnBFldgesJQoXx9
lhsJp/1R99fczt4yv6kM2Zj3qefNS8tbYht9qdOHAvPsmizIIQXryTCmX0yoKuWf
Qnvxj7ctbZjSHn66fIGoupZ+3q7fPiwpR6fsmHrTbkS+2oS0Ei9II57c0URghbuW
x69T0ZJpVRm0nmnRaxNvbMlZzUdvU5paYhXXTDYv3OkOLEQCESeT7MQpTWeeowmq
hi46PurKuU7Yht/+qzBs
=smmL
-----END PGP SIGNATURE-----

--=-dk+6oNgDNoME8YKxwolu--
