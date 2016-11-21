Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMq3w40xDzDvJC
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 00:21:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dUTL/3Dw"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qVvM7omn"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0F4CF20882;
 Mon, 21 Nov 2016 08:20:58 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 21 Nov 2016 08:20:58 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=11xV0Y3JRFNURy1ccGbvqQC6zYk=; b=dUTL/3
 Dwfc8PDMPaVZVgM51GfiMfy8XZUJDHnAp/Rsm+qSTHks8bPQirt+zHyKdbgX+urQ
 abs0fdQN/MCQV57TIE5s4I6XUPB5TbCFEUXwLbJukckyr74jdjsCbO3vmVRGrVp9
 BfGCWEemSW57OaeRFMQUsgTZpqglYSNdIy8Mc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=11xV0Y3JRFNURy
 1ccGbvqQC6zYk=; b=qVvM7omnDhB4J/S9URQKbP42T+m0QIAT6LQQu2ZWvZVq+O
 g9E+rl6jDjtX7bIwoji0zVXgJKBu7DEO7ItjvUnsaN9Dag1QeGxKHNb9bkrtp4dg
 oueXNak5l9/H07K5nvvhmMCPJFSxpRXfEomDNIS3nilYjFC1w7Xb0dX9PjWyY=
X-ME-Sender: <xms:ufQyWOul686sKYZB9gQ6yo3-ezMBAtpsQtnQbk97-RdRAm-mJ5LcJg>
X-Sasl-enc: eDajZxaM9Cg5nkk7h5I6VpbxA1jjV2AfCLsgWcrbLI9f 1479734457
Received: from keelia.aj.id.au (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 972082442C;
 Mon, 21 Nov 2016 08:20:56 -0500 (EST)
Message-ID: <1479734436.2503.8.camel@aj.id.au>
Subject: Re: [PATCH qemu 12/38] aspeed/smc: rework the prototype of the
 AspeedSMCFlash helper routines
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 21 Nov 2016 23:50:36 +1030
In-Reply-To: <1479478938-13267-13-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-13-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-89HTFYI9xfnKDMqb+J5/"
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
X-List-Received-Date: Mon, 21 Nov 2016 13:21:01 -0000


--=-89HTFYI9xfnKDMqb+J5/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-18 at 15:21 +0100, C=C3=A9dric Le Goater wrote:
> Change the routines prototype to use a 'AspeedSMCFlash *' instead of
> 'AspeedSMCState *'. The result will help in making future changes
> clearer.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/ssi/aspeed_smc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 37 ++++++++++++++++++++++---------------
> =C2=A0include/hw/ssi/aspeed_smc.h |=C2=A0=C2=A02 +-
> =C2=A02 files changed, 23 insertions(+), 16 deletions(-)
>=20
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 78f5aed53247..91cdc0bf1ac7 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -328,19 +328,30 @@ static const MemoryRegionOps aspeed_smc_flash_defau=
lt_ops =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> =C2=A0};
> =C2=A0
> -static inline int aspeed_smc_flash_mode(const AspeedSMCState *s, int cs)
> +static inline int aspeed_smc_flash_mode(const AspeedSMCFlash *fl)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0return s->regs[s->r_ctrl0 + cs] & CTRL_CMD_MODE_=
MASK;
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState *s =3D fl->controller;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0return s->regs[s->r_ctrl0 + fl->id] & CTRL_CMD_M=
ODE_MASK;
> =C2=A0}
> =C2=A0
> -static inline bool aspeed_smc_is_usermode(const AspeedSMCState *s, int c=
s)
> +static inline bool aspeed_smc_is_usermode(const AspeedSMCFlash *fl)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0return aspeed_smc_flash_mode(s, cs) =3D=3D CTRL_=
USERMODE;
> +=C2=A0=C2=A0=C2=A0=C2=A0return aspeed_smc_flash_mode(fl) =3D=3D CTRL_USE=
RMODE;
> =C2=A0}
> =C2=A0
> -static inline bool aspeed_smc_is_writable(const AspeedSMCState *s, int c=
s)
> +static inline bool aspeed_smc_is_ce_stop_active(const AspeedSMCFlash *fl=
)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0return s->regs[s->r_conf] & (1 << (s->conf_enabl=
e_w0 + cs));
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState *s =3D fl->controller;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0return s->regs[s->r_ctrl0 + fl->id] & CTRL_CE_ST=
OP_ACTIVE;
> +}
> +
> +static inline bool aspeed_smc_is_writable(const AspeedSMCFlash *fl)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState *s =3D fl->controller;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0return s->regs[s->r_conf] & (1 << (s->conf_enabl=
e_w0 + fl->id));
> =C2=A0}
> =C2=A0
> =C2=A0static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, un=
signed size)
> @@ -350,7 +361,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, h=
waddr addr, unsigned size)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint64_t ret =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0if (aspeed_smc_is_usermode(s, fl->id)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0if (aspeed_smc_is_usermode(fl)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < s=
ize; i++) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> @@ -370,13 +381,13 @@ static void aspeed_smc_flash_write(void *opaque, hw=
addr addr, uint64_t data,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const AspeedSMCState *s =3D fl->controller;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0if (!aspeed_smc_is_writable(s, fl->id)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0if (!aspeed_smc_is_writable(fl)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qemu_log_mask(LOG_G=
UEST_ERROR, "%s: flash is not writable at 0x%"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0HWADDR_PR=
Ix "\n", __func__, addr);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0if (!aspeed_smc_is_usermode(s, fl->id)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0if (!aspeed_smc_is_usermode(fl)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qemu_log_mask(LOG_U=
NIMP, "%s: usermode not implemented\n",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__func__)=
;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> @@ -397,17 +408,13 @@ static const MemoryRegionOps aspeed_smc_flash_ops =
=3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> =C2=A0};
> =C2=A0
> -static bool aspeed_smc_is_ce_stop_active(const AspeedSMCState *s, int cs=
)
> -{
> -=C2=A0=C2=A0=C2=A0=C2=A0return s->regs[s->r_ctrl0 + cs] & CTRL_CE_STOP_A=
CTIVE;
> -}
> -
> =C2=A0static void aspeed_smc_update_cs(const AspeedSMCState *s)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < s->num_cs; ++i) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qemu_set_irq(s->cs_lines=
[i], aspeed_smc_is_ce_stop_active(s, i));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qemu_set_irq(s->cs_lines=
[i],
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed_smc_is_ce_stop=
_active(&s->flashes[i]));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0}
> =C2=A0
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index bdfbcc0ffa7d..c64954f6103f 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -47,7 +47,7 @@ typedef struct AspeedSMCController {
> =C2=A0} AspeedSMCController;
> =C2=A0
> =C2=A0typedef struct AspeedSMCFlash {
> -=C2=A0=C2=A0=C2=A0=C2=A0const struct AspeedSMCState *controller;
> +=C2=A0=C2=A0=C2=A0=C2=A0struct AspeedSMCState *controller;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t id;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t size;
--=-89HTFYI9xfnKDMqb+J5/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYMvSlAAoJEJ0dnzgO5LT5MbUP/39Zure++9QtAssXgwdeQCSm
VWdi4nLlkw0nyv7nIkrT2jhwqC0LRkAJ7ioSten+vuZ0Wh7KBSHHMpf/0zZDoPcY
vzxywKwcgW8OV7aiJAA3uD13AQDNoOo8sJ7PVfz0p2UwHF5CJF7RDpicCVVzOlA9
r8rEs2iZQj2vd32W7fRhoQraJtivvJIFB5O5Sn49sdD8MUYvz3psFGea8FtvS1rC
US6gHlxrmrtlm7D0BwhIJDY+hCzI/ajAg4OAfoJ57syfIEO0vV5rv+4vziIKLMZg
HQTInWg+Pfr9FPp0eJwe+ey3DEy+GJgXIDZZwwrFNsla68/MIKv4ORXsue4noS6j
Es1tJdkzcP9vZllGaioCEGaA84YfVd7VgPUC2aGfoaN3gAPkqR9mk+lw4+MWCa7e
ydMl332JPJnMhdiDJ67ulZoGaP2MvpiJ6ye5b/L5G3Queu9Pv+GLJFsBgLr5B7jA
EI/Q8YCHgUVg/X+riINpQkUY+LYoxgGSQs0c2mxD0EfSY+AjUcUDCHDphalaFrzt
Hq9Lh2dbTpkvdV4iuCljLiIVv9KtejrhcQmwA9hIJLB2NY5nqhW7V71QcpzUP7iT
UQLrHR+YzpH0J3As8AlNlRVYEMJcaCB967Hkj1xX5OeAOG8KwVNQRVAJwYL+IAdm
jK4d5YQTxOzCi2Lc83Rc
=65bK
-----END PGP SIGNATURE-----

--=-89HTFYI9xfnKDMqb+J5/--
