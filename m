Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XOGi1tsg"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="q0I+bfpr"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7RDH5bnkzDqp5
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 08:46:23 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id ACE2320F54;
 Thu,  5 Oct 2017 17:46:21 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 17:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=2sNdqBhM/+HeJGo3eXZBJ1T8WvbaGsVxsK+a39/aL
 1Y=; b=XOGi1tsgYK0oXC6KV5/etfaXOpo7zfNwt5PUllxCMHVka3ZZmxhkPZjPy
 I9NGyDBxsTrqKJCBiauPCN1k0PO9iAi0o40zJ+lisFVGWhuPPY/c6X+O8kjZ7Fqm
 O1VTVWYttqOhwBrSLPjdFxLLkoVWU7wKnQ4cswOeo+FD4LwHeGNyt7KIhGNasqy/
 iseoSIIpCWuvftiXX96telYVZfi63Fne0Jijx+MedR9UcA37mu8Wi1s3tFywTYZr
 2WubNt/wmI7j9nbC8iXWtMNuCzdI91S0zZhR3uwjf8uZcymlMN36BXWu9N26Wv2c
 uQJ5z+H1sED/ikCvi1W/bRYgqk4nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=2sNdqBhM/+HeJGo3eX
 ZBJ1T8WvbaGsVxsK+a39/aL1Y=; b=q0I+bfprYxd4Mjc4e/TVR12s/MY7amwvgo
 03B20gXPeh7l2qxLbQUT4SVVdclzy1dKMk1RqwGzY6UTZi7xRKDA5jY2WHB4Hnkn
 45oJSH6OUS80yTaqOE673vCVMpQ/95dW7+zSkJUUpjGGNULi47aVyKvw+KFqcci1
 rW2V02qiwJVyIdRe3RUW10wcSgI1usM8ig40Kmhng6MRr1suLx5uQNm7Ppe6EoJ1
 9Z932H7/XYk2CKJvMcfGZvm3mgvNJppLzI/oBi99LqqLbn94cRqQ1P7ePgBN7r5g
 j2SJ43j6yZ2fWbJnToAm7pxNS7dONp1PUZcaPOSxEZ5fQ/wYZmJg==
X-ME-Sender: <xms:LajWWamVYBt-0_H8udZXttuyPwU2M4whxwqQWrQT1bcdy43oeq8Vyg>
X-Sasl-enc: y+qWLb5RP4rPqRG7mWou0xE3YIOI0yFooOrR6QvhI9PU 1507239981
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id F17ED242CF;
 Thu,  5 Oct 2017 17:46:19 -0400 (EDT)
Message-ID: <1507239976.5452.78.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 05/31] drivers: fsi: sbefifo: replace
 awkward wait_event expression
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 08:16:16 +1030
In-Reply-To: <1507231464-13635-6-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-6-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ZPe1RzeHj5FG8FCxPziR"
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
X-List-Received-Date: Thu, 05 Oct 2017 21:46:24 -0000


