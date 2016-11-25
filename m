Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tQ35t05PlzDrPG
 for <openbmc@lists.ozlabs.org>; Fri, 25 Nov 2016 15:30:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BbTGwxZu"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OSg+FOEK"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C570C20774;
 Thu, 24 Nov 2016 23:30:23 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 24 Nov 2016 23:30:23 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=VkmjS3rzbe5VBJ6eeBcG8U4QxLw=; b=BbTGwx
 Zut+uP68Y5HJv4sSfoHkUqg2gkcqiD69ciSJyCq0Ne/PSpSnx/QC1y8mayw6bxxS
 2Jumi1YEJNE/ioNEmR6moqt/tYV34VrRI05qsV+39PIfHxEu7U0Y/oUIKWCEhLA0
 0oBYWrmvOa1HBqNpJgeifwJ7Ssmq0mgEvCtyk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=VkmjS3rzbe5VBJ
 6eeBcG8U4QxLw=; b=OSg+FOEKe6x+Phvw+hTeHPgKNnKbvI9sJxECa8W3guqKRX
 orEPu6vj8F0jJs0CzhMskWfn+y530l10MwekCQL41ZDqx9odGG9ftHbahQiYG6kQ
 j1dZ5g958Jk9rtRu5iI03I4X/yNOX4YvSfghUx6NNYZkMMjmpWXDD/prN7fUs=
X-ME-Sender: <xms:X743WLd_1PeqqS5YTRkchB8wJs9dmvQ0e3BN5fST2w_LN6-b5IfecA>
X-Sasl-enc: CBXTeAbZRq66jqi+WLGQxNdJ3nWLeSqBuzIo2a7AswXd 1480048222
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 46E992418C;
 Thu, 24 Nov 2016 23:30:22 -0500 (EST)
Message-ID: <1480048217.2503.57.camel@aj.id.au>
Subject: Re: [PATCH qemu 16/38] aspeed/smc: add tests for Command mode
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Fri, 25 Nov 2016 15:00:17 +1030
In-Reply-To: <1479478938-13267-17-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-17-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-XKwFFuzUbNFKZynS3L9E"
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
X-List-Received-Date: Fri, 25 Nov 2016 04:30:26 -0000


