Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fnZgqgG1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WjHmqTfC"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7RtW6L1rzDqhb
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 09:16:03 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D27F020BC7;
 Thu,  5 Oct 2017 18:16:01 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 18:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Kk7OY4JUdS8Oaczv0WTl7kkRwYZqUbauFtltcQN9C
 U8=; b=fnZgqgG1fkTIXjUXiuok7nhdGVzaWz5ly3UVcOgoeWEGNQ2ri5ZxMoNb1
 QvYViOtDS6tmdtd73/yjoNnRAXS80R9qYYBI/QsLkJh84jTDA7oa1e7bQFiBuXk7
 s80rgFVMmjwfylTNQ/m5N1RRHCKxwEJt1Lg56pP1shNXacMKk0tMeOfBq3mNDrWV
 TM45/heZTFK57qF/r6G/uguDXLZXwofptG1EoP/yhtxUJE2ZAvQ6ospLpV0GB52O
 2szw0zQF7WEX10JcSD21F8OFuOrVoKViFE0sgYnM8VFM5eWwvuA+S9x5a9EZxr0C
 VQPccMa9Cwt7qTQ8lSpkCQkDclETA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Kk7OY4JUdS8Oaczv0W
 Tl7kkRwYZqUbauFtltcQN9CU8=; b=WjHmqTfCBV/MkKR9uVw/UEKkpl9YUpt/HO
 hrcG+iqtyzPwlRAJuuBym9rILycFWJ6KEZq8v4xssPCXxBQAW8GjQwyziPubDy1J
 CfSvqIVC7Iwy0a4/K7Pf4gOMTkWPoZDuvrDogMh/RsKfHYo3pqXBoHr6BEm6+n4U
 qNFCRwLXf6SR8lEcPZfCIsvHUmMfHBPuPQg5EPoVypj99Nm7Ii7P54Ui7TzpW8pm
 Qp9+MWTRo306RDZlKSbe9dBcoWNYVt5WBqeqBYWDVwQL78JbB/mr+nl8Ic5/QfEY
 CFq1BmFKFxp5RfP44DWdNWS2BGd5z43o8uK9QnEPjyPGJWNtOLvg==
X-ME-Sender: <xms:Ia_WWWYI5igb2LR6i_-6TwLSZSQ6EEXS9l3hxWg4jNfOiQUFiD88gA>
X-Sasl-enc: f7qIAUkvDUNbN0ag9jHz9q36jJPnt74j+O/ox64WKovF 1507241761
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id D7950242CF;
 Thu,  5 Oct 2017 18:15:59 -0400 (EDT)
Message-ID: <1507241756.5452.92.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 12/31] drivers: fsi: sbefifo: Fix
 include guards in header file
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 08:45:56 +1030
In-Reply-To: <1507231464-13635-13-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-13-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-rC3JKvY2DMwdvxt4iXi6"
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
X-List-Received-Date: Thu, 05 Oct 2017 22:16:04 -0000


--=-rC3JKvY2DMwdvxt4iXi6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Make them conform to Linux standard headers.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0include/linux/fsi-sbefifo.h | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=C2=A0
> diff --git a/include/linux/fsi-sbefifo.h b/include/linux/fsi-sbefifo.h
> index 1b46c63..8e55891 100644
> --- a/include/linux/fsi-sbefifo.h
> +++ b/include/linux/fsi-sbefifo.h
> @@ -13,8 +13,8 @@
> =C2=A0 * GNU General Public License for more details.
> =C2=A0 */
> =C2=A0
> -#ifndef __FSI_SBEFIFO_H__
> -#define __FSI_SBEFIFO_H__
> +#ifndef LINUX_FSI_SBEFIFO_H
> +#define LINUX_FSI_SBEFIFO_H
> =C2=A0
> =C2=A0struct device;
> =C2=A0struct sbefifo_client;
> @@ -27,4 +27,4 @@ extern int sbefifo_drv_write(struct sbefifo_client *cli=
ent, const char *buf,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0size_t len);
> =C2=A0extern void sbefifo_drv_release(struct sbefifo_client *client);
> =C2=A0
> -#endif /* __FSI_SBEFIFO_H__ */
> +#endif /* LINUX_FSI_SBEFIFO_H */
--=-rC3JKvY2DMwdvxt4iXi6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1q8cAAoJEJ0dnzgO5LT5094P/iOQ8V8PDvmgeO3zYSRy+QLm
mxLQXkdeBZ/XmLiqWiAU+K2wetN28z++rqx7PdLbD6pZFWRMBOmYCbZLO3gv+Il4
aj05eJffeOf6/UtXUOGTtvEEUUVo6+RH7Io2ry2iqyRTvNT0KomFs47M24xbMyp3
mmkyLmxg3RaNDMRxuFJevbYtP94nCy2HllrnSaa9iRKILjSuQHgQCzQEKGzOdMGA
nL/4npeR09TrCb42Ht0Io+hYRKKslGta3Vv29DRoM+eyNhplCNV65hBpOCWMaAlr
LKLAhvP8MLDtEEA4jZsX/mh7TPCRbtJqHQXOufEyik6t9pxg37KKnL1Wpd8dNKz1
bDs4KW/1+jFFsB+7jfZM9BA2UcvXYGX3oeTJXBWlLxZ+Avqzd7bp3MjH3LEg/pyo
aJ5xhGcBZ6kQ6kgfHMux1RrNfHybNwzgLBNMx63NjrOs8jjIB/PjEiG07V3ZRlbA
V8RGLede5NwUEemxKPv/I75dE/AAfeQa8WKkKbsZraLYad1i2Ob6qlggbwcGF/a/
WVjea1MYsgSj0t+SaoPmAVKzEp+wJ8dBwIlgGNdn6bBWC3NRqp0gunklklMdbM7z
2BIjH7KXanpddB//Vqb3PpBgdXjAXbguOAzUtPMdATCwGh+nXktc+YufTv4MgFsu
WSQssRItS+2vKcxk9bYj
=J/Fj
-----END PGP SIGNATURE-----

--=-rC3JKvY2DMwdvxt4iXi6--
