Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Jv8slsrP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="b96ATZJc"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6vt51rfkzDqpx
 for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2017 12:13:49 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A22420D7A;
 Wed,  4 Oct 2017 21:13:47 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 04 Oct 2017 21:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=xL0m4+qDOonFpTgzsf167YeKy/7F2Gx6h3/DkTZhh
 Us=; b=Jv8slsrP6A3+9Zf7wX9INxMMYX5TZr9kl/ENUBrtPC7NUU9bcEsj/Yr4E
 jS+zZoBBDi/lZ1uCZgYqTsoDYuigDZoeLhLwi2XptZ2GuqoZYpLzI6n5VXf+9oTw
 UC+Ve+gHDU+UBGPZhz8gWYY3ETE5oYw3o3q3Hl6V/pS359xdFeL73oKfiegO2y3n
 0P1NfwQTRxGnooCQM7RzGkgVtRLi754p38i3Yh56nSgK7sKh2g8gNFc932AlgYe8
 fICGC+LyqU0/zLzXbREpn/SsqcgrlH6/s8+p/xsH+lrSHQKHxkH4OZuvkTSGeRTi
 Oymx20TAn7efdhVtWQwqQx2IblERg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=xL0m4+qDOonFpTgzsf
 167YeKy/7F2Gx6h3/DkTZhhUs=; b=b96ATZJcGNkRXNHUZjNVH5NAVw6AJ2Ix7b
 42Iy6SEYNjBgWRrlxGJvjDnb8M+LwN1pvpZe2z1R9FAHZsqpuSM0Fn+S2BLmdY5V
 9aBq07UCUmayeZoe3TIizq79xJzCvI0d++7fLs1WZcFV2o8oA5yEgauOi5PXyXjp
 iS9IxUgMC2h9u1XcyS455g/7tcst3zxBHjJMNMQMozF6sntYdxnUxj1KWz/hckLu
 be0AoqxPAby1X4VWm1KNI5qFaAvC5zubaLpckJHZYy45gdBmjQfcQPEjOBCg2eDv
 Sl4rBPTAC/3HsU8Mb7Dk8xTnBbkGCyYTfe4mpMaPqkkCYp02RcIA==
X-ME-Sender: <xms:S4fVWTHGFVunuZIy9iu1cv70HMhmW7BnsOzn0vZ6d9pYrH34s8YRWQ>
X-Sasl-enc: a2ywz3Zh9H4Y6bPwTHb+azNujkreiM7epzPe/vcGMmsh 1507166026
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0AB8F241D9;
 Wed,  4 Oct 2017 21:13:44 -0400 (EDT)
Message-ID: <1507166021.5452.52.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2 8/9] drivers/hwmon/occ: Remove
 repeated ops for OCC command in progress
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Thu, 05 Oct 2017 11:43:41 +1030
In-Reply-To: <1506724868-13010-9-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506724868-13010-9-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Ddc0KmPfMOU8crVC1CXU"
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
X-List-Received-Date: Thu, 05 Oct 2017 01:13:49 -0000


--=-Ddc0KmPfMOU8crVC1CXU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-09-29 at 17:41 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=20
> This is now handled in the occ driver.
>=20
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/hwmon/occ/p9_sbe.c | 14 +-------------
> =C2=A01 file changed, 1 insertion(+), 13 deletions(-)
>=20
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index 2d50a94..c7e0d9c 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -26,14 +26,10 @@ struct p9_sbe_occ {
> =C2=A0static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
> =C2=A0{
> =C2=A0	int rc, error;
> -	unsigned long start;
> =C2=A0	struct occ_client *client;
> =C2=A0	struct occ_response *resp =3D &occ->resp;
> =C2=A0	struct p9_sbe_occ *p9_sbe_occ =3D to_p9_sbe_occ(occ);
> =C2=A0
> -	start =3D jiffies;
> -
> -retry:
> =C2=A0	client =3D occ_drv_open(p9_sbe_occ->sbe, 0);
> =C2=A0	if (!client) {
> =C2=A0		rc =3D -ENODEV;
> @@ -52,15 +48,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8
> *cmd)
> =C2=A0
> =C2=A0	switch (resp->return_status) {
> =C2=A0	case RESP_RETURN_CMD_IN_PRG:
> -		if (time_after(jiffies,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0start +
> msecs_to_jiffies(OCC_TIMEOUT_MS)))
> -			rc =3D -EALREADY;
> -		else {
> -			set_current_state(TASK_INTERRUPTIBLE);
> -			schedule_timeout(msecs_to_jiffies(OCC_CMD_IN
> _PRG_MS));
> -
> -			goto retry;
> -		}
> +		rc =3D -ETIMEDOUT;
> =C2=A0		break;
> =C2=A0	case RESP_RETURN_SUCCESS:
> =C2=A0		occ_reset_error(occ);
--=-Ddc0KmPfMOU8crVC1CXU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1YdFAAoJEJ0dnzgO5LT5pM4P/ijGoFpkRw7rJ1LAh1VVO819
kqKHvv0ub9EFiL60sVn7V5I1uh3P0ZkYsZLoaRpDX4C2mnSO/Meqw4iof6CbADak
HLDK4PaxO0zDYv6gGYwgNvZxlv773+CeyePBzBRfCOvN0uV7SUrcjYw5oZTTntEk
u1VlthkRNQslkt+XEGmTxRTFfoRQ72O/tldCvSC9Dnujfc+/3cg5JwZmQ6GM3Z/3
IVpMqP2yCN2ZwzBwSQZGRbqDUYnPno2eQ/NBBJbc6d+/d0UCHrg6bFomvdn+gp2m
SRc1Djt0cyf9C2bkNklhGkhogbGK6epfAdjLgMkLi8oo4sKu/Hex9o9KDOqCWmKj
x07Jmb80Qt3vwH8RXC16CiP5XGKIcCY36WGTycbjyXdNH5YDYrSZ9uQ+a/AodAmF
4N84Da+Oh94047sZceCY+2Q3TDyOnTFMAuepQQDbnU7pLTxIDwLqxhwBJ/KPwJg6
JQrwrjm7uu2y7qEpknAVl92j8ZdKn8hLKAQom3eLzC9GtoQg1fZrj0yZ3js+Xh1O
XQnFT1v80Dz2K+yY9d0PSj6RFkvyA2T30MjWKeeaSQ6sOil8AaGWt0utj0RHr9eO
iqVt2SMTq3+TBNbp9wUD6juvVJKyd7Mnq/SYT2zfdN4BNitZ4c+14Hm5TTczPNu9
Kr//0t9Gi/471l2i9BZj
=j65+
-----END PGP SIGNATURE-----

--=-Ddc0KmPfMOU8crVC1CXU--
