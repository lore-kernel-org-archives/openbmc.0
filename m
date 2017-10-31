Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="IrLEZEAX"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QV7z8Xqu"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQzh82R8dzDqMY
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 16:00:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9AD7C20ADA;
 Tue, 31 Oct 2017 01:00:53 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 31 Oct 2017 01:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=kc1VJMujW8ZgAaaXe5eiOhd3Amxg+f9Vg3PQ0OyXibA=; b=IrLEZEAX
 aprCsJXcizgfWsiJsEXuozuKvcUBMlDSppjRZMY3/C8uJfyV/xQywggObG3xEwSs
 G4mbcgGeDi6mlQjvm3FgKK/rhciOT0wUz2fliX0RVWiGSf2FZlBFgU/TOHQY21Nn
 h9B5N9qBsbM4eq/WSO98hh5+dv7f+V/1YcNV+1y6Uj0Zb7izfwFveOWLYAXypq1M
 p5kyl0a1NC7xHFX8ruE6ZEnX4uze/Z83raOg0MqirOZ4INxe+NzlGOefSB+4z1s0
 lYP3L/kiLz2n4BcaX9VG3TmQK7POz5i3ZVyFENRY8PyjHJG4pB14O0eTYC8zQcKB
 TK1yCNcIfrIk7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=kc1VJMujW8ZgAaaXe5eiOhd3Amxg+
 f9Vg3PQ0OyXibA=; b=QV7z8XquiHjMf+Q70AMMjPwjTfiDQ/WESuOPJGzNHmEsq
 t6kIhy7RklR/rulgAY4PuVE7WR+yMk4UINFBbrmeJDbsZAxpjJj2z3k9yHq3Qey1
 03GiAY0NM6GIL9sUgEvwetnm3hGw0Eyl440Ha5ZRYAXBC2vd6J4oA4QyryiiINou
 KycsVOUeQe680Y6P82bY+OCk/+bp9+fw9B0Hv1a0BrSZvewSSGaYma39oJAru70f
 4HT9ZIJpWhxDUy9RmbdjP6/6PNuCLlBFesyVehg+hPcgQFgbmL7hpqbgo3Uh71aL
 VAjkgRosm6/JwnSmqlLOsY3p+E2IqMKr6KG6CkRTA==
X-ME-Sender: <xms:hQP4WUUGvw6hLOcIaoqqJp8zm0zpEjksimRXZomGTeia5SCYCH1DpQ>
Received: from keelia (unknown [45.124.203.19])
 by mail.messagingengine.com (Postfix) with ESMTPA id F39077FA8C;
 Tue, 31 Oct 2017 01:00:50 -0400 (EDT)
Message-ID: <1509426043.2263.7.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2] drivers (fsi): sbefifo: Add timeout
 for waiting for data
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: bradleyb@fuzziesquirrel.com, "Edward A. James" <eajames@us.ibm.com>
Date: Tue, 31 Oct 2017 15:30:43 +1030
In-Reply-To: <1509057254-14890-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1509057254-14890-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-PIeZIrZhzZIzynjmc9oy"
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
X-List-Received-Date: Tue, 31 Oct 2017 05:00:56 -0000


--=-PIeZIrZhzZIzynjmc9oy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-26 at 17:34 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> During a transfer, in the event that the SBE isn't running, the driver
> will wait for data to appear in the FIFO forever. This doesn't work at
> BMC boot time if any transfers are attempted (by OCC driver probing, for
> example), as it will just hang the boot. So add a simple timeout
> mechanism when the driver reschdules waiting for data to show up in the
> FIFO.
>=C2=A0
> Tested on witherspoon by rebooting the BMC successfully with chassis
> power on.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied to dev-4.10.

Cheers,

Andrew
--=-PIeZIrZhzZIzynjmc9oy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ+AN7AAoJEJ0dnzgO5LT5uXsP+gPvMzwr/ImF6ebzF9YVGsDV
xer10Nud9sqxOQoycN58ZaHgSyKYkaK7oMvcbAaxDGTEpXGXv6LhXQBvgfOCl9rH
msJmc8Srkl9NT75xFXvxIJJ2ztg3xJV8HYx5xPUfcqau4r2Khzegq+2/Z1GWIdfS
2QaT6NT2ezIVDysh62CfVnAnzOcKTOiwd3hrlieSbbdpNjfRcqNZ9y8bEABzUNjY
wU5zXZeL+PzA3XCgP32kqwhDl9crGU3H7V2gS2J/+ARfBs37aoHdhOa0QB8tQhK4
Qhzu292BRhl26fWauAQwQSuKrjdPtWPz2l2tz/w2OQn3Xt+G4a7bdkpOQuUxtqN9
hwKFXBLaMqP7C8XM53tVIFDO1sASNG8OpsPEU1Wue7uT3QtoxUEt/0cGQtBoX7cF
EnamEBkvfiRbZya1iMf2qSRmg7dcABW/KGEVEarFFJCyDq0uDOur2os6IWeZLQ0g
0Qqdmj6XXKCj4BuQ0GKAlxTtRxizOL/4pE4b3k8acdTPgQE6SFrpcOkjUxc/55JU
sqhlZ+Ly7dMx+mAuVaxbC4eMQnY3/EhtMr38QmqTLZz3xjqNGSOLnmR/RgIX8IaY
Qm91uSEB8x9WjXP5NfvyNiWRxgPBx4fLHAIkOC9ZmA493CONn+OU5XivJR7SnJXe
LoFTy5k7esOfh10DM5hI
=I6cK
-----END PGP SIGNATURE-----

--=-PIeZIrZhzZIzynjmc9oy--
