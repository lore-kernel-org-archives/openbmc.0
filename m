Return-Path: <andrew@aj.id.au>
Received: from homiemail-a12.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 8CA8D1A0609
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 11:57:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=YMtl+5pp; 
 dkim-atps=neutral
Received: from homiemail-a12.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a12.g.dreamhost.com (Postfix) with ESMTP id 28C33103006C;
 Sun, 21 Feb 2016 16:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=3UHUFFQCrXUywy0MwPdsp
 sgit1I=; b=YMtl+5ppudPvZhCSiZAIiDfNYyXT6TNiPJcrGIKYmwgvqodJY3hxZ
 hvrZtaMKrS8+5/bm0KPSovtre3qwZod/R5SMHBEgx391n8OK8/Z3kP0+VlhMS7qS
 JdYrSOSrbePlMr8lqvKZuKEwkxMDnZjoPERGYks6dBraNOOS1HQ3/c=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a12.g.dreamhost.com (Postfix) with ESMTPSA id 6247D103006A;
 Sun, 21 Feb 2016 16:57:25 -0800 (PST)
Message-ID: <1456102639.3064.19.camel@aj.id.au>
Subject: Re: [PATCH linux v2] mtd: spi-nor: aspeed-smc: Use io string
 accessors to fifo
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Mon, 22 Feb 2016 11:27:19 +1030
In-Reply-To: <1455909028-21559-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455909028-21559-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455909028-21559-2-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-zw3TzQbF8Gaa02P3Lh9J"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Feb 2016 00:57:31 -0000


--=-zw3TzQbF8Gaa02P3Lh9J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think the change of direction in the {to,from}_fifo implementations
improves the readability. Thanks!

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

