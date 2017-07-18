Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xBMvb1ys2zDrFQ
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 11:26:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mlqTxA4I"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Kyeo448p"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B919420809;
 Mon, 17 Jul 2017 21:26:46 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 17 Jul 2017 21:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=uBO78U5O3Iiw3V6OLRds7cvC6l+EaHwRCQ7NuMgGy
 IY=; b=mlqTxA4I1CyYEZ2h8GwBKTybwcWtZPdpJGDxoVuO6heCEeYbOKpZe/doT
 7zkkCFREyUkKEqrpvKSZ8WjBAfZsUjUpPFIUhhV+/C3AImvQ6QCH7JF1zcGm/W0t
 sGtAmewZThjzYqjngXcP8yGeDMX739Ug27au4f3FzOs0deE/HahOw+coeT7XthWC
 +q/zAE171GSuJnfedchNWNe0QOau52thRTVQT4X5U8DlFYFMhaJqFITB4EWFUkPn
 9AAbhCxMVtfGuRyrmhlz9k5bzLUI9Qpd6Pz+fCAVg6LlyUiH15fE2Dxs1LT21ULV
 uEnmEppB+WRD1IEfvrudQHGDEIY3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=uBO78U5O3Iiw3V6OLR
 ds7cvC6l+EaHwRCQ7NuMgGyIY=; b=Kyeo448pTTu8zA6HLye268eaBaWUmHWWn3
 0nyEmz2ACRhSrb1RMX0tbBXrp0JTNeaI6l53DlbPqyc5/hJ+u1yOKQvwSJi0dbti
 0FNUGp1+LCHbPOttBJ9Ttl29aTW1jYDbKQsyNxQUFS6POXQx/HxFe+IjExEmkkE+
 z32y7fle9CUn7ksESBrDT1/M41aMp3tqZmESruYvD8SJwA9F8Pb/hsEAdDmEqUWX
 Q++3MK1assGhIlLi7Oly5+h2RTRUvSlbrVlSVBA/bjxONXmcTU+KcoaGT56xyk39
 sIPOKBncNsmz610phZ3qQYQ0+O8dSWs1qVcU1EXiXCHRFmRjnwBA==
X-ME-Sender: <xms:1mNtWeT74atZWp4drSd1NS17olm7ghZpNlcnjPf2DDcp_tjZio0QHQ>
X-Sasl-enc: uh7e+kQ62NRSWkfSx6tDJpnkoh40+Fgr3iSE9rIEU3CC 1500341206
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 81B7924570;
 Mon, 17 Jul 2017 21:26:45 -0400 (EDT)
Message-ID: <1500341199.500.1.camel@aj.id.au>
Subject: Re: Adding new platform
From: Andrew Jeffery <andrew@aj.id.au>
To: sachin naik <sacnaik@gmail.com>, openbmc@lists.ozlabs.org
Date: Tue, 18 Jul 2017 10:56:39 +0930
In-Reply-To: <CALFfRJOOB=AJaEKzhW9yiCqbn1ymozyaTnyG9+bTn9YdPFsU_Q@mail.gmail.com>
References: <CALFfRJOOB=AJaEKzhW9yiCqbn1ymozyaTnyG9+bTn9YdPFsU_Q@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-yNa9ULizSsYUFKbgna1E"
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
X-List-Received-Date: Tue, 18 Jul 2017 01:26:53 -0000


--=-yNa9ULizSsYUFKbgna1E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sachin,

On Sat, 2017-07-15 at 18:18 -0700, sachin naik wrote:
> Hi All
>=20
> I need to add new platform to openBMC. My platform is based on
> AST2500 SOC.
> I have created BSP layers on BSP and added all required linux
> standard drivers for my platform. I brought up the openBMC on my
> platform.=20

Great!

> Now I need a help to add all environmental device info
>=20
> For example I need to add all temperature sensors of my platform to
> BMC application stack so that the IPMI host/net =C2=A0and REST services
> will work seamlessly.=C2=A0
>=20
> How=C2=A0shall I integrate my platform temperature sensors(All are hwmon
> class device) to openBMC application stack ?
>=20
> Any help or pointer will help me a lot.

Taking a different tack to Andrew's reply, have you published an
OpenBMC repository (and/or any other relevant repositories) with the
changes for your platform? Can you provide any information on the
platform?

Having access to your git trees and some information will give us
something concrete to talk about and might allow us to better help you
with specific integration questions.

Thanks for your interest in OpenBMC!

Andrew

>=20
> Thanks and regards
> Sachin
--=-yNa9ULizSsYUFKbgna1E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZbWPPAAoJEJ0dnzgO5LT5V+8QAJrs8+7F7maqtRKUMGUpA9mO
DwjYuoyn+T5cb02iwyefoC9jT6v14VEdnGyhNxrkkzU4IWTfxD3WEJylGeE6lcSH
z7MS/6cUZcfdx5dZGGNk3z1alwAk/ELYztpFMAuB/rHDsRDBRzh/4XPMzTHFKWjx
x4j+LhEhB0McyAG1AbPHKgAEiSDo0C5HGdSZJ2XkAUb6Fq1ggv1Ru4xn04DH+89O
pZqzUs8MoZ0EM+4OQg/iKQ0ioriS8GQ2xUb+4uZKfiDQWDvNcdv1fUIpsbB7vGgY
B2SQUZ567z7CSDMZIhC1m+e6puiKyG6pPSOWoOPK1YhcbWAXzERUpcGfc20qMxbt
wf3dkfRLEQi1/JmXJlM/F999gaA0f67XtdglXZ9PHD40zyOD0h4f3/LLg3pfNYsg
AWIT57LHYE+ssnas4USsf0zs+T7MuAK5k6BVU/WVgHVRPIQyo0B2kVxJ70ulRXig
SH4qxWFbQnT6YnEs12fac/O3150XGrySS5Vax5QfiOROkBx85z+61SUSq2D6H1vU
yi+AAH6IojRTNu0gleANFbAbo54/DTX8VYhc8PQCuJfWLdwGRThzM+Khw9QNKQAS
Ig528d/vXwTS/ahCaFHsQ5KfY1eSfGKrQlvCPS4LX1awLlQEY/buxAdMSY9CPuT/
kRcn4AkNLXSEMrAc59Sp
=trpS
-----END PGP SIGNATURE-----

--=-yNa9ULizSsYUFKbgna1E--
