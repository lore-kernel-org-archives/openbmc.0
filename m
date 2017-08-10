Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSbJJ0ZcWzDqrP
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 14:49:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Qke4rQOM"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Zaa2C3KT"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D748A219E2;
 Thu, 10 Aug 2017 00:49:01 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 10 Aug 2017 00:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=VwFxaFZWuH/foIeYFsUry/0THEtzylmd36YwAXBd4
 io=; b=Qke4rQOME12U6tCRdsurHcrVMnnvSWKKo1AbnfcSgxGrS6SVddx2B6Lo1
 UMY1AdF8COO/lY/4aIQynyzAAHgpTaBkq84Hd6Ak5mMFNWW3Rv9rJock1skI42Kf
 Jh3hMNBZZiMUclH/VPW/qd7VwY+eTisZ5co77Ubvpipis1MQo1x/L920+/ZVSz0y
 ngSwKgGxirmR3oHeSuH7RrotmH7Bbz5iLNK/9Yj6vJL+SODlw8SHaHkYhNqZeMY9
 +sK3ooyTrQGKNxJrERMg5P9K8/h7DIIDQbAyKzvOhrxM5Vvv4tJezcjGh8YO3XEI
 KV93C3VYL9QJzLsNi8JWMUtNoHSpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=VwFxaFZWuH/foIeYFs
 Ury/0THEtzylmd36YwAXBd4io=; b=Zaa2C3KTinnZTtba9DOfz328PyaKtPSwCj
 E+2jdo6oZCDjEkI0UR52vpmgjn9AavlpgSD96pJKwcgb7CrXseRn9hKWdv0XQQ1T
 vMK9sEZrHTtG5z6ZtWccQK9Gi0vJ21rb0rZn//r2iRM8Ag24aBWzmjgF0Jqn7pNm
 noMZMRBJxmbDHDCAXuuH8XbvlbE74SXiwUdwiusLchSw5fz82gpBJgGyQN/HgRUb
 TCK4imwSHKOykO3mNamZcVOpilrlCOOjQQzrmyL5mqEh+IsW1w+vEknVzpyolFzr
 P284eIILLlEHCnrmzW0edNRWWoLLoRxx+CsjFjBJ0+jlB+sTp65A==
X-ME-Sender: <xms:veWLWQfpC3fVlVPiy7W9evtv81Uo3jLaDiUMDEg8vALhJmvvc6t9jQ>
X-Sasl-enc: EC4tTeYBY4JaJdy2p8X3yB4ScOtTVbdhkRoG8c7EHOFU 1502340541
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 012822418B;
 Thu, 10 Aug 2017 00:48:59 -0400 (EDT)
Message-ID: <1502340533.7946.12.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] hwmon: (ucd9000) Add user space access
 of status and config
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au, 
 eajames@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
Date: Thu, 10 Aug 2017 14:18:53 +0930
In-Reply-To: <20170809013436.21050-1-cbostic@linux.vnet.ibm.com>
References: <20170809013436.21050-1-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-7X4qhl6jkhQKguVqMISj"
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
X-List-Received-Date: Thu, 10 Aug 2017 04:49:05 -0000


--=-7X4qhl6jkhQKguVqMISj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

On Tue, 2017-08-08 at 20:34 -0500, Christopher Bostic wrote:
> Create sysfs files to export status_word, status_vout, gpio_config
> and other properties of the ucd90160 device.=C2=A0=C2=A0There are separat=
e
> files for each parsed bit.
>=20
> Note that status_word and ton / toff has not yet been moved
> into the pmbus core.=C2=A0=C2=A0Once the final decision from the communit=
y
> has been received I'll updating.
>=20
> > Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> =C2=A0drivers/hwmon/pmbus/ucd9000.c | 390 +++++++++++++++++++++++++++++++=
++++++++++-
> =C2=A01 file changed, 389 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.=
c
> index 3e3aa95..f384a39 100644
> --- a/drivers/hwmon/pmbus/ucd9000.c
> +++ b/drivers/hwmon/pmbus/ucd9000.c
> @@ -26,6 +26,8 @@
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/i2c.h>
> =C2=A0#include <linux/i2c/pmbus.h>
> +#include <linux/sysfs.h>
> +#include <linux/hwmon-sysfs.h>
> =C2=A0#include "pmbus.h"
> =C2=A0
> =C2=A0enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd909=
10 };
> @@ -34,6 +36,10 @@
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
> @@ -119,6 +125,378 @@ static int ucd9000_read_byte_data(struct i2c_client=
 *client, int page, int reg)
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(i2c, ucd9000_id);
> =C2=A0
> +static ssize_t ucd9000_clear_faults(struct device *dev,
> > +				struct device_attribute *attr, const char *buf,
> > +				size_t count)
> +{
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> +
> > +	pmbus_clear_faults(client);
> +
> > +	return count;
> +}

