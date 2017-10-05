Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gFDo2yrd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QLBfV6eL"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7TKF6FXjzDqhf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 10:20:49 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 85DD120EA6;
 Thu,  5 Oct 2017 19:20:47 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 19:20:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=zL+xb3/RirUH0SVjgho0R9cUx0olu6ZkYoIWOj+2g
 ck=; b=gFDo2yrd4IoWsmSz3cHLkWoZshAFmob2WrqwG7hG2/6E3/FMbjABOskgZ
 qIDmRVfWwkNwKpsqf1tOcYtoRRHVM2FWrDZ2j2D7TU6CkOzE03i3ckLMINZ2vuun
 ih1JO7Y3wrYGzT1Zy8fffsgO9pD5SoW2g/ccN+azUsxrvzAzNtgFNI3zlbt7y0/O
 MA5vXgtk69trWAijaHeLwstveiV7lbqLpDfTjCIgLVbBfVap7qVunGwBfCYyNOsg
 QGtkHG2S52Jehm0hGOuvsc9Mo2zF6/vvJozGuaGM1UR9wGDXey/2omo8C90Bulzn
 un3Xh2fTQDbqEW3MKgRrq+TOblJnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=zL+xb3/RirUH0SVjgh
 o0R9cUx0olu6ZkYoIWOj+2gck=; b=QLBfV6eLPgMNXs4qG1MqXDYTNTvYQS86Qd
 i3oVhJFgB7anmjMQ1rIICnVrHuv18yuCXxfDc8UIQZP40t+bYTy5K+xJKNQgBP3C
 QlYAoXrAB2VwYA9S05NXv30QY0MuHDWCEdklaDt6fUhdLrn2eazOK5TQwcFvwYph
 ETlWwPm55Jd4DptV0jCB2Vf95RllGhUBO9FkIOhsXcyMcSZYAJoMxfpooTKER8R2
 99gc1qEEwVqvbP3SqNF8sceoE93k+qenr7vzpMUlvcyWwsYXUvggScpryxfxRh2/
 DhUcJWigaxk2EUpV/OftDr2NzGIMwxZshn4CefsauYSWcwklA/Lw==
X-ME-Sender: <xms:T77WWf1OZd2i8UWUHIMtPNZlNQFD7Qf7Cu3JoVl537YRHPWskLK41g>
X-Sasl-enc: dh5vih7yycgDjbIesZfi5x6YVHcWcuZZJ7EhvyxxDLCa 1507245646
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 773007FA70;
 Thu,  5 Oct 2017 19:20:45 -0400 (EDT)
Message-ID: <1507245642.5452.113.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 26/31] drivers: fsi: occ: Add OCC
 response definitions to header
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 09:50:42 +1030
In-Reply-To: <1507231464-13635-27-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-27-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-VawjlUJJhZfcr/OryTH9"
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
X-List-Received-Date: Thu, 05 Oct 2017 23:20:50 -0000


--=-VawjlUJJhZfcr/OryTH9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Also fix include guards.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0include/linux/occ.h | 20 +++++++++++++++++---
> =C2=A01 file changed, 17 insertions(+), 3 deletions(-)
>=C2=A0
> diff --git a/include/linux/occ.h b/include/linux/occ.h
> index d78332c..0a4a54a 100644
> --- a/include/linux/occ.h
> +++ b/include/linux/occ.h
> @@ -11,12 +11,26 @@
> =C2=A0 * GNU General Public License for more details.
> =C2=A0 */
> =C2=A0
> -#ifndef __OCC_H__
> -#define __OCC_H__
> +#ifndef LINUX_FSI_OCC_H
> +#define LINUX_FSI_OCC_H
> =C2=A0
> =C2=A0struct device;
> =C2=A0struct occ_client;
> =C2=A0
> +#define OCC_RESP_CMD_IN_PRG		0xFF
> +#define OCC_RESP_SUCCESS		0
> +#define OCC_RESP_CMD_INVAL		0x11
> +#define OCC_RESP_CMD_LEN_INVAL		0x12
> +#define OCC_RESP_DATA_INVAL		0x13
> +#define OCC_RESP_CHKSUM_ERR		0x14
> +#define OCC_RESP_INT_ERR		0x15
> +#define OCC_RESP_BAD_STATE		0x16
> +#define OCC_RESP_CRIT_EXCEPT		0xE0
> +#define OCC_RESP_CRIT_INIT		0xE1
> +#define OCC_RESP_CRIT_WATCHDOG		0xE2
> +#define OCC_RESP_CRIT_OCB		0xE3
> +#define OCC_RESP_CRIT_HW		0xE4
> +
> =C2=A0extern struct occ_client *occ_drv_open(struct device *dev,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long flags);
> =C2=A0extern int occ_drv_read(struct occ_client *client, char *buf, size_=
t len);
> @@ -24,4 +38,4 @@ extern int occ_drv_write(struct occ_client *client, con=
st char *buf,
> =C2=A0			=C2=A0size_t len);
> =C2=A0extern void occ_drv_release(struct occ_client *client);
> =C2=A0
> -#endif /* __OCC_H__ */
> +#endif /* LINUX_FSI_OCC_H */
--=-VawjlUJJhZfcr/OryTH9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1r5KAAoJEJ0dnzgO5LT521kQALPCiQRC/Kyptn9EJhn12Szt
l7tmIZg9kAUF5gPBN/MVkPm44hx29/zu59IKo5kk2i4juDGdnfGiYkeLGHnbhWoI
Bd91ZZ9Wq58St7RcK0GJsMjoWmqX2+4Wo26prsCkxLIHRAweZq2GKkgk50emeSwp
EjIa9/fnrIVvCRFoSHorDgR2qi1ag6Eiytip/STgNAhSoEYM+2Bm3Q+CWkfNdsAr
19QfuGCkB+aatfCaY+47ASH24HUYIFJEmCih/wrFcY71JWA6PX4n2zl6TbMY2JAP
U+Ip/CjYGqMmDCuhxPzIrMUGRqJsJTkYQCn1Y4J+yE6a+aYmON5PGDsmakEtNmI7
mTEyhdHejCH4ifr/QOA5BCY+Fq0kCLHTR/x0CDhLzu5HZ//b7GgEvo3VzFZ9jMdW
LkWT2w3/nSjX0e44Z1YW/deQU1Vv6PnSCTlo4AQ786xTVwT9FU1FG/zqJBMz32n4
yonS9pmYN5NqiNsrjj+0WmvRk52m2fn4M6Edm35T8mAU2PJaFVM2dvsFLWl/ZcNB
vj+iA971+o3Pjj5HZHRO6zMj/6SpZPVzEu1WiHCB+8aEBuZgfBmcUGr2DBnP2vJy
PBzTbWa0jCMabL0m+Vi/Z6DRDQuadCc37J2NW78PHEXP1U3a5MLVrGbN8cgFaZd5
+fWVerY/2mJWZSPrCLfg
=q2s1
-----END PGP SIGNATURE-----

--=-VawjlUJJhZfcr/OryTH9--
