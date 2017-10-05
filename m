Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="exTQusU8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bSWmpGJP"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7R1k2f8czDqnb
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 08:37:14 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 342F720AF0;
 Thu,  5 Oct 2017 17:37:12 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 17:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=OD/WkwoXd8E1KpqyizOZva7eIygyFssftwoAU6Y1l
 jk=; b=exTQusU8wK6Hu5EB89kFIVNPdEriMIurRV7gVgp8cwi4hFZHuxQETL43U
 pFeOPrsXWxKSFS4JoUGExmrPwOVfOClk8XG6t1ZUz3NW+1f+4PD78UIIOUyIfGll
 ffUD4UKbBvmp4FP96rJF1+qf1FNLRJdxSnLv7VmXZjwk2jSeepzDkKlR69TEeaAq
 OINFCzMTdFUZSFZedjj19oibJQSHo0cw2w4PKus9y3l6fONivPYjd1nZCQp+Zn+M
 4WgIVbOzf5Sulxaa+AdBKPSwjn0ZL0IX3b7ycUt4NL9ftQNmXuMn+35TmWDI+mLX
 KXyuIbDxhbj5qsmGu+iPejgA2NKAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=OD/WkwoXd8E1Kpqyiz
 OZva7eIygyFssftwoAU6Y1ljk=; b=bSWmpGJPghGHCxOC1U7B1la++UFOd6zhpN
 OVEsD1+u3UwzX8A/hDXZSDrx7aGBjBPeAPEUe3szjNV4J48P8JWbNzw/pvZo5P/o
 7Rk8K2/vylvcrBIgd1Kc2YQ7EN6ibXPheRiwIsajy48KJ5h8hgN0ndZeZtzAHN4n
 i4BzJWLDydb0qBACt/OiIGzQ+2Q41/Acu0fx3CR5LSnI2VrJtq4XMHHsu/kXwmzb
 u4UPJZaDAOqL6sv35iAuFTRZFVrSfYIUFKH1VkIeoeQsfNF1IORTSqnmc7Xz75ra
 2ho9JZZxoQVRmvOQS8ktvoLxZna0WOlFbyQ41WZbxSGAtjYcJqmA==
X-ME-Sender: <xms:CKbWWSsCB4ZjyBRdWXkJyd4dSwEm_d_WNbuSrlMSGJzo7zOs6exL0A>
X-Sasl-enc: vganXhyFhzuSqy3AjGk9mAgEdb87sSGNQ0vYaWGDwMDS 1507239431
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 79D6E248B1;
 Thu,  5 Oct 2017 17:37:10 -0400 (EDT)
Message-ID: <1507239427.5452.75.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 03/31] drivers: fsi: sbefifo: Use
 __be32 for big endian values
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 08:07:07 +1030
In-Reply-To: <1507231464-13635-4-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-4-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Yv7n6IJWTsCw96NF5DI1"
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
X-List-Received-Date: Thu, 05 Oct 2017 21:37:15 -0000


--=-Yv7n6IJWTsCw96NF5DI1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:23 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Use a real __be32 value instead of u32 for big endian values.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 2e45a75..c5eeace 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -103,7 +103,7 @@ struct sbefifo_client {
> =C2=A0static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
> =C2=A0{
> =C2=A0	int rc;
> -	u32 raw_word;
> +	__be32 raw_word;
> =C2=A0
> =C2=A0	rc =3D fsi_device_read(sbefifo->fsi_dev, reg, &raw_word,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sizeof(raw_word));
> @@ -111,17 +111,19 @@ static int sbefifo_inw(struct sbefifo *sbefifo, int=
 reg, u32 *word)
> =C2=A0		return rc;
> =C2=A0
> =C2=A0	*word =3D be32_to_cpu(raw_word);
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int sbefifo_outw(struct sbefifo *sbefifo, int reg, u32 word)
> =C2=A0{
> -	u32 raw_word =3D cpu_to_be32(word);
> +	__be32 raw_word =3D cpu_to_be32(word);
> =C2=A0
> =C2=A0	return fsi_device_write(sbefifo->fsi_dev, reg, &raw_word,
> =C2=A0				sizeof(raw_word));
> =C2=A0}
> =C2=A0
> +/* Don't flip endianness of data to/from FIFO, just pass through. */
> =C2=A0static int sbefifo_readw(struct sbefifo *sbefifo, u32 *word)
> =C2=A0{
> =C2=A0	return fsi_device_read(sbefifo->fsi_dev, SBEFIFO_DWN, word,
--=-Yv7n6IJWTsCw96NF5DI1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1qYDAAoJEJ0dnzgO5LT5npAP/0MQhSTfgoJFeylt/oJ6SLbH
hMMQ0YnKRGgMfHq+xIAW9Zup1wniZZ3LAlEG35CpMnqXmbLcJBAupQOT9ggb1CCZ
nDt6rvefw5wvo1K/6toRmL9z6wD0UdNrGTALW0mWaxkvbcAtlIde0kESYAaV0PS3
SIjmlLvCBj4UlKXYdLCR6gPSQzPr/MrU+JY4ZZdQNrwZZaAflH0Mu8oO4Z4flQbJ
a6mMIueTn2Y/8EzD2c63KC2WVLLC7sa/GmM4bQcNEAtnuIEUaMjgsxXRNZeSTUsM
J7gZpKeR3kmylS5WQVj3UPomz2Cu2zzBkyyh1Cdp55rjze2a5oY+N3IqnmK/H70f
GkO7WU5l8uffYOqPJC4rfg/RI1LILeZuCAi4ZLgO2Et0JgV/MHkvYLMLq1m/FyS+
HlaOYTIXjqvx/56ig6tHAuPGx7cdjk6blqTLh8ODdm+R2OH3eV0CHoM45oYTj1hS
ICtpEh//K7vHEj0Mf2Fstg1SMpWW4V4rCqq0jUsJuK6oXlOvYKCJQSmYARor2WFH
xmuN8LFPIfbVxDmmnBkYPZv4Znmzh9nN5zR51TB2RgF0E1Wc7le06bB9Bh7YeLsy
F5UnQHEcOWQXrFyPEOYOpO7ecdEASo6ogYk4AaGmBHUwu2LDIKxgac5AhrSlyp67
ZGaeCre7WPAsqUZElEfa
=IwqO
-----END PGP SIGNATURE-----

--=-Yv7n6IJWTsCw96NF5DI1--
