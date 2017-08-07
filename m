Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xQn5k2YQQzDqnQ
 for <openbmc@lists.ozlabs.org>; Mon,  7 Aug 2017 16:03:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="G1QHe/A4"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="M5KCve8s"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0710F20CBF;
 Mon,  7 Aug 2017 02:03:36 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 07 Aug 2017 02:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=smsX/XqTFWdi6k3lFAjwBRqssSvBkFgyByEaGUmhg
 Fk=; b=G1QHe/A4BiDJeCGNRAjnMxQ1nxC8e66VL2X8aZbgWDyx6HQUVFaOXEOmD
 mXDNLN21/F8tv1rqSnx2nOMjQtnBNXJo30wEGaeE41gv2GDTTHmnkz+e3PxvujWq
 jsUVpBCn5xuQBDspp5DumNH7JvdhVJwRxkt5VribnJNl0FkOUkgvzOtJ7e0yA6Ak
 +c82l6NyFO4fMw6G6Qg0mNs5NkRtDa79Rc0PVSoA1GW1UFUkbN+DYVA7guUE9ppo
 nkcmTBlHHvKR7GYifGg9LHqoVkSQ9UihYfCtlsI1AuimljOCJjyIrfj8VNz+WvyK
 2OeJzaNgl2gcrAJhLIEwPqtPhI8MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=smsX/XqTFWdi6k3lFA
 jwBRqssSvBkFgyByEaGUmhgFk=; b=M5KCve8sO04vhvXQJi6J4X67rQ1UETZ8YD
 UOBWDn5EZJyHl85TtrIJOSjhcTOP+t1pSuP4A5lTsavBL6+YEX3oIs/I2DFoSIGB
 7cKJqPAVDbwwr8Yi+ky/6HPiKrDU6CBYY4je4GNAlzhQFgbWldchXCBuGy/u8xba
 QRsSyhjYFAnjrb8aEMdN38xkjXo79EJAuDiF+jmFMbbNN7nCTIqd4OZSD8aP/H8Y
 ZkhQEq04c/yoPNu0dwNkeMng0Ls3zGTtczAAr/yZOx089ufjm+C0YUQXa2qpA/8M
 UOdJj2BS23Mgj9gd29fk8if29vXLKJSxWNvj9phaB8xEQSte87Hw==
X-ME-Sender: <xms:twKIWX7J-kSz5_cOThnYmYYbbFY9nviyGU5Gd3GcYYSSLZx_MrKQUw>
X-Sasl-enc: 8jJQ+8Cl3Hl3tNX2U/yKMEFLygZTG2YsQe7OSYkkgxo7 1502085815
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8CFBA7E16E;
 Mon,  7 Aug 2017 02:03:33 -0400 (EDT)
Message-ID: <1502085810.7709.4.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 2/5] drivers/hwmon/pmbus: ibmps: Add
 non-hwmon attributes
From: Andrew Jeffery <andrew@aj.id.au>
To: Matt Spinler <mspinler@linux.vnet.ibm.com>, Eddie James
 <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, bjwyman@gmail.com
Date: Mon, 07 Aug 2017 15:33:30 +0930
In-Reply-To: <8cf1b3f6-83c6-ac3c-8385-a65d29d95ce4@linux.vnet.ibm.com>
References: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501705534-27606-3-git-send-email-eajames@linux.vnet.ibm.com>
 <1501806822.29409.13.camel@aj.id.au>
 <bd9944cf-b3e1-68bd-b5c9-cbe4767a95e5@linux.vnet.ibm.com>
 <8cf1b3f6-83c6-ac3c-8385-a65d29d95ce4@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-rq19bCftYshVD8TYVe5b"
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
X-List-Received-Date: Mon, 07 Aug 2017 06:03:38 -0000


