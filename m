Return-Path: <eajames.ibm@gmail.com>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ttV3m3NQBzDqGL
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jan 2017 10:08:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QsXbRflm"; 
 dkim-atps=neutral
Received: by mail-wm0-x244.google.com with SMTP id m203so88829779wma.3
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jan 2017 15:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s7zALCa9++ZwW8D/AHmQ414cYrfqYJKajfQWgzaTjAc=;
 b=QsXbRflmCbeIlHW1yZg6PGfBqa8VbzXhqEihQbAwpjitMoJy2/aEySREeX97OkoWFf
 aUfaVg/kOA3MAE3VCFm8j0kLvGLvnPOtvtd1aqwtmImRJVUN276Q4Kmbm6AeaBrwVPDq
 xY5horuGmRrkFN8ShxSxLfCaHT1mdRZxZN+uMHGE03ALzeJ6e1dv1h2Pv23M6IlQgTsA
 QPEciGTlzLQ3Sqx3symcweFqJc4PMG4JmoM96NPsbrv1g7rkuxYT2ASrdjCg3Q42+Cse
 YwhehW2vBATGiX3ERxig8XkF/9xdkisk0rWGoL+r3EpI0kRAXOn/su3uEzHXpiEORuR4
 ru7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s7zALCa9++ZwW8D/AHmQ414cYrfqYJKajfQWgzaTjAc=;
 b=XeHOMEOyrc9/fsKKCjWxJMtAx3k9kxXp8z30Q4qo53Y9JsyXdJ9z8O+CQvdwUEgwf1
 lsGFVE5HnNAgONzYLBj5sgaJFklhQXemmAndDdr7v2xO0UBU2dAh3fijtNPof7kXJ2OS
 cTQXXLQCrit+Y+G9z1qhDVMPVDJvrCwo2pWljBhSzNJZ3GqfJH8lCJXzCH7i15by1/zR
 s8NdDKHVMbNP41Gt5iYUp+D3Ek11OsmG8eNdbK18EJtfsY+duRdFC5kh63fSqoMID2or
 TiIE/QEEOXyBAWu414jpP/d4XFCqPzkCE3fT4Y52AOuUOfPfFRUASJSvSHZ23q29UbEc
 VnIg==
X-Gm-Message-State: AIkVDXJ6V4w6PHtKK4xps3ORUfdjDAInaOfylct4PdZEPNH4skobUVTTZL0cXaBzf0htUzzwLU8aq6/MmU0qXg==
X-Received: by 10.28.189.136 with SMTP id n130mr59354871wmf.133.1483484897250; 
 Tue, 03 Jan 2017 15:08:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.137.100 with HTTP; Tue, 3 Jan 2017 15:08:16 -0800 (PST)
In-Reply-To: <42C2BC60-5F46-4632-97D5-E513FF8F3DC8@fuzziesquirrel.com>
References: <20161230193404.GB8516@roeck-us.net>
 <42C2BC60-5F46-4632-97D5-E513FF8F3DC8@fuzziesquirrel.com>
From: Eddie James <eajames.ibm@gmail.com>
Date: Tue, 3 Jan 2017 17:08:16 -0600
Message-ID: <CALpMbdkw1QQZfDQ+NA5WbxrjCRLh0C32Z5eWjuzbk4sZXxQHPg@mail.gmail.com>
Subject: Re: [PATCH linux 2/6] hwmon: occ: Add sysfs interface
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 03 Jan 2017 23:08:21 -0000

Hi,

Just talked to Andrew. Can we just issue a modprobe command from
userspace once the system power is on? That should be pretty clean in
the driver and will make the "online" attribute unnecessary.

Eddie

