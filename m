Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XMasJ4te"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="V+AZ0Rwo"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Y4b1zmpzDqlT
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:10:07 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C3D420DB3;
 Thu,  5 Oct 2017 22:10:05 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 22:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=0ucFC3B602gsJisXq4SJT4StnCRoLJ8yJTdP+SKaF
 +U=; b=XMasJ4teDBOXpDHSd/26VBULcnYCpeyVVqxz6sItqQ7K1GarYHbru0rwH
 R0qHaprwAgT2u/CRBsBxDBEISuxn5rSUVOzLSNiD0xZ0mMj4T+XIuPFPGE//6+IB
 gxB+0r+lI/PPHz2WJXBJnkpnFY84aaM8riYrl3JxlkR3M9CEAvufKU/b/Kcy3vJa
 q1aywUH3qe3xXMqyJIV92V33Xra5/4lctal0zvKj9G+SEwoQ0gcFOcVohNNxCHC+
 0xdrTjQG+HlGYMPLA0xUqzuoumbuq7BdrTjmMSfRG5lDo6YNe3LCNQqp3R5V9J9t
 R64JtIZjInQ+ECN1uWgphmbfTlydA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=0ucFC3B602gsJisXq4
 SJT4StnCRoLJ8yJTdP+SKaF+U=; b=V+AZ0Rwo0+WAQxkX9FqvJ0I23hk3prKTCm
 /npt1r50pvO3XKg5APFKULXyOD8mgjJDXbYX8IXE0Vxku6utQld1EDdc+50xKauA
 LLiigCxnylRKdpZfLAHaZ7Dfg9/GEcTOunqzuERq5tRHF+WdQC3oBkDurXe/v2F/
 ZFYBs4qOBwjbhDqficY8d7PPIwQ3OCfs6KqVSMRSzq+6irNPgJTgNdtOW9bKRlVK
 PoVMM6XR5c3HlnRAGTz9HNPqMsITZLKtwI6ok/gWnObDWScYRE+Xz+pJNGy5wCWn
 Z9Mtj9n958CLKFU6wkcBYFrXigNh4CZgdtdMATfEEncq1CCr+XUg==
X-ME-Sender: <xms:_eXWWYGRoeK_RcM0ppDoQRJsVfLgeLsa4HTCF8SVzmYSsezHZtfwSw>
X-Sasl-enc: OfovCF18+3zIICd0FbdtBCn4FmLqEJCyki8kytaOU0BD 1507255804
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 40A4C7E1D8;
 Thu,  5 Oct 2017 22:10:02 -0400 (EDT)
Message-ID: <1507255799.5452.131.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v4 06/31] drivers: fsi: sbefifo: remove
 redundant function
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 12:39:59 +1030
In-Reply-To: <1507255553-13301-7-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507255553-13301-7-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-6/ULR+yw0LgHh95QL06R"
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
X-List-Received-Date: Fri, 06 Oct 2017 02:10:08 -0000


