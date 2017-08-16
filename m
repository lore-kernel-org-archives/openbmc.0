Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xXLr84y88zDqsF
 for <openbmc@lists.ozlabs.org>; Wed, 16 Aug 2017 17:41:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ncWnDhVQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="D3tnQHWJ"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 26DAB20BA7;
 Wed, 16 Aug 2017 03:41:09 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 16 Aug 2017 03:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=k/CYf70t5nYEA8cNKOEe0aHvjhJCajw+QFtf3P+v7
 OY=; b=ncWnDhVQUiTwCHjiA1ORb1fi6hH232JbT2fBWV4RmSb4O6rbpu9/nT4zA
 aKsTscBpijVHxJXzERFdK/Gt0YIBeKa1M0hAXlT7korZ5jwxbOO/QZQgyVCk5BmL
 BM/2ByvE5pDcEvDU/EME72sKS1TrUjiRMMMZuQvLedyzCqL+lxw7Q59bE+7fOmau
 a2OkJ6kUJJ9Bs9iav4wJWsTVGwscPJwNVF29RMolUbiMqMH9tfhrJIFrju8a6Z1c
 KzemebIp3rs4eLwJf51CgWtS8E0puNZeEHc6cCmofVa1mCcbSKW2ROAi9sh7kioN
 OnKrrfpUDDvOaQgw3q5Ok6KnW6T5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=k/CYf70t5nYEA8cNKO
 Ee0aHvjhJCajw+QFtf3P+v7OY=; b=D3tnQHWJUtJW7ak0rfQVcX89x1oUXx/Vpv
 zvd0kd2hqpWLr3pnzCRrCo9E3qODH3UuggdGgRfph64NvsdO1ZF+BUMa5OVNvT2c
 1epIjxJ+t2TLu31W3h/NIgAobIAHCS8fbN95OzG+8/gw73zbsmPmWDyoy+0Ypdf3
 xsRdSx3nOzLr1o05rRMaWlV1dF2GxKi0uLWGq0KpuXuXr28vhwvOyDGnAXLruzYu
 FQHu9+rpasNSA4V6jv/ttEJRDmPuAUA03k/48xlHvLDM3QIsaD9KV0fLuHnbCeV+
 22x2SNUJODtONoLp5IABPnGpmFpSJvdYKT/WG6I1IQl2GiNQM1eQ==
X-ME-Sender: <xms:FfeTWfEnJZZVkDzYG8fK-hPRd7gpLOZ_TE0qaibs66g_8nYNRQ2ZfA>
X-Sasl-enc: FCG/FBGwVo4KofEiN9619837j4ELf3c/C/RU2nJhtLHc 1502869268
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3BCD37F9A9;
 Wed, 16 Aug 2017 03:41:06 -0400 (EDT)
Message-ID: <1502869263.681.3.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2] hwmon: (ucd9000) Add syfs access
 files for chip specific faults
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Wed, 16 Aug 2017 17:11:03 +0930
In-Reply-To: <20170812172607.74148-1-cbostic@linux.vnet.ibm.com>
References: <20170812172607.74148-1-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-B2qlkewMpGmjBTZIA4nf"
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
X-List-Received-Date: Wed, 16 Aug 2017 07:41:14 -0000


--=-B2qlkewMpGmjBTZIA4nf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

Comments inline based on some skimming of the datasheet and command
reference.

