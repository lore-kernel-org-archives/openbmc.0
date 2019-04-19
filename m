Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KvI4RvTr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="elEZ8nDz"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lcfb4QBDzDq9p
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 10:43:50 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CC37920CB3;
 Thu, 18 Apr 2019 20:43:46 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 18 Apr 2019 20:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=Q9AFz
 DITtXuV2Z3g4lD/dsdxS9U/zdm6h9rbm4mcmmY=; b=KvI4RvTra9xV2z4s7Ci79
 2nqmIVDBOzPRRAUmql6v8LCD9AAqH7PJRP1pBo4KPkOsIhTQ0+fuFHoDWiOJhjUR
 j0xf0qTnawYN5w2VB6J8sje2kNWiGWizFKwLEo44R1KZFd2Wxm0pth4RzAgtXy2o
 VVjPmVX4yOO3EJw98rKJzPteKiQXQCueUTrnI+vOde5RdS+7X8hSpTsui6OIgofp
 CPFnhCFnmNZIlsSxtAjdsuQiafxeMJ9eRE6BoL28YF79ggc3asLA5krUJfKVS8QD
 aZSd0GrOVMIdj9747x7Lkh3QmrRapdV67azAmA14NMPc7WxNFHuu/E2nEvuCnLU+
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Q9AFzDITtXuV2Z3g4lD/dsdxS9U/zdm6h9rbm4mcm
 mY=; b=elEZ8nDzUXWuvHXI2qRkT4Ua7jGisWZv48SQr7s8RpPgO3QC4hD1EAm4l
 dj/d+caOxGGFsl5WXCHcNRmrZ+PPMvPCnb9LLnn0oiNqR5LN58ygCBHjI17Z1ND0
 DrxBSZmokLSJulC38Rmq0aM0gaenhDwo42smlC3pDMEB0N+Rg2dPJNPf1QF4vpYF
 q4q+o/QiuxoSQEJ3IHDUw6CRF2HFaptGIj6VI398qmT5X2QqCDi6t1dLl32kwHRb
 7HYmu+9ezHUJ3LQwtxRNgv7f24jBd9lHkIkKpKHp7hQYTwTk/MjElWOLYSn4N2ma
 NH23+e2qA/fBMxH0zuoAXW9FJxZkw==
X-ME-Sender: <xms:whm5XL8S46pQjQJxMOJ1QI65Q0aMG3Xmrz5l9k_-clfaeVE3NJHfuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeigdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehinhhtvghrshhilhdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghn
 ughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:whm5XIFc-fkzHOf3LJ_vRTrhKbdH1UEhJ8LMdL98vPHXzTr5jFfxow>
 <xmx:whm5XA4PJZwwJDxluoSeimQIMc5m5q5j7Rmg6JKnxKYAnsUo1aEEag>
 <xmx:whm5XFLdIgEgc5e1hQbOX9Bb-igSXnZcjt5KPkGLVfVeAC20doLW_g>
 <xmx:whm5XAIbbg1-iYC4Y_Gxq4_ybyo-m2TKaz55CcCIXmyMoyr9DViMUg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E77DC7C50A; Thu, 18 Apr 2019 20:43:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <73905178-bc3d-4322-adc6-8c1ec62675fc@www.fastmail.com>
In-Reply-To: <20190418143613.28516-1-venture@google.com>
References: <20190418143613.28516-1-venture@google.com>
Date: Thu, 18 Apr 2019 20:43:45 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Venture" <venture@google.com>, "Joel Stanley" <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_dev-5.0_2/2]_fixup!_hwmon:_(pmbus/isl68137):_Add_dr?=
 =?UTF-8?Q?iver_for_Intersil_ISL68137_PWM_Controller?=
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
X-List-Received-Date: Fri, 19 Apr 2019 00:43:55 -0000