--=-6/ULR+yw0LgHh95QL06R
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 21:05 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> sbefifo_client_next_xfr function just does what
list_first_entry_or_null
> does.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 28 +++++++++++++++-------------
> =C2=A01 file changed, 15 insertions(+), 13 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index dbac0c3..173cd03 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -279,20 +279,12 @@ static struct sbefifo_xfr
*sbefifo_enq_xfr(struct sbefifo_client *client)
> =C2=A0	return xfr;
> =C2=A0}
> =C2=A0
> -static struct sbefifo_xfr *sbefifo_client_next_xfr(
> -		struct sbefifo_client *client)
> -{
> -	if (list_empty(&client->xfrs))
> -		return NULL;
> -
> -	return container_of(client->xfrs.next, struct sbefifo_xfr,
client);
> -}
> -
> =C2=A0static bool sbefifo_xfr_rsp_pending(struct sbefifo_client *client)
> =C2=A0{
> -	struct sbefifo_xfr *xfr;
> +	struct sbefifo_xfr *xfr =3D list_first_entry_or_null(&client-
>xfrs,
> +							=C2=A0=C2=A0=C2=A0struct
sbefifo_xfr,
> +							=C2=A0=C2=A0=C2=A0client);
> =C2=A0
> -	xfr =3D sbefifo_client_next_xfr(client);
> =C2=A0	if (xfr && test_bit(SBEFIFO_XFR_RESP_PENDING, &xfr->flags))
> =C2=A0		return true;
> =C2=A0
> @@ -595,7 +587,15 @@ static ssize_t sbefifo_read_common(struct
sbefifo_client *client,
> =C2=A0	}
> =C2=A0
> =C2=A0	if (sbefifo_buf_readnb(&client->rbuf, n)) {
> -		xfr =3D sbefifo_client_next_xfr(client);
> +		xfr =3D list_first_entry_or_null(&client->xfrs,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sbefifo_xfr,
client);
> +		if (!xfr) {
> +			/* should be impossible to not have an xfr
here */
> +			WARN_ONCE(1, "no xfr in queue");
> +			sbefifo_put_client(client);
> +			return -EPROTO;
> +		}
> +
> =C2=A0		if (!test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
> =C2=A0			/*
> =C2=A0			=C2=A0* Fill the read buffer back up.
> @@ -632,7 +632,9 @@ static bool sbefifo_write_ready(struct sbefifo
*sbefifo,
> =C2=A0				struct sbefifo_xfr *xfr,
> =C2=A0				struct sbefifo_client *client,
size_t *n)
> =C2=A0{
> -	struct sbefifo_xfr *next =3D sbefifo_client_next_xfr(client);
> +	struct sbefifo_xfr *next =3D list_first_entry_or_null(&client-
>xfrs,
> +							=C2=A0=C2=A0=C2=A0=C2=A0struct
sbefifo_xfr,
> +							=C2=A0=C2=A0=C2=A0=C2=A0client);
> =C2=A0
> =C2=A0	*n =3D sbefifo_buf_nbwriteable(&client->wbuf);
> =C2=A0	return READ_ONCE(sbefifo->rc) || (next =3D=3D xfr && *n);
--=-6/ULR+yw0LgHh95QL06R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1uX3AAoJEJ0dnzgO5LT55dwP/1Oxa/yeUoWZG31rhAY/01cH
Simxat6776nk1YGne7MtVqojhMjX/PPj6SteXKx6YRjH54F/q/Wd8PasXCqVco0W
4taDaFVEr3SmqWrQ8ZSPsR/60HbuxLA8tAcEyI6DJKVURiY9jy3JYyyI7k6VHuAw
wfOBVOcJcnXDAtQN2hnT+TxpUwsz564v2XlQ8yRd5RCS9FLVyapzbzNRe7gekfXQ
142CU6yLlp8Spw/f8E/2xclx77/8YoguSksXyVfNYBmxLnemQwRIORcuuzfRtjJy
YlwTfG14e+ekbSmgbiT7zFeeSFNNuMuXiAgY9FKeC1a8QB3KTjvFYYBb9cGo2n82
T190zIX0+gjZA3vVd8k72QqC3ItroQFnxrwlR2J+TSF/DRhBbBZtC7iqjdPmz0zW
UYltugB+ylWwrPFM2NUEeGQkCGXZlOJubatZP41scVaqE9zfjqv5YwQqEB/1NVDh
VYEHQEaVKedeItbaw1ttUJ4YsCqlyJQXvQTLNBoFp8e4S+9PXJZqzAR/aL6PXzVn
xIiAojJkFCQpkuf2W8LKFPaw6FqUF7K2k3/Gy1DpJDPAHli7uWEJzrVnH5BBn9a1
9XOAS9YkotrAnU7+EW1oBHYAyk/bPS6nVn6EK8fwt0DNPOrNmOT1XK50jk3xhsEt
V7OQRiMeYouD7zZU8byo
=Fg6b
-----END PGP SIGNATURE-----

--=-6/ULR+yw0LgHh95QL06R--
