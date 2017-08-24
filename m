Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xd6K31SdNzDqYY
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 11:34:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KZzqUWgv"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ANf/Ku3J"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4528620FA8;
 Wed, 23 Aug 2017 21:34:11 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 23 Aug 2017 21:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=MuSpFP1Zlopg9I9BjLMaUJGXVwN1w5Bn7DnDY4U7z
 Qg=; b=KZzqUWgvpUpDHhpzmqOg/eyHd5cTVdiyEO1sexb6o4vhp4g4KghMi/vES
 jE6FIN/OovEMRujeBRzY56ASTotWUnWkDEcLlRkEpSaD0LMzZ/uoJuZmwcWMz859
 EvLUfhCUxsRPCultKOigI8FGMbPpqGhSggQriQfyFN1eiX3/Q1CR91Gx7LQkr6at
 EiTMq6azUbFrutXhz6xmj121AbG5cPZ4oGTHpa8eEtoIlRLKCt6SzLGwpWdJLQRq
 U15m1sh2yHT8lsYd58ZZ4KpHEeJuaW/Jxz5lyAT2+Z6uT20vReM8eOKrXCpIagM3
 dsxjYRHtN+80W6ugUEA+59G7Uk3Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=MuSpFP1Zlopg9I9BjL
 MaUJGXVwN1w5Bn7DnDY4U7zQg=; b=ANf/Ku3JwLN32yAICmQlh0YJokpp1We18u
 8M2cWpPhl9enNs+wuVnRNUxiQACkK9DnD+VoPpwnKKSfFTI73ySVWPxQmRCUve6P
 79YcLjPDKe56M+E+4VhlEzPvJfHlgIlxfhM6UFpwkpF9QYGZK/XOyTcUk0EDX1iL
 hWMUeZ9WbqLQHMCWsvM6cX/zz5H7kTs6bQTQ14hRQV/gt9ubCD34K1xTqGlQLuJe
 vJAuo00Jn8xU6jsdiY+E/Pa0U6uN9G4xBNSr23HNG0i1lFCHSrpTgtdOteEY8jQL
 LRAR415fD1BPjfOhSAQJnAO4x6AgBI+mafnodVC0O3zbYD1C2XsA==
X-ME-Sender: <xms:Ey2eWRIfYt4qqoWbGQKlOhl9xAxErTaRBJXEZQAFn8_isgTAqX6haA>
X-Sasl-enc: W/HJBffHhukKFRDKLzN2aqRYXS29xsRDegvQ9kW7iFP+ 1503538450
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BEB0324A95;
 Wed, 23 Aug 2017 21:34:08 -0400 (EDT)
Message-ID: <1503538442.4231.1.camel@aj.id.au>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Add MTD and UBI support
 to ast-g5
From: Andrew Jeffery <andrew@aj.id.au>
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>, joel@jms.id.au, 
 raltherr@google.com, maxims@google.com, miltonm@us.ibm.com
Cc: openbmc@lists.ozlabs.org
Date: Thu, 24 Aug 2017 11:04:02 +0930
In-Reply-To: <1502849350-40252-1-git-send-email-anoo@linux.vnet.ibm.com>
References: <1502849350-40252-1-git-send-email-anoo@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-YI8E5a2/+QZwpVHMtmI6"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Aug 2017 01:34:16 -0000


--=-YI8E5a2/+QZwpVHMtmI6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-08-15 at 21:09 -0500, Adriana Kobylak wrote:
> Add MTD and UBI support to the default g5 include, conditioned to
> having MTDPARTS_DEFAULT defined.
>=C2=A0
> This allows platforms to enable this support if desired without
> adding it by default since it increases the size of u-boot.
>=C2=A0
> Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
> ---
> =C2=A0include/configs/ast-g5-ncsi.h | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)
>=C2=A0
> diff --git a/include/configs/ast-g5-ncsi.h b/include/configs/ast-g5-
> ncsi.h
> index 12d6684..b126e6e 100644
> --- a/include/configs/ast-g5-ncsi.h
> +++ b/include/configs/ast-g5-ncsi.h

I suggest we make this common to all platforms to reduce the configuration
headache. Putting the #defines in ast-g5-ncsi doesn't isolate the change to
Witherspoon, and I think we should avoid further fragmentation e.g. by
introducing a Witherspoon-specific configuration.

If other platforms need to recover the extra space required we can deal wit=
h
that on an as-needed basis in the future.

Cheers,

Andrew

> @@ -28,4 +28,14 @@
> =C2=A0
> =C2=A0#define CONFIG_HW_WATCHDOG
> =C2=A0
> +/* MTD and UBI */
> +#ifdef MTDPARTS_DEFAULT
> +#define CONFIG_FLASH_CFI_MTD
> +#define CONFIG_CMD_UBI
> +#define CONFIG_RBTREE
> +#define CONFIG_MTD_DEVICE
> +#define CONFIG_MTD_PARTITIONS
> +#define CONFIG_CMD_MTDPARTS
> +#endif
> +
> =C2=A0#endif	/* __AST_G5_NCSI_CONFIG_H */
--=-YI8E5a2/+QZwpVHMtmI6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZni0KAAoJEJ0dnzgO5LT5MLAP/A+RwiUZXiiJWeaSLUuV/uG8
cDq+4oNcJTqX0Y4kN7qomRMSpyLrJBlQ3Y8TOQTLk9WeKErbFFs2VnTg/C2qirEE
WZksYZTIyUNePNsdwHsKMrkev5b0VJD5YzJgUE+9E1DnuA7wpdm9WpEcSgD5yOcb
nTL/HELPd7MoTCbiz+MeYh2F+WZFihgBp3EHsKrIAKua/sgCreTbe15BAcw3zPSy
IPQDiNRZ4LEn88DZagCV2E0GbglFb820y59Op8CikEpPzaWtfCTUFZp4/nFimD+k
wk0WxNUyCzqtaDaEsEoGa2TNbm+hk10pj3bhX4bvSbL5mm47wKfzS82chYYLkecz
iq88fFX9qP+/tWKAl3fnpAJGTsddqw7B9aTjDD/6wazQgwFa0H8lPzY1k+DgsYkm
vIEBxKED772wU83PHEVlyTIsA0KADslpCR1YaYOiIPe0Z4nwvshON6HphrZGMNmH
o8wc28Iny30LMHK4T6cCgpR5M/n3XUNVVVMtoi1XKBD2wcRwMPv7qcC6B+5olEsh
lNofi0leLUfvVoyp7o4JMuhB+OVu2xCcUNo6UUgqJFC5OJXY73ty4jAnWkaXVfVH
D9zobHyqK+pcr5kHgq7vy9IRGgntDldjwFQTdYkEXiJu3Z0BaViMaJXaREDk4A/n
Qwbyk1gL+9D/ykwhkUM2
=KeBC
-----END PGP SIGNATURE-----

--=-YI8E5a2/+QZwpVHMtmI6--