On Fri, 19 Apr 2019, at 00:06, Patrick Venture wrote:
> Apply differences from hwmon review to bring the driver code to the sa=
me
> point.  There were some key differences regarding attribute placement
> from the review, beyond the normal cleanup.
>=20
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  Documentation/hwmon/isl68137   |  72 +++++++++++++
>  drivers/hwmon/pmbus/isl68137.c | 188 ++++++++++++++------------------=
-
>  2 files changed, 149 insertions(+), 111 deletions(-)
>  create mode 100644 Documentation/hwmon/isl68137
>=20
> diff --git a/Documentation/hwmon/isl68137 b/Documentation/hwmon/isl681=
37
> new file mode 100644
> index 000000000000..92e5c5fc5b77
> --- /dev/null
> +++ b/Documentation/hwmon/isl68137
> @@ -0,0 +1,72 @@
> +Kernel driver isl68137
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Supported chips:
> +  * Intersil ISL68137
> +    Prefix: 'isl68137'
> +    Addresses scanned: -
> +    Datasheet: Publicly available at the Intersil website
> +     =20
> https://www.intersil.com/content/dam/Intersil/documents/isl6/isl68137.=
pdf
> +
> +Authors:
> +        Maxim Sloyko <maxims@google.com>
> +        Robert Lippert <rlippert@google.com>
> +        Patrick Venture <venture@google.com>
> +
> +Description
> +-----------
> +
> +Intersil ISL68137 is a digital output 7-phase configurable PWM
> +controller with an AVSBus interface.
> +
> +Usage Notes
> +-----------
> +
> +This driver does not probe for PMBus devices. You will have to=20
> instantiate
> +devices explicitly.
> +
> +The ISL68137 AVS operation mode must be enabled/disabled at runtime.
> +
> +Beyond the normal sysfs pmbus attributes, the driver exposes a contro=
l=20
> attribute.
> +
> +Additional Sysfs attributes
> +---------------------------
> +
> +avs(0|1)_enable		Controls the AVS state of each rail.
> +
> +curr1_label		"iin"
> +curr1_input		Measured input current
> +curr1_crit		Critical maximum current
> +curr1_crit_alarm	Current critical high alarm
> +
> +curr[2-3]_label		"iout[1-2]"
> +curr[2-3]_input		Measured output current
> +curr[2-3]_crit		Critical maximum current
> +curr[2-3]_crit_alarm	Current critical high alarm
> +
> +in1_label		"vin"
> +in1_input		Measured input voltage
> +in1_lcrit		Critical minimum input voltage
> +in1_lcrit_alarm		Input voltage critical low alarm
> +in1_crit		Critical maximum input voltage
> +in1_crit_alarm		Input voltage critical high alarm
> +
> +in[2-3]_label		"vout[1-2]"
> +in[2-3]_input		Measured output voltage
> +in[2-3]_lcrit		Critical minimum output voltage
> +in[2-3]_lcrit_alarm	Output voltage critical low alarm
> +in[2-3]_crit		Critical maximum output voltage
> +in[2-3]_crit_alarm	Output voltage critical high alarm
> +
> +power1_label		"pin"
> +power1_input		Measured input power
> +power1_alarm		Input power high alarm
> +
> +power[2-3]_label	"pout[1-2]"
> +power[2-3]_input	Measured output power
> +
> +temp[1-3]_input		Measured temperature
> +temp[1-3]_crit		Critical high temperature
> +temp[1-3]_crit_alarm	Chip temperature critical high alarm
> +temp[1-3]_max		Maximum temperature
> +temp[1-3]_max_alarm	Chip temperature high alarm
> diff --git a/drivers/hwmon/pmbus/isl68137.c=20
> b/drivers/hwmon/pmbus/isl68137.c
> index ccac14bdb985..515596c92fe1 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -4,61 +4,19 @@
>   *
>   * Copyright (c) 2017 Google Inc
>   *
> - * This program is free software; you can redistribute it and/or modi=
fy
> - * it under the terms of the GNU General Public License as published =
by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> - * GNU General Public License for more details.
>   */
> =20
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/init.h>
>  #include <linux/err.h>
> -#include <linux/i2c.h>
>  #include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
>  #include "pmbus.h"
> =20
> -#define ISL68137_VOUT_AVS 0x30
> -
> -static struct pmbus_driver_info isl68137_info =3D {
> -	.pages =3D 2,
> -	.format[PSC_VOLTAGE_IN] =3D direct,
> -	.format[PSC_VOLTAGE_OUT] =3D direct,
> -	.format[PSC_CURRENT_IN] =3D direct,
> -	.format[PSC_CURRENT_OUT] =3D direct,
> -	.format[PSC_POWER] =3D direct,
> -	.format[PSC_TEMPERATURE] =3D direct,
> -	.m[PSC_VOLTAGE_IN] =3D 1,
> -	.b[PSC_VOLTAGE_IN] =3D 0,
> -	.R[PSC_VOLTAGE_IN] =3D 3,
> -	.m[PSC_VOLTAGE_OUT] =3D 1,
> -	.b[PSC_VOLTAGE_OUT] =3D 0,
> -	.R[PSC_VOLTAGE_OUT] =3D 3,
> -	.m[PSC_CURRENT_IN] =3D 1,
> -	.b[PSC_CURRENT_IN] =3D 0,
> -	.R[PSC_CURRENT_IN] =3D 2,
> -	.m[PSC_CURRENT_OUT] =3D 1,
> -	.b[PSC_CURRENT_OUT] =3D 0,
> -	.R[PSC_CURRENT_OUT] =3D 1,
> -	.m[PSC_POWER] =3D 1,
> -	.b[PSC_POWER] =3D 0,
> -	.R[PSC_POWER] =3D 0,
> -	.m[PSC_TEMPERATURE] =3D 1,
> -	.b[PSC_TEMPERATURE] =3D 0,
> -	.R[PSC_TEMPERATURE] =3D 0,
> -	.func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN
> -	    | PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
> -	    | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_TEMP
> -	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> -	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
> -	.func[1] =3D PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> -	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
> -};
> +#define ISL68137_VOUT_AVS	0x30
> =20
>  static ssize_t isl68137_avs_enable_show_page(struct i2c_client *clien=
t,
>  					     int page,
> @@ -75,23 +33,13 @@ static ssize_t=20
> isl68137_avs_enable_store_page(struct i2c_client *client,
>  					      const char *buf, size_t count)
>  {
>  	int rc, op_val;
> +	bool result;
> =20
> -	if (count < 1) {
> -		rc =3D -EINVAL;
> -		goto out;
> -	}
> +	rc =3D kstrtobool(buf, &result);
> +	if (rc)
> +		return rc;
> =20
> -	switch (buf[0]) {
> -	case '0':
> -		op_val =3D 0;
> -		break;
> -	case '1':
> -		op_val =3D ISL68137_VOUT_AVS;
> -		break;
> -	default:
> -		rc =3D -EINVAL;
> -		goto out;
> -	}
> +	op_val =3D result ? ISL68137_VOUT_AVS : 0;
> =20
>  	/*
>  	 * Writes to VOUT setpoint over AVSBus will persist after the VRM is=

> @@ -101,27 +49,28 @@ static ssize_t=20
> isl68137_avs_enable_store_page(struct i2c_client *client,
>  	 * enabling AVS control is the workaround.
>  	 */
>  	if (op_val =3D=3D ISL68137_VOUT_AVS) {
> -		int vout_command =3D pmbus_read_word_data(client, page,
> -							PMBUS_VOUT_COMMAND);
> +		rc =3D pmbus_read_word_data(client, page, PMBUS_VOUT_COMMAND);
> +		if (rc < 0)
> +			return rc;
> +
>  		rc =3D pmbus_write_word_data(client, page, PMBUS_VOUT_COMMAND,
> -					   vout_command);
> -		if (rc)
> -			goto out;
> +					   rc);
> +		if (rc < 0)
> +			return rc;
>  	}
> =20
>  	rc =3D pmbus_update_byte_data(client, page, PMBUS_OPERATION,
>  				    ISL68137_VOUT_AVS, op_val);
> =20
> -out:
> -	return rc < 0 ? rc : count;
> +	return (rc < 0) ? rc : count;
>  }
> =20
>  static ssize_t isl68137_avs_enable_show(struct device *dev,
>  					struct device_attribute *devattr,
>  					char *buf)
>  {
> -	struct i2c_client *client =3D kobj_to_i2c_client(&dev->kobj);
> -	struct sensor_device_attribute_2 *attr =3D to_sensor_dev_attr_2(deva=
ttr);
> +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> +	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr)=
;
> =20
>  	return isl68137_avs_enable_show_page(client, attr->index, buf);
>  }
> @@ -130,53 +79,70 @@ static ssize_t isl68137_avs_enable_store(struct=20=

> device *dev,
>  				struct device_attribute *devattr,
>  				const char *buf, size_t count)
>  {
> -	struct i2c_client *client =3D kobj_to_i2c_client(&dev->kobj);
> -	struct sensor_device_attribute_2 *attr =3D=20
> to_sensor_dev_attr_2(devattr);
> +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> +	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr)=
;
> =20
>  	return isl68137_avs_enable_store_page(client, attr->index, buf, coun=
t);
>  }
> =20
> -static SENSOR_DEVICE_ATTR_2(avs0_enabled, 0644,
> -			    isl68137_avs_enable_show, isl68137_avs_enable_store,
> -			    0, 0);
> -static SENSOR_DEVICE_ATTR_2(avs1_enabled, 0644,
> -			    isl68137_avs_enable_show, isl68137_avs_enable_store,
> -			    0, 1);
> +static SENSOR_DEVICE_ATTR_RW(avs0_enable, isl68137_avs_enable, 0);
> +static SENSOR_DEVICE_ATTR_RW(avs1_enable, isl68137_avs_enable, 1);
> =20
> -static int isl68137_remove(struct i2c_client *client);
> -
> -static int isl68137_probe(struct i2c_client *client,
> -			  const struct i2c_device_id *id)
> -{
> -	int rc;
> -
> -	rc =3D pmbus_do_probe(client, id, &isl68137_info);
> -	if (rc)
> -		return rc;
> +static struct attribute *enable_attrs[] =3D {
> +	&sensor_dev_attr_avs0_enable.dev_attr.attr,
> +	&sensor_dev_attr_avs1_enable.dev_attr.attr,
> +	NULL,
> +};
> =20
> -	rc =3D device_create_file(&client->dev,
> -				&sensor_dev_attr_avs0_enabled.dev_attr);
> -	if (rc)
> -		goto out_fail;
> -	rc =3D device_create_file(&client->dev,
> -				&sensor_dev_attr_avs1_enabled.dev_attr);
> -	if (rc)
> -		goto out_fail;
> +static const struct attribute_group enable_group =3D {
> +	.attrs =3D enable_attrs,
> +};
> =20
> -	return rc;
> +static const struct attribute_group *attribute_groups[] =3D {
> +	&enable_group,
> +	NULL,
> +};
> =20
> -out_fail:
> -	isl68137_remove(client);
> -	return rc;
> -}
> +static struct pmbus_driver_info isl68137_info =3D {
> +	.pages =3D 2,
> +	.format[PSC_VOLTAGE_IN] =3D direct,
> +	.format[PSC_VOLTAGE_OUT] =3D direct,
> +	.format[PSC_CURRENT_IN] =3D direct,
> +	.format[PSC_CURRENT_OUT] =3D direct,
> +	.format[PSC_POWER] =3D direct,
> +	.format[PSC_TEMPERATURE] =3D direct,
> +	.m[PSC_VOLTAGE_IN] =3D 1,
> +	.b[PSC_VOLTAGE_IN] =3D 0,
> +	.R[PSC_VOLTAGE_IN] =3D 3,
> +	.m[PSC_VOLTAGE_OUT] =3D 1,
> +	.b[PSC_VOLTAGE_OUT] =3D 0,
> +	.R[PSC_VOLTAGE_OUT] =3D 3,
> +	.m[PSC_CURRENT_IN] =3D 1,
> +	.b[PSC_CURRENT_IN] =3D 0,
> +	.R[PSC_CURRENT_IN] =3D 2,
> +	.m[PSC_CURRENT_OUT] =3D 1,
> +	.b[PSC_CURRENT_OUT] =3D 0,
> +	.R[PSC_CURRENT_OUT] =3D 1,
> +	.m[PSC_POWER] =3D 1,
> +	.b[PSC_POWER] =3D 0,
> +	.R[PSC_POWER] =3D 0,
> +	.m[PSC_TEMPERATURE] =3D 1,
> +	.b[PSC_TEMPERATURE] =3D 0,
> +	.R[PSC_TEMPERATURE] =3D 0,
> +	.func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN
> +	    | PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
> +	    | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_TEMP
> +	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
> +	.func[1] =3D PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
> +	.groups =3D attribute_groups,
> +};

