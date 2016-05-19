Return-Path: <andrew@aj.id.au>
Received: from homiemail-a19.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9H6X1kt8zDqfr
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 13:46:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=RFXxMfPQ; 
 dkim-atps=neutral
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id 26567604069;
 Wed, 18 May 2016 20:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=iE5I8usUMRrspIM5lDl7j
 B5sXGA=; b=RFXxMfPQ1pIvXQETnpmtCYfkaFeD7jigUxYDiVa/u7IgHWIMkip6o
 20jrTxCNbkiNyqvS6Ati2cYHlC2685kvxB0TUjEgcFiduWctxkWnSRFpp6ZVfMJL
 8fo33YoglQarcMGxtwQgCHf9kSrsTaYG2HUXq7Uc85j0UhnhIzrHY0=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id 95622604061;
 Wed, 18 May 2016 20:46:08 -0700 (PDT)
Message-ID: <1463629553.2703.142.camel@aj.id.au>
Subject: Re: [PATCH btbridge v4 2/6] Increase debugging output when
 receiving a response to message from dbus
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Date: Thu, 19 May 2016 13:15:53 +0930
In-Reply-To: <1462324208-11150-3-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462324208-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462324208-11150-3-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-mdrsS+8DLbOqv1skDOes"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2016 03:46:12 -0000


--=-mdrsS+8DLbOqv1skDOes
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-05-03 at 20:10 -0500, OpenBMC Patches wrote:
> From: Cyril Bur <cyril.bur@au1.ibm.com>
>=20
> Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0btbridged.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/btbridged.c b/btbridged.c
> index 3e261a9..be25eb9 100644
> --- a/btbridged.c
> +++ b/btbridged.c
> @@ -317,6 +317,8 @@ static int method_send_message(sd_bus_message
> *msg, void *userdata, sd_bus_error
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0	MSG_OUT("Received a dbus response for msg with seq
> 0x%02x\n", seq);
> +	MSG_OUT("(netfn 0x%02x lun 0x%02x cmd 0x%02x cc 0x%02x with
> data of size %lu)\n",
> +			netfn, lun, cmd, cc, data_sz);
> =C2=A0	bt_msg->call =3D sd_bus_message_ref(msg);
> =C2=A0	bt_msg->rsp.netfn =3D netfn;
> =C2=A0	bt_msg->rsp.lun =3D lun;
--=-mdrsS+8DLbOqv1skDOes
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXPTbxAAoJEJ0dnzgO5LT5z7kP+gJrQCgY+xPyCdw6epDqT6bo
Hab3u8zB1WWAgHX3nmqrX1S87zk7okBSB0/R7Dp302NFV8AAzM/N7SkJpblGzCoz
NtsOUvMbe7syZ6weKvF/GxsTa/rVlZdMXygI6daohI8TexHHk3BQgYBLJWnZeLrs
o5I78fXj5D5WzZwBIbCZw8/kYKbwru7eQILuDdw0UlsJfJxX0tjs2zcU7Mf/mywV
3EdzCAcUL757srPZT3pi7dLtO2rRvViwazXUk0jllKOWzykltnygqgPQspbhr93X
25vCupHu8FY8FLKYLL5T+MttmIPOEQiuy1jfJ0vDEeuLCcTFQUwrVpbwc2kgir0r
SJFu91fclgco6N2x6H0ZiI0hH3WIkkRzS9JnNAo12/HU4d/rA4nDJIycxXT69CFU
S710ufHUj0BouZH/VbSaA0VUYUmNUYRhAaysuvaO9yfxDEuIZNneOmmqphw3igIJ
+vaa7yiKLlZFPzcGVmsEe8v0x0DgpUNYE3gr6hjmfJxJdlu01wETsSlLgTE6D5UA
F1G4w8GuQFZfgW7bQbmT+zIm9DAmB2B/17gUA9kH+OwV3aeXE7WR6i8Mo+99V2ht
iqGmEB79V/inGot9+1pWt0ZQKpxnsw4Gvc/duTZsOYjwQ7B4LFZEnAQGPjI4yxRD
G2V9LkqC4xNIGh/Rlsfr
=Qz+U
-----END PGP SIGNATURE-----

--=-mdrsS+8DLbOqv1skDOes--
