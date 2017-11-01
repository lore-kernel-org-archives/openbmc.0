Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Knh4PU91"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ghexMQwz"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yRg4P5C0TzDr4H
 for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2017 18:35:48 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CF33920853;
 Wed,  1 Nov 2017 03:35:44 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 01 Nov 2017 03:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=aaJdW+M9hwOWazayPJieVUdTuCIPSguWeuMob/Lmgb0=; b=Knh4PU91
 azWfS5k64Oz6ToHfxmUS8Ep+1nCHsCQf//sYr6LAj7TFWr4w0Tmej9zWqiWrPLwP
 7VrZX/zTu1rT/j+1grkai46eQtlw9A9AvW293ukteUcGCzrUdoBodxicyKFjremc
 9ahfvFzQn0IjUlvkFFc08y4In5JI34VKpTeJN4RlWIM7ixBViJbKGXRmUZDMHUOk
 6a6oSa7YntAMxQWtvCUVJA7OVLU7yqHgN1Kk/AvsXklz35ku2108OsVvsYoHvIYz
 SOAM5UZJ+u5fAXm0epS3A2VO9lywlktQPL4QX08NZvESRtbLEziZtef7XC7djyj/
 BuF/jQRun5jiXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=aaJdW+M9hwOWazayPJieVUdTuCIPS
 guWeuMob/Lmgb0=; b=ghexMQwzJnDwuNhb763OKmOLXR9sTp0PTJiCA8nV1ZrMy
 BHbBHixS/ywpGxBu4s06d3qU1JQqmH6FINqKDL9dfqMcQfnNHYmOnkPbqk85qufH
 qAk7bGjFbszLhskWyb617dtc60xwT6QtbXyGQPC6UPKuiKOv1kzKdnXCz3/LzzJ0
 7PdMZA2VtvrBFnwwHHGnWCP+DFawmO3o/NSnQE/ESAiVX5TYGXvdvCtcj0ttbs4U
 hU2A0hCJvFO4FJbxx1UZEPY2n+BzWF3yhU3PUj5xjrb4im3w+URyg4Sdm9+a3ygD
 TK9XBUGekrJBNww+aXh3epFr1iVxiYcDAu5i17Lfg==
X-ME-Sender: <xms:UHn5WQ3FzWlWIIDpDxHrDpgJQvX7cFOof7zNOWJPpedWm7CweN8RdQ>
Received: from keelia (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id C5478247F0;
 Wed,  1 Nov 2017 03:35:42 -0400 (EDT)
Message-ID: <1509521736.2263.11.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] drivers (fsi): occ: Change errno for
 releasing client during transfer
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Wed, 01 Nov 2017 18:35:36 +1100
In-Reply-To: <1509471272-30457-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1509471272-30457-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-5fMMQFN5+FSsLtnSK/Ta"
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
X-List-Received-Date: Wed, 01 Nov 2017 07:35:50 -0000


--=-5fMMQFN5+FSsLtnSK/Ta
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-10-31 at 12:34 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Clients were receiving the ECANCELED errno when the client is removed
> during a transfer. Use ENODEV instead, as ECANCELED is for AIO ops.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied to dev-4.10.

Andrew
--=-5fMMQFN5+FSsLtnSK/Ta
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ+XlIAAoJEJ0dnzgO5LT5qewQAInt/7OuCmVxK+aboD1nv09i
g3QzvNXDQKar90GGFiPRXHx0id+avZkidYUOS2r2FCtwQ0PpeL/O7YtcMwpJcjxx
q+tiN1rNTfRNv1b+Bs+Sk+PZFQamicAvQg5q4npIzDwWxvRiD4L26/SMr35I2TTe
KdnbdsV3afhK4oA29XB4mtLuYjdfjQJF8jpcRfA8WLcFbk+PBVlapKb7lVVQ22pz
Byn+7JhiK9SQEj+ZO6l03dZ/vHICYsKkev6YK+CsbzELd2r3dT+Xql/v0awYVa+v
DrcVLEH5WXZRWnnrwqw2jF9Tn2r9awSAWak9qFwOTfeWYNR2z0DsmQd1LFJ2Ja9H
533kXaq16dv8qC7DLHOEbgmasmssm0MGPwEcoaLmgPar4NVFrGOq9o31lBe0lE9T
L6UuXTIkh3lVSLLA43vlcmtYdIJD6eCxtTChKLDFQKXq6yk1rp0ZrV91c2fcVQ7R
nFkev0zBViHgaR3+MQxdiylD6GZtJ1ji2VMntkA3u9bsJ1oDXSaLh3DwmxEOxQn4
TYGiZJs2/73ceOgl5ePxYSEJuYYUcV1RiVzzgvxZ5rQNPuJzqh5S8byj0882dWXJ
g3MzDo5HIqbBJLBOzVTFi+JdWoTgST2HZzvR+fZglURFX6MazpeIYfbgRDm3l5uk
yltPho7uaT2VZQ4ym6JF
=w4qv
-----END PGP SIGNATURE-----

--=-5fMMQFN5+FSsLtnSK/Ta--
