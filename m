Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VvRBq5ZD"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="V74ENGdd"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lgSx1mH9zDqTF
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 12:50:41 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C11E021E90;
 Thu, 18 Apr 2019 22:50:38 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 18 Apr 2019 22:50:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=O77OkkVnc4hvOL86l9Lv7RQ3vJnLa45
 9rKp9xNByGHY=; b=VvRBq5ZDbIwxeADC+Onit/z+pdBOYGmOpC7Y6qJI0Ed4FVL
 ZshNW5DH6/TJHBUiXW52/HHTwYdyr6iDZ9SxwSMjtancS202tUZfLyIbp5kHlD7L
 9Nb6oQ/l4v0r8y8B4qvoxwIxrC7idbaL5qfWelIDpS1p9037+7vJqVICZ1yZwCqJ
 ftZTpBrmzoyOMghGouOsq61YWISXCXuV0juQyAgOwsZgm2bfkWWMl40sxPaiiID/
 Z+S61EKEuc0+mHrTkmfwhDJj8sU2XWM61EUtEYQi3+7pbxrazhD/rUIlZyI44a7S
 b7AGHLMmeXbIL/BBQ+PPOP1AMsjYfL23pYNSNPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=O77Okk
 Vnc4hvOL86l9Lv7RQ3vJnLa459rKp9xNByGHY=; b=V74ENGddM3YfOha+kEVzZX
 F5m4k/KT0ehE+KE3DnwAKj7DYyp3OW0Q/BMgfKMUfNoHDEqVheamfvDFnxeUgZwI
 RdyzcsAmmuTYlhyAelbh/gbKl+myAUOOFEP2wqo7SkBqdnQnA/A6uqCtKbhwQ3B/
 39ngxDF2Au9e6UeBrivwTXT5zsL2R1FPJupA7Ct+KAopMAG2eYnUoTEv4Ueh/QQ1
 5IFrr4JKGh9rPJVtruUgN3raKvFvx1dvYLvpy4iRuvRua5vKZ3yiEkx92Mh0bPIt
 rBADGy4nkEwjvGSNCPKWLaK70cRJFYbOi2G5Sp9fHx4Zz+g35/3BWQmtkNdriJCw
 ==
X-ME-Sender: <xms:fje5XN79ujkFqaNSI9UOVsEBCMcIGzG_hkw07duX1tXVk__E6NOEaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeigdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepihhnthgvrhhsihhlrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgu
 rhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:fje5XD0JIgu6iSHOsN9TX11qeN54MqPPw9LT0VbXUyUcK2NNi5bIVQ>
 <xmx:fje5XGaonlk1VAzUxE4PJM9DSzgEU3VVpxMumEz-0zgsrfIEmYvvTQ>
 <xmx:fje5XDAKdkFqCi9Xk43LCjmzLX1Syusa6BV6Vct4nsEZik692B99Ig>
 <xmx:fje5XOEfz9MRsl99nYSKmY6AlPelqQccgpDdXO2kmEWJzLq_JTTTAQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 584E37C50A; Thu, 18 Apr 2019 22:50:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <394c8cad-d9dc-402c-ba89-45c8f7725b87@www.fastmail.com>
In-Reply-To: <20190418143613.28516-1-venture@google.com>
References: <20190418143613.28516-1-venture@google.com>
Date: Thu, 18 Apr 2019 22:50:37 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Venture" <venture@google.com>, "Joel Stanley" <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_dev-5.0_2/2]_fixup!_hwmon:_(pmbus/isl68137):_Add_dr?=
 =?UTF-8?Q?iver_for_Intersil_ISL68137_PWM_Controller?=
Content-Type: text/plain
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
X-List-Received-Date: Fri, 19 Apr 2019 02:50:42 -0000



On Fri, 19 Apr 2019, at 00:06, Patrick Venture wrote:
> Apply differences from hwmon review to bring the driver code to the same
> point.  There were some key differences regarding attribute placement
> from the review, beyond the normal cleanup.
> 
> Signed-off-by: Patrick Venture <venture@google.com>

Applied to dev-5.0.

Cheers,

Andrew

