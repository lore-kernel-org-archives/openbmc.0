Return-Path: <andrew@aj.id.au>
Received: from homiemail-a15.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 768E01A002B
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 13:59:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Z/li2RWu; 
 dkim-atps=neutral
Received: from homiemail-a15.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTP id 8FD5D76C069;
 Thu, 11 Feb 2016 18:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=K7idPhdXEyCZ9Q55N5U5n
 NiWDTI=; b=Z/li2RWuvxvBqGoB1ecBkmJevKnkK7TBIPRsqkk37SawSR6G4patR
 BrnIYWT+bcgaKjRXpciKnXebP1I3choDhO3kOhUMxQPJX1eKs9BDQhxIOjWif0vR
 XDPjKElN6TZ7GaGmE5/VYmyNY7MtneFhafrkXhw1gSY6jkE2CFGkco=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPSA id C3DA476C065;
 Thu, 11 Feb 2016 18:59:39 -0800 (PST)
Message-ID: <1455245970.24478.26.camel@aj.id.au>
Subject: Re: [PATCH linux] mtd: spi-nor: aspeed-smc: Use io string accessors
 to fifo
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Fri, 12 Feb 2016 13:29:30 +1030
In-Reply-To: <1455162625-11142-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455162625-11142-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455162625-11142-2-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-lOjTNQXkiTPTJQKG/GKv"
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
X-List-Received-Date: Fri, 12 Feb 2016 02:59:43 -0000


--=-lOjTNQXkiTPTJQKG/GKv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Milton,

Excuse the unnecessary quote markers that might appear through the
patch, my mail client (Evolution) seems to have a mind of its own
sometimes. Starting to shave that yak. Anyway.

As an aside I've tested an earlier version of the code and confirmed
the approach works (i.e. no JFFS2 corruption on re-mount).

On Wed, 2016-02-10 at 21:50 -0600, OpenBMC Patches wrote:
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
> other architecture may not accept unsigne

typo: unsigned

>  long addresses as ioport
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
>  drivers/mtd/spi-nor/aspeed-smc.c | 142 +++++++++++++++++++++++++++++++++=
+++---
>  2 files changed, 135 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index c7554d8..4a963c4 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -44,6 +44,8 @@ config ASPEED_FLASH_SPI
>  > 	> tristate "Aspeed flash controllers in SPI mode"
>  > 	> depends on HAS_IOMEM && OF
>  > 	> depends on ARCH_ASPEED || COMPILE_TEST
> +> 	> # IO_SPACE_LIMIT must be equivalent to (~0UL)
> +> 	> depends on !NEED_MACH_IO_H
>  > 	> help
>  > 	>   This enables support for the New Static Memory Controller (FMC)
>  > 	>   in the AST2400 when attached to SPI nor chips, and support for
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspee=
d-smc.c
> index 9dd4609..74127d8 100644
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
> +#include=20
>  #include=20
>  #include=20
>  #include=20
> @@ -19,6 +25,116 @@
>  #include=20
>  #include=20
> =20
> +#include=20
> +
> +static void *ins_align(unsigned long io, void *buf, size_t len)
> +{
> +> 	> BUILD_BUG_ON(0 & len & ~3);

Should just be BUG_ON()? Given that you disabled it with '0 &', do we
want it at all?

> +
> +> 	> if (len & 2) {
> +> 	> 	> put_unaligned(inw(io), (u16 *)buf);
> +> 	> 	> buf +=3D sizeof(u16);
> +> 	> }
> +> 	> if (len & 1) {
> +> 	> 	> put_unaligned(inb(io), (u8 *)buf);
> +> 	> 	> buf +=3D sizeof(u8);
> +> 	> }
> +> 	> return buf;
> +}
> +
> +static const void *outs_align(unsigned long io, const void *buf, size_t =
len)
> +{
> +> 	> BUILD_BUG_ON(0 & len & ~3);

As above

> +	if (len & 2) {
> +> 	> 	> outw(get_unaligned((u16 *)buf), io);
> +> 	> 	> buf +=3D sizeof(u16);
> +> 	> }
> +> 	> if (len & 1) {
> +> 	> 	> outb(get_unaligned((u8 *)buf), io);
> +> 	> 	> buf +=3D sizeof(u8);
> +> 	> }
> +> 	> return buf;
> +}
> +
> +
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
> +static void aspeed_smc_from_fifo(void *buf, const void __iomem *iop, siz=
e_t len)
> +{
> +> 	> unsigned long io =3D (__force unsigned long)iop;
> +
> +> 	> if (io & 1) {
> +> 	> 	> insb(io, buf, len);
> +> 	> } else if ((unsigned long)io & 2) {
> +> 	> 	> size_t l =3D (2 - (unsigned long)buf) & 1;
> +
> +> 	> 	> l =3D min(l, len);
> +> 	> 	> buf =3D ins_align(io, buf, l);
> +> 	> 	> len -=3D l;
> +
> +> 	> 	> if (len >=3D 2) {
> +> 	> 	> 	> insw(io, buf, len >> 1);
> +> 	> 	> 	> buf +=3D len & ~1;
> +> 	> 	> }
> +> 	> 	> buf =3D ins_align(io, buf, len & 1);
> +> 	> } else {
> +> 	> 	> size_t l =3D (4 - (unsigned long)buf) & 3;
> +
> +> 	> 	> l =3D min(l, len);
> +> 	> 	> buf =3D ins_align(io, buf, l);
> +> 	> 	> len -=3D l;
> +
> +> 	> 	> if (len >=3D 4) {
> +> 	> 	> 	> insl(io, buf, len >> 2);
> +> 	> 	> 	> buf +=3D len & ~3;
> +> 	> 	> }
> +> 	> 	> buf =3D ins_align(io, buf, len & 3);
> +> 	> }

So I've tried deduplicating this function - the code in the latter two
cases is largely the same bar the magic numbers and insw vs insl. I've
come up with the code below (note that I haven't actually probed the
modifications), but I'm not convinced it's much of a win in terms of
clarity:

/* Is this available somewhere else? Rusty doesn't think so.
 * Probably needs a better name (first set value) */
#define FS_VAL(x) ((x) & ~((x) - 1))

static void aspeed_smc_from_fifo(void *buf, const void __iomem *iop, size_t=
 len)
{
	unsigned long io =3D (__force unsigned long)iop;
        u8 align =3D FS_VAL((io & 7) | 4); /* align is one of 1, 2 or 4 */
        u8 mask =3D align - 1;
        size_t to_align =3D align - ((unsigned long)buf) & mask);

	if (align =3D=3D 1) {
		insb(io, buf, len);
                return;
	}
        to_align =3D min(to_align, len);
        buf =3D ins_align(io, buf, to_align);
        len -=3D to_align;
	if (len >=3D align) {
		size_t nr_blocks =3D len / align;
		if (align =3D=3D 2) {
			insw(io, buf, nr_blocks);
		} else {
			insl(io, buf, nr_blocks);
		}
		buf +=3D (nr_blocks * align);
	}
        buf =3D ins_align(io, buf, len & mask);

Is it worth it? A similar approach can be taken for
aspeed_smc_to_fifo() if so.

As for whether there's a better approach short of fixing mmiocpy(), I
don't know, so no further suggestions really (i.e. I guess we just live
with the IO_SPACE_LIMIT jiggery-pokery).

