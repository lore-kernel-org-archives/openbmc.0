Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qB3GOjtN"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Ht4LTSkp"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zcVm729g3zF15V
 for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2018 18:52:39 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2CB7320DD1;
 Thu,  8 Feb 2018 02:52:37 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 08 Feb 2018 02:52:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=e7URxuJOJWNh1ejMTcTiMCTTxuUCBvjq7q2PG0Jxqis=; b=qB3GOjtN
 4i6+m0050yKkV9OaH9MbGf52jg9U0isyjUNK6M+zUpafeRPKP0/D3gv2kbvtxkoN
 vxrHLeen9SUDR4HiYrVoCa0xQa+s4TrUg7FHFU7wGy0yQy/B3tFy314hF5PS0PHY
 DuxyslYV0VTc3dotJn0AvEXEL/n3qAKJyXSnRO7DkYyJMxQ4cfWM0dlAcvwhuMac
 drE3U4HscApNSb3N1RkVRCJaT07bRKG3SuWYDQwo0rBMVLXyXGvyZq3eRckAV3RF
 08L7JRbNFQs1HypxnxKoMnCYLJ9rdD7Cqyv4LEbxpVCT8yiG1ygO89ikCx1Ozhv1
 K1qhJAckInNRgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=e7URxuJOJWNh1ejMTcTiMCTTxuUCB
 vjq7q2PG0Jxqis=; b=Ht4LTSkpoqx3c1YsejZq2vlWKS2dhjQtaln4tlcJHet2K
 425lo1Kr8qdxtTORJsbTJ2ztbVN38EfemOyXscYBZuqR1k8rVcnECM0s9GVfJvV8
 g+ONCuSfZPSpSUxbMMdzKR1FdAYmPWune70L9WqTXc7wL+XyDtdrWzK46Jfmve5Y
 pZKv1uYmQtDVTeA1zvQDRLmDZjF6nwzXPGgZ60EVQPd2Csa7DhgXoXLFB6njGbJx
 GKTwj+6ErUML6tZ5x1oRcT8OamFwl3fZ8vWzqdySUcr2hVRFRzR154ZNrfW93hbt
 zZlhs1Kw5LsRwSBgFzCkFY4AFHIh2oH3Ppvlxc9MQ==
X-ME-Sender: <xms:xQF8Wu7khq5A-zIHCS__cVpOMVb1II4QjvqEYFEIXeZC9lJnNnhkUQ>
Received: from dave (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 285827E3DF;
 Thu,  8 Feb 2018 02:52:34 -0500 (EST)
Message-ID: <1518076351.14456.8.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.13 3/3] soc: aspeed-lpc-ctrl: Enable FWH cycles
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Cyril Bur <cyrilbur@gmail.com>
Date: Thu, 08 Feb 2018 18:22:31 +1030
In-Reply-To: <20180208053745.31254-4-joel@jms.id.au>
References: <20180208053745.31254-1-joel@jms.id.au>
 <20180208053745.31254-4-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-LrHPHPPvnDPgddK6F6OR"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Feb 2018 07:52:39 -0000


--=-LrHPHPPvnDPgddK6F6OR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-02-08 at 16:07 +1030, Joel Stanley wrote:
> To date this driver has relied on prevous BMC state in order
> to have the host be able to access data over the LPC bus.
>=20
> Now we explicitly enable the FWH cycles from when the user first
> configures the address to map. We chose to do this then as before that
> time there is no way for the kernel to know where it is safe to point
> the LPC window.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/misc/aspeed-lpc-ctrl.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctr=
l.c
> index 4a818ad3827e..21b4ee9d0a38 100644
> --- a/drivers/misc/aspeed-lpc-ctrl.c
> +++ b/drivers/misc/aspeed-lpc-ctrl.c
> @@ -21,6 +21,10 @@
> =20
>  #define DEVICE_NAME	"aspeed-lpc-ctrl"
> =20
> +#define HICR5 0x0
> +#define HICR5_ENL2H	BIT(8)

Shouldn't we be setting this at the same time as HICR5_ENFWH below?

> +#define HICR5_ENFWH	BIT(10)
> +
>  #define HICR7 0x8
>  #define HICR8 0xc
> =20
> @@ -155,8 +159,17 @@ static long aspeed_lpc_ctrl_ioctl(struct file *file,=
 unsigned int cmd,
>  		if (rc)
>  			return rc;
> =20
> -		return regmap_write(lpc_ctrl->regmap, HICR8,
> -			(~(map.size - 1)) | ((map.size >> 16) - 1));
> +		rc =3D regmap_write(lpc_ctrl->regmap, HICR8,
> +				(~(map.size - 1)) | ((map.size >> 16) - 1));
> +		if (rc)
> +			return rc;
> +
> +		/*
> +		 * Enable LPC FHW cycles. This is required for the host to
> +		 * access the regions specified.
> +		 */
> +		return regmap_update_bits(lpc_ctrl->regmap, HICR5,
> +				HICR5_ENFWH, HICR5_ENFWH);
>  	}
> =20
>  	return -EINVAL;
--=-LrHPHPPvnDPgddK6F6OR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJafAG/AAoJEJ0dnzgO5LT5FPwP/0qlqi5k84z/Rsg80GPFySoV
PPZpvpdcGko0ZNyhuoFfpxzn0z8OLsKz35hcdQ0upwegA7yzpzC4Bymmkp8pLPFv
gDwH0HNvz8dQiWTnChzGmM/p5D+/XS3ChKGwgehxLpqaZ2+dka9viqZNYaESltqh
HNBdq/WjR0e75B6D88XHiN01iL0LXAowPlgADkZbWEnWav0R7clXwF3rEzjJNpmW
Al4faGI8xNaQciinHKyK0Jj5I4BRAIGW/9lkdfcH6QVy0GAT6vuZSmrFCjvOAH6r
iZZo+O+SbFvlZBxGhKJayRiTFQaMRmyBzlevRDR1YBG7Vr/6Hds5MftnSCIvBcRn
H2r2S1+narD7FrlEDgCwCCOyN0siYTk0HKwhw/cvgd/Rb3aRLyi7PGgFfbZd1p1O
KtZI81BJsDS62pXy84S9mx3HO7FqYSK61BFNxFaWXu8zYcDTDTKcTMV4Gm8kcC0E
UI7k1JZ3xYOcvfE4JEeissHHfwn8aDgzT1nFG3SIGuN/pXP5hIXycl6w1lCHf+7Q
Goxvbkybl2VdNZc39O4JgLzDZQhoN/kiCe/P5S/s9K/6TMEDSfhaG7FFy3wP7jfX
XGAfcs3mIkh/Ad/Djp/hlDRHrWBcz1SEepPzVYCAK1NwUcvRZ0c1ALbdrPTAD/y8
ciRWhmeXfAxOSv8KLl7m
=oDl+
-----END PGP SIGNATURE-----

--=-LrHPHPPvnDPgddK6F6OR--