--=-rq19bCftYshVD8TYVe5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-08-04 at 11:17 -0500, Matt Spinler wrote:
>=20
> On 8/4/2017 10:16 AM, Eddie James wrote:
> >=20
> >=20
> > On 08/03/2017 07:33 PM, Andrew Jeffery wrote:
> > > On Wed, 2017-08-02 at 15:25 -0500, Eddie James wrote:
> > > > > From: "Edward A. James" <eajames@us.ibm.com>
> > > >=20
> > > > Add sysfs entries to dump out PS registers
> > >=20
> > > Why are we working against what the pmbus subsystem already gives us?
> > > Why not augment support in pmbus core to give us the information we
> > > need in a manner acceptable to upstream?
> >=20
> > Yea, that would be great. I feel like we're a little short on time for=
=C2=A0
> > that, as we need this functionality basically now. But we can give it=
=C2=A0
> > a shot.
> >=20
> > >=20
> > > Flipping to the other end of the spectrum: The device only has one
> > > page. We can just use `i2cget -f -y ...` without risk of corruption.
> >=20
> > Yea, I just get a lot of requests to have it all in the device driver.=
=C2=A0
> > I guess we need to just push back and ask people to use i2c tools. But=
=C2=A0
> > we will have to solve this for the UCD driver.
>=20
> In general, IBM likes to capture a lot of registers on failures so we=C2=
=A0
> can actually figure out what went wrong after the fact, as we have=C2=A0
> customers who get mad when we can't give them root cause.

I appreciate that.

> =C2=A0=C2=A0It's a bummer=C2=A0
> that is so hard to do here.=C2=A0=C2=A0And if we had to use the i2cdev st=
uff for=C2=A0
> that, then why even use a device driver for any of this...

Well, because:

1. There are existing ABIs for exposing a lot (but not all) of these
properties, and hwmon/pmbus devices should have drivers that conform to
these ABIs
2. Using the existing ABIs allows existing applications (e.g.
`sensors`) to display interesting information without knowledge of the
hardware (PMBus spec is pretty loose in terms of what you can do, what
you support, and how you go about it)

The problem I have with the proposal is it emulates what we can
equivalently scrape with `i2cget -f` by documenting a new kernel ABI
that has no additional semantics. This isn't going to fly with
upstream, and isn't terribly useful for us given the single page this
device supports.

The spanner in the works is the UCD driver where we will want to do the
same thing, but where the device has multiple pages. The `i2cget -f`
approach falls down there, and does seem it might require something
like what's proposed here if time is a factor. Given that there's the
question of consistency in the approach (i.e. providing the sysfs
interface for the UCD device but requiring the use of `i2cget -f` here
seems broken).

I'm a bit torn really.

Has anyone looked at how much effort it would really be to split out
the bits?

>=20
>=20
> >=20
> > >=20
> > > > =C2=A0 and clear faults.
> > >=20
> > > Can you describe the motivation for this? I feel like it would be wor=
th
> > > having this as a separate patch, and to the core rather than in an
> > > arbitrary driver.
> >=20
> > Users need to be able to clear faults, that was just on my list of=C2=
=A0
> > requirements :) They could probably use i2cset though.
>=20
> Yea, userspace needs this.=C2=A0=C2=A0I'm kinda surprised there wasn't al=
ready a=C2=A0
> way to expose it.

Right; it seems the kernel's pmbus subsystem has mainly been concerned
with monitoring and not controlling the associated device. Clearing
faults would be a departure from that, as are my core changes to
support the MAX31785. I think there's a good chance that something like
what's proposed is acceptable, just no-one had implemented it.

Andrew