Eddie was exposing this in the core. I don't think we should need to
carry it here.

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
> > +	return sprintf(buf, "%1d\n", ret & BIT(nr) ? 1 : 0);
> +}
> +
> +static ssize_t ucd9000_gpi_config(struct device *dev,
> > +				struct device_attribute *attr,
> > +				char *buf)
> +{
> > +	struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_attr(at=
tr);
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	int nr =3D (sensor_attr->index & 0xf00) >> 8;
> +	int reg =3D sensor_attr->index & 0xff, ret;

Do we need to set the page?

> +
> > +	ret =3D i2c_smbus_write_byte_data(client, UCD9000_GPIO_SELECT, reg);
> > +	if (ret) {
> > +		dev_err(&client->dev, "Failed to set gpio select %d\n", reg);
> > +		return ret;
> > +	}
> +
> > +	ret =3D i2c_smbus_read_byte_data(client, UCD9000_GPIO_CONFIG);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev,
> > +			"Failed to read gpi%02d config\n", reg);
> > +	}
> +
> > +	return sprintf(buf, "%1d\n", ret & BIT(nr) ? 1 : 0);
> +}
> +
> +static ssize_t ucd9000_status_vout(struct device *dev,
> > +				struct device_attribute *attr,
> > +				char *buf)
> +{
> > +	struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_attr(at=
tr);
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	int nr =3D (sensor_attr->index & 0xf00) >> 8;
> > +	int page =3D sensor_attr->index & 0xff, ret;
> +
> > +	ret =3D pmbus_set_page(client, page);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "i2c_smbus_write failed. page:%d rc:%d\n",
> > +			page, ret);
> > +		return ret;
> > +	}
> +
> > +	ret =3D i2c_smbus_read_byte_data(client, PMBUS_STATUS_VOUT);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev,
> > +			"Failed to read status_vout(%d) rc:%d\n", page, ret);
> +	}

The set_page()/read_byte() dance can be performed with
pmbus_read_byte_data()

> +
> > +	return sprintf(buf, "%1d", ret & BIT(nr) ? 1 : 0);
> +}
> +
> +static ssize_t ucd9000_status_word(struct device *dev,
> > +				struct device_attribute *attr,
> > +				char *buf)
> +{
> > +	struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_attr(at=
tr);
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	int nr =3D sensor_attr->index, ret;
> +
> > +	ret =3D i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev,
> > +			"Failed to read number of active pages\n");
> > +		return ret;
> > +	}
> +
> > +	return sprintf(buf, "%1d", ret & BIT(nr) ? 1 : 0);
> +}
> +
> +static DEVICE_ATTR(clear_faults, 0200, NULL, ucd9000_clear_faults);
> +static DEVICE_ATTR(clear_logged_faults, 0200,
> > +			=C2=A0=C2=A0NULL, ucd9000_clear_logged_faults);
> +
> +/* MFR status */
> +static SENSOR_DEVICE_ATTR(gpi8_fault, 0444, ucd9000_mfr_status, NULL, 23=
);
> +static SENSOR_DEVICE_ATTR(gpi7_fault, 0444, ucd9000_mfr_status, NULL, 22=
);
> +static SENSOR_DEVICE_ATTR(gpi6_fault, 0444, ucd9000_mfr_status, NULL, 21=
);
> +static SENSOR_DEVICE_ATTR(gpi5_fault, 0444, ucd9000_mfr_status, NULL, 20=
);
> +static SENSOR_DEVICE_ATTR(gpi4_fault, 0444, ucd9000_mfr_status, NULL, 19=
);
> +static SENSOR_DEVICE_ATTR(gpi3_fault, 0444, ucd9000_mfr_status, NULL, 18=
);
> +static SENSOR_DEVICE_ATTR(gpi2_fault, 0444, ucd9000_mfr_status, NULL, 17=
);
> +static SENSOR_DEVICE_ATTR(gpi1_fault, 0444, ucd9000_mfr_status, NULL, 16=
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

Is this impacted by the debugfs approach that Eddie's developing?

> +
> +/* GPIO config */
> +static SENSOR_DEVICE_ATTR(gpio8_enab, 0444, ucd9000_gpi_config, NULL, 8)=
;
> +static SENSOR_DEVICE_ATTR(gpio8_out_enab, 0444, ucd9000_gpi_config,
> > +			NULL, 0x0108);
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
> +			NULL, 0x0311);