On Sat, 2017-08-12 at 12:26 -0500, Christopher Bostic wrote:
> Create sysfs files for mfr specific fault indicators.
> Add sysfs files for GPIO configuration access.
> Link driver into the gpio device driver.
>=C2=A0
> > Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v2 - Removed clear_faults file - redundant since all other sysfs
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0core accesses result in an automatic clear =
fault.
> =C2=A0=C2=A0=C2=A0- Removed local status_word and status_vout register du=
mps and
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0use the new pmbus core status facilities in=
stead.
> =C2=A0=C2=A0=C2=A0- Rename gpi<x>_fault to gpi<x>_alarm to better match c=
ore naming
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0conventions.
> =C2=A0=C2=A0=C2=A0- Add full register dump for mfr_status.
> =C2=A0=C2=A0=C2=A0- Add gpio chip to device structure and use gpio interf=
aces.
> ---
> =C2=A0drivers/hwmon/pmbus/ucd9000.c | 268 +++++++++++++++++++++++++++++++=
++++++++++-
> =C2=A01 file changed, 266 insertions(+), 2 deletions(-)
>=C2=A0
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.=
c
> index 3e3aa95..ecd3e1a 100644
> --- a/drivers/hwmon/pmbus/ucd9000.c
> +++ b/drivers/hwmon/pmbus/ucd9000.c
> @@ -26,6 +26,9 @@
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/i2c.h>
> =C2=A0#include <linux/i2c/pmbus.h>
> +#include <linux/sysfs.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/gpio.h>
> =C2=A0#include "pmbus.h"
> =C2=A0
> =C2=A0enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd909=
10 };
> @@ -34,6 +37,10 @@
> > =C2=A0#define UCD9000_NUM_PAGES		0xd6
> > =C2=A0#define UCD9000_FAN_CONFIG_INDEX	0xe7
> > =C2=A0#define UCD9000_FAN_CONFIG		0xe8
> > +#define UCD9000_LOGGED_FAULTS		0xea
> > +#define UCD9000_MFR_STATUS		0xf3
> > +#define UCD9000_GPIO_SELECT		0xfa
> > +#define UCD9000_GPIO_CONFIG		0xfb
> > =C2=A0#define UCD9000_DEVICE_ID		0xfd
> =C2=A0
> > =C2=A0#define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
> @@ -46,9 +53,14 @@
> =C2=A0
> > =C2=A0#define UCD9000_NUM_FAN		4
> =C2=A0
> > +#define UCD9000_FULL_REG	BIT(8)
> +
> > +#define UCD90160_NUM_GPIOS	26
> +
> =C2=A0struct ucd9000_data {
> > =C2=A0	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
> > =C2=A0	struct pmbus_driver_info info;
> > +	struct gpio_chip gpio;
> =C2=A0};
> =C2=A0#define to_ucd9000_data(_info) container_of(_info, struct ucd9000_d=
ata, info)
> =C2=A0
> @@ -119,6 +131,225 @@ static int ucd9000_read_byte_data(struct i2c_client=
 *client, int page, int reg)
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(i2c, ucd9000_id);
> =C2=A0
> +static void ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
> > +			int value)
> +{
> > +	struct i2c_client *client=C2=A0=C2=A0=3D gpiochip_get_data(gc);
> > +	int ret;
> +
> > +	ret =3D i2c_smbus_write_byte_data(client, offset, value);

Why are we using i2c_smbus_write_byte_data()? Why aren't we using the pmbus=
_*()
helpers? Is it because we don't have to set the page? Might be worth a comm=
ent
if so.

Regardless this doesn't seem right - offset is in the GPIO number space
relative to the base for the GPIO chip. i2c_smbus_write_byte_data() uses th=
e
second argument as the command - so we'll be writing 'value' to registers w=
e
don't intend?

Shouldn't this be writing GPIO_SELECT and then GPIO_CONFIG? Also as noted i=
n
the datasheet don't we need a double-write of GPIO_CONFIG to avoid storing
enabled output state on STORE_DEFAULT_ALL?

> > +	if (ret)
> > +		dev_err(&client->dev, "Failed to set gpio select %d\n", value);
> +}
> +
> +static int ucd9000_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> > +	struct i2c_client *client=C2=A0=C2=A0=3D gpiochip_get_data(gc);
> +
> > +	return i2c_smbus_read_byte_data(client, offset);

Similar comments here as for the _set() case.

