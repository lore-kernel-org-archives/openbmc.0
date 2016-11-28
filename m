Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tRqkb3S6bzDvjt
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 13:04:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WzJA86eg"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QE4u7Uwa"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5E56A208EA;
 Sun, 27 Nov 2016 21:04:53 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 27 Nov 2016 21:04:53 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=1sAyaEnWxxCEzJYVqZUrPXAzs1I=; b=WzJA86
 ege5DyiVPo4UJ+8GGTWnNAb69hV85a6Q6czAnjGdtr9kqfa71TmaIKxQqQfPkcJ6
 mrE1Q+3pxEC0H1C/o8tmrlmUtWY3Mzj0xK2N/rcdGaNXj2qk5jhQ3UIGuTsnQenG
 X5Oe0UkjQNl4cNUER6SKTc4UlAR9SobkLniX0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=1sAyaEnWxxCEzJ
 YVqZUrPXAzs1I=; b=QE4u7UwaKHsf/3Z3+EvgP4A+7mLT894y3IG4sjEUy0eZnP
 fs58dqBE8qoXYXGp4IbIABk7OUWxRXShJxdrqfiFEhpPQl4QQ67RTP68MLlD6occ
 w6PwmeHxqkruFK5XZ6kZ4F7frlPT5GF4l/w6uWJs6FgO6NEJZgr0VkyIf3qVc=
X-ME-Sender: <xms:xZA7WGS9q4amkrb3TwLiIxwsdwOrcgNc6QG5rfKT6QekaT07WSmHcw>
X-Sasl-enc: jEc1uMmog0NbxWsBNy69/iPB+pnr8RNBJLKpWFA6n6u4 1480298692
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id E1E212453C;
 Sun, 27 Nov 2016 21:04:51 -0500 (EST)
Message-ID: <1480298688.2503.71.camel@aj.id.au>
Subject: Re: [PATCH qemu 28/38] aspeed: add a temp sensor device on I2C bus 3
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 28 Nov 2016 12:34:48 +1030
In-Reply-To: <10d7a71f-d37a-705d-300c-7630f74f35ae@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-29-git-send-email-clg@kaod.org>
 <10d7a71f-d37a-705d-300c-7630f74f35ae@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-9Z6NjmGRCmcei+pUJbbd"
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
X-List-Received-Date: Mon, 28 Nov 2016 02:04:56 -0000


--=-9Z6NjmGRCmcei+pUJbbd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-22 at 17:57 +0100, C=C3=A9dric Le Goater wrote:
> On 11/18/2016 03:22 PM, C=C3=A9dric Le Goater wrote:
> > Temperatures can be changed from the monitor with :
> >=20
> > 	(qemu) qom-set /machine/unattached/device[2] temperature0 12000
>=20
>=20
> These devices should be defined at the machine level, in palmetto_bmc_ini=
t(),=C2=A0
> and not at the SoC level.=C2=A0

Agreed. Did you see my comments on Alistair's RTC patch along these
lines?

Andrew

>=20
> C.
>=20
> > > > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > ---
> > =C2=A0hw/arm/aspeed_soc.c | 8 ++++++++
> > =C2=A01 file changed, 8 insertions(+)
> >=20
> > diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> > index 24354f700115..2aa15d90cc31 100644
> > --- a/hw/arm/aspeed_soc.c
> > +++ b/hw/arm/aspeed_soc.c
> > @@ -268,6 +268,14 @@ static void aspeed_soc_realize(DeviceState *dev, E=
rror **errp)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c=
), 0,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
qdev_get_gpio_in(DEVICE(&s->vic), 12));
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0/* add a TMP423 temperature sensor */
> > +=C2=A0=C2=A0=C2=A0=C2=A0dev =3D i2c_create_slave(aspeed_i2c_get_bus(DE=
VICE(&s->i2c), 2),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0"tmp423", 0x4c);
> > +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(dev), 31000, "t=
emperature0", &err);
> > +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(dev), 28000, "t=
emperature1", &err);
> > +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(dev), 20000, "t=
emperature2", &err);
> > +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(dev), 110000, "=
temperature3", &err);
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* FMC */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fmc_num_cs =3D aspeed_fmc_get_cs(s, &err)=
;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> >=20
>=20
>=20
--=-9Z6NjmGRCmcei+pUJbbd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYO5DAAAoJEJ0dnzgO5LT5GQsQALVy3Ri8wQkiQ7cJG8oKjojx
pW+JDt0yfQLv6W2mlm5a6gmKlXAUfoVCyNzv2FsHn2fJEekwSvirQQmNs8VdUJg3
YaVyY7IAfggv94nr3vc53N7w2pAwN8E0XWu56Qeigbw0H37vPiJwqk7q3NEI6BtD
y6OJKyoyajMY4xPSTKbfq3zpAIYtIMyYSZPJbvGkmk1m7hvrBV3rjgo2oVgMqmu+
qrtMT+cseO3UPJXIIps9cNRDvLx61C7wZKeT4jj+7rbvYaB6U7ZaJMD4q5GG6eg5
6N9JOyj7DFrbneDHeqH7EB/A/ujcRFQAhNJbiz6HivAmy+fSaVXiuJgOgLx10wnX
kxOM1wh9Gs9UcfohJj+/srscIS9zBGSzGrWxUu3T3DQtw+PfUwfaz0XQ3bkMSIOc
G0+y9LN5rjyXGNpdQzpxkoYjwuCfgIpmlnKgu7B8rQXfEiDWkBOUY957be26ElFS
XLsmTuHkJB1DmK/o31Jm0MFu2nDyrXRK0yz0kp35leE3ehxqmxa9g854Rmulh8T+
6kEcunwcwxt/xPDb1/6dWuqkJMele3MTGyiwnKOzY9nfnbD86XhTOiab1WIhzI85
IteHu+UauclZnQMIpGZYaLZ4mr4FRmrLGbiBqm/jwGTyfvbofaujH3TbckVOgGEI
0oO14WHncmUhZYy0O2Iv
=GX9x
-----END PGP SIGNATURE-----

--=-9Z6NjmGRCmcei+pUJbbd--
