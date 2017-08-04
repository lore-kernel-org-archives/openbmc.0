Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNnwZ27BPzDqG5
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 10:33:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NZxBXgsx"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gZfVuqvI"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0AF06209DB;
 Thu,  3 Aug 2017 20:33:48 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 03 Aug 2017 20:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=NN+XVYn7+LIO50zUA0o9fPNnqvDr++q66ndwibt2B
 FA=; b=NZxBXgsxSyoxSZ1btifyqhYIw+CS6HQOzzCZo/hs0kBH2v1wpdK70EsAW
 clxDw6oiWVePtNSLyOJitvObC83fjChaINKO3fJJBPczttNY51S2yWn3QomimX7L
 vVI7g6OVoJ6n2uSF3yIkUv0SVKo52yWIwYs03SfJ0WavY6wh4FP99F42F3ZyQmUY
 lqfFBKZ6N1Nfi3s07VE7qYFL5N7UzWfa764ogC6c8Vo45flVEzsaGMLL2VkIXz4y
 +FxLAxr7Pq0r+vlJ2v+z2qDqsV7qvxIE6eSAMhaJnVRRh09nkxJ95UpDEBnJlSsy
 CUlwNKPJCKhn6/xiXP0DCMNvx15UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=NN+XVYn7+LIO50zUA0
 o9fPNnqvDr++q66ndwibt2BFA=; b=gZfVuqvIltnhWse1p8JdAtknjSvJ+CRmX0
 WZ3T8Dys7JJN9W9Bcbb32pjBqq61NyHms18hsMWofHCdWTvpnT4J0gAigE0RGnJY
 8QhIe3VQzTHk0nI2GpQc0xQ/gKfzzR900VJoe1JhBL3ztxUrBnGsTvKnk0UV5OvK
 vEPG6FKMmUcZGafd25bbuZUVf0lDSXZPNU5tqMbolNYQKdTA0p3yhP6qVryNjInd
 hJ331+h1TfWI9b9TYAHjh5g706+fhZlGoGtMKjA834WosJKr9DmHatMrSWPTPnsR
 nGf+uIwV5SMLDfau+pTcn5BkTG5Z6UJIYK8qJ1gQZmTFMnKQH5QQ==
X-ME-Sender: <xms:68CDWcL0Pnw_frUT6nAeJfvTKr4kDiatZi46nkUDo4dfQvnk_MzqlA>
X-Sasl-enc: hkwvR6iR1gbw8sjRo9aDfrjfBQKRacS4X4Qfhko5ETbL 1501806827
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id E0971244AA;
 Thu,  3 Aug 2017 20:33:45 -0400 (EDT)
Message-ID: <1501806822.29409.13.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 2/5] drivers/hwmon/pmbus: ibmps: Add
 non-hwmon attributes
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, bjwyman@gmail.com
Date: Fri, 04 Aug 2017 10:03:42 +0930
In-Reply-To: <1501705534-27606-3-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501705534-27606-3-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-jsVhLeeI1yKCCzv41FWr"
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
X-List-Received-Date: Fri, 04 Aug 2017 00:33:50 -0000


--=-jsVhLeeI1yKCCzv41FWr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-08-02 at 15:25 -0500, Eddie James wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Add sysfs entries to dump out PS registers

Why are we working against what the pmbus subsystem already gives us?
Why not augment support in pmbus core to give us the information we
need in a manner acceptable to upstream?

Flipping to the other end of the spectrum: The device only has one
page. We can just use `i2cget -f -y ...` without risk of corruption.

>  and clear faults.

Can you describe the motivation for this? I feel like it would be worth
having this as a separate patch, and to the core rather than in an
arbitrary driver.

Cheers,

Andrew

