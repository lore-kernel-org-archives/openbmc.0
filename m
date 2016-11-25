Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tQ3DK5N2nzDvNW
 for <openbmc@lists.ozlabs.org>; Fri, 25 Nov 2016 15:36:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fg2paCme"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ERFynocs"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 857F320620;
 Thu, 24 Nov 2016 23:35:59 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 24 Nov 2016 23:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=KkNNWF6bDeliZoCYXgYAOyfTv9A=; b=fg2paC
 meaNAgoxGWfWgBHC2N+gnU2sOY8WDIdsWiWbbXLQ19kaWdHp59Sh1BTmYlJS7OqS
 WjMjxLJNXACCzncVtaqbxI+GbSK56wGt/a+YjiBStk+E4Ebq63C0MY5uEV01YErC
 8TtLYOaU5OHNdQ2THjT3dZ0hLnRXXQ1W1Rd/I=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=KkNNWF6bDeliZo
 CYXgYAOyfTv9A=; b=ERFynocsFUUjZN4ZdlrTtshBzJthiVSy2+t1ZZv8fHhPv+
 cfAovLcGeeGM1k6sxGoUtJg4IsbOjBfxCuigGHISlsdjhS0x0cwXKAcjrjM+cJpa
 uXEJ24NRbAIQy/UYzI4/knGDnHCL4qbyUHF03MhYyZjPJaxXTBzlCf2rV3JS0=
X-ME-Sender: <xms:r783WGCd4gHG0aCE467ljW8B7ERAfLRn--jC79JcocWtvP68FC6Z6A>
X-Sasl-enc: v3PukF1a0xq0Tu4c5+Er/E+nfMJ3BrKUCNcSUu/gQqBG 1480048558
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1785A2418C;
 Thu, 24 Nov 2016 23:35:57 -0500 (EST)
Message-ID: <1480048554.2503.59.camel@aj.id.au>
Subject: Re: [PATCH qemu 18/38] aspeed/smc: add a 'sdram_base' property
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Fri, 25 Nov 2016 15:05:54 +1030
In-Reply-To: <1479478938-13267-19-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-19-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-MUVO888a6pD3bQ38eqGG"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Fri, 25 Nov 2016 04:36:02 -0000


--=-MUVO888a6pD3bQ38eqGG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-18 at 15:21 +0100, C=C3=A9dric Le Goater wrote:
> The setting of the DRAM address of the DMA transaction depends on the
> DRAM base address of the SoC, so we add a property to give this
> information to the model.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/arm/aspeed_soc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 7 +++++++
> =C2=A0hw/ssi/aspeed_smc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 1 +
> =C2=A0include/hw/ssi/aspeed_smc.h | 3 +++
> =C2=A03 files changed, 11 insertions(+)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index fcf029f8c1c2..24354f700115 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -276,6 +276,13 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(&s->fmc), fm=
c_num_cs, "num-cs", &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(&s->fmc), sc->inf=
o->sdram_base, "sdram-base",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0&local_err);
> +=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(&err, local_err);
> +=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(errp, er=
r);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&s->fmc), t=
rue, "realized", &local_err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(&err, local_err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 8e7e3bd9e335..24c78aa57537 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -819,6 +819,7 @@ static const VMStateDescription vmstate_aspeed_smc =
=3D {
> =C2=A0};
> =C2=A0
> =C2=A0static Property aspeed_smc_properties[] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_UINT64("sdram-base", AspeedSMCState,=
 sdram_base, 0),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_UINT32("num-cs", AspeedSMCState=
, num_cs, 1),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_END_OF_LIST(),
> =C2=A0};
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 39ee601940e8..88a904849801 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -96,6 +96,9 @@ typedef struct AspeedSMCState {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t r_timings;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t conf_enable_w0;
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0/* for DMA support */
> +=C2=A0=C2=A0=C2=A0=C2=A0uint64_t sdram_base;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCFlash *flashes;
> =C2=A0} AspeedSMCState;
> =C2=A0
--=-MUVO888a6pD3bQ38eqGG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYN7+qAAoJEJ0dnzgO5LT57B4P/2UFYh2VOqf3UbXCzTGRqPyX
grgwfrpaEFNX+WKp6zq32CftI/Jfg0HskeEgGLzrS8Vc4ydRRJ2VBiZ8H6Fvij9l
cfjCZRtZdrotb9eq2Iwg618Y5lp7vXiqsiO1dnSYbYVKYIBNbVElvwVP5qdrA/53
QEFeAP5oDMKf1/8d1qsGPsvz+xfy89d2dfa/g5eW+ZGGjyx/VUrHCIUMcb9jGQ7A
VD4/24tl5RH6GPiGlPBjuleFv12g/9zFhewIJKV3+2606WUJwt6ourOqszV4Fn6f
TDcQRiKqpUmBCMasaeWXKig5mVD2IPEWl/sA65+HbLxUKQ6W+N7FbXCzOhOFR0Uo
mPTBVN/9oIAJCXuKynZxGOLVOtdfOy3ps/ikNuezf1Vd+DryiROhyUqVTtchm743
WRRMD/szP3nYoFT2pVyAtzu/KCW2ZUnDH4ctC0w6OMNlJpbIeAfmtgTLMVtcWW+Z
i+wS/B47F59t+F4o48u7dJnBGL9pHtxhdcKlMN2qMl0xTjJ7hW+IOjJwZClnXun0
Do3VWVc/erZ1s0nD6TJtOrtRMuxCySRhH7XHcTWb6BBDTLbhO81rKjW5RgvLKh2t
Hd1rlVbcJaD8F1yclpfLEjZktjCwKyqMoICgA5ufqYQEtxGuRfbj2xVv85+gVqgU
ErsG7KDIo0WVo1k/jKYi
=9ihu
-----END PGP SIGNATURE-----

--=-MUVO888a6pD3bQ38eqGG--
