Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hPylXipU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TO2rn7qQ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7RMJ249VzDqG2
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 08:52:28 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3FC1620A64;
 Thu,  5 Oct 2017 17:52:26 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 17:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=5bHP99AmIMXi0ld8v34QNCWwraSVPqXxO8nI6Feyv
 54=; b=hPylXipU97F7ArLPObSITUutiaWUMPV/zAEOMQhQoAuyVprHE7JX0uXl5
 R1p1DWF4Q7cvhd6U75kSzBEKdjn5Q5qqYFxVYX8AASeAF3J36w/Cm9iOGffc52Fg
 AfmmG4IYYgGL9WeQiLDB3P2T+CjWc6k26+9AygTxZF4nWaJNrLtSYM993vZqUJkW
 6CiEfch6uCvU2hpgWYTkChMP5N0AJmHSuEvGVARlhYg4O6ulEqrFGeDo/T3vZ8wT
 7oSR8hcLn5y7OhMvgym+HjxbW80g8L1yE3218gFn6rd4g49CEiya34auj2+c0C1c
 Ws/OSdFbcdVHXJJ9VSqb1VNokquEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=5bHP99AmIMXi0ld8v3
 4QNCWwraSVPqXxO8nI6Feyv54=; b=TO2rn7qQFconnrCqEen8cDC2Z83AgIMNzk
 77UuUxJmBUcrhL5FJjWqZToxlK2cy4+k8yN/Y35p0bF2QXmSz9+vg/dyzl20irS8
 KE6qJFbzst7NK1ApWJAk9mv+LmXI28hKS+fXQWdnnupbmqBpr0vJQ1b5he6ij+n0
 impllfrfLYdPcGmlXaAtTuDySbCLbgHW2y7HoVaBGhp5TZjbGjeCfDRYHbYhuXkb
 Ea3nVaaI/aGeDjCBnCo7ek5g7jyStN41Oj7bKznsQ0RiLv0U+Q9UOJbAi/8esvS9
 1Dy31fIecjj1WZ9Rz0eGsOIp9Wb2qk/XQ5eZmWDu2/jRj49zfW0A==
X-ME-Sender: <xms:mqnWWY0hIqfwI4PDTAjK7blQKgzshWWIMscwhzSGOgifo-blIfgN5g>
X-Sasl-enc: J4R/OfLWOYkBU7l8//A+iGIiBKDTSciRU6ViwTE9vgqj 1507240345
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 79DDB24772;
 Thu,  5 Oct 2017 17:52:24 -0400 (EDT)
Message-ID: <1507240338.5452.82.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 07/31] drivers: fsi: sbefifo: Use goto
 to reduce put statements
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 08:22:18 +1030
In-Reply-To: <1507231464-13635-8-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-8-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-TzjeZuVxY5+0D0bRbcn3"
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
X-List-Received-Date: Thu, 05 Oct 2017 21:52:28 -0000