> ---
>  Documentation/hwmon/isl68137   |  72 +++++++++++++
>  drivers/hwmon/pmbus/isl68137.c | 188 ++++++++++++++-------------------
>  2 files changed, 149 insertions(+), 111 deletions(-)
>  create mode 100644 Documentation/hwmon/isl68137
> 
> diff --git a/Documentation/hwmon/isl68137 b/Documentation/hwmon/isl68137
> new file mode 100644
> index 000000000000..92e5c5fc5b77
> --- /dev/null
> +++ b/Documentation/hwmon/isl68137
> @@ -0,0 +1,72 @@
> +Kernel driver isl68137
> +======================
> +
> +Supported chips:
> +  * Intersil ISL68137
> +    Prefix: 'isl68137'
> +    Addresses scanned: -
> +    Datasheet: Publicly available at the Intersil website
> +      
> https://www.intersil.com/content/dam/Intersil/documents/isl6/isl68137.pdf
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
> +This driver does not probe for PMBus devices. You will have to 
> instantiate
> +devices explicitly.
> +
> +The ISL68137 AVS operation mode must be enabled/disabled at runtime.
> +
> +Beyond the normal sysfs pmbus attributes, the driver exposes a control 
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
> diff --git a/drivers/hwmon/pmbus/isl68137.c 
> b/drivers/hwmon/pmbus/isl68137.c
> index ccac14bdb985..515596c92fe1 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -4,61 +4,19 @@
>   *
>   * Copyright (c) 2017 Google Inc
>   *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> - * GNU General Public License for more details.
>   */
>  
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
>  
> -#define ISL68137_VOUT_AVS 0x30
> -
> -static struct pmbus_driver_info isl68137_info = {
> -	.pages = 2,
> -	.format[PSC_VOLTAGE_IN] = direct,
> -	.format[PSC_VOLTAGE_OUT] = direct,
> -	.format[PSC_CURRENT_IN] = direct,
> -	.format[PSC_CURRENT_OUT] = direct,
> -	.format[PSC_POWER] = direct,
> -	.format[PSC_TEMPERATURE] = direct,
> -	.m[PSC_VOLTAGE_IN] = 1,
> -	.b[PSC_VOLTAGE_IN] = 0,
> -	.R[PSC_VOLTAGE_IN] = 3,
> -	.m[PSC_VOLTAGE_OUT] = 1,
> -	.b[PSC_VOLTAGE_OUT] = 0,
> -	.R[PSC_VOLTAGE_OUT] = 3,
> -	.m[PSC_CURRENT_IN] = 1,
> -	.b[PSC_CURRENT_IN] = 0,
> -	.R[PSC_CURRENT_IN] = 2,
> -	.m[PSC_CURRENT_OUT] = 1,
> -	.b[PSC_CURRENT_OUT] = 0,
> -	.R[PSC_CURRENT_OUT] = 1,
> -	.m[PSC_POWER] = 1,
> -	.b[PSC_POWER] = 0,
> -	.R[PSC_POWER] = 0,
> -	.m[PSC_TEMPERATURE] = 1,
> -	.b[PSC_TEMPERATURE] = 0,
> -	.R[PSC_TEMPERATURE] = 0,
> -	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN
> -	    | PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
> -	    | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_TEMP
> -	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> -	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
> -	.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> -	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
> -};
> +#define ISL68137_VOUT_AVS	0x30
>  
>  static ssize_t isl68137_avs_enable_show_page(struct i2c_client *client,
>  					     int page,
> @@ -75,23 +33,13 @@ static ssize_t 
> isl68137_avs_enable_store_page(struct i2c_client *client,
>  					      const char *buf, size_t count)
>  {
>  	int rc, op_val;
> +	bool result;
>  
> -	if (count < 1) {
> -		rc = -EINVAL;
> -		goto out;
> -	}
> +	rc = kstrtobool(buf, &result);
> +	if (rc)
> +		return rc;
>  
> -	switch (buf[0]) {
> -	case '0':
> -		op_val = 0;
> -		break;
> -	case '1':
> -		op_val = ISL68137_VOUT_AVS;
> -		break;
> -	default:
> -		rc = -EINVAL;
> -		goto out;
> -	}
> +	op_val = result ? ISL68137_VOUT_AVS : 0;
>  
>  	/*
>  	 * Writes to VOUT setpoint over AVSBus will persist after the VRM is
> @@ -101,27 +49,28 @@ static ssize_t 
> isl68137_avs_enable_store_page(struct i2c_client *client,
>  	 * enabling AVS control is the workaround.
>  	 */
>  	if (op_val == ISL68137_VOUT_AVS) {
> -		int vout_command = pmbus_read_word_data(client, page,
> -							PMBUS_VOUT_COMMAND);
> +		rc = pmbus_read_word_data(client, page, PMBUS_VOUT_COMMAND);
> +		if (rc < 0)
> +			return rc;
> +
>  		rc = pmbus_write_word_data(client, page, PMBUS_VOUT_COMMAND,
> -					   vout_command);
> -		if (rc)
> -			goto out;
> +					   rc);
> +		if (rc < 0)
> +			return rc;
>  	}
>  
>  	rc = pmbus_update_byte_data(client, page, PMBUS_OPERATION,
>  				    ISL68137_VOUT_AVS, op_val);
>  
> -out:
> -	return rc < 0 ? rc : count;
> +	return (rc < 0) ? rc : count;
>  }
>  
>  static ssize_t isl68137_avs_enable_show(struct device *dev,
>  					struct device_attribute *devattr,
>  					char *buf)
>  {
> -	struct i2c_client *client = kobj_to_i2c_client(&dev->kobj);
> -	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>  
>  	return isl68137_avs_enable_show_page(client, attr->index, buf);
>  }
> @@ -130,53 +79,70 @@ static ssize_t isl68137_avs_enable_store(struct 
> device *dev,
>  				struct device_attribute *devattr,
>  				const char *buf, size_t count)
>  {
> -	struct i2c_client *client = kobj_to_i2c_client(&dev->kobj);
> -	struct sensor_device_attribute_2 *attr = 
> to_sensor_dev_attr_2(devattr);
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>  
>  	return isl68137_avs_enable_store_page(client, attr->index, buf, count);
>  }
>  
> -static SENSOR_DEVICE_ATTR_2(avs0_enabled, 0644,
> -			    isl68137_avs_enable_show, isl68137_avs_enable_store,
> -			    0, 0);
> -static SENSOR_DEVICE_ATTR_2(avs1_enabled, 0644,
> -			    isl68137_avs_enable_show, isl68137_avs_enable_store,
> -			    0, 1);
> +static SENSOR_DEVICE_ATTR_RW(avs0_enable, isl68137_avs_enable, 0);
> +static SENSOR_DEVICE_ATTR_RW(avs1_enable, isl68137_avs_enable, 1);
>  
> -static int isl68137_remove(struct i2c_client *client);
> -
> -static int isl68137_probe(struct i2c_client *client,
> -			  const struct i2c_device_id *id)
> -{
> -	int rc;
> -
> -	rc = pmbus_do_probe(client, id, &isl68137_info);
> -	if (rc)
> -		return rc;
> +static struct attribute *enable_attrs[] = {
> +	&sensor_dev_attr_avs0_enable.dev_attr.attr,
> +	&sensor_dev_attr_avs1_enable.dev_attr.attr,
> +	NULL,
> +};
>  
> -	rc = device_create_file(&client->dev,
> -				&sensor_dev_attr_avs0_enabled.dev_attr);
> -	if (rc)
> -		goto out_fail;
> -	rc = device_create_file(&client->dev,
> -				&sensor_dev_attr_avs1_enabled.dev_attr);
> -	if (rc)
> -		goto out_fail;
> +static const struct attribute_group enable_group = {
> +	.attrs = enable_attrs,
> +};
>  
> -	return rc;
> +static const struct attribute_group *attribute_groups[] = {
> +	&enable_group,
> +	NULL,
> +};
>  
> -out_fail:
> -	isl68137_remove(client);
> -	return rc;
> -}
> +static struct pmbus_driver_info isl68137_info = {
> +	.pages = 2,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_CURRENT_IN] = direct,
> +	.format[PSC_CURRENT_OUT] = direct,
> +	.format[PSC_POWER] = direct,
> +	.format[PSC_TEMPERATURE] = direct,
> +	.m[PSC_VOLTAGE_IN] = 1,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +	.R[PSC_VOLTAGE_IN] = 3,
> +	.m[PSC_VOLTAGE_OUT] = 1,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = 3,
> +	.m[PSC_CURRENT_IN] = 1,
> +	.b[PSC_CURRENT_IN] = 0,
> +	.R[PSC_CURRENT_IN] = 2,
> +	.m[PSC_CURRENT_OUT] = 1,
> +	.b[PSC_CURRENT_OUT] = 0,
> +	.R[PSC_CURRENT_OUT] = 1,
> +	.m[PSC_POWER] = 1,
> +	.b[PSC_POWER] = 0,
> +	.R[PSC_POWER] = 0,
> +	.m[PSC_TEMPERATURE] = 1,
> +	.b[PSC_TEMPERATURE] = 0,
> +	.R[PSC_TEMPERATURE] = 0,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN
> +	    | PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
> +	    | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_TEMP
> +	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
> +	.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
> +	.groups = attribute_groups,
> +};
>  
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
>  
>  static const struct i2c_device_id isl68137_id[] = {
> @@ -192,7 +158,7 @@ static struct i2c_driver isl68137_driver = {
>  		   .name = "isl68137",
>  		   },
>  	.probe = isl68137_probe,
> -	.remove = isl68137_remove,
> +	.remove = pmbus_do_remove,
>  	.id_table = isl68137_id,
>  };
>  
> -- 
> 2.21.0.593.g511ec345e18-goog
> 
>
