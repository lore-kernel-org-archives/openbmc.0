Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tT1YB2HjVzDvqj
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 11:30:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gzzGi2+a"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="PZ5oVa2K"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2B241206C9;
 Tue, 29 Nov 2016 19:30:52 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 29 Nov 2016 19:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=3MYCni6sYNEvq6REqUlO7uFtGos=; b=gzzGi2
 +aUmepNBqPxWqhKdaAP/j2pTEksAgE+VZi9yISmVj61Z9hsOp30ewx8+9lNWd5vy
 bDj8bC+SsBwX68IulDMuAkJt/VOVO9ZNedR1OGNSeYYZkUTqK/zJjvwd0dSabVis
 QraT8H0OTJcBMHyjQJJylUUDqFH+fH8uyGJ+4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=3MYCni6sYNEvq6
 REqUlO7uFtGos=; b=PZ5oVa2KFivNZd1sam06unYLUK04lHyU5GrQI34HNS+AZH
 FwalKefh3qT38Xm8EePghfFEleJJ0DgcJDxHsYQ5rNApKwNrCuN1inx+W6XMw7Rb
 bdP8fxFR2f0e6KssYMrjfebC9xYMiAG0WZQAUZHvope6SmpAVrf13SRcw2FhI=
X-ME-Sender: <xms:vB0-WHAUNhZuPPA_Fw__laK2R9h7rzwW0Wzg4cM8No1EfkvQp0JrCw>
X-Sasl-enc: l6g0DGQqQ9ilwrpoD4zXlnNYHZZuvZ7WkmjuWalHWB87 1480465851
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id E57332413E;
 Tue, 29 Nov 2016 19:30:49 -0500 (EST)
Message-ID: <1480465843.2503.94.camel@aj.id.au>
Subject: Re: [RFC PATCH linux 4/9] hwmon: occ: Add I2C SCOM transport
 implementation
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames.ibm@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, "Edward A . James" <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 30 Nov 2016 11:00:43 +1030
In-Reply-To: <CALpMbd=F8Jj7ObkYog7paNyaEa5Qj-0PETBDd+faZGd8_MkVxQ@mail.gmail.com>
References: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
 <cover.1478835488.git.andrew@aj.id.au>
 <f9d045f67c7c79bbe7299cffd829d0848154a46c.1478835488.git.andrew@aj.id.au>
 <CALpMbd=F8Jj7ObkYog7paNyaEa5Qj-0PETBDd+faZGd8_MkVxQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-rOLkM28QQpuKeQ0pq8i+"
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
X-List-Received-Date: Wed, 30 Nov 2016 00:30:55 -0000


--=-rOLkM28QQpuKeQ0pq8i+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-29 at 16:59 -0600, Eddie James wrote:
> Hi Andrew,
>=20
> Just a general comment on this one. I'm not sure it's worth having an
> extra layer just to isolate these functions from the
> p8_i2c_getscom/putscom. Those just do the address shift for P8. But
> there's no situation where i2c is used that's not on the P8. So this
> seems like unnecessary complexity to me. I'm not sure, just a thought.

My perspective is that baking P8 knowledge into the I2C SCOM operations
 makes the code surprising. Maybe renaming the functions is enough,
something like p8_occ_getscom(). To me it doesn't seem like much cost
in complexity to separate the transport from implementation-specific
quirks with the addressing, and gaining a general approach in the
process.

Maybe Joel can weigh in here?

Andrew

