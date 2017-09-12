Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="tRlUTKns"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ou9P0UzN"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xrwyD67FYzDrJn
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 17:13:56 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 91E8E20C37;
 Tue, 12 Sep 2017 03:13:53 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 12 Sep 2017 03:13:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=W1yi1YDx4TwO+yTBNUQmwpucPE6QMeHFsBLCYuU50
 LQ=; b=tRlUTKnsu2v/YLc4qlvBmnvzeKu7VOrU+MtkynURdNC3+7pgJnSIZr533
 GJm5E8ma/hSt5HR19zZN5BreGQI3EvlFL4zdJqHsoQvLGL87x6aOVjVfKPZVTYLB
 0y6ao6lMWCe1BefHBkRSOBmbVQmrJNWJqwKg+vTwa+oCkqtZ7VC2CTlbCQ2+DcWS
 MNAGKUlXbiIV3Qh9/wTLEG2ex/D+l9oiMFMlXLwqKGPLuC/QsLZlZecNS1+ZkRLl
 QtL4bP+PUnRh1W5dvQLiIj22qM/gtRCduKGBzbzzcBqUHdWBu2K7wU0h/yn2LSZD
 pyQ3DusHRH8SA8OZ7rTs22fEPDUCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=W1yi1YDx4TwO+yTBNU
 QmwpucPE6QMeHFsBLCYuU50LQ=; b=ou9P0UzN0c47takMipNUZyazOOJS0eis1w
 w62/s0vMIeGujQs7EXETwJA6iKn+NRLk8YIXyP1qjifv2fqDXakKtdWWZCta6Sh2
 SOMj51QsIp4p4wL4pcQF7l0sdIoIeMn0ZioKn7Spli+tlCs0RwZLeTtuRpvznMRh
 w0onwfQy136QA9/nExY4A/ZMnGj8Kmux8dYuutuLFi11BLmVuLeQD5vOGf0C6gxw
 XAUBzw3jkMOUi9mufiFNhVKj4am5fneGhX00SSAIDdIXzdSjVAGwqGTIckGST2x4
 T1R6YjIb3bbhIBHDwppw916fuvlCkHb6wLoxuVb2jqqwapYWgXZQ==
X-ME-Sender: <xms:MYm3WXXQwa4Mx4GOwtLTr74VrdUb5vIQDQEBsl58C07egDYpkQd_Ag>
X-Sasl-enc: iCCU7ESGCKCiUX6T5S08kStqfUWvybfcH5w2BxhXAccG 1505200432
Received: from keelia16 (ppp14-2-0-125.bras21.adl4.internode.on.net
 [14.2.0.125])
 by mail.messagingengine.com (Postfix) with ESMTPA id 56ADF7F066;
 Tue, 12 Sep 2017 03:13:52 -0400 (EDT)
Message-ID: <1505200428.4080.4.camel@aj.id.au>
Subject: Re: [PATCH qemu] aspeed: add support for the witherspoon-bmc board
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Tue, 12 Sep 2017 16:43:48 +0930
In-Reply-To: <20170911091643.25203-1-clg@kaod.org>
References: <20170911091643.25203-1-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-zXBsJhgga28m+uosaAI7"
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
X-List-Received-Date: Tue, 12 Sep 2017 07:13:57 -0000


--=-zXBsJhgga28m+uosaAI7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-09-11 at 11:16 +0200, C=C3=A9dric Le Goater wrote:
> The Witherspoon boards are OpenPOWER system hosting a POWER9
> Processor. Let's add support for their BMC including a couple
> of I2C devices as found on real HW.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks, applied to master.

Andrew