Seems like it should implement a gpio_chip?

> +
> +
> +/* Status VOUT : Should be moved to PMBUS core */

Did you investigate implementing these in the PMBus core? If so, why
didn't you take that route? If not, why not?

> +static SENSOR_DEVICE_ATTR(ton1_max_fault, 0444, ucd9000_status_vout,
> > +			NULL, 0x0201);
> +static SENSOR_DEVICE_ATTR(toff1_max_warning, 0444, ucd9000_status_vout,
> > +			NULL, 0x0101);
> +static SENSOR_DEVICE_ATTR(ton2_max_fault, 0444, ucd9000_status_vout,
> > +			NULL, 0x0202);
> +static SENSOR_DEVICE_ATTR(toff2_max_warning, 0444, ucd9000_status_vout,
> > +			NULL, 0x0102);
> +static SENSOR_DEVICE_ATTR(ton3_max_fault, 0444, ucd9000_status_vout,
> > +			NULL, 0x0203);
> +static SENSOR_DEVICE_ATTR(toff3_max_warning, 0444, ucd9000_status_vout,
> > +			NULL, 0x0103);
> +static SENSOR_DEVICE_ATTR(ton4_max_fault, 0444, ucd9000_status_vout,
> > +			NULL, 0x0204);
> +static SENSOR_DEVICE_ATTR(toff4_max_warning, 0444, ucd9000_status_vout,
> > +			NULL, 0x0104);
> +static SENSOR_DEVICE_ATTR(ton5_max_fault, 0444, ucd9000_status_vout,
> > +			NULL, 0x0205);
> +static SENSOR_DEVICE_ATTR(toff5_max_warning, 0444, ucd9000_status_vout,
> > +			NULL, 0x0105);
> +static SENSOR_DEVICE_ATTR(ton6_max_fault, 0444, ucd9000_status_vout,
> > +			NULL, 0x0206);
> +static SENSOR_DEVICE_ATTR(toff6_max_warning, 0444, ucd9000_status_vout,
> > +			NULL, 0x0106);
> +static SENSOR_DEVICE_ATTR(ton7_max_fault, 0444, ucd9000_status_vout,
> > +			NULL, 0x0207);
> +static SENSOR_DEVICE_ATTR(toff7_max_warning, 0444, ucd9000_status_vout,
> > +			NULL, 0x0107);
> +static SENSOR_DEVICE_ATTR(ton8_max_fault, 0444, ucd9000_status_vout,
> > +			NULL, 0x0208);
> +static SENSOR_DEVICE_ATTR(toff8_max_warning, 0444, ucd9000_status_vout,
> > +			NULL, 0x0108);
> +static SENSOR_DEVICE_ATTR(ton9_max_fault, 0444, ucd9000_status_vout,
> > +			NULL, 0x0209);
> +static SENSOR_DEVICE_ATTR(toff9_max_warning, 0444, ucd9000_status_vout,
> > +			NULL, 0x0109);
> +static SENSOR_DEVICE_ATTR(ton10_max_fault, 0444, ucd9000_status_vout,
> > +			NULL, 0x020a);
> +static SENSOR_DEVICE_ATTR(toff10_max_warning, 0444, ucd9000_status_vout,
> > +			NULL, 0x010a);
> +static SENSOR_DEVICE_ATTR(ton11_max_fault, 0444, ucd9000_status_vout,
> > +			NULL, 0x020b);
> +static SENSOR_DEVICE_ATTR(toff11_max_warning, 0444, ucd9000_status_vout,
> > +			NULL, 0x010b);
> +static SENSOR_DEVICE_ATTR(ton12_max_fault, 0444, ucd9000_status_vout,
> > +			NULL, 0x020c);
> +static SENSOR_DEVICE_ATTR(toff12_max_warning, 0444, ucd9000_status_vout,
> > +			NULL, 0x010c);
> +static SENSOR_DEVICE_ATTR(ton13_max_fault, 0444, ucd9000_status_vout,
> > +			NULL, 0x020d);
> +static SENSOR_DEVICE_ATTR(toff13_max_warning, 0444, ucd9000_status_vout,
> > +			NULL, 0x010d);
> +static SENSOR_DEVICE_ATTR(ton14_max_fault, 0444, ucd9000_status_vout,
> > +			NULL, 0x020e);
> +static SENSOR_DEVICE_ATTR(toff14_max_warning, 0444, ucd9000_status_vout,
> > +			NULL, 0x010e);
> +static SENSOR_DEVICE_ATTR(ton15_max_fault, 0444, ucd9000_status_vout,
> > +			NULL, 0x020f);
> +static SENSOR_DEVICE_ATTR(toff15_max_warning, 0444, ucd9000_status_vout,
> > +			NULL, 0x010f);
> +static SENSOR_DEVICE_ATTR(ton16_max_fault, 0444, ucd9000_status_vout,
> > +			NULL, 0x0210);
> +static SENSOR_DEVICE_ATTR(toff16_max_warning, 0444, ucd9000_status_vout,
> > +			NULL, 0x0110);
> +
> +/*
> + * Status Word
> + * Why is this not in the core?=C2=A0=C2=A0In process of being added to =
pmbus core
> + * but for the mean time its local for testing purposes
> + */
> +static SENSOR_DEVICE_ATTR(misc_alarm, 0444, ucd9000_status_word, NULL, 0=
);
> +static SENSOR_DEVICE_ATTR(cml_alarm, 0444, ucd9000_status_word, NULL, 1)=
;
> +static SENSOR_DEVICE_ATTR(vout_crit_alarm, 0444, ucd9000_status_word, NU=
LL, 5);
> +static SENSOR_DEVICE_ATTR(off_alarm, 0444, ucd9000_status_word, NULL, 6)=
;
> +static SENSOR_DEVICE_ATTR(fans_alarm, 0444, ucd9000_status_word, NULL, 1=
0);
> +static SENSOR_DEVICE_ATTR(pgood_alarm, 0444, ucd9000_status_word, NULL, =
11);
> +static SENSOR_DEVICE_ATTR(mfr_alarm, 0444, ucd9000_status_word, NULL, 12=
);
> +static SENSOR_DEVICE_ATTR(vout_alarm, 0444, ucd9000_status_word, NULL, 1=
5);

