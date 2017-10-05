Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="A45ktYK/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YC99buH6"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Qwm6nTTzDqJ7
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 08:32:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 25D2F20D69;
 Thu,  5 Oct 2017 17:32:54 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 17:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=hUjFY3Wt2iWTMIveDmqZcAzYzLKI9JRudhz5r9a9o
 T8=; b=A45ktYK/AXeUK2QIbD/c8mVxU665XmSl1AuVWeVkrNRipgIQWQoT1vmzC
 FiOLx4Q3rcRH40iJwDgrfooO9FpQJkP9e/MOGCUuEpoXae41F+uuu2orpShHdk+p
 s8yXiROlUkqEOfrbKUIY2rMXoZ/wUO3o/DHPh8Sx0UQAov8TPXFXpz3Rr2EXewWB
 i/tudBbhyr3DexnyNa0xRKldDPpDTfSQiTfZhzBx1laxWaY8NDL1n3kySw36KF6x
 +hDDtgj0e+HqM7+hfexuVs5lZUFVvVNHBNr+b95MtFknfb3rvv/MBVbv1dgnOI34
 l09ICt6OJxMM6aYqK/ZOI9hFitGyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=hUjFY3Wt2iWTMIveDm
 qZcAzYzLKI9JRudhz5r9a9oT8=; b=YC99buH66ftGG8lLiX5B6Pj45XHkv0+KJe
 GUKnQwPX9xSHszWUUPpQBxDW954t87s0vW4xl/g7OifU7S+8uPeOZHCB8eHvEQ0K
 fPeONWwRbxU57pLJUM6jLZRraMEYpyucRrYSDINr1YOoYEPYUOGiFn8HRbYuBFjj
 ai555PbJYWviC/YI1Hu2kabgEfEp85UO11WaiYF7k7NmSnP2t1y8djsfX048bjcR
 Co1IBr+PJNWIdSyQdcumFb0NNZ1oj+6lMCb1T9SYPh7zR6P4574Tw+Hb3Z5KDpx2
 MxVbKC8Rwk5+vbjQPPrqloOFGBh8O0fuJLXCKMqAQ731j5/tFCaQ==
X-ME-Sender: <xms:BqXWWal1qOJNt0dIPaqt5I9l17TQ51iLyTuNG0eUHqnEo4gjpikz5g>
X-Sasl-enc: Jgn6yYbxPRV0R5sj5H4XqWq/fbRvIi9b6syJsbB7zWGq 1507239173
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 651C324969;
 Thu,  5 Oct 2017 17:32:52 -0400 (EDT)
Message-ID: <1507239169.5452.74.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 02/31] drivers: fsi: sbefifo: Use a
 defined reschedule length
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 08:02:49 +1030
In-Reply-To: <1507231464-13635-3-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-3-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-DtR7GDJDMATh6fMLJDFv"
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
X-List-Received-Date: Thu, 05 Oct 2017 21:32:57 -0000


--=-DtR7GDJDMATh6fMLJDFv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:23 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Switch to a #defined reschedule period instead of using 500 ms twice.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 6fa75a8..2e45a75 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -51,6 +51,8 @@
> =C2=A0#define=C2=A0=C2=A0=C2=A0SBEFIFO_EOT_MAGIC		0xffffffff
> =C2=A0#define SBEFIFO_EOT_ACK		0x14
> =C2=A0
> +#define SBEFIFO_RESCHEDULE	msecs_to_jiffies(500)
> +
> =C2=A0struct sbefifo {
> =C2=A0	struct timer_list poll_timer;
> =C2=A0	struct fsi_device *fsi_dev;
> @@ -404,7 +406,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0		if (devn =3D=3D 0) {
> =C2=A0			/* No open slot for write.=C2=A0=C2=A0Reschedule. */
> =C2=A0			sbefifo->poll_timer.expires =3D jiffies +
> -				msecs_to_jiffies(500);
> +				SBEFIFO_RESCHEDULE;
> =C2=A0			add_timer(&sbefifo->poll_timer);
> =C2=A0			goto out_unlock;
> =C2=A0		}
> @@ -445,7 +447,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0		if (devn =3D=3D 0) {
> =C2=A0			/* No data yet.=C2=A0=C2=A0Reschedule. */
> =C2=A0			sbefifo->poll_timer.expires =3D jiffies +
> -				msecs_to_jiffies(500);
> +				SBEFIFO_RESCHEDULE;
> =C2=A0			add_timer(&sbefifo->poll_timer);
> =C2=A0			goto out_unlock;
> =C2=A0		}
--=-DtR7GDJDMATh6fMLJDFv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1qUBAAoJEJ0dnzgO5LT5zAIQAKMr5Xvsc6N93MNGv/jmqe3u
FxC5ZdaFW08/IShjeCsG+njc/G/8gpKcGIt6OiJLPLvdk+wiZDHoQ1oaQB8s7dxV
u1bD50NM1NWhjNfIf6glqd53VKvuTzw7jUTQ1dCFqiSDXB94OpzGp5RPoaDyrZgR
12uGHARaMLhskqixCcWBqVUqp12H3M2EwID5VLNmY4/gqI2RpfhSsKLfUSqBbqjG
/5gX1CVwhisH9KMEvufqrVKlSaCoHeHjkl/ZSKaPMRkhpp3YjNLASHmVJ/lsK0I7
7mPy0xwiOt3mWQ7FA+5Wdbx55JEt2m1jRHdtkClioCuEfennDvSUWKN2AkzXruue
sf36Uf9vZjKRkscvsDt6y4VrxxbGyguKYhtYF1k7p7vAwOwC98ZatqqL3b3fKki9
JeRoAprnN0P/62BNGogt9okWTzLWpmenZVTtmelKPmnimnGDCyDXeCjA+bx7vdau
vjY/YW6/naal7kAyYouliYPVBsWVsWNrqQEqWT8N0jyfNFXRF5sRTvts4+UwW9eW
8Qsss8D8lszwidNxdcMkKm0WHiqnBbnnitKc/NESTsVt7hBFYhCK0wKZAgP8U5u6
ruUpZXvtiIKH78XCSIMowlULRjmPPgfLqs4vonGS3m5+Hq4IfLcEFor01iAKlw6e
c7q8I3/26XQpPwzwZqEw
=mHKw
-----END PGP SIGNATURE-----

--=-DtR7GDJDMATh6fMLJDFv--
