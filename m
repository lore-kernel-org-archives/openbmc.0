Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0Ckr1h7ZzDrML
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 10:43:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=bvtoj+pi; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=FQg8PHB1; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 30B0E1A70
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 20:42:58 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Wed, 27 Jul 2016 20:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=RwL2c
 ElQVtR27BNtmjNDcIodehs=; b=bvtoj+piNTdoPBCpG0ex2ksu8OXi4PhrTkTES
 c2nyrVw9Z8mV7GVHpVWICTkZsETXckRhWXbvdWq1st/BISzX9Rlf3PYyzYfgaBBw
 ZKmXpEE3QjCbBd4qVn2AuaWmIiMY41Ab15YhPHRyR180V7Iij0tkiTxE3e9xrLX+
 3pHDS8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=RwL2cElQVtR27BNtmjNDcIodehs=; b=FQg8P
 HB1FtoZI5M6scqL0hl2ui4e6GJrA/8UkqeHzW2GGSOmBdRNeUbgwtJ4yI2HNf1Iw
 f8wJ/sVTyqSRO4B776ZfdFJoKIU3Qgvig8yJ01r7O55peQw0SiASvJab/1/Kt6cw
 umfhybkdk9PRF3p5My53KFGkbaF6hUkPJeF18s=
X-Sasl-enc: zD6idyM7NfHecZDUn44CpNC63ZKSI9uqWLcECLUnF3Dr 1469666577
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id CAD69CCDCB
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 20:42:56 -0400 (EDT)
Message-ID: <1469666573.5468.67.camel@aj.id.au>
Subject: Re: [PATCH v2] ast2400: use the 'aspeed' model for the ftgmac100 nic
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Date: Thu, 28 Jul 2016 10:12:53 +0930
In-Reply-To: <20160728003227.20666-1-andrew@aj.id.au>
References: <20160728003227.20666-1-andrew@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-EB4KFCirTxvlJZpc4kr6"
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
X-List-Received-Date: Thu, 28 Jul 2016 00:43:00 -0000


--=-EB4KFCirTxvlJZpc4kr6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Disregard this, there was some fat-fingering. Sorry for the noise.

Andrew

On Thu, 2016-07-28 at 10:02 +0930, Andrew Jeffery wrote:
> From: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> =C2=A0hw/arm/ast2400.c | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
> index e8ca5a9e26e3..72dd6a29d4e6 100644
> --- a/hw/arm/ast2400.c
> +++ b/hw/arm/ast2400.c
> @@ -239,7 +239,10 @@ static void ast2400_realize(DeviceState *dev, Error =
**errp)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Net */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_nic_properties(DEVICE(&s->ftgmac10=
0), &nd_table[0]);
> -=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&s->ftgmac100), =
true, "realized", &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&s->ftgmac100), =
true, "aspeed", &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&s->ftgmac100), =
true, "realized",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0&local_err);
> +=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(&err, local_err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(err=
p, err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
--=-EB4KFCirTxvlJZpc4kr6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXmVUNAAoJEJ0dnzgO5LT5mm0P/2ToJOb6m0zpvk2ZA/C5AzzA
pqHkpvKkQloptn3EXGDENeHqr6+2kvqGLycnDtwf9LXRN8jmaeGT+nznWkJYoMsF
I8yH6ZA3+BWEAYxp3dEN4Wtr3qoGF3/g6odz5iCXncjmA6Imk/L0de8SxkFR40b4
rL90D0GAUw+20XEEvzeRxq0ihwrs2/KJgFewS4qEzGgwjJbzEfK0sAngOgPO8RIM
DDB2JwGYlDKLNGvjdvYfa2m9qD8IE6aUPVPnEzfJmlgYGE1AJY3Rb2pPE5Dy0ev3
g7/p4nAXMwvcWwOBZgc0YzMzwM42y7FVdz+ZuV6rQFHFQocQ8qIc+vGqHXE/dizD
CaLdP4aOd2rJ8ZHWPSydF2PgIZ1MANJwpLkMV5kVOkArRa7QcUGJG/59Q+4hyrRn
neB+AMQ2YQpetZBgZWyson5ZARUcfTVInQrBK8YrKNN2oboWxp3nb05lgtBsLucm
wt0eSK91zWMh65+5MHs25+bt8WkCp86c5r54fLhiyzatHIUyQTmUcflAdEvJzGGb
USFvMYUJRWEQwxiHyYdqL/xhnbDHYidKEf6WfqG1cnb1Cp6HnqzEE72vp8fH1XJc
4460OAvRx9h/824kfPpKcOSPh6XgtAaHAxffF7XI8g/OxaeNotSumBYMkmAEqwne
na6r8zre3wQmDe153v88
=TWFF
-----END PGP SIGNATURE-----

--=-EB4KFCirTxvlJZpc4kr6--
