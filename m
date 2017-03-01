Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vY0gk0hpZzDqJl
 for <openbmc@lists.ozlabs.org>; Wed,  1 Mar 2017 14:05:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gQ7A0vON"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lZa+ldTE"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5284420776;
 Tue, 28 Feb 2017 22:05:34 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 28 Feb 2017 22:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=DTzoQwAItwlhQAfAjzUNwj+WE0M=; b=gQ7A0v
 ON8lYhf6Zdafu+EpctVVQkSEQSkB6TmDtoPOYbQUBwut5u5ZSuI4ilDQ890vjRFG
 R8at+dr+k5Eeo+LYBm0QaU5rX5xegi/+mQBV46cTQmBwm9NWanHPj3rcvBLNkoCx
 lH+Bc3gf/nxQbbuPY0kW4vG7ic5Cn9RmMus2s=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=DTzoQwAItwlhQA
 fAjzUNwj+WE0M=; b=lZa+ldTEZyyFxJ1S27m/bUktOmb27tXu1PlL8ttGJDB1u3
 +cRigjRzAsNC1k920wJJ2VLrJjMFk3tqEvJI9w6wNyhMa195eUpBJrqL6Jat2Jcb
 OjAEN5RnnZazRHCXNMWQ6KPNA/5TnPxmqxLPlYaC3nt0nKITIK37QA5OaAITQ=
X-ME-Sender: <xms:fjq2WOoKIId6y349wcfF43n_H5R7rBnszIf7DB736LceHGl96CrHaQ>
X-Sasl-enc: EZNbDbOVx8lqRy6YOF60RE4UFQF6vuMKKW3OHCl96yo9 1488337533
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BE4FD7E325;
 Tue, 28 Feb 2017 22:05:31 -0500 (EST)
Message-ID: <1488337524.4258.9.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7] arm: aspped: romulus: Set PNOR SPI
 address mapping
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cyril Bur <cyrilbur@gmail.com>
Date: Wed, 01 Mar 2017 13:35:24 +1030
In-Reply-To: <1488285610.4258.3.camel@aj.id.au>
References: <1488266280-28755-1-git-send-email-mine260309@gmail.com>
 <CACPK8XdHH1Yrr+TaD-joq0uFgj+epg_dQu2QHhSfFv9i0LNkDQ@mail.gmail.com>
 <1488280599.2423183.895344368.6877EADC@webmail.messagingengine.com>
 <CAARXrtmw2FmhuO2WU8A4F4X=i5JD0CPTV_N6Oztm8zzs7diKuA@mail.gmail.com>
 <1488285610.4258.3.camel@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-oO0/SoVTaRBYtMN91LGJ"
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
X-List-Received-Date: Wed, 01 Mar 2017 03:05:39 -0000


--=-oO0/SoVTaRBYtMN91LGJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Replying to myself again... I think I've learnt the lesson not to email
whilst in bed.

I've done some further investigation after jumping on a Romulus
machine:

On Tue, 2017-02-28 at 23:10 +1030, Andrew Jeffery wrote:
> On Tue, 2017-02-28 at 20:27 +0800, Lei YU wrote:
> > Hi Andrew, Joel,
> >=20
> > This patch is for issue https://github.com/openbmc/openbmc/issues/1214
> >=20
> > Here's what I have tested:
> > 1. rom1-19 with updated OpenBMC (c85f23e1), which has mboxd enabled;
> > 2. Do a power cycle;
> > 3. Once BMC is ready, check the registers by devmem:
> > =C2=A0=C2=A0=C2=A0```
> > > =C2=A0=C2=A0=C2=A0root@romulus:/tmp# devmem 0x1e630034
> >=20
> > =C2=A0=C2=A0=C2=A00x70640000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0<=3D=3D Wrong, expect 0x70680000
> > > =C2=A0=C2=A0=C2=A0root@romulus:/tmp# devmem 0x1e630030
> >=20
> > =C2=A0=C2=A0=C2=A00x64600000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0<=3D=3D Wrong, expect 0x68600000
> > =C2=A0=C2=A0=C2=A0```
> > I can see the two registers have the unexpected value.
> >=20
> > Without manually setting the two registers, `obmcutil poweron` results =
in
> > no output at all in host console.
>=20
> Okay, can you please open an issue on github? I'd like to have a play
> with a Romulus system tomorrow to better understand what's going on
> here. We shouldn't need this kernel patch.
>=20
> This makes me wonder if something's wrong with Zaius and Witherspoon as
> well, and whether the problem is masked by these register writes in the
> boardfile.
>=20