> ---
> =C2=A0hw/arm/aspeed.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 62 insertions(+)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 02c0c1613c86..484ae1003d26 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -46,6 +46,7 @@ enum {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PALMETTO_BMC,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AST2500_EVB,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ROMULUS_BMC,
> +=C2=A0=C2=A0=C2=A0=C2=A0WITHERSPOON_BMC,
> =C2=A0};
> =C2=A0
> =C2=A0/* Palmetto hardware value: 0x120CE416 */
> @@ -83,9 +84,13 @@ enum {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SCU_AST2500_HW_STRA=
P_ACPI_ENABLE |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SCU_HW_STRAP_SPI_MO=
DE(SCU_HW_STRAP_SPI_MASTER))
> =C2=A0
> +/* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) *=
/
> +#define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
> +
> =C2=A0static void palmetto_bmc_i2c_init(AspeedBoardState *bmc);
> =C2=A0static void ast2500_evb_i2c_init(AspeedBoardState *bmc);
> =C2=A0static void romulus_bmc_i2c_init(AspeedBoardState *bmc);
> +static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc);
> =C2=A0
> =C2=A0static const AspeedBoardConfig aspeed_boards[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[PALMETTO_BMC] =3D {
> @@ -112,6 +117,14 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_cs=C2=A0=C2=A0=
=C2=A0=C2=A0=3D 2,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.i2c_init=C2=A0=C2=
=A0=3D romulus_bmc_i2c_init,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> +=C2=A0=C2=A0=C2=A0=C2=A0[WITHERSPOON_BMC]=C2=A0=C2=A0=3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.soc_name=C2=A0=C2=A0=3D=
 "ast2500-a1",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hw_strap1 =3D WITHERSPO=
ON_BMC_HW_STRAP1,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.fmc_model =3D "mx25l256=
35e",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.spi_model =3D "mx66l1g4=
5g",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_cs=C2=A0=C2=A0=C2=
=A0=C2=A0=3D 2,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.i2c_init=C2=A0=C2=A0=3D=
 witherspoon_bmc_i2c_init,
> +=C2=A0=C2=A0=C2=A0=C2=A0},
> =C2=A0};
> =C2=A0
> =C2=A0#define FIRMWARE_ADDR 0x0
> @@ -347,11 +360,60 @@ static const TypeInfo romulus_bmc_type =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.class_init =3D romulus_bmc_class_init,
> =C2=A0};
> =C2=A0
> +static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSoCState *soc =3D &bmc->soc;
> +=C2=A0=C2=A0=C2=A0=C2=A0DeviceState *dev;
> +=C2=A0=C2=A0=C2=A0=C2=A0uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc-=
>i2c), 3), "pca9552", 0x60);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc-=
>i2c), 4), "tmp423", 0x4c);
> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc-=
>i2c), 5), "tmp423", 0x4c);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc-=
>i2c), 9), "tmp105", 0x4a);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc-=
>i2c), 11), "rx8900", 0x32);
> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc-=
>i2c), 11), "pca9552",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x60);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0dev =3D qdev_create((BusState *) aspeed_i2c_get_=
bus(DEVICE(&soc->i2c), 11),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"smbus-eeprom")=
;
> +=C2=A0=C2=A0=C2=A0=C2=A0qdev_prop_set_uint8(dev, "address", 0x51);
> +=C2=A0=C2=A0=C2=A0=C2=A0qdev_prop_set_ptr(dev, "data", eeprom_buf);
> +=C2=A0=C2=A0=C2=A0=C2=A0qdev_init_nofail(dev);
> +}
> +
> +static void witherspoon_bmc_init(MachineState *machine)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_board_init(machine, &aspeed_boards[WITHER=
SPOON_BMC]);
> +}
> +
> +static void witherspoon_bmc_class_init(ObjectClass *oc, void *data)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0MachineClass *mc =3D MACHINE_CLASS(oc);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->desc =3D "OpenPOWER Witherspoon BMC (ARM1176=
)";
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->init =3D witherspoon_bmc_init;
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->max_cpus =3D 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->no_sdcard =3D 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->no_floppy =3D 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->no_cdrom =3D 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->no_parallel =3D 1;
> +}
> +
> +static const TypeInfo witherspoon_bmc_type =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0.name =3D MACHINE_TYPE_NAME("witherspoon-bmc"),
> +=C2=A0=C2=A0=C2=A0=C2=A0.parent =3D TYPE_MACHINE,
> +=C2=A0=C2=A0=C2=A0=C2=A0.class_init =3D witherspoon_bmc_class_init,
> +};
> +
> =C2=A0static void aspeed_machine_init(void)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0type_register_static(&palmetto_bmc_type);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0type_register_static(&ast2500_evb_type);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0type_register_static(&romulus_bmc_type);
> +=C2=A0=C2=A0=C2=A0=C2=A0type_register_static(&witherspoon_bmc_type);
> =C2=A0}
> =C2=A0
> =C2=A0type_init(aspeed_machine_init)
--=-zXBsJhgga28m+uosaAI7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZt4ktAAoJEJ0dnzgO5LT5gboP/iHU7xs1LXiwTJo1bdZA1iOe
d12n4L5WLa5JW8hy0Ep1ZuxeuX0HfSIwxe5Lohxxj4+XTF94RdVo0yssocSP+Rgp
eJLkxPswfpek1iEX0qNrMoClqL+nCYUP3RShuA9ck/rcloSJdtVNigt1DsFfr/et
J3DaGNQjWIbKI1hPVP1LtgP0gJOrt/bC2LIhl5YatkcYfPX95S/60YhkLbpwV9/5
UzjdsgrjES37cO7jWD+J7ek+hGk9lM2l42LExx2WCb7mr0aHdA6pfiwIOeDqB4/8
OT5PNzaNekFoJ1cQBM/BQW/9TULMD3El1zeA7o45ANPJK/mtu2MoOIyIT4HNpmWK
gTy2FqyG00Lb07skybiph+XZwgMi0w8cqwF4vp7n6MSHmZg0nJxbeYeYK9vwjLDX
xWuDItVcd5JKXYQAmaOcydbNtC5qGiZaf3tZ/A4TNMyryMlywzVbBT3at9A9dUjG
tT2a58n4BG7OQoIK14zgZWDgid01MiSWkfBnFly2z3HIY5F47xnY96sgea37eua9
pWiJ6CsgxvOzhPOMrFSy7rcBmyalBuXwBHlxmKgs5zEhMV/awIrvY3rfQJD0LGv/
6iE8cqN2ze2u95Iq6QTTj8X9X5hKxi9uWtuu+1Qs5MUxzcr9Xl7kEybYQ4Z2nVHZ
KVO3d8RzbMUMPeoo3Ccv
=yyjH
-----END PGP SIGNATURE-----

--=-zXBsJhgga28m+uosaAI7--
