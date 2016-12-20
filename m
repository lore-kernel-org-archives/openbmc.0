Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tjJFH6KsJzDwQp
 for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2016 11:14:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="HmUI3pnp"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UqKa0xIW"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C132020867;
 Mon, 19 Dec 2016 19:14:41 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 19 Dec 2016 19:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=VoYPTCpS088D6oFU25K0R4Wqhlw=; b=HmUI3p
 npohfwLYWlRU4Ts0hgty/t/JOuQMG0zFBqsTZgfFFoGdRdXL1XnH4TkTEqrafgso
 OPF9jSweVS3R2KSdsJKsRlwUSM0XewMbxNfcXm2s5MTPdOl9bgZ4ei4GqZ/ZpQWr
 c0W984gZ2DKAepZDzKX6/ynFyg71/Ax5h+4wk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=VoYPTCpS088D6o
 FU25K0R4Wqhlw=; b=UqKa0xIWBaxcOEfDunnGNeCl9hvB1cbi6/GqeVAssFBNuO
 ZsV9W7HI6Ft+q48UUd3nop6pZr0ZiBKnLSbv4ei9cmpSHg65c2x77p8lw8RCkIqW
 nFuNnyObDn46yB3mt1QladFESNfe43z8MEXhfntpEzSpQXRAzpxFDWdfWHb0E=
X-ME-Sender: <xms:8XdYWFe7fG6UWdgh4o9qj0fIeTecp2zCQzcfELLEdMJ21Tx17MD8hw>
X-Sasl-enc: kcEFk/zhqiJFGL29GMpEORVfcR0yDW95MOXcSq37bKes 1482192880
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A4BCA24165;
 Mon, 19 Dec 2016 19:14:39 -0500 (EST)
Message-ID: <1482192875.3419.8.camel@aj.id.au>
Subject: Re: [PATCH linux 2/7] hwmon: occ: Add sysfs interface
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Tue, 20 Dec 2016 10:44:35 +1030
In-Reply-To: <1481920496-6732-1-git-send-email-eajames.ibm@gmail.com>
References: <1481920496-6732-1-git-send-email-eajames.ibm@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-1P4ZQ31vi4vZLSt8cS1d"
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
X-List-Received-Date: Tue, 20 Dec 2016 00:14:44 -0000


--=-1P4ZQ31vi4vZLSt8cS1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-12-16 at 14:34 -0600, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Add a generic mechanism to expose the sensors provided by the OCC in
> sysfs.
>=20
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> =C2=A0Documentation/hwmon/occ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=
=C2=A0=C2=A048 +++++
> =C2=A0drivers/hwmon/occ/Makefile=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=
=A02 +-
> =C2=A0drivers/hwmon/occ/occ_sysfs.c | 492 +++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A0drivers/hwmon/occ/occ_sysfs.h |=C2=A0=C2=A052 +++++
> =C2=A04 files changed, 593 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 drivers/hwmon/occ/occ_sysfs.c
> =C2=A0create mode 100644 drivers/hwmon/occ/occ_sysfs.h
>=20
> diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
> index 79d1642..1ee8689 100644
> --- a/Documentation/hwmon/occ
> +++ b/Documentation/hwmon/occ
> @@ -25,6 +25,54 @@ Currently, all versions of the OCC support four types =
of sensor data: power,
> =C2=A0temperature, frequency, and "caps," which indicate limits and thres=
holds used
> =C2=A0internally on the OCC.
> =C2=A0
> +sysfs Entries
> +-------------
> +
> +The OCC driver uses the hwmon sysfs framework to provide data to userspa=
ce.
> +
> +The driver exports two sysfs files for each frequency, temperature, and =
power
> +sensor. These are "input" and "label". The input file contains the value=
 of the
> +sensor. The label file contains the sensor id. The sensor id is the uniq=
ue
> +internal OCC identifier. Sensor ids may be provided by the OCC specifica=
tion.
> +The names of these files will be in the following format:
> > +	<sensor type><sensor index>_input
> > +	<sensor type><sensor index>_label
> +Sensor types will be one of "temp", "freq", or "power". The sensor index=
 is