>=20
> Thanks,
> Eddie
>=20
> > On Thu, Nov 10, 2016 at 10:12 PM, Andrew Jeffery <andrew@aj.id.au> wrot=
e:
> > The BMC queries the OCC on POWER8 chips with SCOMs over I2C.
> >=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0drivers/hwmon/occ/occ_scom_i2c.c | 68 +++++++++++++++++++++++++++=
+++++++++++++
> > =C2=A0drivers/hwmon/occ/occ_scom_i2c.h | 20 ++++++++++++
> > =C2=A02 files changed, 88 insertions(+)
> > =C2=A0create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
> > =C2=A0create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h
> >=20
> > diff --git a/drivers/hwmon/occ/occ_scom_i2c.c b/drivers/hwmon/occ/occ_s=
com_i2c.c
> > new file mode 100644
> > index 000000000000..b1a060331c4a
> > --- /dev/null
> > +++ b/drivers/hwmon/occ/occ_scom_i2c.c
> > @@ -0,0 +1,68 @@
> > +/*
> > + * occ_i2c.c - hwmon OCC driver
> > + *
> > + * This file contains the i2c layer for accessing the OCC over i2c bus=
.
> > + *
> > + * Copyright 2016 IBM Corp.
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> > + * it under the terms of the GNU General Public License as published b=
y
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0See=
 the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/i2c.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +
> > +#include "scom.h"
> > +#include "occ_scom_i2c.h"
> > +
> > +#define OCC_I2C_NAME=C2=A0=C2=A0=C2=A0"occ-p8-i2c"
> > +
> > +int occ_i2c_getscom(void *bus, u32 address, u8 *data, size_t offset)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ssize_t rc;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 buf;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i2c_client *client =
=3D bus;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rc =3D i2c_master_send(clien=
t, (const char *)&address, sizeof(u32));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rc !=3D sizeof(u32))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -SCOM_WRITE_ERROR;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rc =3D i2c_master_recv(clien=
t, (char *)&buf, sizeof(u64));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rc !=3D sizeof(u64))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -SCOM_READ_ERROR;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*((u64 *)&data[offset]) =3D =
be64_to_cpu(buf);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > +}
> > +EXPORT_SYMBOL(occ_i2c_getscom);
> > +
> > +int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 buf[3];
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ssize_t rc;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i2c_client *client =
=3D bus;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buf[0] =3D address;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buf[1] =3D data1;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buf[2] =3D data0;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rc =3D i2c_master_send(clien=
t, (const char *)buf, sizeof(u32) * 3);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rc !=3D sizeof(u32) * 3)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -SCOM_WRITE_ERROR;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > +}
> > +EXPORT_SYMBOL(occ_i2c_putscom);
> > +
> > > > +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> > +MODULE_DESCRIPTION("I2C OCC SCOM transport");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/hwmon/occ/occ_scom_i2c.h b/drivers/hwmon/occ/occ_s=
com_i2c.h
> > new file mode 100644
> > index 000000000000..92225f4cd584
> > --- /dev/null
> > +++ b/drivers/hwmon/occ/occ_scom_i2c.h
> > @@ -0,0 +1,20 @@
> > +/*
> > + * occ_i2c.c - hwmon OCC driver
> > + *
> > + * This file contains the i2c layer for accessing the OCC over i2c bus=
.
> > + *
> > + * Copyright 2016 IBM Corp.
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> > + * it under the terms of the GNU General Public License as published b=
y
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0See=
 the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +int occ_i2c_getscom(void *bus, u32 address, u8 *data, size_t offset);
> > +int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1);
> > --
> > 2.9.3
> >=20
--=-rOLkM28QQpuKeQ0pq8i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYPh20AAoJEJ0dnzgO5LT55v4P/ikKYXw+nDddzLT3+7h5seKF
FI0llaxRXkxyHa2xMzpp0YXhnpnD+YVn37OsnV1lj32E+Hlpbg2ucs+4O52PaMPk
HxITxXT4VGIsatmMzxXjtQIiSUUICASvaJQDzOsrlyH4XjPy+Jx+ojcsmxlSflFx
5MbfUoyfhCbSJ8tjn1uCaAztcc5JgoYHhtXKIdii5HuKLglsBR1ov03nNYF3QuLD
H8d33HPw1GX25d8uwzpRHEAKyM6HyW4B/qR0mwE/WXJg5TEZPtbLObxJKGFluNf9
vvTBXy5pA7K7o6huhgRda26Qv/jZ4lshbG111vydbcChQuYsa8hFUVXA5Qu9J38t
78huF+fzLYLp6kn+8f/trh3rH2KIEe9l+pCx61eU0cHZlJdEi6m13CREi8x+26ON
YKg3Vz5MgC/8L7wlx0I8adV1RW/lMrtFJnloBSR8Kx55u/cTN1/PFzosGgPeaSc6
DwtmHp6BnhSviIwhSr1rIWVDZNHN/SSVrCh89mrvFu7Z3e5WiB4QjdkR59UcRIZE
WGf8qsm39F+BYDUnoKM+lRQkQ/8D+Kf0mQFvi4snr96eJVocc7A3Hzr9T77yjNbt
SpShtk5PEhNYL1iZuDPkZmk2GRzInWtXEA8dClNNVzDJy3uYJfBzLJo9a19Sl0OD
0p0lhcY8H8cmsBXO+RrH
=MdaM
-----END PGP SIGNATURE-----

--=-rOLkM28QQpuKeQ0pq8i+--
