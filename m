Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Hx0CTs4C"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FkGq4wwv"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Y802FZzzDqlr
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:13:04 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1F2FD20D06;
 Thu,  5 Oct 2017 22:13:01 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 22:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=9r5W4fL0PslF5MQsATvM4ncsRc6TjYzarkWm/tnix
 Iw=; b=Hx0CTs4CUbFz0JnKgutjLpJW+L8+EntlS0hlvdjRKplTII100N8jLmrda
 dZHLnlcn5I9USdRjq6S//OQrW57sOwapr3BkGNDwMlYDQRZqr4+StQ9jfthgHGts
 GqlJBe/AEflrZ5UTXiAMrbiT2vmGW16B0+o8enliiJnawE95BICD86s/viCdxJfq
 CRp194Tmv0t29lxzTmnkN4LaDwxwpeRYX5LT+zKl6gt/ZYyR3z7b+s5tQKa5mJFy
 12/hQjUkvnEK3DDI+CYfyk5rU5BXJ4wLN9j+X1kNp3pwpJfF8/sGPYadiqjo38CP
 +2LnYNxoNh8qW6VD2MUV7cYm/idcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=9r5W4fL0PslF5MQsAT
 vM4ncsRc6TjYzarkWm/tnixIw=; b=FkGq4wwvb2lFHhKNzRHvmF+kZN/VOZ0WvN
 HwOGxbFThwjqk7l9BvsgdClSC6SKJKOHCkyNAAvgoDLBRJvtpf+1fH6Nw6u7AiZk
 aX1fVpDPeXRkaUGzbmaast1GS2dEXMBYh2B7+YSMcMGynkY2TqLJ5Q1y0YKbRK90
 NS5RAWec3p0AXU2O+G2EUKpARTzdf9NKH5EOydiQPKA+IiwsSDf/rm0PWHMw/Xgf
 jAsVMsidZyzkAHak1Gxjl/xTgkTwXlDqgV+zUQ9r+3M7RxLdWVyA1GB9YrGapG/7
 oIXRi4OjB5MgI+rdYsEEadpnAlUTO590CSZTPj9bVYTJlOwAJzmQ==
X-ME-Sender: <xms:rebWWaJZSbyhD5-_O16BMJKfvDIk0mVWnEkExmFAycb_fQTMCqYc7w>
X-Sasl-enc: Azyw3kMtPRidG2bgUfcl+H2ueZEWsV89m6ECLVDeqY1i 1507255980
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 081B57E954;
 Thu,  5 Oct 2017 22:12:58 -0400 (EDT)
Message-ID: <1507255975.5452.132.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v4 19/31] drivers: fsi: occ: Return
 ENODEV if client is NULL
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 12:42:55 +1030
In-Reply-To: <1507255553-13301-20-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507255553-13301-20-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-rls692aI/dR323Gwhzkw"
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
X-List-Received-Date: Fri, 06 Oct 2017 02:13:05 -0000


--=-rls692aI/dR323Gwhzkw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 21:05 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Safeguard the access functions.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/occ.c | 24 ++++++++++++++++++++----
> =C2=A01 file changed, 20 insertions(+), 4 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index 55f293d..322af5a 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -168,11 +168,16 @@ static ssize_t occ_read_common(struct occ_client *c=
lient, char __user *ubuf,
> =C2=A0{
> =C2=A0	int rc;
> =C2=A0	size_t bytes;
> -	struct occ_xfr *xfr =3D &client->xfr;
> +	struct occ_xfr *xfr;
> +
> +	if (!client)
> +		return -ENODEV;
> =C2=A0
> =C2=A0	if (len > OCC_SRAM_BYTES)
> =C2=A0		return -EINVAL;
> =C2=A0
> +	xfr =3D &client->xfr;
> +
> =C2=A0	spin_lock_irq(&client->lock);
> =C2=A0
> =C2=A0	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
> @@ -263,11 +268,16 @@ static ssize_t occ_write_common(struct occ_client *=
client,
> =C2=A0	int rc;
> =C2=A0	unsigned int i;
> =C2=A0	u16 data_length, checksum =3D 0;
> -	struct occ_xfr *xfr =3D &client->xfr;
> +	struct occ_xfr *xfr;
> +
> +	if (!client)
> +		return -ENODEV;
> =C2=A0
> =C2=A0	if (len > (OCC_CMD_DATA_BYTES + 3) || len < 3)
> =C2=A0		return -EINVAL;
> =C2=A0
> +	xfr =3D &client->xfr;
> +
> =C2=A0	spin_lock_irq(&client->lock);
> =C2=A0	if (test_and_set_bit(CLIENT_XFR_PENDING, &client->flags)) {
> =C2=A0		rc =3D -EBUSY;
> @@ -327,8 +337,14 @@ static ssize_t occ_write(struct file *file, const ch=
ar __user *buf,
> =C2=A0
> =C2=A0static int occ_release_common(struct occ_client *client)
> =C2=A0{
> -	struct occ_xfr *xfr =3D &client->xfr;
> -	struct occ *occ =3D client->occ;
> +	struct occ *occ;
> +	struct occ_xfr *xfr;
> +
> +	if (!client)
> +		return -ENODEV;
> +
> +	xfr =3D &client->xfr;
> +	occ =3D client->occ;
> =C2=A0
> =C2=A0	spin_lock_irq(&client->lock);
> =C2=A0
--=-rls692aI/dR323Gwhzkw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1uanAAoJEJ0dnzgO5LT5VsgP/RbY5I9f0rqv4Yo1L7Px6P8y
S9lHYZm/dGrBhpCu8WvVi2kMLo5MbyYwzkty7qZdNug5sWfpmqQpGWYRN/grtQ2Z
LWIWT1akxaCvePdbsrV8TIU9BcZblVIpjaA99mpf50TrznBoiShAiHkeXOqLqIH+
8e4EgicNrNOzgmfc+gVBz9X10zeqbOegrgW0oIQn0ajjRA2kF68lYO+rha3xegXg
q7RkSnDZfxxhNxmVcyOeksWFG39tqkdkMbJipJK8pFwyJHo2/pn5XXzkwx5oZ0U5
5mSnkE5wK+Bi8dNus+Wj9Oaqh5EbYfrvn6atIUf1JRrNHQlwM41jLMdSRV+RHEbO
6/k7uZI77VLVbfXBC+Uzeec9HMg6nixo2mCPJHzds4MLz/5XjVUBR048c4QQhKq/
7SsUx4/9n7ltnO/z40ExeiEfH9DcdRcvWipwpOyFGd0jFD+m9pr/Nd63oUcmi6pY
+fzk9Eq5TLx5A1zghUIQ/+44B+5Bcyo3qVpqsi9FfU6JeMCcgd/RkM5J7sKKYZvM
HeO9TjS6SsJbJTo6mhmCIgtm+I+xjiXaCWmvBKs0V3W8RWwM8oLq1V7GGvlGJ08x
85JAFYwSQau3C9g87WinfNWjMQcMKQFdKTuZ7IYxfxT/7y0HGXm+g/xXr3sjlhxE
RkGwvS1b4F0YWSwgM/rT
=VFsR
-----END PGP SIGNATURE-----

--=-rls692aI/dR323Gwhzkw--