> +}
> +
> +static ssize_t ucd9000_clear_logged_faults(struct device *dev,
> > +				struct device_attribute *attr, const char *buf,
> > +				size_t count)
> +{
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	int ret;
> +
> > +	ret =3D i2c_smbus_write_byte_data(client, UCD9000_LOGGED_FAULTS, 0);
> > +	if (ret) {
> > +		dev_err(&client->dev, "Failed to clear logged faults\n");
> > +		return ret;
> > +	}
> +
> > +	return count;
> +}
> +
> +static ssize_t ucd9000_mfr_status(struct device *dev,
> > +				struct device_attribute *attr,
> > +				char *buf)
> +{
> > +	struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_attr(at=
tr);
> > +	bool full_reg =3D !!(sensor_attr->index & UCD9000_FULL_REG);
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	int nr =3D sensor_attr->index, ret;
> > +	u32 block_buffer;
> +
> > +	ret =3D pmbus_set_page(client, 0);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "i2c_smbus_write failed. rc:%d\n", ret);
> > +		return ret;
> > +	}
> +
> > +	ret =3D i2c_smbus_read_block_data(client, UCD9000_MFR_STATUS,
> > +					(u8 *)&block_buffer);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev,
> > +			"Failed to read mfr status. rc:%d\n", ret);
> > +		return ret;
> > +	}
> +
> > +	if (full_reg)
> > +		return sprintf(buf, "%08x\n", ret);
> > +	else
> > +		return sprintf(buf, "%1d\n", ret & BIT(nr) ? 1 : 0);
> +}
> +
> +static ssize_t ucd9000_gpi_config(struct device *dev,
> > +				struct device_attribute *attr,
> > +				char *buf)
> +{
> > +	struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_attr(at=
tr);
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	struct ucd9000_data *data
> > +		=3D to_ucd9000_data(pmbus_get_driver_info(client));
> > +	int nr =3D (sensor_attr->index & 0xf00) >> 8;
> > +	int reg =3D sensor_attr->index & 0xff, ret;
> +
> +
> > +	ucd9000_gpio_set(&data->gpio, UCD9000_GPIO_SELECT, reg);
> > +	ret =3D ucd9000_gpio_get(&data->gpio, UCD9000_GPIO_CONFIG);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev,
> > +			"Failed to read gpi%02d config\n", reg);
> > +	}
> +
> > +	return sprintf(buf, "%1d\n", ret & BIT(nr) ? 1 : 0);
> +}
> +
> +static DEVICE_ATTR(clear_logged_faults, 0200,
> > +			=C2=A0=C2=A0NULL, ucd9000_clear_logged_faults);
> +
> +/* MFR status */
> +static SENSOR_DEVICE_ATTR(gpi8_alarm, 0444, ucd9000_mfr_status, NULL, 23=
);
> +static SENSOR_DEVICE_ATTR(gpi7_alarm, 0444, ucd9000_mfr_status, NULL, 22=
);
> +static SENSOR_DEVICE_ATTR(gpi6_alarm, 0444, ucd9000_mfr_status, NULL, 21=
);
> +static SENSOR_DEVICE_ATTR(gpi5_alarm, 0444, ucd9000_mfr_status, NULL, 20=
);
> +static SENSOR_DEVICE_ATTR(gpi4_alarm, 0444, ucd9000_mfr_status, NULL, 19=
);
> +static SENSOR_DEVICE_ATTR(gpi3_alarm, 0444, ucd9000_mfr_status, NULL, 18=
);
> +static SENSOR_DEVICE_ATTR(gpi2_alarm, 0444, ucd9000_mfr_status, NULL, 17=
);
> +static SENSOR_DEVICE_ATTR(gpi1_alarm, 0444, ucd9000_mfr_status, NULL, 16=
);
> +static SENSOR_DEVICE_ATTR(new_logged_fault_detail, 0444,
> > +			ucd9000_mfr_status, NULL, 12);
> +static SENSOR_DEVICE_ATTR(system_watchdog_timeout, 0444,
> > +			ucd9000_mfr_status, NULL, 11);
> +static SENSOR_DEVICE_ATTR(store_default_all_error, 0444,
> > +			ucd9000_mfr_status, NULL, 10);
> +static SENSOR_DEVICE_ATTR(store_default_all_done, 0444,
> > +			ucd9000_mfr_status, NULL, 9);
> +static SENSOR_DEVICE_ATTR(watchdog_timeout, 0444,
> > +			ucd9000_mfr_status, NULL, 8);
> +static SENSOR_DEVICE_ATTR(invalid_logs, 0444,
> > +			ucd9000_mfr_status, NULL, 7);
> +static SENSOR_DEVICE_ATTR(logged_fault_detail, 0444,
> > +			ucd9000_mfr_status, NULL, 6);
> +static SENSOR_DEVICE_ATTR(resequence_error, 0444, ucd9000_mfr_status, NU=
LL, 5);
> +static SENSOR_DEVICE_ATTR(pkgid_mismatch, 0444, ucd9000_mfr_status, NULL=
, 4);
> +static SENSOR_DEVICE_ATTR(hardcoded_parms, 0444, ucd9000_mfr_status, NUL=
L, 3);
> +static SENSOR_DEVICE_ATTR(seq_off_timeout, 0444, ucd9000_mfr_status, NUL=
L, 2);
> +static SENSOR_DEVICE_ATTR(seq_on_timeout, 0444, ucd9000_mfr_status, NULL=
, 1);
> +static SENSOR_DEVICE_ATTR(mfr_status, 0444,
> > +			ucd9000_mfr_status, NULL, UCD9000_FULL_REG);