--=-TzjeZuVxY5+0D0bRbcn3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Use a goto in the read() and write() functions so that we can just have
> one get_client and put_client statement.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 35 ++++++++++++++++++-----------------
> =C2=A01 file changed, 18 insertions(+), 17 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 173cd03..a5bdc75 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -565,22 +565,21 @@ static ssize_t sbefifo_read_common(struct sbefifo_c=
lient *client,
> =C2=A0	if (wait_event_interruptible(sbefifo->wait,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sbefifo_read_ready(sbefifo, clien=
t, &n,
> =C2=A0							&ret))) {
> -		sbefifo_put_client(client);
> -		return -ERESTARTSYS;
> +		ret =3D -ERESTARTSYS;
> +		goto out;
> =C2=A0	}
> =C2=A0
> =C2=A0	if (ret) {
> =C2=A0		INIT_LIST_HEAD(&client->xfrs);
> -		sbefifo_put_client(client);
> -		return ret;
> +		goto out;
> =C2=A0	}
> =C2=A0
> =C2=A0	n =3D min_t(size_t, n, len);
> =C2=A0
> =C2=A0	if (ubuf) {
> =C2=A0		if (copy_to_user(ubuf, READ_ONCE(client->rbuf.rpos), n)) {
> -			sbefifo_put_client(client);
> -			return -EFAULT;
> +			ret =3D -EFAULT;
> +			goto out;
> =C2=A0		}
> =C2=A0	} else {
> =C2=A0		memcpy(kbuf, READ_ONCE(client->rbuf.rpos), n);
> @@ -592,8 +591,8 @@ static ssize_t sbefifo_read_common(struct sbefifo_cli=
ent *client,
> =C2=A0		if (!xfr) {
> =C2=A0			/* should be impossible to not have an xfr here */
> =C2=A0			WARN_ONCE(1, "no xfr in queue");
> -			sbefifo_put_client(client);
> -			return -EPROTO;
> +			ret =3D -EPROTO;
> +			goto out;
> =C2=A0		}
> =C2=A0
> =C2=A0		if (!test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
> @@ -610,9 +609,11 @@ static ssize_t sbefifo_read_common(struct sbefifo_cl=
ient *client,
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	sbefifo_put_client(client);
> +	ret =3D n;
> =C2=A0
> -	return n;
> +out:
> +	sbefifo_put_client(client);
> +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0static ssize_t sbefifo_read(struct file *file, char __user *buf, si=
ze_t len,
> @@ -689,14 +690,14 @@ static ssize_t sbefifo_write_common(struct sbefifo_=
client *client,
> =C2=A0			if (mod_timer(&sbefifo->poll_timer, jiffies))
> =C2=A0				sbefifo_put(sbefifo);
> =C2=A0
> -			sbefifo_put_client(client);
> -			return -ERESTARTSYS;
> +			ret =3D -ERESTARTSYS;
> +			goto out;
> =C2=A0		}
> =C2=A0
> =C2=A0		if (sbefifo->rc) {
> =C2=A0			INIT_LIST_HEAD(&client->xfrs);
> -			sbefifo_put_client(client);
> -			return sbefifo->rc;
> +			ret =3D sbefifo->rc;
> +			goto out;
> =C2=A0		}
> =C2=A0
> =C2=A0		n =3D min_t(size_t, n, len);
> @@ -708,8 +709,8 @@ static ssize_t sbefifo_write_common(struct sbefifo_cl=
ient *client,
> =C2=A0				sbefifo_get(sbefifo);
> =C2=A0				if (mod_timer(&sbefifo->poll_timer, jiffies))
> =C2=A0					sbefifo_put(sbefifo);
> -				sbefifo_put_client(client);
> -				return -EFAULT;
> +				ret =3D -EFAULT;
> +				goto out;
> =C2=A0			}
> =C2=A0
> =C2=A0			ubuf +=3D n;
> @@ -736,8 +737,8 @@ static ssize_t sbefifo_write_common(struct sbefifo_cl=
ient *client,
> =C2=A0			sbefifo_put(sbefifo);
> =C2=A0	}
> =C2=A0
> +out:
> =C2=A0	sbefifo_put_client(client);
> -
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
--=-TzjeZuVxY5+0D0bRbcn3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1qmTAAoJEJ0dnzgO5LT5n84P/0HZA4r3hJTBtcIDwxuLzHBW
/MDUTJ2TUdEQBlCSDDmEFi4ECUgXfd+mcMlpWvDrv9VPKIgSyCfnXR1/dcj0x0db
YJBiw/CWsaW5YZgx/Rr353XQCvhLPRezpnVV0Z5fHUU8EiNy17VH2JdJhuGJdnZk
ewGqCmYaRidrURBREfHyZhDQv75Plhx70Lp3jbcGC+kVfmVJ5NJX9m3KdYVVgZdE
+8to9eDI1c5Pe8N/xjC/pBBH65XrwxslAdAKRyxtt3QgnrvKu03t2gG82oOaeQSS
QJ/PonoFKYDaI0SUoPM76PFEdrjgN7OW94xTCMcZOFYplPOq5vSLyKADbThXIkiB
7Ld6+V19SoGaUXqny992IC35anTfWny+gT8/hVU8zaprx+lXBLgWBG9Z7wKaC+PZ
i0aws4CAh0/8OC2fiiDpAhN/hf94316bUXUlTOAlgsLGiBUmvgbVl/7GRWtucMEJ
i1hq0b2MSzu/5u2XaxwAe4tfOLu+TFOJe74/H30XDDLr6+EjtZ5HcBEitl2/1QYB
ugKbPswdxJ/8Vqk6ThFVESv/qoaP2uVvBrk5Ew/JejNl8IlWgOXYOMKlvVqNtEDa
j3Ldjpx4kqrIkUKqQ8PDNzSDW0iL/WgYCmABb9KkiINESdHVlQ0OihC+e7v479Sl
anLJUa/6lAYxm7MeAS3v
=em7G
-----END PGP SIGNATURE-----

--=-TzjeZuVxY5+0D0bRbcn3--
