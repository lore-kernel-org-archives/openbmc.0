Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xcf6W4Ql5zDrCw
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 17:23:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CwM/bf++"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KFXiV8T/"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3659A20DAE;
 Wed, 23 Aug 2017 03:23:29 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 23 Aug 2017 03:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=F13zsvf0SDcfQ2ToIZp9K8cmxCq/huAat8Fi543i2
 F0=; b=CwM/bf++m8XGsYrsaY6i9yQWPKV/S1YQ+X5XYN2Rt6GZaHVr9OsczaOEP
 TSvkUWXmIw6NBI6C+TqtJZLmHdeK/wJl588k3OTA+iRwEi2KKlTDda3vI+uLKbjk
 XK6A4/nYJAedlCuDa15L5s2FfuDJuOEOwpqBqDDCUoSz2OHX/HA7fN0yu4noFxJ0
 gf5T/PBwyy40brbXMFQBWjAreSbRiusd3Fg6HUkB27s80v9zU2TI0PRgGcJ8Gu/h
 25xjwh7XRV7aQnlrftk3zqBPSkFg7zCWNmr1mbFWJPPoyouoIbmDJETBWhrn+5i/
 1MWPEMYt26nAZM4ElUrpfBmOciE3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=F13zsvf0SDcfQ2ToIZ
 p9K8cmxCq/huAat8Fi543i2F0=; b=KFXiV8T/6RwwtdQcOm5idui4R43yf5goPP
 sgKDrZAuow87W8ZbmSQBHtstQ95GOhExXtT8trVxZrPeP2hMP3kqHbWU6FBX4Qga
 prl9QumKhd1rZ8YtPffgyApeUvEKyTPpfnYl6EgPcIOnhNJhgeDAD+qd5WZt1SBM
 6wfXngpkNJrvTZawjzE86cIW+Fo9Y2snw9S6dLyTyN+VpPDdZfciR06IlduBcPw5
 /YakwqPKcCP0qFm7TGzybAFk9w1tKjpnB2gozhKaP3rim86XwQeUCfddRUzzB2K2
 7AGU5IPONk/T35HzBChu2bSEB0P6UtQrx7ph9mKyv2i9HM0MJ6Fw==
X-ME-Sender: <xms:cS2dWf9Ag022THyARqIkrnCefrw7nOBtumGRiBY5popZp_cRxnokrQ>
X-Sasl-enc: KoQYpVHIS4MGl4R4PpKKpZsPPTXbRwfr3YX7fGaH1Ajo 1503473008
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 803E12470F;
 Wed, 23 Aug 2017 03:23:27 -0400 (EDT)
Message-ID: <1503473004.7266.37.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] drivers: occ: Fix bad list access
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Wed, 23 Aug 2017 16:53:24 +0930
In-Reply-To: <1503439230-14034-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1503439230-14034-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-6vx0QKGjjpar523BmQuA"
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
X-List-Received-Date: Wed, 23 Aug 2017 07:23:33 -0000


--=-6vx0QKGjjpar523BmQuA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-08-22 at 17:00 -0500, Eddie James wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> list_first_entry() doesn't return NULL if the list is empty...
>=20
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Thanks, applied to dev-4.10.

Andrew

> ---
> =C2=A0drivers/fsi/occ.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index d984e51..621fbf0 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -572,7 +572,7 @@ static void occ_worker(struct work_struct *work)
> =C2=A0again:
> > =C2=A0	spin_lock_irq(&occ->list_lock);
> =C2=A0
> > -	xfr =3D list_first_entry(&occ->xfrs, struct occ_xfr, link);
> > +	xfr =3D list_first_entry_or_null(&occ->xfrs, struct occ_xfr, link);
> > =C2=A0	if (!xfr) {
> > =C2=A0		spin_unlock_irq(&occ->list_lock);
> > =C2=A0		return;
--=-6vx0QKGjjpar523BmQuA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZnS1sAAoJEJ0dnzgO5LT5DcsP/19pHwxbsMTZbdkkg52yGttj
Y/2g7hKt0qrCK9E9WLTWs5YOoXBD4geBE5RiZztYcCpgONNdKlSzwvv5FuXJQ8l8
j7xBFHlsnXhZPk/zpfIiFu1qSbvJLT41RV9C1sNUd+NFnpS14Q3LLJamOQ3JmKRA
UxSd5hy4kQ/QMlRcqMblisokAaY8wDdRW+Xw7BGLGb+vc+59rUr7InWyeh+n9+tm
JyaVJCVDAWygUO5GAaHYWZ3k5ZoZZS8svgZ1nVQ1gyquF/7sSOju+jd6kd1KIriD
B54PuyRtR6wnBPPkqkG26bb247suKt4c+TweqHD6ZRPsode4mNtty509PwvxxVxs
V+tkzNAeGuhf+EZ5hzM0wNmbpiAY6Icj97EGIbsUKMREHadcw7aRzOQUnRETeNv/
SFW3Y1nAHDUoYzymSA7jQTY/w3lOJgjQY6q/oSfhxHU3QGqgaJIX2+SexNJ/qmgT
D2PjPNvQ0QdFQVwy0E0JvPbHIZQXFcb6E2552/LiR+DK/8RCynMDo3fy496J+6AX
1LnPPgcF4EcnynfU8Vq4MYE+Qd27gXvQIMIWB4MwrDmNZBN5kdmM5wXdTWuoagSO
QpqFT60Nn3CPazQSgBIheEkpwEbpPqPaUmMfoaZjvEkLard7L9KWsrCq5F7vg6Yw
waZCBCtCCjJkMPq/oe4G
=ersc
-----END PGP SIGNATURE-----

--=-6vx0QKGjjpar523BmQuA--