So Eddie's patch addresses some of these - can you please rework your
patch in terms of his?

Cheers,

Andrew

> +
> +static struct attribute *ucd9000_attributes[] =3D {
> > +	&dev_attr_clear_faults.attr,
> > +	&dev_attr_clear_logged_faults.attr,
> > +	&sensor_dev_attr_misc_alarm.dev_attr.attr,
> > +	&sensor_dev_attr_cml_alarm.dev_attr.attr,
> > +	&sensor_dev_attr_vout_crit_alarm.dev_attr.attr,
> > +	&sensor_dev_attr_off_alarm.dev_attr.attr,
> > +	&sensor_dev_attr_fans_alarm.dev_attr.attr,
> > +	&sensor_dev_attr_pgood_alarm.dev_attr.attr,
> > +	&sensor_dev_attr_mfr_alarm.dev_attr.attr,
> > +	&sensor_dev_attr_vout_alarm.dev_attr.attr,
> > +	&sensor_dev_attr_gpi8_fault.dev_attr.attr,
> > +	&sensor_dev_attr_gpi7_fault.dev_attr.attr,
> > +	&sensor_dev_attr_gpi6_fault.dev_attr.attr,
> > +	&sensor_dev_attr_gpi5_fault.dev_attr.attr,
> > +	&sensor_dev_attr_gpi4_fault.dev_attr.attr,
> > +	&sensor_dev_attr_gpi3_fault.dev_attr.attr,
> > +	&sensor_dev_attr_gpi2_fault.dev_attr.attr,
> > +	&sensor_dev_attr_gpi1_fault.dev_attr.attr,
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
> > +	&sensor_dev_attr_toff1_max_warning.dev_attr.attr,
> > +	&sensor_dev_attr_toff2_max_warning.dev_attr.attr,
> > +	&sensor_dev_attr_toff3_max_warning.dev_attr.attr,
> > +	&sensor_dev_attr_toff4_max_warning.dev_attr.attr,
> > +	&sensor_dev_attr_toff5_max_warning.dev_attr.attr,
> > +	&sensor_dev_attr_toff6_max_warning.dev_attr.attr,
> > +	&sensor_dev_attr_toff7_max_warning.dev_attr.attr,
> > +	&sensor_dev_attr_toff8_max_warning.dev_attr.attr,
> > +	&sensor_dev_attr_toff9_max_warning.dev_attr.attr,
> > +	&sensor_dev_attr_toff10_max_warning.dev_attr.attr,
> > +	&sensor_dev_attr_toff11_max_warning.dev_attr.attr,
> > +	&sensor_dev_attr_toff12_max_warning.dev_attr.attr,
> > +	&sensor_dev_attr_toff13_max_warning.dev_attr.attr,
> > +	&sensor_dev_attr_toff14_max_warning.dev_attr.attr,
> > +	&sensor_dev_attr_toff15_max_warning.dev_attr.attr,
> > +	&sensor_dev_attr_toff16_max_warning.dev_attr.attr,
> > +	&sensor_dev_attr_ton1_max_fault.dev_attr.attr,
> > +	&sensor_dev_attr_ton2_max_fault.dev_attr.attr,
> > +	&sensor_dev_attr_ton3_max_fault.dev_attr.attr,
> > +	&sensor_dev_attr_ton4_max_fault.dev_attr.attr,
> > +	&sensor_dev_attr_ton5_max_fault.dev_attr.attr,
> > +	&sensor_dev_attr_ton6_max_fault.dev_attr.attr,
> > +	&sensor_dev_attr_ton7_max_fault.dev_attr.attr,
> > +	&sensor_dev_attr_ton8_max_fault.dev_attr.attr,
> > +	&sensor_dev_attr_ton9_max_fault.dev_attr.attr,
> > +	&sensor_dev_attr_ton10_max_fault.dev_attr.attr,
> > +	&sensor_dev_attr_ton11_max_fault.dev_attr.attr,
> > +	&sensor_dev_attr_ton12_max_fault.dev_attr.attr,
> > +	&sensor_dev_attr_ton13_max_fault.dev_attr.attr,
> > +	&sensor_dev_attr_ton14_max_fault.dev_attr.attr,
> > +	&sensor_dev_attr_ton15_max_fault.dev_attr.attr,
> > +	&sensor_dev_attr_ton16_max_fault.dev_attr.attr,
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
> @@ -227,16 +605,26 @@ static int ucd9000_probe(struct i2c_client *client,
> > =C2=A0		=C2=A0=C2=A0| PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
> > =C2=A0	}
> =C2=A0
> > +	ret =3D sysfs_create_group(&client->dev.kobj, &ucd9000_attr_group);
> > +	if (ret < 0)
> > +		return ret;
> +
> > =C2=A0	return pmbus_do_probe(client, mid, info);
> =C2=A0}
> =C2=A0
> +static int ucd9000_remove(struct i2c_client *client)
> +{
> > +	sysfs_remove_group(&client->dev.kobj, &ucd9000_attr_group);
> > +	return pmbus_do_remove(client);
> +}
> +
> =C2=A0/* This is the driver that will be inserted */
> =C2=A0static struct i2c_driver ucd9000_driver =3D {
> > =C2=A0	.driver =3D {
> > =C2=A0		.name =3D "ucd9000",
> > =C2=A0	},
> > =C2=A0	.probe =3D ucd9000_probe,
> > -	.remove =3D pmbus_do_remove,
> > +	.remove =3D ucd9000_remove,
> > =C2=A0	.id_table =3D ucd9000_id,
> =C2=A0};
> =C2=A0
--=-7X4qhl6jkhQKguVqMISj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZi+W1AAoJEJ0dnzgO5LT5/BoQAI4tFAqADo2yRKS+VDs8MV4E
fqv5/hYxJhBn/mZCxrEdXtcmtL7GC6xqcvkihr26GLvSmnQ/gR17I7XRsnqjTorx
scxxPdx7s7jCYDdJ0Ls3JXgTS/8r6rTJK5ZzKMLWR3NgBLi8ENqWhqtrzC8u/ZQK
+h0aKk/WUorIri9+zg32dFXuirpY1qmq4k9bRTRnCTY+vGYf6WyQLzST2RHYYwzA
VvMHYSGXtquultablYvXZ3iVEln+3RptEJQ89f8whDxdjTiKbm0Kmi/7I1fw/K3g
5mtY4tDnjuQII5GGuAJr3wvATbYam+vn74QTnf/QizpixExmPizCr63/0fEAsY56
NaBb19sQrzd/gZTtlpEbguIW87tYUGqEv3aY8jccM/LBRp3BbMCqAOU1TkLwN/hX
gpKJxrFpwntIDKqFFdaiFKmX3NYQAR79pQPKHtDjoJKQa0N9V7RgQrsNfH+/eDjJ
5Cu0oVDnHRZpNNuSsFgInggJZ69VNQ8o3lAhwa49cnGEy9NskqPWUfpO7x3LYjED
je9pWII1Dz8oVcCDdXedoZ8I59fzYfCbzK4TXLTFT6OWy3Zz06R+vv4cdiB6MGo2
Pt5KpBDowoiYPmsTY5h0TbGtqEab3OoSFrHP2IutL52Fh0enaCRFV1FHbUHY/q0x
gFlUqBnnyVAthEXiKAKy
=1XH0
-----END PGP SIGNATURE-----

--=-7X4qhl6jkhQKguVqMISj--