>=20
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/hwmon/pmbus/ibmps.c | 78 ++++++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 78 insertions(+)
>=20
> diff --git a/drivers/hwmon/pmbus/ibmps.c b/drivers/hwmon/pmbus/ibmps.c
> index 1928dd9..f55d2bf 100644
> --- a/drivers/hwmon/pmbus/ibmps.c
> +++ b/drivers/hwmon/pmbus/ibmps.c
> @@ -9,8 +9,10 @@
> =C2=A0
> =C2=A0#include <linux/device.h>
> =C2=A0#include <linux/i2c.h>
> +#include <linux/hwmon-sysfs.h>
> =C2=A0#include <linux/jiffies.h>
> =C2=A0#include <linux/module.h>
> +#include <linux/sysfs.h>
> =C2=A0
> =C2=A0#include "pmbus.h"
> =C2=A0
> @@ -122,14 +124,90 @@ static int ibmps_read_word_data(struct i2c_client *=
client, int page, int reg)
> > =C2=A0	.read_word_data =3D ibmps_read_word_data,
> =C2=A0};
> =C2=A0
> +static ssize_t ibmps_clear_faults(struct device *dev,
> > +				=C2=A0=C2=A0struct device_attribute *dev_attr,
> > +				=C2=A0=C2=A0const char *buf, size_t count)
> +{
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> +
> > +	pmbus_clear_faults(client);
> +
> > +	return count;
> +}
> +static DEVICE_ATTR(clear_faults, 0200, NULL, ibmps_clear_faults);
> +
> +static ssize_t ibmps_show_status_word(struct device *dev,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *dev_a=
ttr,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *buf)
> +{
> > +	int rc;
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> +
> > +	rc =3D pmbus_read_word_data(client, 0, PMBUS_STATUS_WORD);
> > +	if (rc < 0)
> > +		return rc;
> +
> > +	return snprintf(buf, PAGE_SIZE - 1, "%04x\n", rc);
> +}
> +static DEVICE_ATTR(status_word, 0444, ibmps_show_status_word, NULL);
> +
> +static ssize_t ibmps_show_status_byte(struct device *dev,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *dev_a=
ttr,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *buf)
> +{
> > +	int rc;
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	struct sensor_device_attribute *sattr =3D to_sensor_dev_attr(dev_attr=
);
> +
> > +	rc =3D pmbus_read_byte_data(client, 0, PMBUS_STATUS_VOUT + sattr->ind=
ex);
> > +	if (rc < 0)
> > +		return rc;
> +
> > +	return snprintf(buf, PAGE_SIZE - 1, "%02x\n", rc);
> +}
> +
> +static SENSOR_DEVICE_ATTR(status_vout, 0444, ibmps_show_status_byte, NUL=
L, 0);
> +static SENSOR_DEVICE_ATTR(status_iout, 0444, ibmps_show_status_byte, NUL=
L, 1);
> +static SENSOR_DEVICE_ATTR(status_input, 0444, ibmps_show_status_byte, NU=
LL, 2);
> +static SENSOR_DEVICE_ATTR(status_temp, 0444, ibmps_show_status_byte, NUL=
L, 3);
> +static SENSOR_DEVICE_ATTR(status_cml, 0444, ibmps_show_status_byte, NULL=
, 4);
> +static SENSOR_DEVICE_ATTR(status_other, 0444, ibmps_show_status_byte, NU=
LL, 5);
> +static SENSOR_DEVICE_ATTR(status_mfr, 0444, ibmps_show_status_byte, NULL=
, 6);
> +static SENSOR_DEVICE_ATTR(status_fan, 0444, ibmps_show_status_byte, NULL=
, 7);
> +
> +static struct attribute *ibmps_attributes[] =3D {
> > +	&dev_attr_clear_faults.attr,
> > +	&dev_attr_status_word.attr,
> > +	&sensor_dev_attr_status_vout.dev_attr.attr,
> > +	&sensor_dev_attr_status_iout.dev_attr.attr,
> > +	&sensor_dev_attr_status_input.dev_attr.attr,
> > +	&sensor_dev_attr_status_temp.dev_attr.attr,
> > +	&sensor_dev_attr_status_cml.dev_attr.attr,
> > +	&sensor_dev_attr_status_other.dev_attr.attr,
> > +	&sensor_dev_attr_status_mfr.dev_attr.attr,
> > +	&sensor_dev_attr_status_fan.dev_attr.attr,
> > +	NULL
> +};
> +
> +static const struct attribute_group ibmps_attribute_group =3D {
> > +	.attrs =3D ibmps_attributes,
> +};
> +
> =C2=A0static int ibmps_probe(struct i2c_client *client,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct i2c_devi=
ce_id *id)
> =C2=A0{
> > +	int rc =3D sysfs_create_group(&client->dev.kobj,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0&ibmps_attribute_group);
> > +	if (rc)
> > +		return rc;
> +
> > =C2=A0	return pmbus_do_probe(client, id, &ibmps_info);
> =C2=A0}
> =C2=A0
> =C2=A0static int ibmps_remove(struct i2c_client *client)
> =C2=A0{
> > +	sysfs_remove_group(&client->dev.kobj, &ibmps_attribute_group);
> +
> > =C2=A0	return pmbus_do_remove(client);
> =C2=A0}
> =C2=A0
--=-jsVhLeeI1yKCCzv41FWr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZg8DmAAoJEJ0dnzgO5LT5lc4P/16Ha4stGYC66ALWJKZWcVmk
vcMY5G3ajmPtyy1DKdF8NpaIR+NYbnIaTUBnzmte++Dn+R76uAlOyL0eBM7AKS36
U2mWIihEBmit+BbSlLfEDEfQuy7mh9p2Y+krEAbuiuN8hE7/yYokzYNQ+WgYPClz
MwuAW6xiQdkYMySL9nigkBrvpBeh49uqPghI4CvTIupgwvYf8fsxGcc3x4aW87LS
R2LXNPtE/U46rA6s6v3wNi2hC/iH04DjOMy9+8/sd0BKD0MHYbwzSqcaVW3LXcZ3
CglxVNRRoMO+Oj5TQTP9jXQ1Nxm8RI4W72vALgu1VyZNkXLV3qN6gai0J5jqHPIf
PyRcd5Z/vsfH4ZITN314FUffkeuE0GUkRS69TWBsWqToPmZf9dAGJ0iYLVD3SdBd
NuB5+UP6FXOfls45onV37VUBjRwtvk2/4LPAC7DIzytY7doPwcJaV1DinMAGoNEI
zxfmIawDyaWO6qUbU9ANZ4md70eF55VGcUOFnT6vFnPck6foYMJRkU46xZ6iGInf
QS3Mm4Ji225BiYsk9ZNepfQhCKeD80fZRraGnEsH0JBctVUElx74HMqily5AGsVZ
gY44JsBNeRH50UN/eFPdPsqWVZfP5Bc0FwG32oEDE45IlP6e86cB/F3zzLJWNtfO
kp9VzQ4JYus0fp+MDzjg
=7L+u
-----END PGP SIGNATURE-----

--=-jsVhLeeI1yKCCzv41FWr--
