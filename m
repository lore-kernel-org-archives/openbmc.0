Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qEYUb6yB"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CXuzNyKH"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7T7B1zbXzDqhf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 10:12:06 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2C31120A41;
 Thu,  5 Oct 2017 19:12:04 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 19:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=utudVYK7WcCBJ7cwTjG8zxB+8hXeGBDVEycO07Rvd
 EY=; b=qEYUb6yB4UxM/kO7s1E2a+8s/1XW7KdIXGSrujepgAuVy7iKHvC2NEEWS
 T7BTbC+p6hi/wj08yOLDOhfl0/VsEY0wTOQZQQ9CpPdKZuPH9JSD7YQ9UQc6qfky
 kXqE+p3z0ecIOFkMEcYknUw0pwIJmtnDl2wpRey6mGKWwQdxW8CY39Q9obgHwCAY
 ZNtKJ413vQ3d+PKkbSl/oumkor6bBvixO6owT6+Cp1K3DgMBYzB0lDuJb7z+s9Eq
 2n6cAhXuHLJtMF0NsccjQ0Z89PPaWHGcb6K7UNXhZk6ipkEovcsqf1XyBZyAb38J
 IkfyuLM/N976nf7WHO7sK2mZpU7qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=utudVYK7WcCBJ7cwTj
 G8zxB+8hXeGBDVEycO07RvdEY=; b=CXuzNyKHqhEsXuZSmCrGSOQhg2k/gPTodF
 IHC0/6nVtxMWEPsH61odw2IctNojmP+A59wms8Q/2q5KakGy5CXsLvQORwd0ZCjT
 27N91a+fe+cdR5ZF/UzGVKvlSZ3wKmwGwAvrRJJ49WYmHGxgrZeadRIpF8g29BvB
 +YHl8lDgjSbey7Q+d+rs2yTdD0J2sG5c6hc03/niTd0ji8bBW70Z1d+3meH8exUu
 POScg8fUIpOCaUdor/bbEJCvb3xHQZXHnEgO4SXlvzUfEvSdEmeDb3ns/BRe4QWV
 RtTaaOZlHhLFWnkTygELQuafa/BzIbMe9ZHJgzrpgk9XAhGkHwQg==
X-ME-Sender: <xms:RLzWWcxagPvvKOU7MZ39EebPz8hjVbAPjbJDj0xVO-iqdwonnGNQ6A>
X-Sasl-enc: jKhdJKLOPybomdYLXrSHHyikBZrA+8oegdKIzuJypdva 1507245123
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 352D87F9D2;
 Thu,  5 Oct 2017 19:12:01 -0400 (EDT)
Message-ID: <1507245118.5452.107.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 22/31] drivers: fsi: occ: fix white
 space and bracket problems
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 09:41:58 +1030
In-Reply-To: <1507231464-13635-23-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-23-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-5JLPC7YVABbfXxCQZho8"
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
X-List-Received-Date: Thu, 05 Oct 2017 23:12:06 -0000


--=-5JLPC7YVABbfXxCQZho8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> For better flow and to meet Linux standards.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/fsi/occ.c | 25 +++++++++++++++----------
> =C2=A01 file changed, 15 insertions(+), 10 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index 4e677c6..f27345c 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -132,9 +132,8 @@ static void occ_enqueue_xfr(struct occ_xfr *xfr)
> =C2=A0
> =C2=A0static struct occ_client *occ_open_common(struct occ *occ, unsigned=
 long flags)
> =C2=A0{
> -	struct occ_client *client;
> +	struct occ_client *client =3D kzalloc(sizeof(*client), GFP_KERNEL);
> =C2=A0
> -	client =3D kzalloc(sizeof(*client), GFP_KERNEL);
> =C2=A0	if (!client)
> =C2=A0		return NULL;
> =C2=A0
> @@ -180,8 +179,9 @@ static ssize_t occ_read_common(struct occ_client *cli=
ent, char __user *ubuf,
> =C2=A0		if (client->read_offset) {
> =C2=A0			rc =3D 0;
> =C2=A0			client->read_offset =3D 0;
> -		} else
> +		} else {
> =C2=A0			rc =3D -ENOMSG;
> +		}
> =C2=A0
> =C2=A0		goto done;
> =C2=A0	}
> @@ -197,8 +197,10 @@ static ssize_t occ_read_common(struct occ_client *cl=
ient, char __user *ubuf,
> =C2=A0		spin_unlock_irq(&client->lock);
> =C2=A0
> =C2=A0		rc =3D wait_event_interruptible(client->wait,
> -			test_bit(XFR_COMPLETE, &xfr->flags) ||
> -			test_bit(XFR_CANCELED, &xfr->flags));
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0test_bit(XFR_COMPLETE,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&xfr->flags) ||
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0test_bit(XFR_CANCELED,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&xfr->flags));

