Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Wd304z4z"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mq5+p8kc"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zfmF44CZFzDr8f
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 11:07:04 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 97BDE20B16;
 Sun, 11 Feb 2018 19:07:02 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 11 Feb 2018 19:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=RgvTnLF0X/yElFJ0wlpVqEGsedjnF1znDO8wZJhx8Rw=; b=Wd304z4z
 8hQHPrIPJvzCcvAN/YN3yQmPrCAcBJw2XlWkzpcRoaS+AMXbgFYgfUC6cm6OPM/V
 8caRry1J7m989N+8lchy2alQyz+XX0GvEBIn9Cp/BnGK7LDQBjWPc379ijCPEgXT
 kkxOdcpXgw3BFed8ljUGZeoj21slskQN+bGe6W0HpNNwKOEalZAV/YzyN65qK8zo
 sw7YlzFzVTd0g1MzRCiIdD7x4WaqCmbgzl8vxBZhjgFJcTBd6WOMwEH96OZ3b/oD
 5RdkYZRZNYLThplBigHSdkuwLeDZQBNKTkrrEbtd1yo63XtQOVVL5oUMKIhTlRsW
 JveluvUw3UE6FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=RgvTnLF0X/yElFJ0wlpVqEGsedjnF
 1znDO8wZJhx8Rw=; b=mq5+p8kcWDlzd4A4pk6ke+c2CkluJP9j2EZHv4vsWbCRX
 RNQ2gthmU+zYjwfSacei6AWfSLtpMwZ1VUDGe2Wn2tT3L4RqeRebntaaC+5GHhM7
 FxBwT8RxwMiaXgfgUjAGjV01jBwFTFkt2jqx7bMiRRtfL5TRwdUFBElpSX9rAZUR
 jsgEwbHHwCddOBopwGOuepORqbIHOL9XKaFiRoz1HzVkoHqL4lBWZWAFSZ9mL1eb
 fyANVMU5kqTPc/5gY8I93iC9yM6mZS6sS9oYvRglKjhvYA67mtHFdLtkkkZv6eK8
 Oqes6cWc5RZuJRw7P6s9inVUwp3Xoork4sJhvQguw==
X-ME-Sender: <xms:ptqAWpzI22MCH4LVUBJ6ZdjgFRiZsugUhLJquGCaWpTfEZFCRHdhCA>
Received: from dave (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 55834246D5;
 Sun, 11 Feb 2018 19:07:00 -0500 (EST)
Message-ID: <1518394016.10440.12.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.13 v2 4/4] misc: aspeed-lpc-ctrl: Enable FWH
 and A2H bridge cycles
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Cyril Bur <cyrilbur@gmail.com>
Date: Mon, 12 Feb 2018 10:36:56 +1030
In-Reply-To: <20180209051158.32354-5-joel@jms.id.au>
References: <20180209051158.32354-1-joel@jms.id.au>
 <20180209051158.32354-5-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-kV0pcUOAJOx0EmpmN7KM"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Feb 2018 00:07:05 -0000


--=-kV0pcUOAJOx0EmpmN7KM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-02-09 at 15:41 +1030, Joel Stanley wrote:
> To date this driver has relied on prevous state from out of tree hacks
> and vendor u-boot trees in order to have the host be able to access
> data over the LPC bus.
>=20
> Now we explicitly enable the AHB to LPC bridge and FWH cycles from when
> the user first configures the address to map. We chose to do this then
> as before that time there is no way for the kernel to know where it is
> safe to point the LPC window.
>=20
> Tested-by: Lei YU <mine260309@gmail.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> --
> v2: Enable both FWH and A2H
> ---
>  drivers/misc/aspeed-lpc-ctrl.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctr=
l.c
> index 4a818ad3827e..1d7d3a6c570f 100644
> --- a/drivers/misc/aspeed-lpc-ctrl.c
> +++ b/drivers/misc/aspeed-lpc-ctrl.c
> @@ -21,6 +21,10 @@
> =20
>  #define DEVICE_NAME	"aspeed-lpc-ctrl"
> =20
> +#define HICR5 0x0
> +#define HICR5_ENL2H	BIT(8)
> +#define HICR5_ENFWH	BIT(10)
> +
>  #define HICR7 0x8
>  #define HICR8 0xc
> =20
> @@ -155,8 +159,18 @@ static long aspeed_lpc_ctrl_ioctl(struct file *file,=
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
> +				HICR5_ENFWH | HICR5_ENL2H,
> +				HICR5_ENFWH | HICR5_ENL2H);
>  	}
> =20
>  	return -EINVAL;
--=-kV0pcUOAJOx0EmpmN7KM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJagNqgAAoJEJ0dnzgO5LT5FbUQAKJCcmWLn94nfrLailG1a43y
gondODjr4HyFHtIRcEcj+FfdKtB7I8YNHHTjh4UE39i18WHn9uPhpiHA3O1jzkow
B2j9Ph3T3vFgknFMPJENmG+h5VbhtViCVrqieRE5d2GMNHyRhKPlRs6P/moulqxy
HHz491er3/tVMoSLwRzyI6iJc5ctv+nSqwbjhsevXCNAxagPpZXhWMrRhlIHd5O0
wy9L9c//ZWo6fbG2WGQfRs4SVd5MYauvsEBY1QhIQJxQ2EW+8gQFa95SA4UNBVCH
a7PjVoIB/FkXSOAiFvrAWTYbHjhHbZNsck6Ri0A9EUCdFo4JqXzSZ1O8BI18YVZb
HrZuA29xzXd297thOxVVtEMy7LXR6SHPxlIY83SAOWFOqWLAcNxWPo9Xb5ysyy2i
DFBbA4qTZVERRVVvmt4nTHq2QFI18SLtn2HsNyEvcz2e/U79dRWXkbGyRFaSPYWZ
3+gNu0sxSA1aNI6UV9IAK4ShxltRd2kYNhQchUMIfHqsniy6lCtF6ZGQuT5eQHqv
ljsNanVlxhYlsa+b4vKdAzsT8vMGCfKp0VDDcy/hAZjCH7ifKLZuPA4hd8dWlzt+
Sp3c0ck7gxXS5w03gV0gcL2TaK5X1tZ+z+gMqcrfIieAmOOQ2rMwahpx3cGyHvsv
1tTcVB6BkVUy+I17xk0q
=iIS6
-----END PGP SIGNATURE-----

--=-kV0pcUOAJOx0EmpmN7KM--
