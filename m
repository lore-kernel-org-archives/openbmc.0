Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td2Gr5Ln2zDvx1
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 12:31:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NGhHBrS9"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="W7KZvsGL"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AF1782056F;
 Mon, 12 Dec 2016 20:31:14 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 12 Dec 2016 20:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=3BJM1jCqkSHFXgIZahUrAho4/e4=; b=NGhHBr
 S9ymdrX8eWAK19NgpgzFYBttfrSX2uhz7SRPgaebQN27D5aB5zIFiOFRQwZAYaWM
 oM1K9znCoIoeG3zUmi709gS8aHLrIOruCAUve83BVBy5WDCEJh8YXDWlQQFNXAVl
 3CmeCMH2ws0JzkYJ5yKe7E4taqdxezVW6e6e8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=3BJM1jCqkSHFXg
 IZahUrAho4/e4=; b=W7KZvsGLanmRHQflvx4MTDvcno6+R1kw6D/1T11Dq75uDp
 hHE6Ls2dKuV3NxC83KT9fWLPgLx6QkdmPJ1tATMyuZ4SC4swcYgETXWpk/kubE4g
 0hH57dWqyeUtjhq77EVxAvocY3/TGlaRSIDyMEQSgK/SvGF4x3PETjfRpsrn8=
X-ME-Sender: <xms:Yk9PWBeQZS4-N5ZFGPVdq2bu2FNNJKPeBXesGHqz3QrF7p34T_I6Rg>
X-Sasl-enc: cFi+MpiJ4/KHyK//+CoIMPNuqaUHXybhhq5QnspP79nw 1481592673
Received: from [10.3.85.50] (unknown [203.122.223.123])
 by mail.messagingengine.com (Postfix) with ESMTPA id A65A87E396;
 Mon, 12 Dec 2016 20:31:12 -0500 (EST)
Message-ID: <1481592668.3112.18.camel@aj.id.au>
Subject: Re: [RFC PATCH linux v6 4/9] hwmon: occ: Add I2C SCOM transport
 implementation
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Tue, 13 Dec 2016 12:01:08 +1030
In-Reply-To: <1480460615-28732-1-git-send-email-eajames.ibm@gmail.com>
References: <1480460615-28732-1-git-send-email-eajames.ibm@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-1MKEA7+nsFcwrik0WO8I"
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
X-List-Received-Date: Tue, 13 Dec 2016 01:31:17 -0000


--=-1MKEA7+nsFcwrik0WO8I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-29 at 17:03 -0600, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> The BMC queries the OCC on POWER8 chips with SCOMs over I2C.
>=20
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/hwmon/occ/occ_scom_i2c.c | 68 +++++++++++++++++++++++++++++=
+++++++++++
> =C2=A0drivers/hwmon/occ/occ_scom_i2c.h | 20 ++++++++++++
> =C2=A02 files changed, 88 insertions(+)
> =C2=A0create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
> =C2=A0create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h
>=20
> diff --git a/drivers/hwmon/occ/occ_scom_i2c.c b/drivers/hwmon/occ/occ_sco=
m_i2c.c
> new file mode 100644
> index 0000000..e1bb363
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_scom_i2c.c
> @@ -0,0 +1,68 @@
> +/*
> + * occ_i2c.c - hwmon OCC driver
> + *
> + * This file contains the i2c layer for accessing the OCC over i2c bus.
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0See t=
he
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +#include "scom.h"
> +#include "occ_scom_i2c.h"
> +
> +#define OCC_I2C_NAME=C2=A0=C2=A0=C2=A0"occ-p8-i2c"
> +
> +int occ_i2c_getscom(void *bus, u32 address, u8 *data, size_t offset)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ssize_t rc;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 buf;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i2c_client *client =3D =
bus;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rc =3D i2c_master_send(client,=
 (const char *)&address, sizeof(u32));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rc !=3D sizeof(u32))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return -SCOM_WRITE_ERROR;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rc =3D i2c_master_recv(client,=
 (char *)&buf, sizeof(u64));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rc !=3D sizeof(u64))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return -SCOM_READ_ERROR;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*((u64 *)&data[offset]) =3D be=
64_to_cpu(buf);

See the comments in 2/9 regarding changing the interface.

> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> +}
> +EXPORT_SYMBOL(occ_i2c_getscom);
> +
> +int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 buf[3];
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ssize_t rc;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i2c_client *client =3D =
bus;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buf[0] =3D address;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buf[1] =3D data1;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buf[2] =3D data0;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rc =3D i2c_master_send(client,=
 (const char *)buf, sizeof(u32) * 3);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rc !=3D sizeof(u32) * 3)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return -SCOM_WRITE_ERROR;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> +}
> +EXPORT_SYMBOL(occ_i2c_putscom);
> +
> > +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("I2C OCC SCOM transport");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/occ/occ_scom_i2c.h b/drivers/hwmon/occ/occ_sco=
m_i2c.h
> new file mode 100644
> index 0000000..92225f4
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_scom_i2c.h
> @@ -0,0 +1,20 @@
> +/*
> + * occ_i2c.c - hwmon OCC driver
> + *
> + * This file contains the i2c layer for accessing the OCC over i2c bus.
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0See t=
he
> + * GNU General Public License for more details.
> + */
> +
> +int occ_i2c_getscom(void *bus, u32 address, u8 *data, size_t offset);
+int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1);
--=-1MKEA7+nsFcwrik0WO8I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYT09cAAoJEJ0dnzgO5LT5yx4P/0ZVIcBQ+tMwzd3IXUXp/sDZ
rdOluP0HcxeizxPq60tNY0cqnyrhq1Vm3CBN5xdlzvWZFNP4RSLx7y9tbDkCwiVD
b+ATP7VGYb07gPJ78FYVoKuChgcvAt/DG1DxbrKPh1gQhn8azZDY8rzP6nFsRbgw
b55lVloNIMiBrspMVRba78p/66WT/PH22zNlaCxQlzY0E4B/H4LJMXIuHnbjIxY5
eBaRaLWE1Ht3/cXGVLT0wXQ9d1KkV3hxMOxEhPz/yIX6UfKu2k7l6onsIKl0iZZF
T2h8J/oGs50dYLkUe0atFheycA0XWM7oIKvXf3LYMWQx78jDdaNXa91fMMwEfa/1
O45rjRYdHzPFPpdqRoPRBbzJzTH3JHugAuO+g/+eUTDsaZQrWsqiT2LWxd8Zkd63
gvrI2lv3m/M0m0EEqoZvX4f5jW9RXfHjG/5YhClcU1todkM7JrM+qXXu3r9nJMD8
8eRH/9Q1JpvoFJCHwsMILrS7kyjYaiBl6IO7cKIZ3YzUWzs5k/KwZHt/AZ/WDPD3
i8oZ8c2W+miDGgjA+KJfn68S2f5GC1ej025MFObL2Ngvw09J54bG02r8HkFKvxcj
ATY8WiTA9lidQNN1NOQ4bSvnz8kTrHE3ilGFUanxjrtW5QR2FLdriPy5IwiNjQij
YIt4DCJE5vzEtaleXRIF
=OVpO
-----END PGP SIGNATURE-----

--=-1MKEA7+nsFcwrik0WO8I--