On Fri, 2016-02-19 at 13:10 -0600, OpenBMC Patches wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>=20
> Make and use new routines to access the fifo when in user mode.
> Instead of using memcpy_fromio, base the new routines on the io
> port string accessors.
>=20
> When the smc controllers are configured to transfer in user mode,
> the exact address within the chip select region is ignored and
> all valid data bytes are sent to the device fifo.  It has been
> determined the reason _memcpy_fromio, an arm specific byte-by-byte
> variant of memcpy_fromio was required in read_reg, is that the
> later will stutter when coping from memory, discarding some
> bytes read, when switching from words to bytes for the final
> unaligned length.
>=20
> This change includes a hack to make inw/outw work.  The default
> generic IO_SPACE_LIMIT is 0, and twenty bits when PCI is selected.
> While there is a PCMCIA SOC config to select the full 4GB space it
> would bring in the PCMCIA core for no use to the ast2400.  We want
> to be part of the generic multi-platform arm kernel and therefore
> mach/io.h is not going to work.  However, the limit is under an
> ifndef, so define it in this file an check it was not redefine
> at probe time.  To avoid redefinition errors or warnings, guard
> the setting with CONFIG_ARM for cross-arch compile testing and
> with a Kconfig dependency for arm cross-compile tests.  While some
> other architecture may not accept unsigned long addresses as ioport
> cookies, that can be addressed when, if ever, the hardware appears
> on another arch.
>=20
> While the change to use the designed-for-memory optimised copy
> template, even reusing the bytes of memcpy, was a recent change
> and only for little endian arm, designing and proposing a patch
> will take some time and there could be debate if the routine
> needs to work on changing memory.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
>  drivers/mtd/spi-nor/Kconfig      |   2 +
>  drivers/mtd/spi-nor/aspeed-smc.c | 120
> ++++++++++++++++++++++++++++++++++++---
>  2 files changed, 113 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi
> -nor/Kconfig
> index c7554d8..4a963c4 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -44,6 +44,8 @@ config ASPEED_FLASH_SPI
>  	tristate "Aspeed flash controllers in SPI mode"
>  	depends on HAS_IOMEM && OF
>  	depends on ARCH_ASPEED || COMPILE_TEST
> +	# IO_SPACE_LIMIT must be equivalent to (~0UL)
> +	depends on !NEED_MACH_IO_H
>  	help
>  	  This enables support for the New Static Memory Controller
> (FMC)
>  	  in the AST2400 when attached to SPI nor chips, and support
> for
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi
> -nor/aspeed-smc.c
> index 9dd4609..af8df0a 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -8,6 +8,12 @@
>   *
>   */
> =20
> +/* See comment by aspeed_smc_from_fifo */
> +#ifdef CONFIG_ARM
> +#define IO_SPACE_LIMIT (~0UL)
> +#endif
> +
> +#include <linux/bug.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -19,6 +25,94 @@
>  #include <linux/of_platform.h>
>  #include <linux/sysfs.h>
> =20
> +/*
> + * On the arm architecture, as of Linux version 4.3, memcpy_fromio
> + * stutters discarding some of the bytes read if the destination is
> + * unaligned, so we can't use it for reading from a fifo to a buffer
> + * of unknown alignment.  Instead use the ins (l, w, b) family
> + * to read from the fifo.   However, ARM tries to hide io port
> + * accesses from drivers unless there is a PCMCIA or PCI device, so
> + * we define the limit before all include files.  There is a
> + * check in probe to make sure this will work, as long as the
> + * architecture uses an identity iomap.
> + */
> +
> +static void aspeed_smc_from_fifo(void *buf, const void __iomem *iop,
> size_t len)
> +{
> +	unsigned long io =3D (__force unsigned long)iop;
> +
> +	if (!len)
> +		return;
> +
> +	/* Expect a 4 byte input port.  Otherwise just read bytes */
> +	if (unlikely(io & 3)) {
> +		insb(io, buf, len);
> +		return;
> +	}
> +
> +	/* Align target to word: first byte then half word */
> +	if ((unsigned long)buf & 1) {
> +		*(u8 *)buf =3D inb(io);
> +		buf++;
> +		len--;
> +	}
> +	if (((unsigned long)buf & 2) && (len >=3D 2)) {
> +		*(u16 *)buf =3D inw(io);
> +		buf +=3D 2;
> +		len -=3D 2;
> +	}
> +	/* Transfer words, then remaining halfword and remaining
> byte */
> +	if (len >=3D 4) {
> +		insl(io, buf, len >> 2);
> +		buf +=3D len & ~3;
> +	}
> +	if (len & 2) {
> +		*(u16 *)buf =3D inw(io);
> +		buf +=3D 2;
> +	}
> +	if (len & 1) {
> +		*(u8 *)buf =3D inb(io);
> +	}
> +}
> +
> +static void aspeed_smc_to_fifo(void __iomem *iop, const void *buf,
> size_t len)
> +{
> +	unsigned long io =3D (__force unsigned long)iop;
> +
> +	if (!len)
> +		return;
> +
> +	/* Expect a 4 byte output port.  Otherwise just write bytes
> */
> +	if (io & 3) {
> +		outsb(io, buf, len);
> +		return;
> +	}
> +
> +	/* Align target to word: first byte then half word */
> +	if ((unsigned long)buf & 1) {
> +		outb(*(u8 *)buf, io);
> +		buf++;
> +		len--;
> +	}
> +	if (((unsigned long)buf & 2) && (len >=3D 2)) {
> +		outw(*(u16 *)buf, io);
> +		buf +=3D 2;
> +		len -=3D 2;
> +	}
> +	/* Transfer words, then remaining halfword and remaining
> byte */
> +	if (len >=3D 4) {
> +		outsl(io, buf, len >> 2);
> +		buf +=3D len & ~(size_t)3;
> +	}
> +	if (len & 2) {
> +		outw(*(u16 *)buf, io);
> +		buf +=3D 2;
> +	}
> +	if (len & 1) {
> +		outb(*(u8 *)buf, io);
> +	}
> +}
> +
>  enum smc_flash_type {
>  	smc_type_nor =3D 0,	/* controller connected to nor
> flash */
>  	smc_type_nand =3D 1,	/* controller connected to nand
> flash */
> @@ -165,8 +259,8 @@ static int aspeed_smc_read_reg(struct spi_nor
> *nor, u8 opcode, u8 *buf, int len)
>  	struct aspeed_smc_chip *chip =3D nor->priv;
> =20
>  	aspeed_smc_start_user(nor);
> -	writeb(opcode, chip->base);
> -	_memcpy_fromio(buf, chip->base, len);
> +	aspeed_smc_to_fifo(chip->base, &opcode, 1);
> +	aspeed_smc_from_fifo(buf, chip->base, len);
>  	aspeed_smc_stop_user(nor);
> =20
>  	return 0;
> @@ -178,8 +272,8 @@ static int aspeed_smc_write_reg(struct spi_nor
> *nor, u8 opcode, u8 *buf,
>  	struct aspeed_smc_chip *chip =3D nor->priv;
> =20
>  	aspeed_smc_start_user(nor);
> -	writeb(opcode, chip->base);
> -	_memcpy_toio(chip->base, buf, len);
> +	aspeed_smc_to_fifo(chip->base, &opcode, 1);
> +	aspeed_smc_to_fifo(chip->base, buf, len);
>  	aspeed_smc_stop_user(nor);
> =20
>  	return 0;
> @@ -202,12 +296,12 @@ static void aspeed_smc_send_cmd_addr(struct
> spi_nor *nor, u8 cmd, u32 addr)
>  		cmdaddr |=3D (u32)cmd << 24;
> =20
>  		temp =3D cpu_to_be32(cmdaddr);
> -		memcpy_toio(chip->base, &temp, 4);
> +		aspeed_smc_to_fifo(chip->base, &temp, 4);
>  		break;
>  	case 4:
>  		temp =3D cpu_to_be32(addr);
> -		writeb(cmd, chip->base);
> -		memcpy_toio(chip->base, &temp, 4);
> +		aspeed_smc_to_fifo(chip->base, &cmd, 1);
> +		aspeed_smc_to_fifo(chip->base, &temp, 4);
>  		break;
>  	}
>  }
> @@ -219,7 +313,7 @@ static int aspeed_smc_read_user(struct spi_nor
> *nor, loff_t from, size_t len,
> =20
>  	aspeed_smc_start_user(nor);
>  	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
> -	memcpy_fromio(read_buf, chip->base, len);
> +	aspeed_smc_from_fifo(read_buf, chip->base, len);
>  	*retlen +=3D len;
>  	aspeed_smc_stop_user(nor);
> =20
> @@ -233,7 +327,7 @@ static void aspeed_smc_write_user(struct spi_nor
> *nor, loff_t to, size_t len,
> =20
>  	aspeed_smc_start_user(nor);
>  	aspeed_smc_send_cmd_addr(nor, nor->program_opcode, to);
> -	memcpy_toio(chip->base, write_buf, len);
> +	aspeed_smc_to_fifo(chip->base, write_buf, len);
>  	*retlen +=3D len;
>  	aspeed_smc_stop_user(nor);
>  }
> @@ -292,6 +386,14 @@ static int aspeed_smc_probe(struct
> platform_device *dev)
>  	int err =3D 0;
>  	unsigned int n;
> =20
> +	/*
> +	 * This driver passes ioremap addresses to io port
> accessors.
> +	 * This works on arm if the IO_SPACE_LIMIT does not truncate
> +	 * the address.
> +	 */
> +	if (~(unsigned long)IO_SPACE_LIMIT)
> +		return -ENODEV;
> +
>  	match =3D of_match_device(aspeed_smc_matches, &dev->dev);
>  	if (!match || !match->data)
>  		return -ENODEV;
--=-zw3TzQbF8Gaa02P3Lh9J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWylzvAAoJEJ0dnzgO5LT5OTEP/1H8Qmt7G4R+CzbFVtDnPMYP
iHjQvl/RFuOsSoTJsvXNy3sx+g63o3XluyDZjlFzsD0qX+rrn/aGDYFSjjIg3z7I
d4SVS2Tpty4+9JSY9I3+lLkyna3vErocnG6AYAPi7S0Kl0+kl1Wg8fcx0jFCTILh
qwh2LQ+jFxZFo11FrUkkYQEWmDNOHWQIGtZQYbSQCp4TGUILhlTppLt2nRg1ueov
heI+l8FA4t38dA3rGqHnryvt6p0woX5ga76/zXfkI2Fi2+QwTFl0DqK10hs9ULme
fIHZx4kP/q5a2/soCYOCe+p9VogFto6OmKjgcbRYLvPnVfL0CtpCAfi5gwNgGKPD
1vr9/xO5JeuUB03WN4dZubHwzRkpuaWc6VNoVTAUxZh2eNn3V1FlZMV3JYRhwKLs
XG20n3Vm7Yk7HfTgLGG9lTipAnzsjDPerM9EmrDHoguleRQAXQgwe40N1zTajTvU
9jq6fpwT3uqDuzDIcwg19Dy2VV3b8LBGeB4P/5EwhTcGgh55NUDDgSV0t/HJZvmz
BY7TkalRd1DojkYS5U1U3qww3mrQvPQ0yHrcCNhr05buGWJ6T6i+F4mZQMMO1nCF
Ka/mODHr2Ba5C3aPtbSGVTA9s1Jd/pPltvNfW33F1dFF3qTbBA1PRvtyrcqTRD1m
ByA9UrOsPe7a2cdlQWtn
=pnXY
-----END PGP SIGNATURE-----

--=-zw3TzQbF8Gaa02P3Lh9J--
