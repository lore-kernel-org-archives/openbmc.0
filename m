Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHCqY4YXxzDqmD
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 08:40:08 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1501022402147859.1043513191682;
 Tue, 25 Jul 2017 15:40:02 -0700 (PDT)
Date: Tue, 25 Jul 2017 17:39:55 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH u-boot 1/1] config/ast-common: hack bootopts
Message-ID: <20170725223955.GA473@asimov.austin.ibm.com>
References: <20170721223326.28674-1-patrick@stwcx.xyz>
 <20170721223326.28674-2-patrick@stwcx.xyz>
 <CAPLgG=m6jr8iatPtYCMGRfoR-DKUEXQHqzZ6O2Hueodqucav2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <CAPLgG=m6jr8iatPtYCMGRfoR-DKUEXQHqzZ6O2Hueodqucav2g@mail.gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
X-List-Received-Date: Tue, 25 Jul 2017 22:40:10 -0000


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2017 at 11:16:20AM -0700, Rick Altherr wrote:
> Why?

Hopefully my previous email in the thread explains.  The main thing I
need to be able to change is the BOOTARGS in order to switch from an
initramfs-based boot to a direct-to-squashfs boot.  The BOOTCOMMAND
maybe isn't needed yet until we move the kernel into UBI.

>=20
> On Fri, Jul 21, 2017 at 3:33 PM, Patrick Williams <patrick@stwcx.xyz> wro=
te:
>=20
> > Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> > ---
> >  include/configs/ast-common.h | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
> > index 110c780070..6f2a50b854 100644
> > --- a/include/configs/ast-common.h
> > +++ b/include/configs/ast-common.h
> > @@ -84,7 +84,10 @@
> >  #define CONFIG_SYS_MAXARGS             16
> >  #define CONFIG_SYS_BARGSIZE            CONFIG_SYS_CBSIZE
> >
> > +#if 0
> >  #define CONFIG_BOOTARGS                        "console=3DttyS4,115200=
n8
> > root=3D/dev/ram rw"
> > +#endif
> > +#define CONFIG_BOOTARGS                         "console=3DttyS4,11520=
0n8
> > root=3D/dev/mtdblock4 ro"
> >
> >  #define CONFIG_AST_SPI_NOR    /* AST SPI NOR Flash */
> >  #define CONFIG_FMC_CS                  1
> > @@ -96,11 +99,14 @@
> >  #define CONFIG_ENV_OFFSET              0x60000 /* environment starts
> > here  */
> >  #define CONFIG_ENV_SIZE                        0x20000 /* Total Size of
> > Environment Sector */
> >
> > +#if 0
> >  #define CONFIG_BOOTCOMMAND     \
> >         "fdt addr 20080000; " \
> >         "if fdt get value ramdisk_conf /configurations/conf@1 ramdisk;
> > then " \
> >         "    bootm 20080000; else bootm 20080000 20300000; " \
> >         "fi"
> > +#endif
> > +#define CONFIG_BOOTCOMMAND                      "fdt addr 20080000; bo=
otm
> > 20080000"
> >  #define CONFIG_ENV_OVERWRITE
> >
> >  #define ASPEED_ENV_SETTINGS \
> > --
> > 2.13.0
> >
> >
> >

--=20
Patrick Williams

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAll3yLkACgkQqwNHzC0A
wRnlxg/+K+KL1ETVasNcrUW60PEAfpGQaIhBzDTFQBVNfSmXOcNuvoVkELxt89Qf
VXpr2yfDOnpPR58wQDoFsmFHV50ac+9kyiTS62KbbQh8iMj/SXa53ci5X5QawXLl
aGTi7MYgwoku+RRBbHJlKqpU4vQCeg4oGW0a8MmL5LukPXMAger0T/duEfGWdZ7W
Ym3ZNz6SI34obsxQG2VRGOyjARCGhWGU9MAWykLqK6caCFajtBhKE3WkDTHj9WBU
cf5QjGmQ7Kk+WWsVXRjceNUyIgVqeozchj8vQ0Qtc2TL+rFC49pa35tHZxooUBcc
tD4/SU273XyQnfJy2PA9hcSj9lr4CwomZSUzu1k/ye/aN28bPV7D6ZlTyr781Pv5
2H8q/CdLEP13yPTy2ysiW8dHlh/hqoMM7nMGMQnDUGtLnMGZCDgsMJSbOnBW4aXn
8o6AVgU4fOPXc6q1OwzHT77DPa4VxxqAM8ZpLl/XLAcoBFDxMT5jN8amq+R97wfj
67GImXNIDLP36b1KemX0VYvEX1UbOsQs57ad4sNH4PJMUWxI5eGeywKso8PSqI2o
asDu692moas05jbzRghYm5fLDwTdx4jUszntYTIuyFiHHNDHbOQyXHe5Lwmvl4QN
UHumYZOz3TIK+c+y1jtxRxiiZRTKBiLsZHqix/gq9skbkzOM4do=
=kCxN
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