This looks worse. Maybe it's worth pulling the condition out into a helper
function?

> =C2=A0
> =C2=A0		spin_lock_irq(&client->lock);
> =C2=A0
> @@ -222,12 +224,14 @@ static ssize_t occ_read_common(struct occ_client *c=
lient, char __user *ubuf,
> =C2=A0
> =C2=A0	bytes =3D min(len, xfr->resp_data_length - client->read_offset);
> =C2=A0	if (ubuf) {
> -		if (copy_to_user(ubuf, &xfr->buf[client->read_offset], bytes)) {
> +		if (copy_to_user(ubuf, &xfr->buf[client->read_offset],
> +				=C2=A0bytes)) {
> =C2=A0			rc =3D -EFAULT;
> =C2=A0			goto done;
> =C2=A0		}
> -	} else
> +	} else {
> =C2=A0		memcpy(kbuf, &xfr->buf[client->read_offset], bytes);
> +	}
> =C2=A0
> =C2=A0	client->read_offset +=3D bytes;
> =C2=A0
> @@ -263,6 +267,7 @@ static ssize_t occ_write_common(struct occ_client *cl=
ient,
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	spin_lock_irq(&client->lock);
> +
> =C2=A0	if (test_and_set_bit(CLIENT_XFR_PENDING, &client->flags)) {
> =C2=A0		rc =3D -EBUSY;
> =C2=A0		goto done;
> @@ -270,7 +275,6 @@ static ssize_t occ_write_common(struct occ_client *cl=
ient,
> =C2=A0
> =C2=A0	/* clear out the transfer */
> =C2=A0	memset(xfr, 0, sizeof(*xfr));
> -
> =C2=A0	xfr->buf[0] =3D 1;
> =C2=A0
> =C2=A0	if (ubuf) {
> @@ -278,8 +282,9 @@ static ssize_t occ_write_common(struct occ_client *cl=
ient,
> =C2=A0			rc =3D -EFAULT;
> =C2=A0			goto done;
> =C2=A0		}
> -	} else
> +	} else {
> =C2=A0		memcpy(&xfr->buf[1], kbuf, len);
> +	}
> =C2=A0
> =C2=A0	data_length =3D (xfr->buf[2] << 8) + xfr->buf[3];
> =C2=A0	if (data_length > OCC_CMD_DATA_BYTES) {
> @@ -430,7 +435,7 @@ static int occ_getsram(struct device *sbefifo, u32 ad=
dress, u8 *data,
> =C2=A0	rc =3D occ_write_sbefifo(client, (const char *)buf, sizeof(buf));
> =C2=A0	if (rc)
> =C2=A0		goto done;
> -=09
> +
> =C2=A0	resp =3D kzalloc(data_len, GFP_KERNEL);
> =C2=A0	if (!resp) {
> =C2=A0		rc =3D -ENOMEM;
--=-5JLPC7YVABbfXxCQZho8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1rw+AAoJEJ0dnzgO5LT5fhUP/2B5489pNYCinOG3RBuo5tRi
IIFKgKDVIPKVRu2Zc2b9mnHb+TOrIyub0scLvdbtrwra6M+FkTSvQhcOtkc9h2C3
wx5KNJfcHH+ruUUfybbmFl6BN0LrQk/jGwXfMgHoG8Ny/6QT2IK3XbPb2Qea0D3e
xPRoS1vUZ/hup48eAZsSjdq/+OlegF2Ou9ZT5xjK3O75OPQGLp9hG937bosLIO0l
PpcNGvkymgZYCLy2QDbgwqDZrs3ze+xbV3LDemjReM9mMFm0fSJPf5UNSyOULaJs
2D1Sr6buLQ88RDvOXEeetWMFoWE1LHNw8xRZkPEh2onjOhJ4plkDpxGyv/fZ4kbr
1Vy50cbtLy5YTEEsjzaw+Ol/pFnSEQmHOXzR0ItKGOnWNGtoId3HAHYjR4C9+bZn
os9XW8ms4Z47+9WwWlS6k90WXDbI/XzYeKEZK5OoAVNHE1HmsIZ9LR7om0NjPbGO
4DFGTj10RrnD6caY76ZffSpLWfMkA3mdrXGPRVI3aRPdKWQ3bNmKusVWxeUSUgxZ
ZkXpQNdc3utdevfI+pqw7UGGZpIaB29Zsi7+JX3lvAykNvfNhcpLqNv9HUs/erK9
oskbYyW2oYONKTYAfc6Sr96I/UhPD3PCrOQz2R2oHa8HR5kFKyJTIJRrzJ+UGaux
KAjIvA9yqr4Gcj4ndbjF
=cVxB
-----END PGP SIGNATURE-----

--=-5JLPC7YVABbfXxCQZho8--
