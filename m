Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Kn9bCjuN"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="K+x4W4Pw"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xs2s81wlhzDrJL
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 21:39:55 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B77720CBA;
 Tue, 12 Sep 2017 07:39:53 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 12 Sep 2017 07:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Zl9JaeFSy4zctt3rV5Hlg/Hhb+Bxe30UH4CN8fL+A
 XM=; b=Kn9bCjuNhTo90i8uAZ2VPqFs7Ww83wdGe3Uk/RQRYWnGQ+Cak6HbCecdQ
 Mf8hkVPckQbDehv6qN3aKh5VDZ3b/ALpME4Qe+khfRyWj0XTbm7k3nkEOnIyDjq7
 5SubaorzWIf4Dewp23sQHARkDfPWB3ZGCiGvmhE5Ii0LNULmxIIYfmYi4RzFJoGQ
 DWwBv2QKcekBVRrdcvLCiy4TEBDdOoTpIgBB+eHPwx8FPAWKHEGaQljQc6bK1kv6
 n1KzGpOKrBIe1WZ1Ax+2m6OvDtdZfvpQOVfxiEqNY5N7l//p+E45ALACWnHHJoVG
 g5PmIitZ5r8TcBXgz7ppdRgSKXLCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Zl9JaeFSy4zctt3rV5
 Hlg/Hhb+Bxe30UH4CN8fL+AXM=; b=K+x4W4PwYiw+DgEBnaIHqlTyCTIG+5jGlv
 WNRWxjvS6IyLx8cPEdaJV4ZAb8P3YaiBrKPIU5wbiqgYZRnbqfdNLsJYtIR+m5+y
 /pxLoOQKtDMh07wvTnNuI8nRGvretaM4q/xjOeam6Xnbhw/VNcnoRY2qiK854E6m
 qX7iQP1QIOnmuMeToal3nnvp5gykd0PXp3bHk48r+K/wbet23mrqoi06IJEXyJBX
 gKefwNju3wjGK/JvBCvHOmjbnWM5b/UBIAE6VOqppv2qfeMf2/1mBklA2ROdi0gx
 wYw1tfYHkW2Bx7SKro9/TAwOA30kQHPYkeus4C5G++qUyPx1JvXg==
X-ME-Sender: <xms:ice3Wagpv6JfhfpnsPJewufzXtT3MRE5Ii_wT2-4mqxhTkgmCaFcjQ>
X-Sasl-enc: R9eWW0YEbyMVwT3Brdf4lxPl7cLaUzAXpkuVoELTSIBm 1505216392
Received: from keelia16 (ppp14-2-0-125.bras21.adl4.internode.on.net
 [14.2.0.125])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5C5EF240B1;
 Tue, 12 Sep 2017 07:39:51 -0400 (EDT)
Message-ID: <1505216385.4080.6.camel@aj.id.au>
Subject: Re: QEMU 2.10.0
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Tue, 12 Sep 2017 21:09:45 +0930
In-Reply-To: <7a015ed8-54c3-f3db-1dcd-dd886a5402c2@kaod.org>
References: <1505200336.4080.3.camel@aj.id.au>
 <f4bc0c68-6fd9-0784-388a-f81e7006b07d@kaod.org>
 <CACPK8Xe2GqA+UwsTcGe3F5b6QWUT=GCOzxRYcaWes8hngXRpQQ@mail.gmail.com>
 <7a015ed8-54c3-f3db-1dcd-dd886a5402c2@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-FQ+h67oqAbf2I7tqIMVX"
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
X-List-Received-Date: Tue, 12 Sep 2017 11:39:58 -0000


