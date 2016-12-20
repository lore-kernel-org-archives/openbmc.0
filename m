Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tjJTt56frzDwRk
 for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2016 11:25:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RbRZrAmr"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CPYv+YNW"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7DC0D20871;
 Mon, 19 Dec 2016 19:25:36 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 19 Dec 2016 19:25:36 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=B6pyBVBhySvSBq9v8kKncN2jltc=; b=RbRZrA
 mrZxxVUwi0PCI3iCmhvXJ2dCNmlFIZiYlpb2qtJzSNyh6sfpNB/LWtqkCr6h1G0D
 l9Y+R1s44lSAvp/eTHvB1VNxCYNSlBuqmXrCzO5tNJvbNi8m0KFu8KqqpT7SsdyN
 CkKyBJ3c8dSuCfBk41HQZA+WXqsaNH4oQdOr4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=B6pyBVBhySvSBq
 9v8kKncN2jltc=; b=CPYv+YNWNSUE66UnFq1KAiqtAE2SBg4p67MdhMl5MDSB+s
 G79aczReaF5MDoK3sQ3R20PoPUcsUDPILilLShiaGeC4HojY0olSrrvU4QHBS/GI
 +NL3o+B9UtnohonvXUBHJicF2JrFQRjqfRjpNplky8nHJHXZenzf3na1C3+jY=
X-ME-Sender: <xms:gHpYWNpMhzsggYMtdZxFly9Kcn3ab3gVSvScrykLXNoYwknuKuzYuQ>
X-Sasl-enc: lDzjOsB7MgD7DJ+4+DVvt2bUm/gD0KSm/xZdKV929Q4w 1482193535
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8D1C224165;
 Mon, 19 Dec 2016 19:25:34 -0500 (EST)
Message-ID: <1482193531.3419.10.camel@aj.id.au>
Subject: Re: [PATCH linux 3/7] hwmon: occ: Add I2C transport implementation
 for SCOM operations
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Tue, 20 Dec 2016 10:55:31 +1030
In-Reply-To: <1481920519-6834-1-git-send-email-eajames.ibm@gmail.com>
References: <1481920519-6834-1-git-send-email-eajames.ibm@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-NP/EUmTnhNe/8RcD20XU"
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
X-List-Received-Date: Tue, 20 Dec 2016 00:25:39 -0000


--=-NP/EUmTnhNe/8RcD20XU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eddie,

Some minor comments below.

