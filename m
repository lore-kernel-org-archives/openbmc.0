Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="sZ8SliBv"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CusYbiEc"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7RTl3wptzDqG2
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 08:58:03 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 71C9E20C42;
 Thu,  5 Oct 2017 17:58:01 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 17:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=ogOxL+mGcULRy/3xoFn9eecq292doFXw7FgNkPery
 4Q=; b=sZ8SliBv8eKhM6U9LDX83B/b4mAdgmziTktULBsJQavfaChT5686uLsdF
 chcbcSgXDSEAWEMwMWxlMwNtM2sutxfVrquO6LAcQagXtdyOmNx0PzhNSV5XW4i9
 0zWighFenxLJ0Tnf8N2HY6gfW+ycRYLrvsO+c0CgxmIw5SEyfnQYo3yj5maXCkng
 upwWXETiEnJPyc+8MZ4KpjRsLDF/NiYG+Sc3vNgkw0IG17M4mU6z7Cl0wlsLqX2L
 t5aGj0KDyXFh7IqctLCAExBeihZNgOD/Z9YDti1X/VGSpxmbvHyIdXSfbN/GVAz2
 wLdHiJnrrzzDLWWfXpd3vX5jlVT6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=ogOxL+mGcULRy/3xoF
 n9eecq292doFXw7FgNkPery4Q=; b=CusYbiEcKl782zPq372F6FfNVa6zY3LNRH
 h/ae1O1zeqF3H+dhSFgcvcBBCl1Y3T94ZCYRuQWyUFjfkjrvBPKeVfu9Ojz9siHn
 S8r4XLy4wYAhYjJSpn6ZxWKgzzy1C54apuvG7gFC/WhmEQRlbG7g2Un4pDistQw3
 szLFRR4wgBu67fss8MSOKnefyOHn8kyzexL7dSVH+MT9rbRBsTYBJgqQqOk6+5Qo
 zcgK2SbDtqdeSsE8wKp/6/iR6gJ5AqzUQtdoxANIZ1FDMH7YMPX5YzmU20LgZ+kF
 NRYBbEVzgcCxVrd8OQLrdi2AxJdps9jrwM+N20NS85VpDW/krWgQ==
X-ME-Sender: <xms:6arWWTg1hkMyumSIHs4J7XR91nja_JKFzXjo22EXQgaJcut8NNzXug>
X-Sasl-enc: cpwGcwQg4FvhX+BZA7BXT1YRnbluQc84YBKIssy2dhAF 1507240680
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id B12142489B;
 Thu,  5 Oct 2017 17:57:59 -0400 (EDT)
Message-ID: <1507240676.5452.85.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 08/31] drivers: fsi: sbefifo: Do an
 earlier get_client call
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 08:27:56 +1030
In-Reply-To: <1507231464-13635-9-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-9-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-nYQ9RNrec1RQOB/5UH5h"
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
X-List-Received-Date: Thu, 05 Oct 2017 21:58:04 -0000


--=-nYQ9RNrec1RQOB/5UH5h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Get client before we start using it.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

I still think the refounting of clients is a bit odd, but if we need to do
it this seems reasonable.

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 9 +++++----
> =C2=A01 file changed, 5 insertions(+), 4 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index a5bdc75..5efba30 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -656,6 +656,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_cl=
ient *client,
> =C2=A0	if (!len)
> =C2=A0		return 0;
> =C2=A0
> +	sbefifo_get_client(client);
> =C2=A0	n =3D sbefifo_buf_nbwriteable(&client->wbuf);
> =C2=A0
> =C2=A0	spin_lock_irq(&sbefifo->lock);
> @@ -663,19 +664,19 @@ static ssize_t sbefifo_write_common(struct sbefifo_=
client *client,
> =C2=A0
> =C2=A0	if ((client->f_flags & O_NONBLOCK) && xfr && n < len) {
> =C2=A0		spin_unlock_irq(&sbefifo->lock);
> -		return -EAGAIN;
> +		ret =3D -EAGAIN;
> +		goto out;
> =C2=A0	}
> =C2=A0
> =C2=A0	xfr =3D sbefifo_enq_xfr(client);
> =C2=A0	if (!xfr) {
> =C2=A0		spin_unlock_irq(&sbefifo->lock);
> -		return -ENOMEM;
> +		ret =3D -ENOMEM;
> +		goto out;
> =C2=A0	}
> =C2=A0
> =C2=A0	spin_unlock_irq(&sbefifo->lock);
> =C2=A0
> -	sbefifo_get_client(client);
> -
> =C2=A0	/*
> =C2=A0	=C2=A0* Partial writes are not really allowed in that EOT is sent =
exactly
> =C2=A0	=C2=A0* once per write.
--=-nYQ9RNrec1RQOB/5UH5h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1qrkAAoJEJ0dnzgO5LT5HuUP/RTVxTzNr0mVtmM3jjmvqnSY
YKOwDIHrQ/jOc8vgxzHyR5QVElIi2ZgirpaxKHw0QLkKniLwf2EeZSdfv7pkCFav
ww4wQ1HVDYORAtTVHkIyYTPPm2l8+BIWKRSd07WWQSgI7Vx05pmpOU/OWrmkOUIJ
mpmT8EVqrJEYgTPnWvv5WE1r8/O8ETM5yE9wLBJY1QXRcixu70FuqvoL0a63xW9I
IUjh8sX/qZ55giduZbfHBqIqUyA8idyDuqHVteh6PlMb4e/6KREUbYWe98I5cOlD
gmoHWdJffrqBSNhOnZsjuv5bvkNouzBE3nRrWK3S3IzidaZk9E/jOlgek9XJA5Hr
+y2tVH6GA0dA/PTmD7Owc7/U85jmJ1rH/U8dmwgGjdj1ZzjgbTP+nuYSGC+bbMpL
74tnjvty2GOZ6o+twf+1JUdlcA2tfIRWZ2YnfSYO3ZWRlLgSn79renpWCxtWAwuI
nmNCgzH3w4xvtlbRq6rNBEbr3rAXNErjWIFFujFj1Nqt0cMjPyTHkm5x74YwehNq
2M48cMLf0+ZoN2Ftnrwbkxj60sgJiSU5tb9PYy5C5k1Aqsxhlt+iLK1WIiEn/0bH
7UxdhLcbaAQmJzgV2J5bf8R49MgOH5Xgq0y3LW2eGhV2KUvhw2tnQK9p+5mGkqbd
7eq7J0g/bxGQH9LM+dd9
=PcnG
-----END PGP SIGNATURE-----

--=-nYQ9RNrec1RQOB/5UH5h--