On Tue, Jan 3, 2017 at 8:30 AM, Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
> The hwmon maintainer rejected Eddies OCC driver because of the online sys=
fs attribute.  Any kernel hackers out there know what the architecturally c=
orrect way to make the occ hwmon device suspend/resume with the system powe=
r might be?
>
> -brad
>
>
>> Begin forwarded message:
>>
>> From: Guenter Roeck <linux@roeck-us.net>
>> Subject: Re: [PATCH linux 2/6] hwmon: occ: Add sysfs interface
>> Date: December 30, 2016 at 2:34:04 PM EST
>> To: eajames.ibm@gmail.com
>> Cc: jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com, robh+dt@ker=
nel.org, wsa@the-dreams.de, andrew@aj.id.au, joel@jms.id.au, devicetree@vge=
r.kernel.org, linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org, linux=
-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, "Edward A. James" <eaja=
mes@us.ibm.com>
>>
>> On Fri, Dec 30, 2016 at 11:56:04AM -0600, eajames.ibm@gmail.com wrote:
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>
>>> Add a generic mechanism to expose the sensors provided by the OCC in
>>> sysfs.
>>>
>>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>>> ---
>>> Documentation/hwmon/occ       |  48 +++++
>>> drivers/hwmon/occ/Makefile    |   2 +-
>>> drivers/hwmon/occ/occ_sysfs.c | 492 +++++++++++++++++++++++++++++++++++=
+++++++
>>> drivers/hwmon/occ/occ_sysfs.h |  52 +++++
>>> 4 files changed, 593 insertions(+), 1 deletion(-)
>>> create mode 100644 drivers/hwmon/occ/occ_sysfs.c
>>> create mode 100644 drivers/hwmon/occ/occ_sysfs.h
>>>
>>> diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
>>> index 79d1642..1ee8689 100644
>>> --- a/Documentation/hwmon/occ
>>> +++ b/Documentation/hwmon/occ
>>> @@ -25,6 +25,54 @@ Currently, all versions of the OCC support four type=
s of sensor data: power,
>>> temperature, frequency, and "caps," which indicate limits and threshold=
s used
>>> internally on the OCC.
>>>
>>> +sysfs Entries
>>> +-------------
>>> +
>>> +The OCC driver uses the hwmon sysfs framework to provide data to users=
pace.
>>> +
>>> +The driver exports two sysfs files for each frequency, temperature, an=
d power
>>> +sensor. These are "input" and "label". The input file contains the val=
ue of the
>>> +sensor. The label file contains the sensor id. The sensor id is the un=
ique
>>> +internal OCC identifier. Sensor ids may be provided by the OCC specifi=
cation.
>>> +The names of these files will be in the following format:
>>> +    <sensor type><sensor index>_input
>>> +    <sensor type><sensor index>_label
>>> +Sensor types will be one of "temp", "freq", or "power". The sensor ind=
ex is
>>> +an index to differentiate different sensor files. For example, a singl=
e
>>> +temperature sensor will have two sysfs files: temp1_input and temp1_la=
bel.
>>> +
>>> +Caps sensors are exported differently. For each caps sensor, the drive=
r will
>>> +export 6 entries:
>>> +    curr_powercap - current power cap in watts
>>> +    curr_powerreading - current power output in watts
>>> +    norm_powercap - power cap without redundant power
>>> +    max_powercap - maximum power cap that can be set in watts
>>> +    min_powercap - minimum power cap that can be set in watts
>>> +    user_powerlimit - power limit specified by the user in watts
>>> +In addition, the OCC driver for P9 will export a 7th entry:
>>> +    user_powerlimit_source - can be one of two values depending on who=
 set
>>> +            the user_powerlimit. 0x1 - out of band from BMC or host. 0=
x2 -
>>> +            in band from other source.
>>> +The format for these files is caps<sensor index>_<entry type>. For exa=
mple,
>>> +caps1_curr_powercap.
>>> +
>>> +The driver also provides a number of sysfs entries through hwmon to be=
tter
>>> +control the driver and monitor the OCC.
>>> +    powercap - read or write the OCC user power limit in watts.
>>> +    name - read the name of the driver
>>> +    update_interval - read or write the minimum interval for polling t=
he
>>> +            OCC.
>>> +
>>> +The driver also exports a single sysfs file through the communication =
protocol
>>> +device (see BMC - Host Communications). The filename is "online" and r=
epresents
>>> +the status of the OCC with respect to the driver. The OCC can be in on=
e of two
>>> +states: OCC polling enabled or OCC polling disabled. The purpose of th=
is file
>>> +is to control the behavior of the driver and it's hwmon sysfs entries,=
 not to