On Fri, 2016-12-16 at 14:35 -0600, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Add functions to send SCOM operations over I2C bus. The BMC can
> communicate with the Power8 host processor over I2C, but needs to use SCO=
M
> operations in order to access the OCC register space.
>=20
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> =C2=A0drivers/hwmon/occ/occ_scom_i2c.c | 67 +++++++++++++++++++++++++++++=
+++++++++++
> =C2=A0drivers/hwmon/occ/occ_scom_i2c.h | 26 ++++++++++++++++
> =C2=A02 files changed, 93 insertions(+)
> =C2=A0create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
> =C2=A0create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h
>=20
> diff --git a/drivers/hwmon/occ/occ_scom_i2c.c b/drivers/hwmon/occ/occ_sco=
m_i2c.c
> new file mode 100644
> index 0000000..70e0f51
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_scom_i2c.c
> @@ -0,0 +1,67 @@
> +/*
> + * occ_scom_i2c.c - hwmon OCC driver
> + *
> + * This file contains the functions for performing SCOM operations over =
I2C bus
> + * to access the OCC.
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
> +int occ_i2c_getscom(void *bus, u32 address, u8 *data)
> +{
> > +	ssize_t rc;
> > +	u64 buf;
> > +	struct i2c_client *client =3D bus;
> +
> +	rc =3D i2c_master_send(client, (const char *)&address, sizeof(u32));

=46rom the documentation: "Returns negative errno, or else the number of
bytes read"

> +	if (rc !=3D sizeof(u32))
> +		return -EIO;

So what we should probably be doing here is:

    if (rc >=3D 0 && rc !=3D sizeof(u32))
        return -EIO;
    else
        return rc;

> +
> > +	rc =3D i2c_master_recv(client, (char *)&buf, sizeof(u64));
> > +	if (rc !=3D sizeof(u64))
> +		return -EIO;

As above.

> +
> +	*((u64 *)data) =3D be64_to_cpu(buf);

Please change the getscom prototypes to take a u64 *. That way we can
get compiler warnings if caller code is broken.

> +
> > +	return 0;
> +}
> +EXPORT_SYMBOL(occ_i2c_getscom);
> +
> +int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)
> +{
> > +	u32 buf[3];
> > +	ssize_t rc;
> > +	struct i2c_client *client =3D bus;
> +
> > +	buf[0] =3D address;
> > +	buf[1] =3D data1;
> > +	buf[2] =3D data0;
> +
> > +	rc =3D i2c_master_send(client, (const char *)buf, sizeof(u32) * 3);
> > +	if (rc !=3D sizeof(u32) * 3)
> +		return -EIO;

See comment on error handling above.

> +
> > +	return 0;
> +}
> +EXPORT_SYMBOL(occ_i2c_putscom);
> +
> > +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("I2C OCC SCOM transport");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/occ/occ_scom_i2c.h b/drivers/hwmon/occ/occ_sco=
m_i2c.h
> new file mode 100644
> index 0000000..204eb4f
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_scom_i2c.h
> @@ -0,0 +1,26 @@
> +/*
> + * occ_scom_i2c.h - hwmon OCC driver
> + *
> + * This file contains function protoypes for peforming SCOM operations o=
ver I2C
> + * bus to access the OCC.
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
> +#ifndef __OCC_SCOM_I2C_H__
> +#define __OCC_SCOM_I2C_H__
> +
> +int occ_i2c_getscom(void *bus, u32 address, u8 *data);

so "u64 *data" here, and in scom.h.

> +int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1);
> +
> +#endif /* __OCC_SCOM_I2C_H__ */

Cheers,

Andrew
--=-NP/EUmTnhNe/8RcD20XU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYWHp7AAoJEJ0dnzgO5LT5QpEQAJ4FY1r3CDBdgnKZ6RfS3HKJ
hYkMYBKyqUxJWhAvskQzJbVf10D2c0WNml4Ch3gHm7jBTthdPWA45EHupUsOjoBt
oJIWJAK4masfs140Osx6uRK9kflOVHYOixK2DpfQ/IcEioO217uO/FJi0zBq3ffo
ldbP4O5RFzIUJspnxInyVXMSPNJnyfhwRunEO4Ty2X7F/wpX2JHDd1lynm6fZX5F
IQ3PCI9mKl7QC/Nr/0Rtbo5y4xvGMb6a+9g+jX97ghCtmTx8E8Fuun/JEEeRoW9v
8koGIQilOROzqpQXOuVbAzeGCa7idfGm7lvBu8loLjhO9YS0gMJ68vdzZIG8sUHM
S/pcZPRHiSzBjG1YTdv2OszwGrpuRHEuYu+gK86g21uKvKjHrc+PHm1PeL/NIGdL
o4m8XJNmz3Tv0kJoVj9spLMbvbl6Nskovh8w/Si8ix/viqrfhYDjtdeaxVMgkRtl
uNrSsnJ5aPE081r0hEmdVqnD3oM6aJkzpsGxbsLbhUwh04hmH4gc6olX3X+2x6Em
Yd0x5+IYQ9waJtI9Hag23YRP0xCQkQ1Ubvuu3B/pfFgFfF3OlvE47Ptg5a5gTAiW
Q1cE0u8DPnb04A+9ixTzmUpC1ZERTxDvjhe1eU2VQNTKZzO+ASGpIUJNF7mr2Rdt
SkzHmpMc31ljIDXBdoAO
=P4Uk
-----END PGP SIGNATURE-----

--=-NP/EUmTnhNe/8RcD20XU--
