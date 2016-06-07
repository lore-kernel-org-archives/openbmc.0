Return-Path: <andrew@aj.id.au>
Received: from homiemail-a11.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rP36J1xLMzDq66
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 17:26:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=IZGQC8Q1; 
 dkim-atps=neutral
Received: from homiemail-a11.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTP id 5DE8A6E075;
 Tue,  7 Jun 2016 00:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=Up1nGuNpfdn0Cc0EdizhH
 8shj3E=; b=IZGQC8Q1PBHCffFjwH5B8wmiu0DbmwGkL7zuSeF9O/AdU1fBSqw4y
 U1nQSMk5Vs3q0FHcMhtx1QU8NxjsPRqcxgi5JmyBZP/JfhRAgBuOux24dP3HaPml
 1wt8rRyEldr7XUWCevhJVmrlEmLAZNhxlj/xax/Jrqxg+S1xjFRzhM=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTPSA id 4DA8E6E074;
 Tue,  7 Jun 2016 00:26:45 -0700 (PDT)
Message-ID: <1465284392.16048.80.camel@aj.id.au>
Subject: Re: [PATCH qemu 12/12] ast2400: add a FTGMAC100 nic
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Tue, 07 Jun 2016 16:56:32 +0930
In-Reply-To: <1464556805-4340-13-git-send-email-clg@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
 <1464556805-4340-13-git-send-email-clg@kaod.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-QG+A4pufVxZfH/Cxsc3f"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Tue, 07 Jun 2016 07:26:48 -0000


--=-QG+A4pufVxZfH/Cxsc3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2016-05-29 at 23:20 +0200, C=C3=A9dric Le Goater wrote:
> Only the first nic, but the second shouldn't be too complex to add if
> needed.

What was this patch based on? The GEM NIC is in the openbmc/qemu repo,
but this patch doesn't remove it - Was it based on upstream?


>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Regardless, looks good to me, we can massage it to apply wherever we
need, eg. by first backing out the GEM NIC as a separate commit.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/arm/ast2400.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0| 18 ++++++++++++++++++
> =C2=A0include/hw/arm/ast2400.h |=C2=A0=C2=A02 ++
> =C2=A02 files changed, 20 insertions(+)
>=20
> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
> index a4a7c10e4361..67ae91f5f977 100644
> --- a/hw/arm/ast2400.c
> +++ b/hw/arm/ast2400.c
> @@ -19,6 +19,7 @@
> =C2=A0#include "hw/char/serial.h"
> =C2=A0#include "hw/boards.h"
> =C2=A0#include "hw/i2c/aspeed_i2c.h"
> +#include "net/net.h"
> =C2=A0
> =C2=A0#define AST2400_UART_5_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x00=
184000
> =C2=A0#define AST2400_IOMEM_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x00200000
> @@ -32,6 +33,8 @@
> =C2=A0#define AST2400_LPC_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x1E789000
> =C2=A0#define AST2400_IBT_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0(AST2400_LPC_BASE + 0x140)
> =C2=A0#define AST2400_I2C_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x1E78A000
> +#define AST2400_ETH1_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x1E660000
> +#define AST2400_ETH2_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x1E680000
> =C2=A0
> =C2=A0static const int uart_irqs[] =3D { 9, 32, 33, 34, 10 };
> =C2=A0static const int timer_irqs[] =3D { 16, 17, 18, 35, 36, 37, 38, 39,=
 };
> @@ -95,6 +98,10 @@ static void ast2400_init(Object *obj)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->bt, sizeof(s->bt), TY=
PE_ASPEED_BT);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(obj, "bt", OBJECT=
(&s->bt), NULL);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus(DEVICE(&s->bt), sysbus_=
get_default());
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->ftgmac100, sizeof(s->ftgma=
c100), TYPE_FTGMAC100);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(obj, "ftgmac100", OBJE=
CT(&s->ftgmac100), NULL);
> +=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus(DEVICE(&s->ftgmac100), sysbu=
s_get_default());
> =C2=A0}
> =C2=A0
> =C2=A0static void ast2400_realize(DeviceState *dev, Error **errp)
> @@ -221,6 +228,17 @@ static void ast2400_realize(DeviceState *dev, Error =
**errp)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->bt), 0, =
AST2400_IBT_BASE);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_connect_irq(SYS_BUS_DEVICE(&s->bt), =
0,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qde=
v_get_gpio_in(DEVICE(&s->vic), 10));
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* Net */
> +=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_nic_properties(DEVICE(&s->ftgmac100), &=
nd_table[0]);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&s->ftgmac100), =
true, "realized", &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(errp, er=
r);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100), 0=
, AST2400_ETH1_BASE);
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100)=
, 0,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_get_=
gpio_in(DEVICE(&s->vic), 2));
> =C2=A0}
> =C2=A0
> =C2=A0static void ast2400_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
> index 2b517e89eeea..bb221734c7b1 100644
> --- a/include/hw/arm/ast2400.h
> +++ b/include/hw/arm/ast2400.h
> @@ -19,6 +19,7 @@
> =C2=A0#include "hw/i2c/aspeed_i2c.h"
> =C2=A0#include "hw/ssi/aspeed_smc.h"
> =C2=A0#include "hw/misc/aspeed_bt.h"
> +#include "hw/net/ftgmac100.h"
> =C2=A0
> =C2=A0typedef struct AST2400State {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*< private >*/
> @@ -35,6 +36,7 @@ typedef struct AST2400State {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState smc;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState spi;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedBTState bt;
> +=C2=A0=C2=A0=C2=A0=C2=A0Ftgmac100State ftgmac100;
> =C2=A0} AST2400State;
> =C2=A0
> =C2=A0#define TYPE_AST2400 "ast2400"
--=-QG+A4pufVxZfH/Cxsc3f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXVncoAAoJEJ0dnzgO5LT5dW4QAIy04i+XC8vSm9Ds4UBpHTbl
IbzcGUp4wh4Hf+eNLRFaSHDe7nMWxThbhIq8ZJ1/JAteLDXKdu33ElVgCuJmB5Em
EMsX4PYYENt1K6yCE7RDt33awUiT6AaYQj3YSXYwOfME2lksWCK7j7oa/O/dqWN/
FKxsJSLDsf2qSEvmQGDUq34xySZeM9/zT0nCi7FE/NTkNY43SjvVX515oUEiNP4P
kuqCytzGu7lwKzB8uzODT/1oJ4Vr1NA8BJt3WiGtTEYBAg+ipLOV3lr04iJ5yY4M
aSM9RHz9MF9DNwFW0zfmjmsokQClR60RTB45RLOJberjw1CVEu/67r7PjS34oaAV
fwAKcsKu4zvzlBJkn4uKvtOA0TfUpdgqGd5kcX/DbV74kABee6bXXXBHNQxVo72Y
NiiVPXbs5KbLiSqoJeOZQeVFFK9ZU8lX9aa8aL9TPqNRpVL/O+mEmnVluRop0bTw
PfRNs0T+HHdpt8gCC5gOt5btr1tdeb6IObTfo9GioPvpuulML3AQ8v+Y6QPKdSvA
Lp8T4uzR/69RqzilTA69nHjZxeW3eKIl2zaJa9hzESZqbSMY/KGFdwYP9Y1uP/7z
y5aYVFnQzL3VEXUB9M+xhoAwrtzyZEhhfUHnQgwoOLsSoRBkSS2cOlLv5LNyXPEL
hSlr4RtCjtpXMvYRas6x
=RF9N
-----END PGP SIGNATURE-----

--=-QG+A4pufVxZfH/Cxsc3f--