>>> +infer any information about the state of the physical OCC. Reading the=
 file
>>> +returns either a 0 (polling disabled) or 1 (polling enabled). Writing =
1 to the
>>> +file enables OCC polling in the driver if communications can be establ=
ished
>>> +with the OCC. Writing a 0 to the driver disables OCC polling.
>>> +
>>> BMC - Host Communications
>>> -------------------------
>>>
>>> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
>>> index 93cb52f..a6881f9 100644
>>> --- a/drivers/hwmon/occ/Makefile
>>> +++ b/drivers/hwmon/occ/Makefile
>>> @@ -1 +1 @@
>>> -obj-$(CONFIG_SENSORS_PPC_OCC) +=3D occ.o
>>> +obj-$(CONFIG_SENSORS_PPC_OCC) +=3D occ.o occ_sysfs.o
>>> diff --git a/drivers/hwmon/occ/occ_sysfs.c b/drivers/hwmon/occ/occ_sysf=
s.c
>>> new file mode 100644
>>> index 0000000..b0e063da
>>> --- /dev/null
>>> +++ b/drivers/hwmon/occ/occ_sysfs.c
>>> @@ -0,0 +1,492 @@
>>> +/*
>>> + * occ_sysfs.c - OCC sysfs interface
>>> + *
>>> + * This file contains the methods and data structures for implementing=
 the OCC
>>> + * hwmon sysfs entries.
>>> + *
>>> + * Copyright 2016 IBM Corp.
>>> + *
>>> + * This program is free software; you can redistribute it and/or modif=
y
>>> + * it under the terms of the GNU General Public License as published b=
y
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include <linux/init.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/jiffies.h>
>>> +#include <linux/hwmon.h>
>>> +#include <linux/hwmon-sysfs.h>
>>> +#include <linux/err.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/device.h>
>>> +
>>> +#include "occ_sysfs.h"
>>> +
>>> +#define MAX_SENSOR_ATTR_LEN 32
>>> +
>>> +#define RESP_RETURN_CMD_INVAL       0x13
>>> +
>>> +struct sensor_attr_data {
>>> +    enum sensor_type type;
>>> +    u32 hwmon_index;
>>> +    u32 attr_id;
>>> +    char name[MAX_SENSOR_ATTR_LEN];
>>> +    struct device_attribute dev_attr;
>>> +};
>>> +
>>> +static ssize_t show_input(struct device *dev,
>>> +                      struct device_attribute *attr, char *buf)
>>> +{
>>> +    int val;
>>> +    struct sensor_attr_data *sdata =3D container_of(attr,
>>> +                                                  struct sensor_attr_d=
ata,
>>> +                                                  dev_attr);
>>> +    struct occ_sysfs *driver =3D dev_get_drvdata(dev);
>>> +
>>> +    val =3D occ_get_sensor_value(driver->occ, sdata->type,
>>> +                               sdata->hwmon_index - 1);
>>> +    if (sdata->type =3D=3D TEMP)
>>> +            val *=3D 1000;    /* in millidegree Celsius */
>>> +
>>> +    return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
>>> +}
>>> +
>>> +/* show_label provides the OCC sensor id. The sensor id will be either=
 a
>>> + * 2-byte (for P8) or 4-byte (for P9) value. The sensor id is a way to
>>> + * identify what each sensor represents, according to the OCC specific=
ation.
>>> + */
>>> +static ssize_t show_label(struct device *dev,
>>> +                      struct device_attribute *attr, char *buf)
>>> +{
>>> +    int val;
>>> +    struct sensor_attr_data *sdata =3D container_of(attr,
>>> +                                                  struct sensor_attr_d=
ata,
>>> +                                                  dev_attr);
>>> +    struct occ_sysfs *driver =3D dev_get_drvdata(dev);
>>> +
>>> +    val =3D occ_get_sensor_id(driver->occ, sdata->type,
>>> +                            sdata->hwmon_index - 1);
>>> +
>>> +    return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
>>> +}
>>> +
>>> +static ssize_t show_caps(struct device *dev,
>>> +                     struct device_attribute *attr, char *buf)
>>> +{
>>> +    int val;
>>> +    struct caps_sensor *sensor;
>>> +    struct sensor_attr_data *sdata =3D container_of(attr,
>>> +                                                  struct sensor_attr_d=
ata,
>>> +                                                  dev_attr);
>>> +    struct occ_sysfs *driver =3D dev_get_drvdata(dev);
>>> +
>>> +    sensor =3D occ_get_sensor(driver->occ, CAPS);
>>> +    if (!sensor) {
>>> +            val =3D -1;
>>> +            return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
>>> +    }
>>> +
>>> +    val =3D occ_get_caps_value(driver->occ, sensor, sdata->hwmon_index=
 - 1,
>>> +                             sdata->attr_id);
>>> +
>>> +    return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
>>> +}
>>> +
>>> +static ssize_t show_update_interval(struct device *dev,
>>> +                                struct device_attribute *attr, char *b=
uf)
>>> +{
>>> +    struct occ_sysfs *driver =3D dev_get_drvdata(dev);
>>> +
>>> +    return snprintf(buf, PAGE_SIZE - 1, "%lu\n", driver->update_interv=
al);
>>> +}
>>> +
>>> +static ssize_t store_update_interval(struct device *dev,
>>> +                                 struct device_attribute *attr,
>>> +                                 const char *buf, size_t count)
>>> +{
>>> +    struct occ_sysfs *driver =3D dev_get_drvdata(dev);
>>> +    unsigned long val;
>>> +    int rc;
>>> +
>>> +    rc =3D kstrtoul(buf, 10, &val);
>>> +    if (rc)
>>> +            return rc;
>>> +
>>> +    driver->update_interval =3D val;
>>> +    occ_set_update_interval(driver->occ, val);
>>> +
>>> +    return count;
>>> +}
>>> +
>>> +static DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO, show_update_int=
erval,
>>> +               store_update_interval);
>>> +
>>> +static ssize_t show_name(struct device *dev,
>>> +                     struct device_attribute *attr, char *buf)
>>> +{
>>> +    return snprintf(buf, PAGE_SIZE - 1, "occ\n");
>>> +}
>>> +
>>> +static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
>>> +
>>> +static ssize_t show_user_powercap(struct device *dev,
>>> +                              struct device_attribute *attr, char *buf=
)
>>> +{
>>> +    struct occ_sysfs *driver =3D dev_get_drvdata(dev);
>>> +
>>> +    return snprintf(buf, PAGE_SIZE - 1, "%u\n", driver->user_powercap)=
;
>>> +}
>>> +
>>> +static ssize_t store_user_powercap(struct device *dev,
>>> +                               struct device_attribute *attr,
>>> +                               const char *buf, size_t count)
>>> +{
>>> +    struct occ_sysfs *driver =3D dev_get_drvdata(dev);
>>> +    u16 val;
>>> +    int rc;
>>> +
>>> +    rc =3D kstrtou16(buf, 10, &val);
>>> +    if (rc)
>>> +            return rc;
>>> +
>>> +    dev_dbg(dev, "set user powercap to: %d\n", val);
>>> +    rc =3D occ_set_user_powercap(driver->occ, val);
>>> +    if (rc) {
>>> +            dev_err(dev, "set user powercap failed: 0x%x\n", rc);
>>> +            if (rc =3D=3D RESP_RETURN_CMD_INVAL) {
>>> +                    dev_err(dev, "set invalid powercap value: %d\n", v=
al);
>>> +                    return -EINVAL;
>>> +            }
>>> +
>>> +            return rc;
>>> +    }
>>> +
>>> +    driver->user_powercap =3D val;
>>> +
>>> +    return count;
>>> +}
>>> +
>>> +static DEVICE_ATTR(user_powercap, S_IWUSR | S_IRUGO, show_user_powerca=
p,
>>> +               store_user_powercap);
>>> +
>>> +static void deinit_sensor_groups(struct device *dev,
>>> +                             struct sensor_group *sensor_groups)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i =3D 0; i < MAX_OCC_SENSOR_TYPE; i++) {
>>> +            if (sensor_groups[i].group.attrs)
>>> +                    devm_kfree(dev, sensor_groups[i].group.attrs);
>>> +            if (sensor_groups[i].sattr)
>>> +                    devm_kfree(dev, sensor_groups[i].sattr);
>>> +            sensor_groups[i].group.attrs =3D NULL;
>>> +            sensor_groups[i].sattr =3D NULL;
>>> +    }
>>> +}
>>> +
>>> +static void sensor_attr_init(struct sensor_attr_data *sdata,
>>> +                         char *sensor_group_name,
>>> +                         char *attr_name,
>>> +                         ssize_t (*show)(struct device *dev,
>>> +                                         struct device_attribute *attr=
,
>>> +                                         char *buf))
>>> +{
>>> +    sysfs_attr_init(&sdata->dev_attr.attr);
>>> +
>>> +    snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
>>> +             sensor_group_name, sdata->hwmon_index, attr_name);
>>> +    sdata->dev_attr.attr.name =3D sdata->name;
>>> +    sdata->dev_attr.attr.mode =3D S_IRUGO;
>>> +    sdata->dev_attr.show =3D show;
>>> +}
>>> +
>>> +static int create_sensor_group(struct occ_sysfs *driver,
>>> +                           enum sensor_type type, int sensor_num)
>>> +{
>>> +    struct device *dev =3D driver->dev;
>>> +    struct sensor_group *sensor_groups =3D driver->sensor_groups;
>>> +    struct sensor_attr_data *sdata;
>>> +    int rc, i;
>>> +
>>> +    /* each sensor has 'label' and 'input' attributes */
>>> +    sensor_groups[type].group.attrs =3D
>>> +            devm_kzalloc(dev, sizeof(struct attribute *) *
>>> +                         sensor_num * 2 + 1, GFP_KERNEL);
>>> +    if (!sensor_groups[type].group.attrs) {
>>> +            rc =3D -ENOMEM;
>>> +            goto err;
>>> +    }
>>> +
>>> +    sensor_groups[type].sattr =3D
>>> +            devm_kzalloc(dev, sizeof(struct sensor_attr_data) *
>>> +                         sensor_num * 2, GFP_KERNEL);
>>> +    if (!sensor_groups[type].sattr) {
>>> +            rc =3D -ENOMEM;
>>> +            goto err;
>>> +    }
>>> +
>>> +    for (i =3D 0; i < sensor_num; i++) {
>>> +            sdata =3D &sensor_groups[type].sattr[i];
>>> +            /* hwmon attributes index starts from 1 */
>>> +            sdata->hwmon_index =3D i + 1;
>>> +            sdata->type =3D type;
>>> +            sensor_attr_init(sdata, sensor_groups[type].name, "input",
>>> +                             show_input);
>>> +            sensor_groups[type].group.attrs[i] =3D &sdata->dev_attr.at=
tr;
>>> +
>>> +            sdata =3D &sensor_groups[type].sattr[i + sensor_num];
>>> +            sdata->hwmon_index =3D i + 1;
>>> +            sdata->type =3D type;
>>> +            sensor_attr_init(sdata, sensor_groups[type].name, "label",
>>> +                             show_label);
>>> +            sensor_groups[type].group.attrs[i + sensor_num] =3D
>>> +                    &sdata->dev_attr.attr;
>>> +    }
>>> +
>>> +    rc =3D sysfs_create_group(&dev->kobj, &sensor_groups[type].group);
>>> +    if (rc)
>>> +            goto err;
>>> +
>>> +    return 0;
>>> +err:
>>> +    deinit_sensor_groups(dev, sensor_groups);
>>> +    return rc;
>>> +}
>>> +
>>> +static void caps_sensor_attr_init(struct sensor_attr_data *sdata,
>>> +                              char *attr_name, uint32_t hwmon_index,
>>> +                              uint32_t attr_id)
>>> +{
>>> +    sdata->type =3D CAPS;
>>> +    sdata->hwmon_index =3D hwmon_index;
>>> +    sdata->attr_id =3D attr_id;
>>> +
>>> +    snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
>>> +             "caps", sdata->hwmon_index, attr_name);
>>> +
>>> +    sysfs_attr_init(&sdata->dev_attr.attr);
>>> +    sdata->dev_attr.attr.name =3D sdata->name;
>>> +    sdata->dev_attr.attr.mode =3D S_IRUGO;
>>> +    sdata->dev_attr.show =3D show_caps;
>>> +}
>>> +
>>> +static int create_caps_sensor_group(struct occ_sysfs *driver, int sens=
or_num)
>>> +{
>>> +    struct device *dev =3D driver->dev;
>>> +    struct sensor_group *sensor_groups =3D driver->sensor_groups;
>>> +    int field_num =3D driver->num_caps_fields;
>>> +    struct sensor_attr_data *sdata;
>>> +    int i, j, rc;
>>> +
>>> +    sensor_groups[CAPS].group.attrs =3D
>>> +            devm_kzalloc(dev, sizeof(struct attribute *) * sensor_num =
*
>>> +                         field_num + 1, GFP_KERNEL);
>>> +    if (!sensor_groups[CAPS].group.attrs) {
>>> +            rc =3D -ENOMEM;
>>> +            goto err;
>>> +    }
>>> +
>>> +    sensor_groups[CAPS].sattr =3D
>>> +            devm_kzalloc(dev, sizeof(struct sensor_attr_data) *
>>> +                         sensor_num * field_num, GFP_KERNEL);
>>> +    if (!sensor_groups[CAPS].sattr) {
>>> +            rc =3D -ENOMEM;
>>> +            goto err;
>>> +    }
>>> +
>>> +    for (j =3D 0; j < sensor_num; ++j) {
>>> +            for (i =3D 0; i < field_num; ++i) {
>>> +                    sdata =3D &sensor_groups[CAPS].sattr[j * field_num=
 + i];
>>> +                    caps_sensor_attr_init(sdata,
>>> +                                          driver->caps_names[i], j + 1=
, i);
>>> +                    sensor_groups[CAPS].group.attrs[j * field_num + i]=
 =3D
>>> +                            &sdata->dev_attr.attr;
>>> +            }
>>> +    }
>>> +
>>> +    rc =3D sysfs_create_group(&dev->kobj, &sensor_groups[CAPS].group);
>>> +    if (rc)
>>> +            goto err;
>>> +
>>> +    return rc;
>>> +err:
>>> +    deinit_sensor_groups(dev, sensor_groups);
>>> +    return rc;
>>> +}
>>> +
>>> +static void occ_remove_hwmon_attrs(struct occ_sysfs *driver)
>>> +{
>>> +    struct device *dev =3D driver->dev;
>>> +
>>> +    device_remove_file(dev, &dev_attr_user_powercap);
>>> +    device_remove_file(dev, &dev_attr_update_interval);
>>> +    device_remove_file(dev, &dev_attr_name);
>>> +}
>>> +
>>> +static int occ_create_hwmon_attrs(struct occ_sysfs *driver)
>>> +{
>>> +    int i, rc, id, sensor_num;
>>> +    struct device *dev =3D driver->dev;
>>> +    struct sensor_group *sensor_groups =3D driver->sensor_groups;
>>> +    struct occ_blocks *resp =3D NULL;
>>> +
>>> +    occ_get_response_blocks(driver->occ, &resp);
>>> +
>>> +    for (i =3D 0; i < MAX_OCC_SENSOR_TYPE; ++i)
>>> +            resp->sensor_block_id[i] =3D -1;
>>> +
>>> +    /* read sensor data from occ */
>>> +    rc =3D occ_update_device(driver->occ);
>>> +    if (rc) {
>>> +            dev_err(dev, "cannot get occ sensor data: %d\n", rc);
>>> +            return rc;
>>> +    }
>>> +    if (!resp->blocks)
>>> +            return -ENOMEM;
>>> +
>>> +    rc =3D device_create_file(dev, &dev_attr_name);
>>> +    if (rc)
>>> +            goto error;
>>> +
>>> +    rc =3D device_create_file(dev, &dev_attr_update_interval);
>>> +    if (rc)
>>> +            goto error;
>>> +
>>> +    if (resp->sensor_block_id[CAPS] >=3D 0) {
>>> +            /* user powercap: only for master OCC */
>>> +            rc =3D device_create_file(dev, &dev_attr_user_powercap);
>>> +            if (rc)
>>> +                    goto error;
>>> +    }
>>> +
>>> +    sensor_groups[FREQ].name =3D "freq";
>>> +    sensor_groups[TEMP].name =3D "temp";
>>> +    sensor_groups[POWER].name =3D "power";
>>> +    sensor_groups[CAPS].name =3D "caps";
>>> +
>>> +    for (i =3D 0; i < MAX_OCC_SENSOR_TYPE; i++) {
>>> +            id =3D resp->sensor_block_id[i];
>>> +            if (id < 0)
>>> +                    continue;
>>> +
>>> +            sensor_num =3D resp->blocks[id].header.sensor_num;
>>> +            if (i =3D=3D CAPS)
>>> +                    rc =3D create_caps_sensor_group(driver, sensor_num=
);
>>> +            else
>>> +                    rc =3D create_sensor_group(driver, i, sensor_num);
>>> +            if (rc)
>>> +                    goto error;
>>> +    }
>>> +
>>> +    return 0;
>>> +
>>> +error:
>>> +    dev_err(dev, "cannot create hwmon attributes: %d\n", rc);
>>> +    occ_remove_hwmon_attrs(driver);
>>> +    return rc;
>>> +}
>>> +
>>> +static ssize_t show_occ_online(struct device *dev,
>>> +                           struct device_attribute *attr, char *buf)
>>> +{
>>> +    struct occ_sysfs *driver =3D dev_get_drvdata(dev);
>>> +
>>> +    return snprintf(buf, PAGE_SIZE - 1, "%u\n", driver->occ_online);
>>> +}
>>> +
>>> +static ssize_t store_occ_online(struct device *dev,
>>> +                            struct device_attribute *attr,
>>> +                            const char *buf, size_t count)
>>> +{
>>> +    struct occ_sysfs *driver =3D dev_get_drvdata(dev);
>>> +    unsigned long val;
>>> +    int rc;
>>> +
>>> +    rc =3D kstrtoul(buf, 10, &val);
>>> +    if (rc)
>>> +            return rc;
>>> +
>>> +    if (val =3D=3D 1) {
>>> +            if (driver->occ_online)
>>> +                    return count;
>>> +
>>> +            driver->dev =3D hwmon_device_register(dev);
>>
>> hwmon_device_register() is deprecated. Please consider using
>> devm_hwmon_device_register_with_info() or at least
>> hwmon_device_register_with_info().
>>
>> Uuh ... and registering a hwmon device based on writing into a sysfs att=
ribute
>> is completely out of the question.
>>
>> Thanks,
>> Guenter
>>
>>> +            if (IS_ERR(driver->dev))
>>> +                    return PTR_ERR(driver->dev);
>>> +
>>> +            dev_set_drvdata(driver->dev, driver);
>>> +
>>> +            rc =3D occ_create_hwmon_attrs(driver);
>>> +            if (rc) {
>>> +                    hwmon_device_unregister(driver->dev);
>>> +                    driver->dev =3D NULL;
>>> +                    return rc;
>>> +            }
>>> +    } else if (val =3D=3D 0) {
>>> +            if (!driver->occ_online)
>>> +                    return count;
>>> +
>>> +            occ_remove_hwmon_attrs(driver);
>>> +            hwmon_device_unregister(driver->dev);
>>> +            driver->dev =3D NULL;
>>> +    } else
>>> +            return -EINVAL;
>>> +
>>> +    driver->occ_online =3D val;
>>> +    return count;
>>> +}
>>> +
>>> +static DEVICE_ATTR(online, S_IWUSR | S_IRUGO, show_occ_online,
>>> +               store_occ_online);
>>> +
>>> +struct occ_sysfs *occ_sysfs_start(struct device *dev, struct occ *occ,
>>> +                              struct occ_sysfs_config *config)
>>> +{
>>> +    struct occ_sysfs *hwmon =3D devm_kzalloc(dev, sizeof(struct occ_sy=
sfs),
>>> +                                           GFP_KERNEL);
>>> +    int rc;
>>> +
>>> +    if (!hwmon)
>>> +            return ERR_PTR(-ENOMEM);
>>> +
>>> +    hwmon->occ =3D occ;
>>> +    hwmon->num_caps_fields =3D config->num_caps_fields;
>>> +    hwmon->caps_names =3D config->caps_names;
>>> +
>>> +    dev_set_drvdata(dev, hwmon);
>>> +
>>> +    rc =3D device_create_file(dev, &dev_attr_online);
>>> +    if (rc)
>>> +            return ERR_PTR(rc);
>>> +
>>> +    return hwmon;
>>> +}
>>> +EXPORT_SYMBOL(occ_sysfs_start);
>>> +
>>> +int occ_sysfs_stop(struct device *dev, struct occ_sysfs *driver)
>>> +{
>>> +    if (driver->dev) {
>>> +            occ_remove_hwmon_attrs(driver);
>>> +            hwmon_device_unregister(driver->dev);
>>> +    }
>>> +
>>> +    device_remove_file(driver->dev, &dev_attr_online);
>>> +
>>> +    devm_kfree(dev, driver);
>>
>> Thw point of using devm_ functions is not to require remove/free functio=
ns.
>> Something is completely wrong here if you need that call.
>>
>> Overall, this is architectually completely wrong. One does not register
>> or instantiate drivers based on writing into sysfs attributes. Please
>> reconsider your approach.
>>
>>> +
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL(occ_sysfs_stop);
>>> +
>>> +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
>>> +MODULE_DESCRIPTION("OCC sysfs driver");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/hwmon/occ/occ_sysfs.h b/drivers/hwmon/occ/occ_sysf=
s.h
>>> new file mode 100644
>>> index 0000000..2a8044f
>>> --- /dev/null
>>> +++ b/drivers/hwmon/occ/occ_sysfs.h
>>> @@ -0,0 +1,52 @@
>>> +/*
>>> + * occ_sysfs.h - OCC sysfs interface
>>> + *
>>> + * This file contains the data structures and function prototypes for =
the OCC
>>> + * hwmon sysfs entries.
>>> + *
>>> + * Copyright 2016 IBM Corp.
>>> + *
>>> + * This program is free software; you can redistribute it and/or modif=
y
>>> + * it under the terms of the GNU General Public License as published b=
y
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +
>>> +#ifndef __OCC_SYSFS_H__
>>> +#define __OCC_SYSFS_H__
>>> +
>>> +#include "occ.h"
>>> +
>>> +struct sensor_group {
>>> +    char *name;
>>> +    struct sensor_attr_data *sattr;
>>> +    struct attribute_group group;
>>> +};
>>> +
>>> +struct occ_sysfs_config {
>>> +    unsigned int num_caps_fields;
>>> +    char **caps_names;
>>> +};
>>> +
>>> +struct occ_sysfs {
>>> +    struct device *dev;
>>> +    struct occ *occ;
>>> +
>>> +    u16 user_powercap;
>>> +    bool occ_online;
>>> +    struct sensor_group sensor_groups[MAX_OCC_SENSOR_TYPE];
>>> +    unsigned long update_interval;
>>> +    unsigned int num_caps_fields;
>>> +    char **caps_names;
>>> +};
>>> +
>>> +struct occ_sysfs *occ_sysfs_start(struct device *dev, struct occ *occ,
>>> +                              struct occ_sysfs_config *config);
>>> +int occ_sysfs_stop(struct device *dev, struct occ_sysfs *driver);
>>> +
>>> +#endif /* __OCC_SYSFS_H__ */
>>> --
>>> 1.9.1
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" i=
n
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