I had assumed here you were talking about the HICR{7,8} registers, and
if I was paying more attention I would have realised you are not.

Instead, these are the {S,F}MC segment mapping configuration registers.
The default values correspond to a 32MB part. From the datasheet if we
do the transform ((0x64600000 >> 16) >> 1) we get 0x3230 which
translates to "start the mapping at 0x30000000, end at 0x32000000" and
thus a 32MiB mapping. With your expected values: ((0x68600000 >> 16) >>
1) we get 0x3430, or "start the mapping at 0x30000000, end at
0x34000000", which is a 64MiB mapping.

Looking at the driver[1] the only time we touch the segment register is
to read the window start, we don't ever write the segment mapping
configuration.

C=C3=A9dric: Have you looked into supporting configuration of the segment
mapping?

We could configure the mapping if we know the chip sizes, however
looking at the device's bindings documentation[2] we find:

    ...
    Required properties:
    ...
    =C2=A0- #size-cells : must be 0 corresponding to chip select child bind=
ing

and

    ...
    Child node required properties:
    =C2=A0 - reg : must contain chip select number in first cell of address=
, must
    be 1 tuple long
    ...

I think we need #size-cells to be 1 in the parent so we can define the
mapping ranges. I don't know that its going to be an easy change to
make though given the bindings are already upstream. Thoughts?

Lei: So as it stands you should drop the HICRx writes from your patch.
However as it stands, we still need the writes to the SMC segment
registers until we can sort out proper driver support.

Cheers,

Andrew

[1] https://github.com/openbmc/linux/blob/dev-4.7/drivers/mtd/spi-nor/aspee=
d-smc.c#L728
[2] https://github.com/openbmc/linux/blob/dev-4.7/Documentation/devicetree/=
bindings/mtd/aspeed-smc.txt
--=-oO0/SoVTaRBYtMN91LGJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYtjp1AAoJEJ0dnzgO5LT5/yoP/jLhVFezODmNuudEZlhumM54
DNVVEXWiwyK7SaDCkkNvBJAqoCeUZ0wrfbm8l2ezVrmtfTtkpgbaLJ9AuoP/PVwD
1KTfojsNyDcH5kMBhFdYwriZAmkkuKvCwWZEBTc2ZSQfMi8LeP461/+e30f1oxKU
R7dPCnTp26m2u6vIvLtboEX8s+pkppzSjpITEKVjSq8fuOzpXSKP1/9MEb2XFnxE
CTGryOoVddG0F0JBsxZDCx0CdK8Ry4xIpf+YuDjAIuz/3MAbBEiXI7D+RPdfpqVO
scC0AybSfZVzm9TE4DVXzaOTeGgcniviINe2wq5WwC9IMHbs2zJg/VYbCDV6eSea
FdGytchoV7iXF/oPJr3LW92WKE5P8iRJinjH+7D9Z1i5RGX1PdnkPhVeX039a99j
LA7PZXrorqQ/JApjX8JgWsK1rlgimmajw9juP4mDoFPvEHANnJZyuQxVtxQb8tEH
LqzZgdo+4hrIZsZmyhiLIGGcPrdcc02dL/GyfZTF67wQOKfFac/cUJXmgfZav3Lf
/yoT1KVlq3WWkwbIgeJAKokQP9YJZNenMZ+Vuz583X/tfigEHgOiKtjqqRxuTcGl
jNUj/PZfMTHtS6VLn+4V9V/xdLAv30Pdhhoy/51x5ef33TMmR5nEec1nlbbH45aX
fo9JEA+1bU0f+cir9vc0
=KSbN
-----END PGP SIGNATURE-----

--=-oO0/SoVTaRBYtMN91LGJ--