> +}
> +
> +static void aspeed_smc_to_fifo(void __iomem *iop, const void *buf, size_=
t len)
> +{
> +> 	> unsigned long io =3D (__force unsigned long)iop;
> +
> +> 	> if (io & 1) {
> +> 	> 	> outsb(io, buf, len);
> +> 	> } else if (io & 2) {
> +> 	> 	> size_t l =3D (2 - (unsigned long)buf) & 1;
> +
> +> 	> 	> len =3D min(l, len);
> +> 	> 	> buf =3D outs_align(io, buf, l);
> +> 	> 	> len -=3D l;
> +
> +> 	> 	> if (len >=3D 2) {
> +> 	> 	> 	> outsw(io, buf, len >> 1);
> +> 	> 	> 	> buf +=3D len & ~(size_t)1;
> +> 	> 	> }
> +> 	> 	> buf =3D outs_align(io, buf, len & 1);
> +> 	> } else {
> +> 	> 	> size_t l =3D (4 - (unsigned long)buf) & 3;
> +
> +> 	> 	> l =3D min(l, len);
> +> 	> 	> buf =3D outs_align(io, buf, l);
> +> 	> 	> len -=3D l;
> +
> +> 	> 	> if (len >=3D 4) {
> +> 	> 	> 	> outsl(io, buf, len >> 2);
> +> 	> 	> 	> buf +=3D len & ~(size_t)3;
> +> 	> 	> }
> +> 	> 	> buf =3D outs_align(io, buf, len & 3);
> +> 	> }
> +}
> +
>  enum smc_flash_type {
>  > 	> smc_type_nor =3D 0,> 	> /* controller connected to nor flash */
>  > 	> smc_type_nand =3D 1,> 	> /* controller connected to nand flash */
> @@ -165,8 +281,8 @@ static int aspeed_smc_read_reg(struct spi_nor *nor, u=
8 opcode, u8 *buf, int len)
>  > 	> struct aspeed_smc_chip *chip =3D nor->priv;
> =20
>  > 	> aspeed_smc_start_user(nor);
> -> 	> writeb(opcode, chip->base);
> -> 	> _memcpy_fromio(buf, chip->base, len);
> +> 	> aspeed_smc_to_fifo(chip->base, &opcode, 1);
> +> 	> aspeed_smc_from_fifo(buf, chip->base, len);
>  > 	> aspeed_smc_stop_user(nor);
> =20
>  > 	> return 0;
> @@ -178,8 +294,8 @@ static int aspeed_smc_write_reg(struct spi_nor *nor, =
u8 opcode, u8 *buf,
>  > 	> struct aspeed_smc_chip *chip =3D nor->priv;
> =20
>  > 	> aspeed_smc_start_user(nor);
> -> 	> writeb(opcode, chip->base);
> -> 	> _memcpy_toio(chip->base, buf, len);
> +> 	> aspeed_smc_to_fifo(chip->base, &opcode, 1);
> +> 	> aspeed_smc_to_fifo(chip->base, buf, len);
>  > 	> aspeed_smc_stop_user(nor);
> =20
>  > 	> return 0;
> @@ -202,12 +318,12 @@ static void aspeed_smc_send_cmd_addr(struct spi_nor=
 *nor, u8 cmd, u32 addr)
>  > 	> 	> cmdaddr |=3D (u32)cmd << 24;
> =20
>  > 	> 	> temp =3D cpu_to_be32(cmdaddr);
> -> 	> 	> memcpy_toio(chip->base, &temp, 4);
> +> 	> 	> aspeed_smc_to_fifo(chip->base, &temp, 4);
>  > 	> 	> break;
>  > 	> case 4:
>  > 	> 	> temp =3D cpu_to_be32(addr);
> -> 	> 	> writeb(cmd, chip->base);
> -> 	> 	> memcpy_toio(chip->base, &temp, 4);
> +> 	> 	> aspeed_smc_to_fifo(chip->base, &cmd, 1);
> +> 	> 	> aspeed_smc_to_fifo(chip->base, &temp, 4);
>  > 	> 	> break;
>  > 	> }
>  }
> @@ -219,7 +335,7 @@ static int aspeed_smc_read_user(struct spi_nor *nor, =
loff_t from, size_t len,
> =20
>  > 	> aspeed_smc_start_user(nor);
>  > 	> aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
> -> 	> memcpy_fromio(read_buf, chip->base, len);
> +> 	> aspeed_smc_from_fifo(read_buf, chip->base, len);
>  > 	> *retlen +=3D len;
>  > 	> aspeed_smc_stop_user(nor);
> =20
> @@ -233,7 +349,7 @@ static void aspeed_smc_write_user(struct spi_nor *nor=
, loff_t to, size_t len,
> =20
>  > 	> aspeed_smc_start_user(nor);
>  > 	> aspeed_smc_send_cmd_addr(nor, nor->program_opcode, to);
> -> 	> memcpy_toio(chip->base, write_buf, len);
> +> 	> aspeed_smc_to_fifo(chip->base, write_buf, len);
>  > 	> *retlen +=3D len;
>  > 	> aspeed_smc_stop_user(nor);
>  }
> @@ -292,6 +408,14 @@ static int aspeed_smc_probe(struct platform_device *=
dev)
>  > 	> int err =3D 0;
>  > 	> unsigned int n;
> =20
> +> 	> /*
> +> 	>  * This driver passes ioremap addresses to io port accessors.
> +> 	>  * This works on arm if the IO_SPACE_LIMIT does not truncate
> +> 	>  * the address.
> +> 	>  */
> +> 	> if (~(unsigned long)IO_SPACE_LIMIT)
> +> 	> 	> return -ENODEV;
> +
>  > 	> match =3D of_match_device(aspeed_smc_matches, &dev->dev);
>  > 	> if (!match || !match->data)
>  > 	> 	> return -ENODEV;
--=-lOjTNQXkiTPTJQKG/GKv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWvUqSAAoJEJ0dnzgO5LT5JsMP/2DtPdswhwjkh0CqZErnw1Eh
h/3hMpkZUyKe/rQl3O16xPP/ePODdnntHcgscIuIEYtoqXji6FeNk1NQ3o2zp6N9
Rh6Mw4Tlxe+D+ArC0EnSaNs/yiDv13Ah5I0jsJuuWjBwoAz7ksPp/wMwM1o9ixO9
2D2CpuR1iweGjLgEPFeiyNR/Kx5q0fXUSmp86WQ/j5wfjeex2aHkruP8y47PpPdY
9LDukPWJKwNcB9liYYWmjlfNtrSgsoifXcdCQPUusqPxKz2KzOc/PWKQpDQii1E8
rvRCUf0AmVb8UJnc6Ranz7vcDOETO8RGFqtRLp9jWrarXUGYQz9k1C4dg0e1whDu
RWxLjeLv63NuDupl8KgU3zZ+f5+nHnloGcsSUxEz49CMjb8WvZSw7MlZrjsXdRkF
1QBefeM3j2mC4fXhDSrmHKfOYu+k1B7gA9XwmzjvM7CIYdXQ9krX+QqGv0fGeUVA
SI5Dr0p1kvK/yhjeG+7pzHa+zmRmS4dQA38J47R2Roy8YkAY1pyelzL8jIr+l5s0
2qFQFdNug6r2Zpv4fmK6M5Q101DGMswiRwoq0g9I2sqneUjp+RqXKQZCltctdA2a
fiL+RpAiZfDNGrVFGVBO73/i0SejKnz+3TDvIyHjNlaPjS2sqwz5LSCQVfdHjyvZ
33PFtAuaVCI3aqpTqJvI
=C0f6
-----END PGP SIGNATURE-----

--=-lOjTNQXkiTPTJQKG/GKv--
