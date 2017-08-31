Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjnSP2K79zDqGX
 for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2017 02:11:49 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7VGALdE078535
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 12:11:47 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cphwwxsw7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 12:11:46 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Thu, 31 Aug 2017 12:11:45 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 31 Aug 2017 12:11:43 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7VGBg6R28573778; Thu, 31 Aug 2017 16:11:43 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB6D5AE04E;
 Thu, 31 Aug 2017 12:12:07 -0400 (EDT)
Received: from [9.10.99.183] (unknown [9.10.99.183])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 85789AE03C;
 Thu, 31 Aug 2017 12:12:07 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v6 2/3] hwmon: (ucd9000) Add gpio chip
 interface
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
References: <20170830214953.73327-1-cbostic@linux.vnet.ibm.com>
 <20170830214953.73327-3-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Thu, 31 Aug 2017 11:11:43 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170830214953.73327-3-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17083116-0008-0000-0000-000002776EFC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007642; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00910273; UDB=6.00456616; IPR=6.00690553; 
 BA=6.00005563; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016945; XFM=3.00000015;
 UTC=2017-08-31 16:11:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17083116-0009-0000-0000-0000368CDDF9
Message-Id: <2b79cfa6-7dd3-553f-6925-eb127a9577cd@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-31_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708310239
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
X-List-Received-Date: Thu, 31 Aug 2017 16:11:49 -0000

Tested-by: Matt Spinler mspinler@linux.vnet.ibm.com


