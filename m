Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZuTvwHz3"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TOj5kkia"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7XyJ2M16zDqks
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:04:40 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B55D20B2E;
 Thu,  5 Oct 2017 22:04:38 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 22:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=3cvDL//2ElqzzIu08KzD0ylvw6Ly0aEslNyMnAaCP
 Ok=; b=ZuTvwHz3QiuSIOrQ9h24o4WXqjM6kVcpuEgkg0GLGL7B3Gjz2oi83aaz8
 JfWYAdmorjDhEQLW+/bRXowQ1cEU3GAxEMGreEFuMQwk9U8HZFCHolklkUaiQnCu
 bFVPZz796XyJyagD4s7DpnueO7Zr6dJvstjlXMN2LqnQVrk6+UiXN4n2sKhJYy1C
 1S4zsy9CBE8HY7iQ4N+DQt+Swa1Y4NrGIBBZTHAuj6BRhP+dRULl+aQikld2M7TC
 A/yGMMksmI6C3zlomAJPKYy4ZebLtsThZhk/mTJ9tLjOZTvnfY1smcdH3m7VeZes
 E0KUJ3+h4htRrM0rL5pHxvKw02zTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=3cvDL//2ElqzzIu08K
 zD0ylvw6Ly0aEslNyMnAaCPOk=; b=TOj5kkia7dh/l7geDm3qJYlW0wl/bt3Jp/
 zJHCgoNEVw3cIDO/Z0FqfJoblPErLLpmveL/NTLbiyQZZAq5fZJn7ta0JVi2ATZ0
 NPfBLRPRJ5lrY/YZA8IUNy2UhmNBuK5GJhUUnRNjsbQA73/UDqUzafpdjEQNh+5Q
 85ryWQ096l2oxjE7RETQnxLNsh+RKNab1kBIp2ghbkUsFBP9uxTHVYcUyy/oVxgd
 fnn4QO3UxwzjGnG/fy8khEyNKIkUfkU6Nf+863Gh8gDisqBSLh6iJQMsnJThamYU
 liYXiBn29tHbFNrr2BywQRehyuoeWXLacb7612LMx4lTm3n53S/A==
X-ME-Sender: <xms:tuTWWUhUWBDuPmBAQTaJPLRBy5D5xG6OHQqjT4v9IXw-BVxHRKbUJg>
X-Sasl-enc: ocLrtEzsZE/rf1LheI+veUOqtR3hHfcy3UeZzVhnJdaX 1507255477
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7D0E47FA76;
 Thu,  5 Oct 2017 22:04:36 -0400 (EDT)
Message-ID: <1507255472.5452.130.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 06/31] drivers: fsi: sbefifo: remove
 redundant function
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 12:34:32 +1030
In-Reply-To: <bb38610c-daa1-a44c-a854-8a00659e576a@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-7-git-send-email-eajames@linux.vnet.ibm.com>
 <1507240108.5452.80.camel@aj.id.au>
 <bb38610c-daa1-a44c-a854-8a00659e576a@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-kE6s81rxRbP035usqt0v"
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
X-List-Received-Date: Fri, 06 Oct 2017 02:04:41 -0000


--=-kE6s81rxRbP035usqt0v
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 21:03 -0500, Eddie James wrote:
>=20
> On 10/05/2017 04:48 PM, Andrew Jeffery wrote:
> > On Thu, 2017-10-05 at 14:23 -0500, Eddie James wrote:
> > > > > > From: "Edward A. James" <eajames@us.ibm.com>
> > > =C2=A0=C2=A0
> > > sbefifo_client_next_xfr function just does what list_first_entry_or_n=
ull
> > > does.
> >=20
> > Any reason you didn't implement sbefifo_client_next_xfr() in terms of
> > list_first_entry_or_null() rather than open-code it?
>=20
> I prefer simplicity of using the kernel helper. With a custom function,=
=C2=A0
> it's not clear if it's doing some additional work unless you go look at=
=C2=A0
> it. With the list function, it's clear it's just returning the top entry.

Sure. I'm not terribly fussed either way, was just interested.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

