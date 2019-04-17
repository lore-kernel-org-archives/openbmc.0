Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="s6l/ZAqJ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="cqqdhNC6"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kXGw2mvkzDqDK
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 16:23:03 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 993EF23702;
 Wed, 17 Apr 2019 02:23:00 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 17 Apr 2019 02:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=iNahR
 8G8KDP/S52fjGR3QDauVG1DOalvYbGVrqsxY9g=; b=s6l/ZAqJcHboEza9nyxJv
 fXbdxFxkYuWsEpG5kxU6lKWF1Hj23DClSx9y1qAarYAnqE2iVNAGbc7eToHz3QLl
 mvuLfelmippbukpkmal093mbbLTwZ+a6vt7V8791GY/UIXCVr8DsT6qvZ3wVVq+/
 KM2LJPIhbi4YaF5jBOyGfn+pTU+CJhPN8L/Xxi3okGsc0udfTkQVhEg7xnhD1F1V
 KeXCQYoHUrRg+CSjBzcn2p8p98AI2St5kyEczSXrXzp48mFtTuD7GpdxbLPSHJrh
 7yHqDeQdCAE+1WTItYfN3SFnqjIw9cJkBmi7hq64D+ZGplJNMnfy+It+7Eh08AjF
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=iNahR8G8KDP/S52fjGR3QDauVG1DOalvYbGVrqsxY
 9g=; b=cqqdhNC6axdgSfxFhNeKkiPku6dPpVlyAEWkkdq/njWgNR+G3OG50+/1s
 SWlOiBRMKUJPeAuqKVB8XOAH9QSFafq7mKQiZXfareZ3XX5G3rFKFERms1pt9m3q
 83ewQj4Wbe1Ysr6akVNzNi0+1rjtZC1p+Lrhsp7DiEKvffBAbDOpFz0EVNa268SZ
 viFOiiOmHHgupYmIT9ER6l6bAyaeg41HBkFuEUEvAoQcl7AcouUSJ9kFJKrZH6Jd
 eWEpFTwjj6m+H1OfxT8jzfPGGA2mc1tcAUwgjkJZxHDCl7x0kxPjZTdSl7hajjrs
 6TgYt0BjvAdEszBy4AT0o1BDh4dgQ==
X-ME-Sender: <xms:Q8a2XBFdWfxGl0En13eUoOaM6nDhGvK5b_ywFDRjAPL9TEvvdpXWlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfedvgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:Q8a2XHHvyIZWeOoQK82PC0Y22KheJSMKbmEF_xHtCbAZMudXtgrE6w>
 <xmx:Q8a2XMContIotwUV8ESECS5GWwhPNyfiWLc7aXjaURWDvBAfT6BQKQ>
 <xmx:Q8a2XO_vyI-Osw8zjoC0emwxxdlXZBu2eYMSlUJTSHXyU4g8LxUOOQ>
 <xmx:RMa2XA8Lf8eEe-mgFY_wL11CoZGo7VmJ2LBLXVnr-PQHGq9wwM9gGA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id ADB227C199; Wed, 17 Apr 2019 02:22:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <5987b5b3-1f0f-4085-833b-4c95ccb9ee85@www.fastmail.com>
In-Reply-To: <dff802e2-6e47-1179-9bb9-283953a5d36e@kaod.org>
References: <20190417054511.29291-1-andrew@aj.id.au>
 <dff802e2-6e47-1179-9bb9-283953a5d36e@kaod.org>
Date: Wed, 17 Apr 2019 02:22:58 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Cc: "Eddie James" <eajames@linux.ibm.com>,
 "George Keishing" <gkeishin@in.ibm.com>
Subject: =?UTF-8?Q?Re:_[PATCH]_Revert_"mtd:_spi-nor:_Add_a_post_BFPT_fixup_for_MX?=
 =?UTF-8?Q?25L25635E"?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2019 06:23:05 -0000



On Wed, 17 Apr 2019, at 15:41, C=C3=A9dric Le Goater wrote:
> On 4/17/19 7:45 AM, Andrew Jeffery wrote:
> > This reverts commit 2bffa65da43e399079dad5947c6aa9ab3cfa4ad4.
> >=20
> > 5.0.x fails to boot on Witherspoon machines after an AC-cycle, with =
the
> > following error:
> >=20
> >> [    4.337766] ubi0: default fastmap pool size: 25
> >> [    4.342321] ubi0: default fastmap WL pool size: 12
> >> [    4.347232] ubi0: attaching mtd3
> >> [    4.361487] ubi0: scanning is finished
> >> [    4.365525] ubi0 error: ubi_read_volume_table: the layout volume=
 was not found