Are these for debug purposes? I can imagine the *_alarm attributes would be
useful in normal circumstances, but are the others?
> +
> +/* GPIO config */
> +static SENSOR_DEVICE_ATTR(gpio8_enab, 0444, ucd9000_gpi_config, NULL, 8)=
;
> +static SENSOR_DEVICE_ATTR(gpio8_out_enab, 0444, ucd9000_gpi_config,
> > +			NULL, 0x0108);

I would think these should be eliminated by using the gpiochip. If they're =
not,
can you please explain why?

> +static SENSOR_DEVICE_ATTR(gpio8_out_val, 0444, ucd9000_gpi_config,
> > +			NULL, 0x0208);
> +static SENSOR_DEVICE_ATTR(gpio8_stat, 0444, ucd9000_gpi_config,
> > +			NULL, 0x0308);
> +static SENSOR_DEVICE_ATTR(gpio9_enab, 0444, ucd9000_gpi_config, NULL, 9)=
;
> +static SENSOR_DEVICE_ATTR(gpio9_out_enab, 0444, ucd9000_gpi_config,
> > +			NULL, 0x0109);
> +static SENSOR_DEVICE_ATTR(gpio9_out_val, 0444, ucd9000_gpi_config,
> > +			NULL, 0x0209);
> +static SENSOR_DEVICE_ATTR(gpio9_stat, 0444, ucd9000_gpi_config,
> > +			NULL, 0x0309);
> +static SENSOR_DEVICE_ATTR(gpio10_enab, 0444, ucd9000_gpi_config, NULL, 1=
0);
> +static SENSOR_DEVICE_ATTR(gpio10_out_enab, 0444, ucd9000_gpi_config,
> > +			NULL, 0x010a);
> +static SENSOR_DEVICE_ATTR(gpio10_out_val, 0444, ucd9000_gpi_config,
> > +			NULL, 0x020a);
> +static SENSOR_DEVICE_ATTR(gpio10_stat, 0444, ucd9000_gpi_config,
> > +			NULL, 0x030a);
> +static SENSOR_DEVICE_ATTR(gpio11_enab, 0444, ucd9000_gpi_config, NULL, 1=
1);
> +static SENSOR_DEVICE_ATTR(gpio11_out_enab, 0444, ucd9000_gpi_config,
> > +			NULL, 0x010b);
> +static SENSOR_DEVICE_ATTR(gpio11_out_val, 0444, ucd9000_gpi_config,
> > +			NULL, 0x020b);
> +static SENSOR_DEVICE_ATTR(gpio11_stat, 0444, ucd9000_gpi_config,
> > +			NULL, 0x030b);
> +static SENSOR_DEVICE_ATTR(gpio14_enab, 0444, ucd9000_gpi_config, NULL, 1=
4);
> +static SENSOR_DEVICE_ATTR(gpio14_out_enab, 0444, ucd9000_gpi_config,
> > +			NULL, 0x010e);
> +static SENSOR_DEVICE_ATTR(gpio14_out_val, 0444, ucd9000_gpi_config,
> > +			NULL, 0x020e);
> +static SENSOR_DEVICE_ATTR(gpio14_stat, 0444, ucd9000_gpi_config,
> > +			NULL, 0x030e);
> +static SENSOR_DEVICE_ATTR(gpio17_enab, 0444, ucd9000_gpi_config, NULL, 1=
7);
> +static SENSOR_DEVICE_ATTR(gpio17_out_enab, 0444, ucd9000_gpi_config,
> > +			NULL, 0x0111);
> +static SENSOR_DEVICE_ATTR(gpio17_out_val, 0444, ucd9000_gpi_config,
> > +			NULL, 0x0211);
> +static SENSOR_DEVICE_ATTR(gpio17_stat, 0444, ucd9000_gpi_config,
> > +			NULL, 0x0311);
> +
> +
> +static struct attribute *ucd9000_attributes[] =3D {
> > +	&dev_attr_clear_logged_faults.attr,
> > +	&sensor_dev_attr_gpi8_alarm.dev_attr.attr,
> > +	&sensor_dev_attr_gpi7_alarm.dev_attr.attr,
> > +	&sensor_dev_attr_gpi6_alarm.dev_attr.attr,
> > +	&sensor_dev_attr_gpi5_alarm.dev_attr.attr,
> > +	&sensor_dev_attr_gpi4_alarm.dev_attr.attr,
> > +	&sensor_dev_attr_gpi3_alarm.dev_attr.attr,
> > +	&sensor_dev_attr_gpi2_alarm.dev_attr.attr,
> > +	&sensor_dev_attr_gpi1_alarm.dev_attr.attr,
> > +	&sensor_dev_attr_new_logged_fault_detail.dev_attr.attr,
> > +	&sensor_dev_attr_system_watchdog_timeout.dev_attr.attr,
> > +	&sensor_dev_attr_store_default_all_error.dev_attr.attr,
> > +	&sensor_dev_attr_store_default_all_done.dev_attr.attr,
> > +	&sensor_dev_attr_watchdog_timeout.dev_attr.attr,
> > +	&sensor_dev_attr_invalid_logs.dev_attr.attr,
> > +	&sensor_dev_attr_logged_fault_detail.dev_attr.attr,
> > +	&sensor_dev_attr_resequence_error.dev_attr.attr,
> > +	&sensor_dev_attr_pkgid_mismatch.dev_attr.attr,
> > +	&sensor_dev_attr_hardcoded_parms.dev_attr.attr,
> > +	&sensor_dev_attr_seq_off_timeout.dev_attr.attr,
> > +	&sensor_dev_attr_seq_on_timeout.dev_attr.attr,
> > +	&sensor_dev_attr_mfr_status.dev_attr.attr,
> > +	&sensor_dev_attr_gpio8_enab.dev_attr.attr,
> > +	&sensor_dev_attr_gpio8_out_enab.dev_attr.attr,
> > +	&sensor_dev_attr_gpio8_out_val.dev_attr.attr,
> > +	&sensor_dev_attr_gpio8_stat.dev_attr.attr,
> > +	&sensor_dev_attr_gpio9_enab.dev_attr.attr,
> > +	&sensor_dev_attr_gpio9_out_enab.dev_attr.attr,
> > +	&sensor_dev_attr_gpio9_out_val.dev_attr.attr,
> > +	&sensor_dev_attr_gpio9_stat.dev_attr.attr,
> > +	&sensor_dev_attr_gpio10_enab.dev_attr.attr,
> > +	&sensor_dev_attr_gpio10_out_enab.dev_attr.attr,
> > +	&sensor_dev_attr_gpio10_out_val.dev_attr.attr,
> > +	&sensor_dev_attr_gpio10_stat.dev_attr.attr,
> > +	&sensor_dev_attr_gpio11_enab.dev_attr.attr,
> > +	&sensor_dev_attr_gpio11_out_enab.dev_attr.attr,
> > +	&sensor_dev_attr_gpio11_out_val.dev_attr.attr,
> > +	&sensor_dev_attr_gpio11_stat.dev_attr.attr,
> > +	&sensor_dev_attr_gpio14_enab.dev_attr.attr,
> > +	&sensor_dev_attr_gpio14_out_enab.dev_attr.attr,
> > +	&sensor_dev_attr_gpio14_out_val.dev_attr.attr,
> > +	&sensor_dev_attr_gpio14_stat.dev_attr.attr,
> > +	&sensor_dev_attr_gpio17_enab.dev_attr.attr,
> > +	&sensor_dev_attr_gpio17_out_enab.dev_attr.attr,
> > +	&sensor_dev_attr_gpio17_out_val.dev_attr.attr,
> > +	&sensor_dev_attr_gpio17_stat.dev_attr.attr,
> > +	NULL
> +};
> +
> +static const struct attribute_group ucd9000_attr_group =3D {
> > +	.attrs =3D ucd9000_attributes,
> +};
> +
> =C2=A0static int ucd9000_probe(struct i2c_client *client,
> > =C2=A0			=C2=A0const struct i2c_device_id *id)
> =C2=A0{
> @@ -227,7 +458,40 @@ static int ucd9000_probe(struct i2c_client *client,
> > =C2=A0		=C2=A0=C2=A0| PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
> > =C2=A0	}
> =C2=A0
> > -	return pmbus_do_probe(client, mid, info);
> > +	info->debugfs =3D true;

This causes a compilation failure:

=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/hwmon/pmbus/ucd9000.o=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
drivers/hwmon/pmbus/ucd9000.c: In function =E2=80=98ucd9000_probe=E2=80=99:
drivers/hwmon/pmbus/ucd9000.c:461:6: error: =E2=80=98struct pmbus_driver_in=
fo=E2=80=99 has no member named =E2=80=98debugfs=E2=80=99
=C2=A0 info->debugfs =3D true;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^~=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
scripts/Makefile.build:294: recipe for target 'drivers/hwmon/pmbus/ucd9000.=
o' failed

=46rom the pmbus/debugfs implementation applied to the tree it looks like we =
can
just drop this.

> +
> > +	data->gpio.label =3D "gpio-ucd9000";
> > +	data->gpio.get =3D ucd9000_gpio_get;
> > +	data->gpio.set =3D ucd9000_gpio_set;
> > +	data->gpio.can_sleep =3D 1;
> > +	data->gpio.base =3D -1;
> > +	if (mid->driver_data =3D=3D ucd90160)
> > +		data->gpio.ngpio =3D UCD90160_NUM_GPIOS;
> > +	data->gpio.parent =3D &client->dev;
> > +	data->gpio.owner =3D THIS_MODULE;
> +
> > +	ret =3D devm_gpiochip_add_data(&client->dev, &data->gpio, client);
> > +	if (ret) {
> > +		/* Use data->gpio.dev as a flag for freeing gpiochip */

What is this comment about?

> > +		data->gpio.parent =3D NULL;
> > +		dev_warn(&client->dev, "Count not add gpiochip\n");
> > +		return ret;
> > +	}
> +
> > +	dev_info(&client->dev, "gpios %i...%i\n", data->gpio.base,
> > +		data->gpio.base + data->gpio.ngpio - 1);
> +
> > +	ret =3D sysfs_create_group(&client->dev.kobj, &ucd9000_attr_group);
> > +	if (ret < 0)
> > +		return ret;
> +
> > +	return=C2=A0=C2=A0pmbus_do_probe(client, mid, info);
> +}
> +
> +static int ucd9000_remove(struct i2c_client *client)
> +{
> > +	sysfs_remove_group(&client->dev.kobj, &ucd9000_attr_group);
> > +	return pmbus_do_remove(client);
> =C2=A0}
> =C2=A0
> =C2=A0/* This is the driver that will be inserted */
> @@ -236,7 +500,7 @@ static int ucd9000_probe(struct i2c_client *client,
> > =C2=A0		.name =3D "ucd9000",
> > =C2=A0	},
> > =C2=A0	.probe =3D ucd9000_probe,
> > -	.remove =3D pmbus_do_remove,
> > +	.remove =3D ucd9000_remove,
> > =C2=A0	.id_table =3D ucd9000_id,
> =C2=A0};
> =C2=A0