>=20
> >=20
> > >=20
> > > Cheers,
> > >=20
> > > Andrew
> > >=20
> > > > > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > > >=20
> > > > ---
> > > > =C2=A0 drivers/hwmon/pmbus/ibmps.c | 78=C2=A0
> > > > +++++++++++++++++++++++++++++++++++++++++++++
> > > > =C2=A0 1 file changed, 78 insertions(+)
> > > >=20
> > > > diff --git a/drivers/hwmon/pmbus/ibmps.c b/drivers/hwmon/pmbus/ibmp=
s.c
> > > > index 1928dd9..f55d2bf 100644
> > > > --- a/drivers/hwmon/pmbus/ibmps.c
> > > > +++ b/drivers/hwmon/pmbus/ibmps.c
> > > > @@ -9,8 +9,10 @@
> > > > =C2=A0=C2=A0=C2=A0=C2=A0#include <linux/device.h>
> > > > =C2=A0 #include <linux/i2c.h>
> > > > +#include <linux/hwmon-sysfs.h>
> > > > =C2=A0 #include <linux/jiffies.h>
> > > > =C2=A0 #include <linux/module.h>
> > > > +#include <linux/sysfs.h>
> > > > =C2=A0=C2=A0=C2=A0=C2=A0#include "pmbus.h"
> > > > =C2=A0 @@ -122,14 +124,90 @@ static int ibmps_read_word_data(struct=
=C2=A0
> > > > i2c_client *client, int page, int reg)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.read_word_data =3D ibmps_rea=
d_word_data,
> > > >=20
> > > > =C2=A0 };
> > > > =C2=A0 +static ssize_t ibmps_clear_faults(struct device *dev,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *dev_a=
ttr,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, size_t count)
> > > >=20
> > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0struct i2c_client *client =3D to_i2c_cli=
ent(dev);
> > > >=20
> > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0pmbus_clear_faults(client);
> > > >=20
> > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0return count;
> > > >=20
> > > > +}
> > > > +static DEVICE_ATTR(clear_faults, 0200, NULL, ibmps_clear_faults);
> > > > +
> > > > +static ssize_t ibmps_show_status_word(struct device *dev,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct=
 device_attribute *dev_attr,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *=
buf)
> > > >=20
> > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0int rc;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0struct i2c_client *client =3D to_i2c_cli=
ent(dev);
> > > >=20
> > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0rc =3D pmbus_read_word_data(client, 0, P=
MBUS_STATUS_WORD);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0if (rc < 0)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return rc;
> > > >=20
> > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0return snprintf(buf, PAGE_SIZE - 1, "%04=
x\n", rc);
> > > >=20
> > > > +}
> > > > +static DEVICE_ATTR(status_word, 0444, ibmps_show_status_word, NULL=
);
> > > > +
> > > > +static ssize_t ibmps_show_status_byte(struct device *dev,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct=
 device_attribute *dev_attr,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *=
buf)
> > > >=20
> > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0int rc;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0struct i2c_client *client =3D to_i2c_cli=
ent(dev);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0struct sensor_device_attribute *sattr =
=3D=C2=A0
> > > > > to_sensor_dev_attr(dev_attr);
> > > >=20
> > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0rc =3D pmbus_read_byte_data(client, 0, P=
MBUS_STATUS_VOUT +=C2=A0
> > > > > sattr->index);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0if (rc < 0)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return rc;
> > > >=20
> > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0return snprintf(buf, PAGE_SIZE - 1, "%02=
x\n", rc);
> > > >=20
> > > > +}
> > > > +
> > > > +static SENSOR_DEVICE_ATTR(status_vout, 0444,=C2=A0
> > > > ibmps_show_status_byte, NULL, 0);
> > > > +static SENSOR_DEVICE_ATTR(status_iout, 0444,=C2=A0
> > > > ibmps_show_status_byte, NULL, 1);
> > > > +static SENSOR_DEVICE_ATTR(status_input, 0444,=C2=A0
> > > > ibmps_show_status_byte, NULL, 2);
> > > > +static SENSOR_DEVICE_ATTR(status_temp, 0444,=C2=A0
> > > > ibmps_show_status_byte, NULL, 3);
> > > > +static SENSOR_DEVICE_ATTR(status_cml, 0444, ibmps_show_status_byte=
,=C2=A0
> > > > NULL, 4);
> > > > +static SENSOR_DEVICE_ATTR(status_other, 0444,=C2=A0
> > > > ibmps_show_status_byte, NULL, 5);
> > > > +static SENSOR_DEVICE_ATTR(status_mfr, 0444, ibmps_show_status_byte=
,=C2=A0
> > > > NULL, 6);
> > > > +static SENSOR_DEVICE_ATTR(status_fan, 0444, ibmps_show_status_byte=
,=C2=A0
> > > > NULL, 7);
> > > > +
> > > > +static struct attribute *ibmps_attributes[] =3D {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0&dev_attr_clear_faults.attr,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0&dev_attr_status_word.attr,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0&sensor_dev_attr_status_vout.dev_attr.at=
tr,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0&sensor_dev_attr_status_iout.dev_attr.at=
tr,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0&sensor_dev_attr_status_input.dev_attr.a=
ttr,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0&sensor_dev_attr_status_temp.dev_attr.at=
tr,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0&sensor_dev_attr_status_cml.dev_attr.att=
r,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0&sensor_dev_attr_status_other.dev_attr.a=
ttr,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0&sensor_dev_attr_status_mfr.dev_attr.att=
r,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0&sensor_dev_attr_status_fan.dev_attr.att=
r,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0NULL
> > > >=20
> > > > +};
> > > > +
> > > > +static const struct attribute_group ibmps_attribute_group =3D {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0.attrs =3D ibmps_attributes,
> > > >=20
> > > > +};
> > > > +
> > > > =C2=A0 static int ibmps_probe(struct i2c_client *client,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct i2c_device_id *id)
> > > >=20
> > > > =C2=A0 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0int rc =3D sysfs_create_group(&client->d=
ev.kobj,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&ibmps_attribute_g=
roup);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0if (rc)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return rc;
> > > >=20
> > > > +
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return pmbus_do_probe(client,=
 id, &ibmps_info);