> +an index to differentiate different sensor files. For example, a single
> +temperature sensor will have two sysfs files: temp1_input and temp1_labe=
l.
> +
> +Caps sensors are exported differently. For each caps sensor, the driver =
will
> +export 6 entries:
> > +	curr_powercap - current power cap in watts
> > +	curr_powerreading - current power output in watts
> > +	norm_powercap - power cap without redundant power
> > +	max_powercap - maximum power cap that can be set in watts
> > +	min_powercap - minimum power cap that can be set in watts
> > +	user_powerlimit - power limit specified by the user in watts
> +In addition, the OCC driver for P9 will export a 7th entry:
> > +	user_powerlimit_source - can be one of two values depending on who se=
t
> > +		the user_powerlimit. 0x1 - out of band from BMC or host. 0x2 -
> > +		in band from other source.
> +The format for these files is caps<sensor index>_<entry type>. For examp=
le,
> +caps1_curr_powercap.
> +
> +The driver also provides a number of sysfs entries through hwmon to bett=
er
> +control the driver and monitor the OCC.
> > +	powercap - read or write the OCC user power limit in watts.
> > +	name - read the name of the driver
> > +	update_interval - read or write the minimum interval for polling the
> > +		OCC.
> +
> +The driver also exports a single sysfs file through the communication pr=
otocol
> +device (see BMC - Host Communications). The filename is "online" and rep=
resents
> +the status of the OCC with respect to the driver. The OCC can be in one =
of two
> +states: OCC polling enabled or OCC polling disabled. The purpose of this=
 file
> +is to control the behavior of the driver and it's hwmon sysfs entries, n=
ot to
> +infer any information about the state of the physical OCC. Reading the f=
ile
> +returns either a 0 (polling disabled) or 1 (polling enabled). Writing 1 =
to the
> +file enables OCC polling in the driver if communications can be establis=
hed
> +with the OCC. Writing a 0 to the driver disables OCC polling.

Again, this is great. There's some overlap with
Documentation/hwmon/sysfs-interface, but nothing to worry about.