Cheers,

Andrew
--=-B2qlkewMpGmjBTZIA4nf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZk/cPAAoJEJ0dnzgO5LT5vm0P/jrAsqjLmVjsl+dnU62nNVu9
0qXdHhR3zslfNIdfYocNuJ8nz9gI6rpsUx/fM3acoZEX6riC1GC6xbq/EYBh9It7
JisFC0z5F/JKjk6I2Nq1+P6oDxd6Prjkl5AJu7cMXSVe75odx7u7AANKfeHJOEq4
TIt4dxTC952xBWxxFqSA5mJOqUe6l8vAzVSPcoI2PeiB+/WoIJgAQTjciGztOY0U
+OE/sH3fmvDZjzA8d/KO/1qg1coCI95bHjYBZFdqKHXiGNm+Kb0Nv/Zff+e5eoku
zVML4k5m0x3y96tw72HqzLe4NVt3SbH0t5FZe1ifK+m83Jj7tKRJnKRjlKbspsih
8+/7TnEaHVrI6w7iUgonxtCUnmtj4pxXmALAceY5nms/100W7PACQzMi5XZeGQO1
eNoMkXmaLVZh1wCwlq7qJWxxrWYWnh+8iDcY+Jx6+ZaiOQhwb/7KDLCEnzOPPmKT
Bpv5Wh17I6WEGAKVJBMOQnsplzQTHkBoHfGC+niLKxlLv42+ZNnHpMemHbhsHSVb
Qu5q9FmjzpNJNZGuUDfd9lLKGO9Y9s8eDbK2CfiqJeWCtALiusOp7l7D7KGNzikU
1xyZ+JtqKCcttqhNLoW0CIzb3Asqmkk00g5F/yBWL3GRA55ozhTasnG9fghjqoWs
ukIKn240owpZVPsOLl8F
=LdtV
-----END PGP SIGNATURE-----

--=-B2qlkewMpGmjBTZIA4nf--