>=20
> Thanks for the review!
> Eddie
>=20
> >=20
> > > =C2=A0=C2=A0
> > > > > > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > > ---
> > > =C2=A0 drivers/fsi/fsi-sbefifo.c | 28 +++++++++++++++-------------
> > > =C2=A0 1 file changed, 15 insertions(+), 13 deletions(-)
> > > =C2=A0=C2=A0
> > > diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> > > index dbac0c3..173cd03 100644
> > > --- a/drivers/fsi/fsi-sbefifo.c
> > > +++ b/drivers/fsi/fsi-sbefifo.c
> > > @@ -279,20 +279,12 @@ static struct sbefifo_xfr *sbefifo_enq_xfr(stru=
ct sbefifo_client *client)
> > > > > > =C2=A0=C2=A0	return xfr;
> > > =C2=A0 }
> > > =C2=A0=C2=A0
> > > -static struct sbefifo_xfr *sbefifo_client_next_xfr(
> > > > > > -		struct sbefifo_client *client)
> > > -{
> > > > > > -	if (list_empty(&client->xfrs))
> > > > > > -		return NULL;
> > > -
> > > > > > -	return container_of(client->xfrs.next, struct sbefifo_xfr, cl=
ient);
> > > -}
> > > -
> > > =C2=A0 static bool sbefifo_xfr_rsp_pending(struct sbefifo_client *cli=
ent)
> > > =C2=A0 {
> > > > > > -	struct sbefifo_xfr *xfr;
> > > > > > +	struct sbefifo_xfr *xfr =3D list_first_entry_or_null(&client-=
>xfrs,
> > > > > > +							=C2=A0=C2=A0=C2=A0struct sbefifo_xfr,
> > > > > > +							=C2=A0=C2=A0=C2=A0client);
> > > =C2=A0=C2=A0
> > > > > > -	xfr =3D sbefifo_client_next_xfr(client);
> > > > > > =C2=A0=C2=A0	if (xfr && test_bit(SBEFIFO_XFR_RESP_PENDING, &xfr=
->flags))
> > > > > > =C2=A0=C2=A0		return true;
> > > =C2=A0=C2=A0
> > > @@ -595,7 +587,15 @@ static ssize_t sbefifo_read_common(struct sbefif=
o_client *client,
> > > > > > =C2=A0=C2=A0	}
> > > =C2=A0=C2=A0
> > > > > > =C2=A0=C2=A0	if (sbefifo_buf_readnb(&client->rbuf, n)) {
> > > > > > -		xfr =3D sbefifo_client_next_xfr(client);
> > > > > > +		xfr =3D list_first_entry_or_null(&client->xfrs,
> > > > > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sbefifo_=
xfr, client);
> > > > > > +		if (!xfr) {
> > > > > > +			/* should be impossible to not have an xfr here */
> > > > > > +			WARN_ONCE(1, "no xfr in queue");
> > > > > > +			sbefifo_put_client(client);
> > > > > > +			return -EPROTO;
> > > > > > +		}
> > > +
> > > > > > =C2=A0=C2=A0		if (!test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags))=
 {
> > > > > > =C2=A0=C2=A0			/*
> > > > > > =C2=A0=C2=A0			=C2=A0* Fill the read buffer back up.
> > > @@ -632,7 +632,9 @@ static bool sbefifo_write_ready(struct sbefifo *s=
befifo,
> > > > > > =C2=A0=C2=A0				struct sbefifo_xfr *xfr,
> > > > > > =C2=A0=C2=A0				struct sbefifo_client *client, size_t *n)
> > > =C2=A0 {
> > > > > > -	struct sbefifo_xfr *next =3D sbefifo_client_next_xfr(client);
> > > > > > +	struct sbefifo_xfr *next =3D list_first_entry_or_null(&client=
->xfrs,
> > > > > > +							=C2=A0=C2=A0=C2=A0=C2=A0struct sbefifo_xfr,
> > > > > > +							=C2=A0=C2=A0=C2=A0=C2=A0client);
> > > =C2=A0=C2=A0
> > > > > > =C2=A0=C2=A0	*n =3D sbefifo_buf_nbwriteable(&client->wbuf);
> > > =C2=A0=C2=A0	return READ_ONCE(sbefifo->rc) || (next =3D=3D xfr && *n)=
;
>=20
>=20
--=-kE6s81rxRbP035usqt0v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1uSwAAoJEJ0dnzgO5LT5xvEP+wZDJe5cRZMwSHq2wavZiG0C
YfCEfwdUnS5FzjmTMChkf8DMLJkSB4F1PPfSqQZMWKu2OBW2xcMIT1JLi067JQhN
x9YqLbp8tX6zkLAGnTKzXAUMdw3h84eZiYhkDK4rIXSwADh00He5itzIfJvg0fPb
tbjgZ7khpN1vCA14cekqXtn2N2kzRgLEJRGA5jFbAaPo8wG8bYQPld721w6MDoV6
01ucETqkGG4zCzZJoEPHs+L7nzSv09aZ5hInqAi1/L0PcoSTuEmyqLuTu64ag95C
uBASznc6j29J6iIH0urxeULjM10Mq/6LFhmp7oGuS5KrWN/S3oRzlyGLvRP6Oa8n
EVihGDlc2SJMVIOyAwNFKwFtCXi69mDC0vJbVGsKigHeXMmuik5nNLwg5xzlinWx
8h5X64vx4SyWv5tsvyP9gUnGmA5skdK8heEIdu0ntEb8sljFRM5Wr2eJRzxHKJf/
keMvAtlWBR3sdjAOheDPKWRdIBaNOnezvFdIj55HxOm1oqZvaeyvntld47VaNQK5
BvL7AJ4NFHcNATacMdWRk2nE13+Y4C/GnveEUdrtI7i1+qKyXW+M9UYvt3RsJ0HH
SA7aP+dXoSvGxxhXOPDPJ8FLDUjVs7dOoghtZBzvo/WBN23EXPL0aXpT0MuvoD2V
dbmKE5qTG4gKiECaQoC2
=kqCB
-----END PGP SIGNATURE-----

--=-kE6s81rxRbP035usqt0v--