This fails to build:

drivers/hwmon/pmbus/isl68137.c:139:3: error: =E2=80=98struct pmbus_drive=
r_info=E2=80=99 has no member named =E2=80=98groups=E2=80=99            =
                                                                   =20
  .groups =3D attribute_groups,
   ^~~~~~
drivers/hwmon/pmbus/isl68137.c:139:12: error: initialization of =E2=80=98=
int (*)(struct i2c_client *, int,  int)=E2=80=99 from incompatible point=
er type =E2=80=98const struct attribute_group **=E2=80=99 [-Werror=3Dinc=
ompatible-pointer-types]                                                =
                                                                        =
                                 =20
  .groups =3D attribute_groups,                                         =
                                                                        =
                                     =20
            ^~~~~~~~~~~~~~~~
drivers/hwmon/pmbus/isl68137.c:139:12: note: (near initialization for =E2=
=80=98isl68137_info.read_byte_data=E2=80=99)                            =
                                                  =20
cc1: some warnings being treated as errors

> =20
> -static int isl68137_remove(struct i2c_client *client)
> +static int isl68137_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *id)
>  {
> -	device_remove_file(&client->dev,
> -			   &sensor_dev_attr_avs1_enabled.dev_attr);
> -	device_remove_file(&client->dev,
> -			   &sensor_dev_attr_avs0_enabled.dev_attr);
> -	return pmbus_do_remove(client);
> +	return pmbus_do_probe(client, id, &isl68137_info);
>  }
> =20
>  static const struct i2c_device_id isl68137_id[] =3D {
> @@ -192,7 +158,7 @@ static struct i2c_driver isl68137_driver =3D {
>  		   .name =3D "isl68137",
>  		   },
>  	.probe =3D isl68137_probe,
> -	.remove =3D isl68137_remove,
> +	.remove =3D pmbus_do_remove,
>  	.id_table =3D isl68137_id,
>  };
> =20
> --=20
> 2.21.0.593.g511ec345e18-goog
>=20
>
