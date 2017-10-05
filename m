Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="nYsnE4Vs"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TbvNzP+4"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6v1k5L9nzDqnG
 for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2017 11:35:22 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B062520F06;
 Wed,  4 Oct 2017 20:35:20 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 04 Oct 2017 20:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=PPNcdyaK1yF5tSUHnlF/4kPAdK/KVESp65Pji31HV
 p8=; b=nYsnE4VsxGkPFovcRsGP32vNX1hnVjjvT89htTvhAjeRsSG05Tph190GY
 PD4vl7OX9ll0+dKze7jOpgk6dkMmugZXuBIwnKTHLekTlp4ymOHrJcsd0j/28t7A
 zQXj17ycdZRbuxNCLo/LRvUI5kJ+LHmVORIKgwmeEH6/e/IhdnHRd+NJrI/nkv+O
 vgPu1LFPc54EXq2fwvHhcUX+2ZlL1ZFCWtEYJBHMbfdiYVT1VkziivnPzcA+J7+G
 NdphTVSN2urCJtxGaWW7H5oVV2cdwiYuu0THyaz0Hxdcl8Itoc1Nw8hC3u9RY4DD
 quuo/18wb1hfSdKQFyywAEwzFiBeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=PPNcdyaK1yF5tSUHnl
 F/4kPAdK/KVESp65Pji31HVp8=; b=TbvNzP+4/xnxwkXTn7fEPleebqNSzLegmS
 Afxr8kbHidIuVA5ZqI7BGowU1QiFFokghI8OQr6VlSmz4KTZABFrQ9Z3jhKksE59
 SZr4iPBzDh11Qfjj13G4pjA0BKFzcCXLt7s9lGVQRCQXe/g8c5PZm7wjLG+Xwgj4
 HjKhXMPnIAWnAbz3SGQPsnzmA44aAlrQncIHc+3UcUZTxvIrm1Dcw8kaZg+MvHWj
 HUEABZuGS4IIBMPrUzMCfB2R5DCLez26pvoOwLjZPGU1TrSrRlel2fv4bA4vq5Al
 X9shFbUT0jjYHlNL8PRRz7BWGE+B2UqNh7an6XGivyJBccyxyRAQ==
X-ME-Sender: <xms:SH7VWZJEIQf9mQeyeZkeODVeS3Q9j3AycSnDnfQgVa-V_iNKcksvHQ>
X-Sasl-enc: EmB2vIsj7xXc48aTFiG+JHsz8Q54crYivZXJruhrPp5r 1507163719
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id BC5547E101;
 Wed,  4 Oct 2017 20:35:18 -0400 (EDT)
Message-ID: <1507163714.5452.43.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2 3/9] drivers: fsi: SBEFIFO: check for
 xfr complete in read wait_event
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Thu, 05 Oct 2017 11:05:14 +1030
In-Reply-To: <1506724868-13010-4-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506724868-13010-4-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-NPSN+Au5z3a75IUjiWcO"
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
X-List-Received-Date: Thu, 05 Oct 2017 00:35:23 -0000


--=-NPSN+Au5z3a75IUjiWcO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-09-29 at 17:41 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> We should check to see if the XFR is complete, not just for a failure
> or for available data. If we hit EOT without getting more data, we may
> wait forever.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index fa34bd8..a9fc8e9 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -541,10 +541,15 @@ static bool sbefifo_read_ready(struct sbefifo *sbef=
ifo,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sbefifo_client =
*client, size_t *n,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0size_t *ret)
> =C2=A0{
> +	struct sbefifo_xfr *xfr =3D list_first_entry_or_null(&client->xfrs,
> +							=C2=A0=C2=A0=C2=A0struct sbefifo_xfr,
> +							=C2=A0=C2=A0=C2=A0client);
> +
> =C2=A0	*n =3D sbefifo_buf_nbreadable(&client->rbuf);
> =C2=A0	*ret =3D READ_ONCE(sbefifo->rc);
> =C2=A0
> -	return *ret || *n;
> +	return *ret || *n ||
> +		(xfr && test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags));
> =C2=A0}
> =C2=A0
> =C2=A0static ssize_t sbefifo_read_common(struct sbefifo_client *client,
--=-NPSN+Au5z3a75IUjiWcO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1X5CAAoJEJ0dnzgO5LT5dfEQAKdhSSSjZAJo83cHJq1rQ7gr
IB6Y7DjMzK5zrWRg9hx0MLO5+7tzwCXDLEYYKqrcaXnq3SzK+pX7PEo2D8iJNOUj
zDkweAuFzRYAWMbXRJydNrv1aUrUrr3FHMyzohfsgK0wMIKEJpn5uISMH48uztOe
gY23CzF810kdwVEgBYpiK5pr24JtPjg27MbzB4jwFdX9ytuGIxatqcJmEzwRtEUm
Kw7oX4oS3NB0uFlSJUYmZLrDPg2kP+qscwS+2En2TWkhxH90Fhg9UyJ0JhZE0wG5
7BxW3MLvyvOp3rzafQ9wFCz05x+sGK5/RO6FruftV6hmDy/iJR9RfTZdaxjdu4pi
TfB7Y5bTfi6njT4n3TApDnmZ7JohumG9A50H+5cQjlFcXH9KZeVlbvbrfZzAfqdP
/KCLlktz05fhIPMUtQJU36dQEU6E5k6p46U+CMppdWIw3IQhijAflr7x+UskWP/g
oknc6BiJal/87xAlaJpeu/wQHOlL4YmF3y0djO/roxGC68e/3XJxO17v5+3MukNv
T1ztaAMZb33BWP2AJ0WsVJFnhSRLD20Do6ndhapovEYTTJcxnuXaOy3rSeXc9UyC
OsNPorX2l+kEbX5hBStINw/qfRvfjevLtXmDFzbxKPO8sk1ttWvS282caiqj1gpf
T+eEY2fOR0ne6xOl9j5L
=Dkic
-----END PGP SIGNATURE-----

--=-NPSN+Au5z3a75IUjiWcO--