The rest looks good to me as well.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> +
> =C2=A0BMC - Host Communications
> =C2=A0-------------------------
> =C2=A0
> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
> index 93cb52f..a6881f9 100644
> --- a/drivers/hwmon/occ/Makefile
> +++ b/drivers/hwmon/occ/Makefile
> @@ -1 +1 @@
> -obj-$(CONFIG_SENSORS_PPC_OCC) +=3D occ.o
> +obj-$(CONFIG_SENSORS_PPC_OCC) +=3D occ.o occ_sysfs.o
> diff --git a/drivers/hwmon/occ/occ_sysfs.c b/drivers/hwmon/occ/occ_sysfs.=
c
> new file mode 100644
> index 0000000..b0e063da
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_sysfs.c
> @@ -0,0 +1,492 @@
> +/*
> + * occ_sysfs.c - OCC sysfs interface
> + *
> + * This file contains the methods and data structures for implementing t=
he OCC
> + * hwmon sysfs entries.
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/jiffies.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/err.h>
> +#include <linux/mutex.h>
> +#include <linux/delay.h>
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +
> +#include "occ_sysfs.h"
> +
> > +#define MAX_SENSOR_ATTR_LEN	32
> +
> > +#define RESP_RETURN_CMD_INVAL	0x13
> +
> +struct sensor_attr_data {
> > +	enum sensor_type type;
> > +	u32 hwmon_index;
> > +	u32 attr_id;
> > +	char name[MAX_SENSOR_ATTR_LEN];
> > +	struct device_attribute dev_attr;
> +};
> +
> +static ssize_t show_input(struct device *dev,
> > +			=C2=A0=C2=A0struct device_attribute *attr, char *buf)
> +{
> > +	int val;
> > +	struct sensor_attr_data *sdata =3D container_of(attr,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sensor_attr_data,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_attr);
> > +	struct occ_sysfs *driver =3D dev_get_drvdata(dev);
> +
> > +	val =3D occ_get_sensor_value(driver->occ, sdata->type,
> > +				=C2=A0=C2=A0=C2=A0sdata->hwmon_index - 1);
> > +	if (sdata->type =3D=3D TEMP)
> > > +		val *=3D 1000;	/* in millidegree Celsius */
> +
> > +	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
> +}
> +
> +/* show_label provides the OCC sensor id. The sensor id will be either a
> + * 2-byte (for P8) or 4-byte (for P9) value. The sensor id is a way to
> + * identify what each sensor represents, according to the OCC specificat=
ion.
> + */
> +static ssize_t show_label(struct device *dev,
> > +			=C2=A0=C2=A0struct device_attribute *attr, char *buf)
> +{
> > +	int val;
> > +	struct sensor_attr_data *sdata =3D container_of(attr,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sensor_attr_data,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_attr);
> > +	struct occ_sysfs *driver =3D dev_get_drvdata(dev);
> +
> > +	val =3D occ_get_sensor_id(driver->occ, sdata->type,
> > +				sdata->hwmon_index - 1);
> +
> > +	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
> +}
> +
> +static ssize_t show_caps(struct device *dev,
> > +			=C2=A0struct device_attribute *attr, char *buf)
> +{
> > +	int val;
> > +	struct caps_sensor *sensor;
> > +	struct sensor_attr_data *sdata =3D container_of(attr,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sensor_attr_data,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_attr);
> > +	struct occ_sysfs *driver =3D dev_get_drvdata(dev);
> +
> > +	sensor =3D occ_get_sensor(driver->occ, CAPS);
> > +	if (!sensor) {
> > +		val =3D -1;
> > +		return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
> > +	}
> +
> > +	val =3D occ_get_caps_value(driver->occ, sensor, sdata->hwmon_index - =
1,
> > +				=C2=A0sdata->attr_id);
> +
> > +	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
> +}
> +
> +static ssize_t show_update_interval(struct device *dev,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *attr, char *buf)
> +{
> > +	struct occ_sysfs *driver =3D dev_get_drvdata(dev);
> +
> > +	return snprintf(buf, PAGE_SIZE - 1, "%lu\n", driver->update_interval)=
;
> +}
> +
> +static ssize_t store_update_interval(struct device *dev,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *attr,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, size_t count)
> +{
> > +	struct occ_sysfs *driver =3D dev_get_drvdata(dev);
> > +	unsigned long val;
> > +	int rc;
> +
> > +	rc =3D kstrtoul(buf, 10, &val);
> > +	if (rc)
> > +		return rc;
> +
> > +	driver->update_interval =3D val;
> > +	occ_set_update_interval(driver->occ, val);
> +
> > +	return count;
> +}
> +
> +static DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO, show_update_inter=
val,
> > +		=C2=A0=C2=A0=C2=A0store_update_interval);
> +
> +static ssize_t show_name(struct device *dev,
> > +			=C2=A0struct device_attribute *attr, char *buf)
> +{
> > +	return snprintf(buf, PAGE_SIZE - 1, "occ\n");
> +}
> +
> +static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
> +
> +static ssize_t show_user_powercap(struct device *dev,
> > +				=C2=A0=C2=A0struct device_attribute *attr, char *buf)
> +{
> > +	struct occ_sysfs *driver =3D dev_get_drvdata(dev);
> +
> > +	return snprintf(buf, PAGE_SIZE - 1, "%u\n", driver->user_powercap);
> +}
> +
> +static ssize_t store_user_powercap(struct device *dev,
> > +				=C2=A0=C2=A0=C2=A0struct device_attribute *attr,
> > +				=C2=A0=C2=A0=C2=A0const char *buf, size_t count)
> +{
> > +	struct occ_sysfs *driver =3D dev_get_drvdata(dev);
> > +	u16 val;
> > +	int rc;
> +
> > +	rc =3D kstrtou16(buf, 10, &val);
> > +	if (rc)
> > +		return rc;
> +
> > +	dev_dbg(dev, "set user powercap to: %d\n", val);
> > +	rc =3D occ_set_user_powercap(driver->occ, val);
> > +	if (rc) {
> > +		dev_err(dev, "set user powercap failed: 0x%x\n", rc);
> > +		if (rc =3D=3D RESP_RETURN_CMD_INVAL) {
> > +			dev_err(dev, "set invalid powercap value: %d\n", val);
> > +			return -EINVAL;
> > +		}
> +
> > +		return rc;
> > +	}
> +
> > +	driver->user_powercap =3D val;
> +
> > +	return count;
> +}
> +
> +static DEVICE_ATTR(user_powercap, S_IWUSR | S_IRUGO, show_user_powercap,
> > +		=C2=A0=C2=A0=C2=A0store_user_powercap);
> +
> +static void deinit_sensor_groups(struct device *dev,
> > +				=C2=A0struct sensor_group *sensor_groups)
> +{
> > +	int i;
> +
> > +	for (i =3D 0; i < MAX_OCC_SENSOR_TYPE; i++) {
> > +		if (sensor_groups[i].group.attrs)
> > +			devm_kfree(dev, sensor_groups[i].group.attrs);
> > +		if (sensor_groups[i].sattr)
> > +			devm_kfree(dev, sensor_groups[i].sattr);
> > +		sensor_groups[i].group.attrs =3D NULL;
> > +		sensor_groups[i].sattr =3D NULL;
> > +	}
> +}
> +
> +static void sensor_attr_init(struct sensor_attr_data *sdata,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *sensor_group_name,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *attr_name,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ssize_t (*show)(struct device *dev,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *attr,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *buf))
> +{
> > +	sysfs_attr_init(&sdata->dev_attr.attr);
> +
> > +	snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
> > +		=C2=A0sensor_group_name, sdata->hwmon_index, attr_name);
> > +	sdata->dev_attr.attr.name =3D sdata->name;
> > +	sdata->dev_attr.attr.mode =3D S_IRUGO;
> > +	sdata->dev_attr.show =3D show;
> +}
> +
> +static int create_sensor_group(struct occ_sysfs *driver,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum sensor_type type, in=
t sensor_num)
> +{
> > +	struct device *dev =3D driver->dev;
> > +	struct sensor_group *sensor_groups =3D driver->sensor_groups;
> > +	struct sensor_attr_data *sdata;
> > +	int rc, i;
> +
> > +	/* each sensor has 'label' and 'input' attributes */
> > +	sensor_groups[type].group.attrs =3D
> > +		devm_kzalloc(dev, sizeof(struct attribute *) *
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sensor_num * 2 + 1, GFP_KERNEL);
> > +	if (!sensor_groups[type].group.attrs) {
> > +		rc =3D -ENOMEM;
> > +		goto err;
> > +	}
> +
> > +	sensor_groups[type].sattr =3D
> > +		devm_kzalloc(dev, sizeof(struct sensor_attr_data) *
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sensor_num * 2, GFP_KERNEL);
> > +	if (!sensor_groups[type].sattr) {
> > +		rc =3D -ENOMEM;
> > +		goto err;
> > +	}
> +
> > +	for (i =3D 0; i < sensor_num; i++) {
> > +		sdata =3D &sensor_groups[type].sattr[i];
> > +		/* hwmon attributes index starts from 1 */
> > +		sdata->hwmon_index =3D i + 1;
> > +		sdata->type =3D type;
> > +		sensor_attr_init(sdata, sensor_groups[type].name, "input",
> > +				=C2=A0show_input);
> > +		sensor_groups[type].group.attrs[i] =3D &sdata->dev_attr.attr;
> +
> > +		sdata =3D &sensor_groups[type].sattr[i + sensor_num];
> > +		sdata->hwmon_index =3D i + 1;
> > +		sdata->type =3D type;
> > +		sensor_attr_init(sdata, sensor_groups[type].name, "label",
> > +				=C2=A0show_label);
> > +		sensor_groups[type].group.attrs[i + sensor_num] =3D
> > +			&sdata->dev_attr.attr;
> > +	}
> +
> > +	rc =3D sysfs_create_group(&dev->kobj, &sensor_groups[type].group);
> > +	if (rc)
> > +		goto err;
> +
> > +	return 0;
> +err:
> > +	deinit_sensor_groups(dev, sensor_groups);
> > +	return rc;
> +}
> +
> +static void caps_sensor_attr_init(struct sensor_attr_data *sdata,
> > +				=C2=A0=C2=A0char *attr_name, uint32_t hwmon_index,
> > +				=C2=A0=C2=A0uint32_t attr_id)
> +{
> > +	sdata->type =3D CAPS;
> > +	sdata->hwmon_index =3D hwmon_index;
> > +	sdata->attr_id =3D attr_id;
> +
> > +	snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
> > +		=C2=A0"caps", sdata->hwmon_index, attr_name);
> +
> > +	sysfs_attr_init(&sdata->dev_attr.attr);
> > +	sdata->dev_attr.attr.name =3D sdata->name;
> > +	sdata->dev_attr.attr.mode =3D S_IRUGO;
> > +	sdata->dev_attr.show =3D show_caps;
> +}
> +
> +static int create_caps_sensor_group(struct occ_sysfs *driver, int sensor=
_num)
> +{
> > +	struct device *dev =3D driver->dev;
> > +	struct sensor_group *sensor_groups =3D driver->sensor_groups;
> > +	int field_num =3D driver->num_caps_fields;
> > +	struct sensor_attr_data *sdata;
> > +	int i, j, rc;
> +
> > +	sensor_groups[CAPS].group.attrs =3D
> > +		devm_kzalloc(dev, sizeof(struct attribute *) * sensor_num *
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0field_num + 1, GFP_KERNEL);
> > +	if (!sensor_groups[CAPS].group.attrs) {
> > +		rc =3D -ENOMEM;
> > +		goto err;
> > +	}
> +
> > +	sensor_groups[CAPS].sattr =3D
> > +		devm_kzalloc(dev, sizeof(struct sensor_attr_data) *
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sensor_num * field_num, GFP_KERNEL);
> > +	if (!sensor_groups[CAPS].sattr) {
> > +		rc =3D -ENOMEM;
> > +		goto err;
> > +	}
> +
> > +	for (j =3D 0; j < sensor_num; ++j) {
> > +		for (i =3D 0; i < field_num; ++i) {
> > +			sdata =3D &sensor_groups[CAPS].sattr[j * field_num + i];
> > +			caps_sensor_attr_init(sdata,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0driver->caps_names[i], j + 1,=
 i);
> > +			sensor_groups[CAPS].group.attrs[j * field_num + i] =3D
> > +				&sdata->dev_attr.attr;
> > +		}
> > +	}
> +
> > +	rc =3D sysfs_create_group(&dev->kobj, &sensor_groups[CAPS].group);
> > +	if (rc)
> > +		goto err;
> +
> > +	return rc;
> +err:
> > +	deinit_sensor_groups(dev, sensor_groups);
> > +	return rc;
> +}
> +
> +static void occ_remove_hwmon_attrs(struct occ_sysfs *driver)
> +{
> > +	struct device *dev =3D driver->dev;
> +
> > +	device_remove_file(dev, &dev_attr_user_powercap);
> > +	device_remove_file(dev, &dev_attr_update_interval);
> > +	device_remove_file(dev, &dev_attr_name);
> +}
> +
> +static int occ_create_hwmon_attrs(struct occ_sysfs *driver)
> +{
> > +	int i, rc, id, sensor_num;
> > +	struct device *dev =3D driver->dev;
> > +	struct sensor_group *sensor_groups =3D driver->sensor_groups;
> > +	struct occ_blocks *resp =3D NULL;
> +
> > +	occ_get_response_blocks(driver->occ, &resp);
> +
> > +	for (i =3D 0; i < MAX_OCC_SENSOR_TYPE; ++i)
> > +		resp->sensor_block_id[i] =3D -1;
> +
> > +	/* read sensor data from occ */
> > +	rc =3D occ_update_device(driver->occ);
> > +	if (rc) {
> > +		dev_err(dev, "cannot get occ sensor data: %d\n", rc);
> > +		return rc;
> > +	}
> > +	if (!resp->blocks)
> > +		return -ENOMEM;
> +
> > +	rc =3D device_create_file(dev, &dev_attr_name);
> > +	if (rc)
> > +		goto error;
> +
> > +	rc =3D device_create_file(dev, &dev_attr_update_interval);
> > +	if (rc)
> > +		goto error;
> +
> > +	if (resp->sensor_block_id[CAPS] >=3D 0) {
> > +		/* user powercap: only for master OCC */
> > +		rc =3D device_create_file(dev, &dev_attr_user_powercap);
> > +		if (rc)
> > +			goto error;
> > +	}
> +
> > +	sensor_groups[FREQ].name =3D "freq";
> > +	sensor_groups[TEMP].name =3D "temp";
> > +	sensor_groups[POWER].name =3D "power";
> > +	sensor_groups[CAPS].name =3D "caps";
> +
> > +	for (i =3D 0; i < MAX_OCC_SENSOR_TYPE; i++) {
> > +		id =3D resp->sensor_block_id[i];
> > +		if (id < 0)
> > +			continue;
> +
> > +		sensor_num =3D resp->blocks[id].header.sensor_num;
> > +		if (i =3D=3D CAPS)
> > +			rc =3D create_caps_sensor_group(driver, sensor_num);
> > +		else
> > +			rc =3D create_sensor_group(driver, i, sensor_num);
> > +		if (rc)
> > +			goto error;
> > +	}
> +
> > +	return 0;
> +
> +error:
> > +	dev_err(dev, "cannot create hwmon attributes: %d\n", rc);
> > +	occ_remove_hwmon_attrs(driver);
> > +	return rc;
> +}
> +
> +static ssize_t show_occ_online(struct device *dev,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *=
attr, char *buf)
> +{
> > +	struct occ_sysfs *driver =3D dev_get_drvdata(dev);
> +
> > +	return snprintf(buf, PAGE_SIZE - 1, "%u\n", driver->occ_online);
> +}
> +
> +static ssize_t store_occ_online(struct device *dev,
> > +				struct device_attribute *attr,
> > +				const char *buf, size_t count)
> +{
> > +	struct occ_sysfs *driver =3D dev_get_drvdata(dev);
> > +	unsigned long val;
> > +	int rc;
> +
> > +	rc =3D kstrtoul(buf, 10, &val);
> > +	if (rc)
> > +		return rc;
> +
> > +	if (val =3D=3D 1) {
> > +		if (driver->occ_online)
> > +			return count;
> +
> > +		driver->dev =3D hwmon_device_register(dev);
> > +		if (IS_ERR(driver->dev))
> > +			return PTR_ERR(driver->dev);
> +
> > +		dev_set_drvdata(driver->dev, driver);
> +
> > +		rc =3D occ_create_hwmon_attrs(driver);
> > +		if (rc) {
> > +			hwmon_device_unregister(driver->dev);
> > +			driver->dev =3D NULL;
> > +			return rc;
> > +		}
> > +	} else if (val =3D=3D 0) {
> > +		if (!driver->occ_online)
> > +			return count;
> +
> > +		occ_remove_hwmon_attrs(driver);
> > +		hwmon_device_unregister(driver->dev);
> > +		driver->dev =3D NULL;
> > +	} else
> > +		return -EINVAL;
> +
> > +	driver->occ_online =3D val;
> > +	return count;
> +}
> +
> +static DEVICE_ATTR(online, S_IWUSR | S_IRUGO, show_occ_online,
> > +		=C2=A0=C2=A0=C2=A0store_occ_online);
> +
> +struct occ_sysfs *occ_sysfs_start(struct device *dev, struct occ *occ,
> > +				=C2=A0=C2=A0struct occ_sysfs_config *config)
> +{
> > +	struct occ_sysfs *hwmon =3D devm_kzalloc(dev, sizeof(struct occ_sysfs=
),
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GFP_KERNEL);
> > +	int rc;
> +
> > +	if (!hwmon)
> > +		return ERR_PTR(-ENOMEM);
> +
> > +	hwmon->occ =3D occ;
> > +	hwmon->num_caps_fields =3D config->num_caps_fields;
> > +	hwmon->caps_names =3D config->caps_names;
> +
> > +	dev_set_drvdata(dev, hwmon);
> +
> > +	rc =3D device_create_file(dev, &dev_attr_online);
> > +	if (rc)
> > +		return ERR_PTR(rc);
> +
> > +	return hwmon;
> +}
> +EXPORT_SYMBOL(occ_sysfs_start);
> +
> +int occ_sysfs_stop(struct device *dev, struct occ_sysfs *driver)
> +{
> > +	if (driver->dev) {
> > +		occ_remove_hwmon_attrs(driver);
> > +		hwmon_device_unregister(driver->dev);
> > +	}
> +
> > +	device_remove_file(driver->dev, &dev_attr_online);
> +
> > +	devm_kfree(dev, driver);
> +
> > +	return 0;
> +}
> +EXPORT_SYMBOL(occ_sysfs_stop);
> +
> > +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("OCC sysfs driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/occ/occ_sysfs.h b/drivers/hwmon/occ/occ_sysfs.=
h
> new file mode 100644
> index 0000000..2a8044f
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_sysfs.h
> @@ -0,0 +1,52 @@
> +/*
> + * occ_sysfs.h - OCC sysfs interface
> + *
> + * This file contains the data structures and function prototypes for th=
e OCC
> + * hwmon sysfs entries.
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __OCC_SYSFS_H__
> +#define __OCC_SYSFS_H__
> +
> +#include "occ.h"
> +
> +struct sensor_group {
> > +	char *name;
> > +	struct sensor_attr_data *sattr;
> > +	struct attribute_group group;
> +};
> +
> +struct occ_sysfs_config {
> > +	unsigned int num_caps_fields;
> > +	char **caps_names;
> +};
> +
> +struct occ_sysfs {
> > +	struct device *dev;
> > +	struct occ *occ;
> +
> > +	u16 user_powercap;
> > +	bool occ_online;
> > +	struct sensor_group sensor_groups[MAX_OCC_SENSOR_TYPE];
> > +	unsigned long update_interval;
> > +	unsigned int num_caps_fields;
> > +	char **caps_names;
> +};
> +
> +struct occ_sysfs *occ_sysfs_start(struct device *dev, struct occ *occ,
> > +				=C2=A0=C2=A0struct occ_sysfs_config *config);
> +int occ_sysfs_stop(struct device *dev, struct occ_sysfs *driver);
> +
> +#endif /* __OCC_SYSFS_H__ */
--=-1P4ZQ31vi4vZLSt8cS1d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYWHfsAAoJEJ0dnzgO5LT5p5EP/30OW8Ru/MluFa1o4Zezo6Bn
JC1t58hi/XHsG2a7jx3TyRDyZ8q6g5344YOo46N9Ihf2T7gK2VdAFUSiAoRgPBvh
PLgnIt3mofH/sXOd4W74nuhx6hQX1OLIClPDnKDHj0C+22Kklb/dTfl+CS9sUm7r
ML+gKwU1wPwAeCdY2vs5LnlyzWKbOSxAzBffz34pBEbYNie6wDCrzJB0ExktAjJG
TbaxlS5+/cBT1n6uV1QBW9fNYcsaKJTymnmlQkHteso19xMXbqaJrPtnxnoWOPdS
9f5bhtNmJDN6/VJD9QY13zknfYS64A5Q5bKUdAZjIXdElJrMN9E/+ZlQTlrB8Xom
IoMdkvW8ptd5iL4WjzullJv9MWFcinCwZRLrrYZQF5cRiuegYYc5I0VGrIiGZy7o
RhUh3uof3JCwZ5jQcmuaxSD5fRq6tVFfMaeygc2yQFkf43kKMVbz5LE7tPP1lm0k
tU+aP1OeTMoJOqX38y5g/GRULUHdKkcB3eJWMZwRvOTnVvxnEnpbMO+201quLybi
uop53685okVf6xy48Are5/Hs7HyS0qQuKl9eZmSwsiwaKLA9drvIpNtqsuRrqLrz
LFPQOpcxDGMjSRJGyr8NR0PB21km0zo0A+JtFY53OBoLTJLHg5H60uKbAkUssZWI
0If/myY9BTImJW+AUbNN
=mCwn
-----END PGP SIGNATURE-----

--=-1P4ZQ31vi4vZLSt8cS1d--