--=-ZPe1RzeHj5FG8FCxPziR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:23 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Use ready() functions to replace awkward boolean expressions in the
> wait_event_interruptible calls.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 32 +++++++++++++++++++++++++-------
> =C2=A01 file changed, 25 insertions(+), 7 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 561a7f6..dbac0c3 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -545,6 +545,16 @@ static unsigned int sbefifo_poll(struct file
*file, poll_table *wait)
> =C2=A0	return mask;
> =C2=A0}
> =C2=A0
> +static bool sbefifo_read_ready(struct sbefifo *sbefifo,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sbefifo_client *clie=
nt, size_t
*n,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0size_t *ret)
> +{
> +	*n =3D sbefifo_buf_nbreadable(&client->rbuf);
> +	*ret =3D READ_ONCE(sbefifo->rc);
> +
> +	return *ret || *n;
> +}
> +
> =C2=A0static ssize_t sbefifo_read_common(struct sbefifo_client *client,
> =C2=A0				=C2=A0=C2=A0=C2=A0char __user *ubuf, char *kbuf,
size_t len)
> =C2=A0{
> @@ -561,9 +571,8 @@ static ssize_t sbefifo_read_common(struct
sbefifo_client *client,
> =C2=A0
> =C2=A0	sbefifo_get_client(client);
> =C2=A0	if (wait_event_interruptible(sbefifo->wait,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(ret =3D READ_ONCE(sbefifo->rc))
||
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(n =3D sbefifo_buf_nbreadable(
> -					&client->rbuf)))) {
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sbefifo_read_ready(sbefifo,
client, &n,
> +							&ret))) {
> =C2=A0		sbefifo_put_client(client);
> =C2=A0		return -ERESTARTSYS;
> =C2=A0	}
> @@ -619,6 +628,16 @@ static ssize_t sbefifo_read(struct file *file,
char __user *buf, size_t len,
> =C2=A0	return sbefifo_read_common(client, buf, NULL, len);
> =C2=A0}
> =C2=A0
> +static bool sbefifo_write_ready(struct sbefifo *sbefifo,
> +				struct sbefifo_xfr *xfr,
> +				struct sbefifo_client *client,
size_t *n)
> +{
> +	struct sbefifo_xfr *next =3D sbefifo_client_next_xfr(client);
> +
> +	*n =3D sbefifo_buf_nbwriteable(&client->wbuf);
> +	return READ_ONCE(sbefifo->rc) || (next =3D=3D xfr && *n);
> +}
> +
> =C2=A0static ssize_t sbefifo_write_common(struct sbefifo_client *client,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0const char __user *ubuf, const
char *kbuf,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0size_t len)
> @@ -660,10 +679,9 @@ static ssize_t sbefifo_write_common(struct
sbefifo_client *client,
> =C2=A0	=C2=A0*/
> =C2=A0	while (len) {
> =C2=A0		if (wait_event_interruptible(sbefifo->wait,
> -				READ_ONCE(sbefifo->rc) ||
> -				(sbefifo_client_next_xfr(client) =3D=3D
xfr &&
> -				=C2=A0(n =3D sbefifo_buf_nbwriteable(
> -							&client-
>wbuf))))) {
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sbefifo_write_ready(sbe
fifo, xfr,
> +								=C2=A0cli
ent,
> +								=C2=A0&n)
)) {
> =C2=A0			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
> =C2=A0			sbefifo_get(sbefifo);
> =C2=A0			if (mod_timer(&sbefifo->poll_timer,
jiffies))
--=-ZPe1RzeHj5FG8FCxPziR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1qgpAAoJEJ0dnzgO5LT5ORMQAKHYFCjPBY1QmCgIRz1E7VMR
9O4l+7wuCWNXo98BJsdqyqWEdyBJ0h1QPCM7F1fMZ/ZWvFEtKo0s5nY+4Kt3eVA5
czRKuB7H5plnFoFX3zNcp/DwF6VTvVP06rS+BTE3HO/dNB3Ps1/1ldaaqe1pmhES
94OA/bWDmWvn3F0reMWg4qolPDoRTAchlERrjfFb5NiESr4DSxLd+n+YeR0uL764
bpxHQjlzk3kBr4SgyZ6xTO6FIK+Zs9wgrcRCtw4SeObLjDXYmDYdNerPV6kStDZA
DpybXIIj5H600okH4RisvXF/EP1qiMST0b1cGJ+T6kP04KhQf2vxt7wx5ukZHzQU
gqhTSYPLNu4VsocRAPH1ZJ/L6uC0DiJfqlAsjpnqvsbkToEf+98O/Y2+/0u7KwRq
GCKvphvwo5cM1NYrjz3fmUJcfb4W815hjk72GCYDZtgQE6S9FWL0GAyU9BDRgpjn
2uncr/sUkAAqyRPQfNMKcIWmYbtPH4Ud/Q1I/7mZOx42XBMKyUa9IofHoY2+26Nh
uZaGkwxKV+Pa8+FEalIG2daXs8RunsMtggpukFLHasYg1zM7jZuB4Z1NHCvcEfF7
sVWtfdc9HMLcBzrRvjEtWhkdqXEntd8hbc4FMFVZGD4NhyEGxW+NWuP0I6gXKwZo
oq+EM8m3VxTYKcsAYFzt
=ec+u
-----END PGP SIGNATURE-----

--=-ZPe1RzeHj5FG8FCxPziR--