--=-FQ+h67oqAbf2I7tqIMVX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-09-12 at 13:24 +0200, C=C3=A9dric Le Goater wrote:
> On 09/12/2017 11:07 AM, Joel Stanley wrote:
> > > > On Tue, Sep 12, 2017 at 5:26 PM, C=C3=A9dric Le Goater <clg@kaod.or=
g> wrote:
> > > On 09/12/2017 09:12 AM, Andrew Jeffery wrote:
> > > > Hello,
> > > >=20
> > > > I've updated openbmc/qemu's master to 2.10.0. For anyone maintainin=
g
> > > > patches on top of master I've merged the old master state into 2.10=
.0
> > > > with the --ours strategy, then applied the series C=C3=A9dric is ma=
intaining
> > > > on top. This means any patches you might have on top of master shou=
ld
> > > > rebase easily due to shared history, whilst keeping our yet-to-be-
> > > > upstreamed patches in an easily identified set.
> > >=20
> > > Here are some updates on the QEMU wiki :
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0https://github.com/op=
enbmc/qemu/wiki
> >=20
> > Thanks Andrew and Cedric.
> >=20
> > I built myself openbmc/qemu master and tried to boot a dev-4.10 kernel
> > with a simple busybox based userspace on it. It hangs at "Starting
> > network".
> >=20
> > I was previously using Cedric's 'aspeed' branch from a long time ago.
> >=20
> > This is my little qemu script that I use. Can you reproduce? Or tell
> > me what I'm doing wrong here?
> >=20
> > =C2=A0#!/bin/bash
> >=20
> > : ${BMC_CS1:=3D/srv/tftp/flash-witherspoon}
> > : ${BMC_CS2:=3D${BMC_CS1}}
> > : ${PNOR:=3D/srv/tftp/witherspoon.pnor}
> >=20
> > ~/dev/qemu/openbmc/arm-softmmu/qemu-system-arm -m 512 -M witherspoon-bm=
c \
> > -nodefaults -nographic -serial stdio \
> > -net nic -net user,hostname=3Dqemu,hostfwd=3D::2222-:22,hostfwd=3D::262=
3-:623 \
> > -drive file=3D${BMC_CS1},format=3Draw,if=3Dmtd \
> > -drive file=3D${BMC_CS2},format=3Draw,if=3Dmtd \
> > -drive file=3D${PNOR},format=3Draw,if=3Dmtd \
> > "$@"
>=20
> I don't see any problems with the network with :
>=20
> =C2=A0 https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3Dw=
itherspoon/lastSuccessfulBuild/artifact/deploy/images/witherspoon/flash-wit=
herspoon
>=20
> [=C2=A0=C2=A0=C2=A0=C2=A02.200000] ftgmac100 1e660000.ethernet: Read MAC =
address c0:ff:ee:00:00:03 from chip
> [=C2=A0=C2=A0=C2=A0=C2=A02.200000] ftgmac100 1e660000.ethernet: Using NCS=
I interface
> [=C2=A0=C2=A0=C2=A0=C2=A02.200000] ftgmac100 1e660000.ethernet eth0: irq =
20, mapped at f0060000
> [=C2=A0=C2=A0=C2=A0=C2=A02.380000] 8021q: 802.1Q VLAN Support v1.8
> [=C2=A0=C2=A0=C2=A026.990000] 8021q: adding VLAN 0 to HW filter on device=
 eth0
> [=C2=A0=C2=A0=C2=A027.520000] ftgmac100 1e660000.ethernet eth0: no vlan i=
ds left to set
> [=C2=A0=C2=A0=C2=A027.520000] ftgmac100 1e660000.ethernet eth0: NCSI inte=
rface up
>=20
> network is up. the QEMU ftgmac100 model does not support VLAN though.=C2=
=A0

I didn't see any issues with networking in my tests either. Maybe we
should take this conversation to the openbmc/qemu/issues?

Cheers,

Andrew
--=-FQ+h67oqAbf2I7tqIMVX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZt8eBAAoJEJ0dnzgO5LT5VMgP/0uQkk3n8AuLtsvB8fSNBsbQ
9drb/W8hNhUDTnExG/8Pym/e2z1CvtTFBYlmruS2MQEZZSeNcJDpDeicr8AuHyXB
lTKhkzoDXKyDBBcjqB0CEw2g3WXB5w6AqbDhijw+Vxq373RiErfwGDMOm2VOVHHe
EYly72fjF8KYBGkUfYXSy9QIyV2LzcccQL9Lp4ukU3pHPWLymYPMN1K5nOHBCpjB
1GvGkqvynepqBtmGRgnI3ZNUyZ6A0lPjUzZlKYSwRXpAb+x9DFSpp40icYi9rQNO
yMRyYOlmmvWDNWZeEXWepSYZP/RJwImZrQ8RF4jRDY9hcZljww+L1UtPEzFevl5i
GaDQa7gg10+759mxXrfrmL8Ohu9WBt9e3r/T2ufth/7x3eMdTOASahICguezt6wt
hlBAMI/DnT6my1QwjrzICqvkBZ5QaM3qeNFTh82TNRzVHbWSp9z+NfBfyj0oMu2A
9c06AU0r/IAGirAUqa+DWl2v4iDfWnrLIOJBatS8KXT5XhocgoshdiqSHs5ZNL0p
8+CcmKay7MUcibhwKq4v1Jhu8rjivfm36S8uu7bFM5o4AZZyscLLCvXLgKOWK45q
NqWfGO6n8rNhN9mrcZWCZLvd+2+pxfYXQIXZ3ku6doBW+ShspWy4D6CXSZgfZQjZ
86aX661YMOuClhCBF5RF
=HKqW
-----END PGP SIGNATURE-----

--=-FQ+h67oqAbf2I7tqIMVX--