> >> [    4.372989] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd=
3, error -22
> >> [    4.380193] UBI error: cannot attach mtd3
> >=20
> > Which leads to:
> >=20
> >> [    4.553478] VFS: Cannot open root device "ubiblock0_1" or unknow=
n-block(0,0): error -6
> >> [    4.561550] Please append a correct "root=3D" boot option; here =
are the available partitions:
> >> [    4.570029] 1f00           32768 mtdblock0
> >> [    4.570038]  (driver?)
> >> [    4.576671] 1f01             384 mtdblock1
> >> [    4.576680]  (driver?)
> >> [    4.583234] 1f02             128 mtdblock2
> >> [    4.583240]  (driver?)
> >> [    4.589883] 1f03           32256 mtdblock3
> >> [    4.589892]  (driver?)
> >> [    4.596520] 1f04           32768 mtdblock4
> >> [    4.596529]  (driver?)
> >> [    4.603080] 1f05             384 mtdblock5
> >> [    4.603085]  (driver?)
> >> [    4.609711] 1f06             128 mtdblock6
> >> [    4.609719]  (driver?)
> >> [    4.616338] 1f07           32256 mtdblock7
> >> [    4.616347]  (driver?)
> >> [    4.622901] 1f08          131072 mtdblock8
> >> [    4.622907]  (driver?)
> >> [    4.629539] Kernel panic - not syncing: VFS: Unable to mount roo=
t fs on unknown-block(0,0)
> >=20
> > A hint is provided earlier in the boot process:
> >=20
> >> [    0.920597] aspeed-smc 1e620000.spi: Using 50 MHz SPI frequency
> >> [    0.926753] aspeed-smc 1e620000.spi: mx25l25635e (32768 Kbytes)
> >> [    0.932704] aspeed-smc 1e620000.spi: CE0 window [ 0x20000000 - 0=
x22000000 ] 32MB
> >> [    0.940230] aspeed-smc 1e620000.spi: CE1 window [ 0x22000000 - 0=
x2a000000 ] 128MB
> >> [    0.947812] aspeed-smc 1e620000.spi: read control register: 203c=
0641
> >> [    1.435022] 3 fixed-partitions partitions found on MTD device bm=
c
> >> [    1.441249] Creating 3 MTD partitions on "bmc":
> >> [    1.445911] 0x000000000000-0x000000060000 : "u-boot"
> >> [    1.455264] 0x000000060000-0x000000080000 : "u-boot-env"
> >> [    1.465042] 0x000000080000-0x000002000000 : "obmc-ubi"
> >> [    1.474914] aspeed-smc 1e620000.spi: Using 50 MHz SPI frequency
> >> [    1.481102] aspeed-smc 1e620000.spi: mx25l25635e (32768 Kbytes)
> >> [    1.487175] aspeed-smc 1e620000.spi: CE1 window [ 0x22000000 - 0=
x24000000 ] 32MB
> >> [    1.494592] aspeed-smc 1e620000.spi: CE2 window [ 0x24000000 - 0=
x2c000000 ] 128MB
> >> [    1.502173] aspeed-smc 1e620000.spi: read control register: 203c=
0041
> >> [    1.705799] aspeed-smc 1e620000.spi: No good frequency, using du=
mb slow
> >> [    1.717393] 3 fixed-partitions partitions found on MTD device al=
t-bmc
> >> [    1.723851] Creating 3 MTD partitions on "alt-bmc":
> >> [    1.728890] 0x000000000000-0x000000060000 : "alt-u-boot"
> >> [    1.738950] 0x000000060000-0x000000080000 : "alt-u-boot-env"
> >> [    1.748975] 0x000000080000-0x000002000000 : "alt-obmc-ubi"
> >=20
> > Specifically, the control register state is exposed as:
> >=20
> >> [    0.947812] aspeed-smc 1e620000.spi: read control register: 203c=
0641
> >=20
> > The 0x3c opcode translates to DREAD4B for the mx25l25635f part, whic=
h is
> > what is detected. The post BFPT fixup implemented in commit 2bffa65d=
a43e
> > ("mtd: spi-nor: Add a post BFPT fixup for MX25L25635E") detects the =
'e'
> > vs 'f' part based on the reported support for
> > BFPT_DWORD5_FAST_READ_4_4_4, which implies 4B opcodes are supported
> > (e.g. DREAD4B), however the aspeed-smc driver fails to put the
> > controller into the right addressing mode to support sending DREAD4B=
, and
> > so we reach a bad state.
>=20
> It's more complex than that but I haven't quite cornered the problem.=20=