> > > >=20
> > > > =C2=A0 }
> > > > =C2=A0=C2=A0=C2=A0=C2=A0static int ibmps_remove(struct i2c_client *=
client)
> > > > =C2=A0 {
> > > > > + sysfs_remove_group(&client->dev.kobj, &ibmps_attribute_group);
> > > >=20
> > > > +
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return pmbus_do_remove(client=
);
> > > >=20
> > > > =C2=A0 }
>=20
>=20
--=-rq19bCftYshVD8TYVe5b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZiAKyAAoJEJ0dnzgO5LT5IfQP/3LiFzSLmAb9d66D6zYu4Qht
QjYjitM0vF1AYbhGiDc167pScxtbpgAgHW/+uGw04fjsx/dOA9lNeQjexlb+ZDgy
UurzlHIC/mt3JdiMOPUYcmYFvBvaK1KVuEGDIMd7wJe22+HYIwjNAcePgLhqNtOu
gOmBoHm3wbneKK/UQr98ttMveLKZX0ZYj2NWKZ6ut5BDS6hYOcmckGIbmu36SN0v
KXR8Gk4ScnVxcxXe9aB6p5ZfOHbFphbwk9RD0qUvksKKWu7GgKahSTDkDwNYf9sv
YKTa/UFZ1P0xWaGRU3Kt+ogt40lx3NiUi+XlEBvtt12vD8HAEHJYtE6EdTcn9cvu
4xya4UAJBBW76BBiPykeff1U9E0OR/L9j8cspN7cqAQ0yqzoCzvf0lqjDPyz+a0c
7B7Y8d9ng6Iaw2LM6alnxhSx9926Zz3skFm8q5xo9443+t98G3aFqa3pQreMRiW9
UU4Ko4LHADaE4UhRRJ2LYkNiHtLBOD/CAuNH+C6Hz1N/pU+kN4b1AipeQ5VX9D8R
ouJD+tcC/xRPGut5MhU9h1Vzsq2LRw4SZ2WAC6lLqpo6t4kfXhIoeVfgPaTrlSGS
h8s1D1mjXa2i3kZXsKjD4yFsmy1ysr1HHIlKDe6jvu0NnOymnCWtddfjUyfYgayN
e2iVeAulXNkCVFd4trZX
=KvJN
-----END PGP SIGNATURE-----

--=-rq19bCftYshVD8TYVe5b--