On 8/30/2017 4:49 PM, Christopher Bostic wrote:
> Add a struct gpio_chip and define some methods so that this device's
> I/O can be accessed via /sys/class/gpio.
>
> Present requirements only call for retrieving current state of pin
> values and their direction.  No requirement at this time to switch
> modes between output and input within the device driver.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v6 - Break out sysfs clear logged faults into separate patch
>     - Fix logic bug that was bitwise inverting instead of !
>     - Add further comments about assumptions related to pin mux.
> v5 - Clean up remaining branch return statements to !! non
>       branching method.
>     - Clean up white space issues.
>     - Add return codes to error messages.
>     - Add comments describing assumptions of ucd90160 type.
>     - Define gpio direction set methods.
>     - Add unique id for each ucd9000 in system for gpio chip.
> v4 - Change status check from branch to a !! non branching method
>     - Remove usage comments on libgpiod for the struct gpio_chip
>       methods.
>     - Clean up some text formatting.
> v3 - Correct bug in gpio_chip get method.  Wasn't retrieving
>       gpio config information correctly.
>     - Remove old debugfs flag from previous pmbus core changes.
>     - Remove all sysfs files for mfr_status command.
>     - Add comments on direct i2c_smbus calls to clarify that no page
>       set is required.
> v2 - Remove clear_faults file - redundant since all other sysfs
>       core accesses result in an automatic clear fault.
>     - Removed local status_word and status_vout register dumps and
>       use the new pmbus core status facilities instead.
>     - Rename gpi<x>_fault to gpi<x>_alarm to better match core naming
>       conventions.
>     - Add full register dump for mfr_status.
>     - Add gpio chip to device structure and use gpio interfaces.
> ---
>   drivers/hwmon/pmbus/ucd9000.c | 206 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 206 insertions(+)
>
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
> index c401e5b..61abd3a 100644
> --- a/drivers/hwmon/pmbus/ucd9000.c
> +++ b/drivers/hwmon/pmbus/ucd9000.c
> @@ -28,6 +28,7 @@
>   #include <linux/i2c/pmbus.h>
>   #include <linux/sysfs.h>
>   #include <linux/hwmon-sysfs.h>
> +#include <linux/gpio.h>
>   #include "pmbus.h"
>
>   enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
> @@ -37,8 +38,18 @@
>   #define UCD9000_FAN_CONFIG_INDEX	0xe7
>   #define UCD9000_FAN_CONFIG		0xe8
>   #define UCD9000_LOGGED_FAULTS		0xea
> +#define UCD9000_GPIO_SELECT		0xfa
> +#define UCD9000_GPIO_CONFIG		0xfb
>   #define UCD9000_DEVICE_ID		0xfd
>
> +/* GPIO CONFIG bits */
> +#define UCD9000_GPIO_CONFIG_ENABLE	BIT(0)
> +#define UCD9000_GPIO_CONFIG_OUT_ENABLE	BIT(1)
> +#define UCD9000_GPIO_CONFIG_OUT_VALUE	BIT(2)
> +#define UCD9000_GPIO_CONFIG_STATUS	BIT(3)
> +#define UCD9000_GPIO_INPUT		0
> +#define UCD9000_GPIO_OUTPUT		1
> +
>   #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
>   #define UCD9000_MON_PAGE(x)	((x) & 0x0f)
>
> @@ -49,9 +60,13 @@
>
>   #define UCD9000_NUM_FAN		4
>
> +#define UCD9000_GPIO_NAME_LEN	16
> +#define UCD90160_NUM_GPIOS	26
> +
>   struct ucd9000_data {
>   	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
>   	struct pmbus_driver_info info;
> +	struct gpio_chip gpio;
>   };
>   #define to_ucd9000_data(_info) container_of(_info, struct ucd9000_data, info)
>
> @@ -122,6 +137,166 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
>   };
>   MODULE_DEVICE_TABLE(i2c, ucd9000_id);
>
> +static int ucd9000_gpio_read_config(struct i2c_client *client,
> +				unsigned int offset)
> +{
> +	int ret;
> +
> +	/* No page set required */
> +	ret = i2c_smbus_write_byte_data(client, UCD9000_GPIO_SELECT, offset);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to select GPIO %d: %d\n", offset,
> +			ret);
> +
> +		return ret;
> +	}
> +
> +	return i2c_smbus_read_byte_data(client, UCD9000_GPIO_CONFIG);
> +}
> +
> +static int ucd9000_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct i2c_client *client  = gpiochip_get_data(gc);
> +	int ret;
> +
> +	ret = ucd9000_gpio_read_config(client, offset);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read GPIO %d config: %d\n",
> +			offset, ret);
> +
> +		return ret;
> +	}
> +
> +	return !!(ret & UCD9000_GPIO_CONFIG_STATUS);
> +}
> +
> +static void ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
> +			int value)
> +{
> +	struct i2c_client *client = gpiochip_get_data(gc);
> +	int ret;
> +
> +	ret = ucd9000_gpio_read_config(client, offset);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read GPIO %d config: %d\n",
> +			offset, ret);
> +
> +		return;
> +	}
> +
> +	if (value) {
> +		if (ret & UCD9000_GPIO_CONFIG_STATUS)
> +			return;
> +
> +		ret |= UCD9000_GPIO_CONFIG_STATUS;
> +	} else {
> +		if (!(ret & UCD9000_GPIO_CONFIG_STATUS))
> +			return;
> +
> +		ret &= ~UCD9000_GPIO_CONFIG_STATUS;
> +	}
> +
> +	ret |= UCD9000_GPIO_CONFIG_ENABLE;
> +
> +	/* Page set not required */
> +	ret = i2c_smbus_write_byte_data(client, UCD9000_GPIO_CONFIG, ret);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to write GPIO %d config: %d\n",
> +			offset, ret);
> +
> +		return;
> +	}
> +
> +	ret &= ~UCD9000_GPIO_CONFIG_ENABLE;
> +
> +	ret = i2c_smbus_write_byte_data(client, UCD9000_GPIO_CONFIG, ret);
> +	if (ret < 0)
> +		dev_err(&client->dev, "Failed to write GPIO %d config: %d\n",
> +			offset, ret);
> +}
> +
> +static int ucd9000_gpio_get_direction(struct gpio_chip *gc,
> +					unsigned int offset)
> +{
> +	struct i2c_client *client = gpiochip_get_data(gc);
> +	int ret;
> +
> +	ret = ucd9000_gpio_read_config(client, offset);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read GPIO %d config: %d\n",
> +			offset, ret);
> +
> +		return ret;
> +	}
> +
> +	return !(!!(ret & UCD9000_GPIO_CONFIG_OUT_ENABLE));
> +}
> +
> +static int ucd9000_gpio_set_direction(struct gpio_chip *gc, unsigned int offset,
> +					bool direction_out, int requested_out)
> +{
> +	struct i2c_client *client = gpiochip_get_data(gc);
> +	int ret, config, out_val;
> +
> +
> +	ret = ucd9000_gpio_read_config(client, offset);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read GPIO %d config: %d\n",
> +			offset, ret);
> +
> +		return ret;
> +	}
> +
> +	if (direction_out) {
> +		out_val = requested_out ? UCD9000_GPIO_CONFIG_OUT_VALUE : 0;
> +
> +		if (ret & UCD9000_GPIO_CONFIG_OUT_ENABLE) {
> +			if ((ret & UCD9000_GPIO_CONFIG_OUT_VALUE) == out_val)
> +				return 0;
> +		} else
> +			ret |= UCD9000_GPIO_CONFIG_OUT_ENABLE;
> +
> +		if (out_val)
> +			ret |= UCD9000_GPIO_CONFIG_OUT_VALUE;
> +		else
> +			ret &= ~UCD9000_GPIO_CONFIG_OUT_VALUE;
> +
> +	} else {
> +		if (!(ret & UCD9000_GPIO_CONFIG_OUT_ENABLE))
> +			return 0;
> +
> +		ret &= ~UCD9000_GPIO_CONFIG_OUT_ENABLE;
> +	}
> +
> +	ret |= UCD9000_GPIO_CONFIG_ENABLE;
> +	config = ret;
> +
> +	/* Page set not required */
> +	ret = i2c_smbus_write_byte_data(client, UCD9000_GPIO_CONFIG, config);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to write GPIO %d config: %d\n",
> +			offset, ret);
> +
> +		return ret;
> +	}
> +
> +	config &= ~UCD9000_GPIO_CONFIG_ENABLE;
> +
> +	return i2c_smbus_write_byte_data(client, UCD9000_GPIO_CONFIG, config);
> +}
> +
> +static int ucd9000_gpio_direction_input(struct gpio_chip *gc,
> +					unsigned int offset)
> +{
> +	return ucd9000_gpio_set_direction(gc, offset, UCD9000_GPIO_INPUT, 0);
> +}
> +
> +static int ucd9000_gpio_direction_output(struct gpio_chip *gc,
> +					unsigned int offset, int val)
> +{
> +	return ucd9000_gpio_set_direction(gc, offset, UCD9000_GPIO_OUTPUT, val);
> +}
> +
>   static ssize_t ucd9000_clear_logged_faults(struct device *dev,
>   				struct device_attribute *attr, const char *buf,
>   				size_t count)
> @@ -261,6 +436,37 @@ static int ucd9000_probe(struct i2c_client *client,
>   		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
>   	}
>
> +	/*
> +	 * Note:
> +	 *
> +	 * Pinmux support has not been added to the new gpio_chip.
> +	 * This support should be added when possible given the mux
> +	 * behavior of these IO devices.
> +	 */
> +	data->gpio.label = (const char *)&client->name;
> +	data->gpio.get_direction = ucd9000_gpio_get_direction;
> +	data->gpio.direction_input = ucd9000_gpio_direction_input;
> +	data->gpio.direction_output = ucd9000_gpio_direction_output;
> +	data->gpio.get = ucd9000_gpio_get;
> +	data->gpio.set = ucd9000_gpio_set;
> +	data->gpio.can_sleep = 1;
> +	data->gpio.base = -1;
> +
> +	/*
> +	 * TODO: set ngpio for ucd9000 devs that aren't 90160 type
> +	 */
> +	if (mid->driver_data == ucd90160)
> +		data->gpio.ngpio = UCD90160_NUM_GPIOS;
> +	data->gpio.parent = &client->dev;
> +	data->gpio.owner = THIS_MODULE;
> +
> +	ret = devm_gpiochip_add_data(&client->dev, &data->gpio, client);
> +	if (ret) {
> +		data->gpio.parent = NULL;
> +		dev_warn(&client->dev, "Could not add gpiochip: %d\n", ret);
> +		return ret;
> +	}
> +
>   	ret = sysfs_create_group(&client->dev.kobj, &ucd9000_attr_group);
>   	if (ret < 0) {
>   		dev_warn(&client->dev, "Failed to add sysfs files: %d\n", ret);
