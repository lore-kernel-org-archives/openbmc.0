Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZsHW5bCQzDqhj
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 16:38:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=FT9nAIYf; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=VSqHtcUu; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 77AAF727;
 Thu, 23 Jun 2016 02:38:45 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Thu, 23 Jun 2016 02:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=sWbjD
 R4A0w0IrvF3T08LrwqR30c=; b=FT9nAIYfKSZq4x+3E90stElQS7/J13ezS2IRw
 +ZW6jFo7erlGFQr7/aNZZtJEsKmSjAgNLnGsdaCqSRn+wK2r+Cm6f5Oc98AMhuot
 5d1z93etEhm76czkkfEbuI+zGYuJJ8SU6UhwUK7VRbpVdJ5rMVTIo6NeeBu1DtuI
 Db5D/c=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=sWbjDR4A0w0IrvF3T08LrwqR30c=; b=VSqHt
 cUuOZX+AZO+k+HvHFHSpbK3BKOeFJdj1PiEoCn0CUWEB4P7SH3i/LJ2v2UeAGs1P
 SXyu/vG7GdLa4YuHNv3tTPFpgJFXqcsdVbyRnNOSzpQfK7uwyKqDRtd69cVoxcB3
 774gLwa3xbV+xh9CSaM3auhf8oK+loL54oSzgU=
X-Sasl-enc: RB3T8r1KzHXhFFK+H/gjSby0N9ueOI8NZLZdLBMEGlN0 1466663924
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id B03E7CCDAC;
 Thu, 23 Jun 2016 02:38:43 -0400 (EDT)
Message-ID: <1466663919.23740.89.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 18/18] initfs: whitelist: Sanitize obmc
 events whitelist entry
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 23 Jun 2016 16:08:39 +0930
In-Reply-To: <20160623003038.2361-19-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-19-openbmc-patches@stwcx.xyz>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-QYdY7YiQhz58tc/YvxWd"
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
X-List-Received-Date: Thu, 23 Jun 2016 06:38:48 -0000


--=-QYdY7YiQhz58tc/YvxWd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> From: Milton Miller <miltonm@us.ibm.com>
>=20
> Remove the trailing / so that the update script doesn't have to loop.
>=20
> It was determined the trailing slash confused the code that makes
> the save subdirectory.=C2=A0=C2=A0The update script was fixed but this re=
moves
> the extra work needed.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> =C2=A0.../common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/f=
iles/whitelist b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs=
/files/whitelist
> index 603cec7..c35a552 100644
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/wh=
itelist
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/wh=
itelist
> @@ -6,4 +6,4 @@
> =C2=A0/etc/group
> =C2=A0/etc/shadow
> =C2=A0/etc/gshadow
> -/var/lib/obmc/events/
> +/var/lib/obmc/events

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
--=-QYdY7YiQhz58tc/YvxWd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXa4PvAAoJEJ0dnzgO5LT5Ow8P/RQQO5IOfOKoRVo1SsXSj1AF
K2OyGB9Q+TwrU1WrQPVHD7MtutkxmROVLD9J11td1W+8v/CYQMQjVMmT0YATScu4
5chpctvHV8Wg1CTLBQqRbaARq+1O738pd7JV+VccLtBckneTW1eoJAwXwnFBCiPA
acJpeTYrtgHKhPKjB4tpm2LMHZeG3ND2nLd0Q3JTlT2A1FBuKmGHe0eyqlB5CaYE
RougMwjzRtUNiE+EGj1bu0f9EFxqq9KRA3ZpLIISxaMxbOSFlFD+sE3NvnCVmNA4
SxhdDNQyoykLsyxtTSZurkFTfYtiCnginmjQs1VxwWBFbh2lEnW7zfxFZZBOL8/R
VhNbGT24yKOJn3LGGkT0Df95cd0e7vVQ1EDZF1ZeSkdXSwCE1AUQudTGl/IVX+hB
rOsHhQ6fOS9PcSHa21Se3yxX2afQQQ/m0/hZBNbROuCqgnB94LtLOQniA1ImLxfd
6fkAYrDLPMq++6iFirnqnOx04+e7fRXWRUQvTdy4Jbg20zFbbcWihG9h0nccXF3E
zHcXXU7cE9ESVEDpa7ND2rOGQejpn4LBdvaQdKIaZAWfUAI7zk3rooEnIZ1cMwS/
gbmt9FkA8XFN5pdO3iSj3MLzrrrJk5SOBl34U+vzKsdplaiDfN9HiXRa3wKSO0PR
3bYkf3nA91+LHH4j5pMg
=2yg/
-----END PGP SIGNATURE-----

--=-QYdY7YiQhz58tc/YvxWd--