>=20
> When doing the link training, the first read for the golden image is=20=

> done in slow mode and it misses the first byte for some reason. So the=
=20
> gold image is incorrect (cough) but other images are correct (cough co=
ugh)
>=20
> Why is this first byte being dropped is the question. The flash module=
=20
> might have entered 4B mode ? is it expecting a dummy ?=20
>=20
> For the moment, this is fine for a workaround but we will need to full=
y=20
> support 4B opcodes (which we do without training). Another solution is=
=20
> to use the kernel command line switch "optimize_read=3Dfalse" and all=20=

> works fine, perfectly fine. Which is kind of frustrating.

Hmm, okay. Sounds like I didn't track it down as well as I thought then.=


I figured we'd need to set CONTROL_IO_DUAL_ADDR_DATA to send a
DREAD4B, but we never put the controller into that mode: there's only
one call to aspeed_smc_set_io_mode(), in aspeed_smc_read_user(),
which is only called if `io_mode =3D=3D CONTROL_IO_DUAL_DATA` holds,
and we set the IO mode to CONTROL_IO_DUAL_DATA.

Suggestions for rewording the commit message? Should I just replace
some of it with your words above?

Andrew

>=20
> Thanks for the patch.
>=20
> C.
>=20
>=20
> >=20
> > In the interim, revert the upstream patch adding 'e' vs 'f' detectio=
n to
> > avoid sending 4B opcodes.
> >=20
> > The revert has been tested on a freshly flashed and power-cycled
> > Witherspoon, both with and without the patch applied, confirming the=

> > broken behaviour in the former case and a successful boot in the lat=
ter.
> >=20
> > Cc: Andrew Geissler <geissonator@gmail.com>
> > Reported-by: George Keishing <gkeishin@in.ibm.com>
> > Investigated-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > Investigated-by: Eddie James <eajames@linux.ibm.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 29 +----------------------------
> >  1 file changed, 1 insertion(+), 28 deletions(-)
> >=20
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi=
-nor.c
> > index 5a5a47651bf9..9f85ab5fc569 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -1681,31 +1681,6 @@ static int sr2_bit7_quad_enable(struct spi_no=
r *nor)
> >  		.addr_width =3D 3,					\
> >  		.flags =3D SPI_NOR_NO_FR | SPI_S3AN,
> > =20
> > -static int
> > -mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
> > -			    const struct sfdp_parameter_header *bfpt_header,
> > -			    const struct sfdp_bfpt *bfpt,
> > -			    struct spi_nor_flash_parameter *params)
> > -{
> > -	/*
> > -	 * MX25L25635F supports 4B opcodes but MX25L25635E does not.
> > -	 * Unfortunately, Macronix has re-used the same JEDEC ID for both
> > -	 * variants which prevents us from defining a new entry in the par=
ts
> > -	 * table.
> > -	 * We need a way to differentiate MX25L25635E and MX25L25635F, and=
 it
> > -	 * seems that the F version advertises support for Fast Read 4-4-4=
 in
> > -	 * its BFPT table.
> > -	 */
> > -	if (bfpt->dwords[BFPT_DWORD(5)] & BFPT_DWORD5_FAST_READ_4_4_4)
> > -		nor->flags |=3D SNOR_F_4B_OPCODES;
> > -
> > -	return 0;
> > -}
> > -
> > -static struct spi_nor_fixups mx25l25635_fixups =3D {
> > -	.post_bfpt =3D mx25l25635_post_bfpt_fixups,
> > -};
> > -
> >  /* NOTE: double check command sets and memory organization when you=
 add
> >   * more nor chips.  This current list focusses on newer chips, whic=
h
> >   * have been converging on command sets which including JEDEC ID.
> > @@ -1843,9 +1818,7 @@ static const struct flash_info spi_nor_ids[] =3D=
 {
> >  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
> >  	{ "mx25u12835f", INFO(0xc22538, 0, 64 * 1024, 256,
> >  			 SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> > -	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512,
> > -			 SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> > -			 .fixups =3D &mx25l25635_fixups },
> > +	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, SPI_NOR_DUAL_RE=
AD | SPI_NOR_QUAD_READ) },
> >  	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K | SPI_N=
OR_4B_OPCODES) },
> >  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
> >  	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_R=
EAD | SPI_NOR_QUAD_READ) },
> >=20
>=20
>
