Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jS7sgJXT"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="T5cxl1FF"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Rrp3bs7zDqhb
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 09:14:34 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 629EE20C4A;
 Thu,  5 Oct 2017 18:14:32 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 18:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=DWz8CPvEo9PD7dG+QxDD4bjL1p3B1gV4rhhKYaR+x
 Jg=; b=jS7sgJXTkYxioD8MUfrGdsIBt6gr+MGoE92nuvERmsLcs3aa1UuswUCbv
 PKBx7D+p1L1Kgu1k5BEAYqAM9FBfVU9D6TGqXgjZ8DZQ7la2ZRyz2JJhktBSOQa/
 k4SaZyQOqs9JE4mQTrDPu8M1xQcKHexnHdJ7iHyi3M3fZNoW/lffcgYemlv1TVoF
 r/v0WWGmzEwd3XeQ969QlrLRwIkiIt6W6Efiopq7R6piVJDxRGOBcDnjSDs1pY/M
 AELvnPkpP9g1jdgRXTd16y25xw3/98Nf05M5/0tU8Ss7uF+TPCSrJShb211dfdqB
 gjDuBaOY8cFvXaPVHoHnjQJkEtvlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=DWz8CPvEo9PD7dG+Qx
 DD4bjL1p3B1gV4rhhKYaR+xJg=; b=T5cxl1FF48ySiypJbKme86HqxTDlcCuEC1
 o09LX+aPhkmLXSTGDaC7RnpnoJPonhXNybgOU2cnW8yanONLhO+it7xtqVGA9HLV
 f3w+O4DzmUJ4SAB2TLQtcV7wnC9AIqiPY4HFjdcy+bVXH1nnAkh5I/LWr/KVCuc5
 LU/zDIaxFMB6L1XWRlWZrSmTV33kFVIoyPbiWpF6cqMJvLHUbIVxd3PhlndSo1Jz
 r3zLgrZaGiXEHKR0oLQYieGn8uyy/OHib8kVn3IbvXenOrCYrYAx78LhQ2d/LKrY
 dlmkYG89kk8u4FFLnipNhB9AOpzW+8xezn4+5fu/y/0kun3hDKKA==
X-ME-Sender: <xms:yK7WWZHRkJud79NvN6BsoZNCrTf_z_lymJ4v7m8bsQpWdKYzSHLxgA>
X-Sasl-enc: FD4X/ODk6FD5FlEp0V/uzoL3/NEGkZqWP925sQLqx9sk 1507241671
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5D40324870;
 Thu,  5 Oct 2017 18:14:30 -0400 (EDT)
Message-ID: <1507241666.5452.91.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 11/31] drivers: fsi: sbefifo: Fix
 module authors and comments
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 08:44:26 +1030
In-Reply-To: <1507231464-13635-12-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-12-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Sp54WAPVizximUqk4sm+"
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
X-List-Received-Date: Thu, 05 Oct 2017 22:14:35 -0000


--=-Sp54WAPVizximUqk4sm+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Clarify the xfr situation in write() and fix module authors
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 12 +++++++-----
> =C2=A01 file changed, 7 insertions(+), 5 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 0ff5209..a2acf76 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -655,7 +655,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_cl=
ient *client,
> =C2=A0	n =3D sbefifo_buf_nbwriteable(&client->wbuf);
> =C2=A0
> =C2=A0	spin_lock_irq(&sbefifo->lock);
> -	xfr =3D sbefifo_next_xfr(sbefifo);
> +	xfr =3D sbefifo_next_xfr(sbefifo);	/* next xfr to be executed */
> =C2=A0
> =C2=A0	if ((client->f_flags & O_NONBLOCK) && xfr && n < len) {
> =C2=A0		spin_unlock_irq(&sbefifo->lock);
> @@ -663,7 +663,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_cl=
ient *client,
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> -	xfr =3D sbefifo_enq_xfr(client);
> +	xfr =3D sbefifo_enq_xfr(client);		/* this xfr queued up */
> =C2=A0	if (!xfr) {
> =C2=A0		spin_unlock_irq(&sbefifo->lock);
> =C2=A0		ret =3D -ENOMEM;
> @@ -719,8 +719,9 @@ static ssize_t sbefifo_write_common(struct sbefifo_cl=
ient *client,
> =C2=A0		len -=3D n;
> =C2=A0		ret +=3D n;
> =C2=A0
> -		/* set flag before starting the worker, as it may run through
> -		=C2=A0* and check the flag before we exit this loop!
> +		/*
> +		=C2=A0* Set this before starting timer to avoid race condition on
> +		=C2=A0* this flag with the timer function writer.
> =C2=A0		=C2=A0*/
> =C2=A0		if (!len)
> =C2=A0			set_bit(SBEFIFO_XFR_WRITE_DONE, &xfr->flags);
> @@ -955,4 +956,5 @@ static void sbefifo_exit(void)
> =C2=A0module_exit(sbefifo_exit);
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Brad Bishop <bradleyb@fuzziesquirrel.com>");
> -MODULE_DESCRIPTION("Linux device interface to the POWER self boot engine=
");
> +MODULE_AUTHOR("Eddie James <eajames@linux.vnet.ibm.com>");
> +MODULE_DESCRIPTION("Linux device interface to the POWER Self Boot Engine=
");
--=-Sp54WAPVizximUqk4sm+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1q7CAAoJEJ0dnzgO5LT5F5MP/0A4k13fZ0X7gN4Yit7MzPfR
Jr9/saL3RziM2TA/el1KUGSvBnUYgEuOxGK/7IchQ6A/huZxyP2NbdSPuvTmlV4A
Ss/x0zW6M/pRfsn7zA3YBVdZyFxMXIG/JWTPparpSzSA+xmgoLUmMbyUCuM9nO9d
jOcWl8+4R/JUjXA+ApYZTbLWp30zlFuHveKyeQIR14WmgGHjgDZXzeHVetv60MEc
zgdUxS36wsIv6XVe3wGltfALyjdcElv0lvcgAVICKeMWrOR6C9UXyTQAJJR8jWuY
jxod4PPwJbxTxwSY0EqB7WeXV7MDbu6LSyXFRhKJBBDdU/aCVjUFjR8ij8RaVSei
XF5aoEhKMjL5I1IyD1voDcKaXGJSj/VEi1toeAihQI93kGv3rVKkf8brKj3orkAq
tREiEbc7CrOHpmuZHmxaDsi4aFoY9OYkzmu3ZD7UvzMj6o8mrxpF2AguhrZw4lsw
XV6uLnNgVtnOJB+CVxwXUtknzZ6vpbmNl1004cOYZ8hQ1md0vm4Cnzd9lzS7goL6
H6esoHEZ76EP05j8dS+asrd/UZuXpDTcjPzVNBP8e9RYg5R3RCtAiVoivrviHfO7
3X4USCZoqU2K7+2i06uN2ywEbur6byJFIRtrClFwCM3PVilFxAvRUJQmc002aVBJ
kxLOBNPgUNV5Z+eFnz7k
=J3IC
-----END PGP SIGNATURE-----

--=-Sp54WAPVizximUqk4sm+--