--=-XKwFFuzUbNFKZynS3L9E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-18 at 15:21 +0100, C=C3=A9dric Le Goater wrote:
> 0005 tests add a read_page_mem test
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0tests/m25p80-test.c | 86 ++++++++++++++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 86 insertions(+)
>=20
> diff --git a/tests/m25p80-test.c b/tests/m25p80-test.c
> index cb7ec81f1a6d..3d449bd194a9 100644
> --- a/tests/m25p80-test.c
> +++ b/tests/m25p80-test.c
> @@ -36,6 +36,9 @@
> =C2=A0#define=C2=A0=C2=A0=C2=A0CRTL_EXTENDED0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A00=C2=A0=C2=A0/* 32 bit addressing for SPI */
> =C2=A0#define R_CTRL0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A00x10
> =C2=A0#define=C2=A0=C2=A0=C2=A0CTRL_CE_STOP_ACTIVE=C2=A0=C2=A0(1 << 2)
> +#define=C2=A0=C2=A0=C2=A0CTRL_READMODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A00x0
> +#define=C2=A0=C2=A0=C2=A0CTRL_FREADMODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A00x1
> +#define=C2=A0=C2=A0=C2=A0CTRL_WRITEMODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A00x2
> =C2=A0#define=C2=A0=C2=A0=C2=A0CTRL_USERMODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A00x3
> =C2=A0
> =C2=A0#define ASPEED_FMC_BASE=C2=A0=C2=A0=C2=A0=C2=A00x1E620000
> @@ -76,6 +79,22 @@ static void spi_conf(uint32_t value)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(ASPEED_FMC_BASE + R_CONF, conf);
> =C2=A0}
> =C2=A0
> +static void spi_ce_ctrl(uint32_t value)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t conf =3D readl(ASPEED_FMC_BASE + R_CE_C=
TRL);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0conf |=3D value;
> +=C2=A0=C2=A0=C2=A0=C2=A0writel(ASPEED_FMC_BASE + R_CE_CTRL, conf);
> +}
> +
> +static void spi_ctrl_setmode(uint8_t mode, uint8_t cmd)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t ctrl =3D readl(ASPEED_FMC_BASE + R_CTRL=
0);
> +=C2=A0=C2=A0=C2=A0=C2=A0ctrl &=3D ~(CTRL_USERMODE | 0xff << 16);
> +=C2=A0=C2=A0=C2=A0=C2=A0ctrl |=3D mode | (cmd << 16);
> +=C2=A0=C2=A0=C2=A0=C2=A0writel(ASPEED_FMC_BASE + R_CTRL0, ctrl);
> +}
> +
> =C2=A0static void spi_ctrl_start_user(void)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t ctrl =3D readl(ASPEED_FMC_BASE + R=
_CTRL0);
> @@ -128,6 +147,18 @@ static void read_page(uint32_t addr, uint32_t *page)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spi_ctrl_stop_user();
> =C2=A0}
> =C2=A0
> +static void read_page_mem(uint32_t addr, uint32_t *page)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0int i;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* move out USER mode to use direct reads from t=
he AHB bus */
> +=C2=A0=C2=A0=C2=A0=C2=A0spi_ctrl_setmode(CTRL_READMODE, READ);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < PAGE_SIZE / 4; i++) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0page[i] =3D make_be32(re=
adl(ASPEED_FLASH_BASE + addr + i * 4));
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +}
> +
> =C2=A0static void test_erase_sector(void)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t some_page_addr =3D 0x600 * PAGE_SI=
ZE;
> @@ -195,6 +226,7 @@ static void test_write_page(void)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spi_ctrl_start_user();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
> +=C2=A0=C2=A0=C2=A0=C2=A0writeb(ASPEED_FLASH_BASE, WREN);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writeb(ASPEED_FLASH_BASE, PP);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(ASPEED_FLASH_BASE, make_be32(my_page=
_addr));
> =C2=A0
> @@ -217,6 +249,58 @@ static void test_write_page(void)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0}
> =C2=A0
> +static void test_read_page_mem(void)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t my_page_addr =3D 0x14000 * PAGE_SIZE; /=
* beyond 16MB */
> +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t some_page_addr =3D 0x15000 * PAGE_SIZE;
> +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t page[PAGE_SIZE / 4];
> +=C2=A0=C2=A0=C2=A0=C2=A0int i;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* Enable 4BYTE mode for flash. This is should b=
e strapped by HW
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* for CE0 anyhow.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> +=C2=A0=C2=A0=C2=A0=C2=A0spi_ce_ctrl(1 << CRTL_EXTENDED0);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* Check what was written */
> +=C2=A0=C2=A0=C2=A0=C2=A0read_page_mem(my_page_addr, page);
> +=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < PAGE_SIZE / 4; i++) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0g_assert_cmphex(page[i],=
 =3D=3D, my_page_addr + i * 4);
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* Check some other page. It should be full of 0=
xff */
> +=C2=A0=C2=A0=C2=A0=C2=A0read_page_mem(some_page_addr, page);
> +=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < PAGE_SIZE / 4; i++) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0g_assert_cmphex(page[i],=
 =3D=3D, 0xffffffff);
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +}
> +
> +static void test_write_page_mem(void)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t my_page_addr =3D 0x15000 * PAGE_SIZE;
> +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t page[PAGE_SIZE / 4];
> +=C2=A0=C2=A0=C2=A0=C2=A0int i;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* Enable 4BYTE mode for flash. This is should b=
e strapped by HW
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* for CE0 anyhow.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> +=C2=A0=C2=A0=C2=A0=C2=A0spi_ce_ctrl(1 << CRTL_EXTENDED0);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* move out USER mode to use direct writes to th=
e AHB bus */
> +=C2=A0=C2=A0=C2=A0=C2=A0spi_ctrl_setmode(CTRL_WRITEMODE, PP);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < PAGE_SIZE / 4; i++) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(ASPEED_FLASH_BASE=
 + my_page_addr + i * 4,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0make_be32(my_page_addr + i * 4));
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* Check what was written */
> +=C2=A0=C2=A0=C2=A0=C2=A0read_page_mem(my_page_addr, page);
> +=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < PAGE_SIZE / 4; i++) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0g_assert_cmphex(page[i],=
 =3D=3D, my_page_addr + i * 4);
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +}
> +
> +
> =C2=A0static char tmp_path[] =3D "/tmp/qtest.m25p80.XXXXXX";
> =C2=A0
> =C2=A0int main(int argc, char **argv)
> @@ -242,6 +326,8 @@ int main(int argc, char **argv)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qtest_add_func("/m25p80/erase_sector", test=
_erase_sector);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qtest_add_func("/m25p80/erase_all",=C2=A0=
=C2=A0test_erase_all);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qtest_add_func("/m25p80/write_page", test_w=
rite_page);
> +=C2=A0=C2=A0=C2=A0=C2=A0qtest_add_func("/m25p80/read_page_mem", test_rea=
d_page_mem);
> +=C2=A0=C2=A0=C2=A0=C2=A0qtest_add_func("/m25p80/write_page_mem", test_wr=
ite_page_mem);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D g_test_run();
> =C2=A0
--=-XKwFFuzUbNFKZynS3L9E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYN75aAAoJEJ0dnzgO5LT5G2AQAIN0EcWUhNtnZ0iJZhOf0cwe
kQ3BF6zJkw30j3p0D8MiYXQhqZNj56/Ch9euvpdzx+0LpCSvBXSdllyjBmFsa2aV
FrYBvVARPJSSnemKfKi8NjNuxW6rC7h2oA8nnQjgyh2RrNh7RouzRutQByZoPP7b
L1kLQi/3/9dMopV6RrbDHrFA42HqNmbahg0BUxmqA5tlf1UX0qncxhE+W2MhvKXp
BobEkcJjFTDZZfsCYZq33Hk9Ltr1diZvZ8A9nCtkjVoEhwWqiUPfcbDKU03rjJkH
72kguzR7FaEsGlO2Srguxsp5os2ajsVpLIOQHB16qC2iJUc/1qwnAuGBk3UeTE6b
Y9GOaAH2oMgqAB/GYhjSys1Kb0vKgBiLBWNhjkSrI+LaPnxtAuEOF91RpYRNDkL3
BZhJQqjnRuly0oD/6xNqWS+Eb9lInHb/54U/7FgvWl+XjIp0RTpv18w39JcUwhGR
HtLoDCNYxqZbwX/BoDfEpwYxjrveMdnmFrBcz+qmK4lC8ljA4jhDsc067SR4ghXi
HaHoqsnDBDv9P0JHZmWelRtwGJ7hfWy+L5mDd+zZbllesCYMHMPcbS9eIPzbHmHb
ZZMDO9gyW1nbT4j+DU5NxLmPR0RiDipg58igDfmFyCwHobLQYzMnut9vmzgPHDJz
EDX/kWlNpyo/Kd2yiFLl
=UjAP
-----END PGP SIGNATURE-----

--=-XKwFFuzUbNFKZynS3L9E--
