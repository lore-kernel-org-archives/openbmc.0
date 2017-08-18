Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xYvzs33X9zDqh9
 for <openbmc@lists.ozlabs.org>; Sat, 19 Aug 2017 06:38:17 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7IKY15p036042
 for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2017 16:38:14 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ce3sajhtr-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2017 16:38:14 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Fri, 18 Aug 2017 14:38:13 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 18 Aug 2017 14:38:10 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7IKc9pP8454410; Fri, 18 Aug 2017 13:38:09 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83E72BE03A;
 Fri, 18 Aug 2017 14:38:09 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.3.230])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 44E94BE047;
 Fri, 18 Aug 2017 14:38:06 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 v3 1/2] hwmon: (ucd9000) Add gpio chip
 interface and clear logged faults
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
References: <20170818013526.35678-1-cbostic@linux.vnet.ibm.com>
 <20170818013526.35678-2-cbostic@linux.vnet.ibm.com>
 <1503035048.681.14.camel@aj.id.au>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Fri, 18 Aug 2017 15:38:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1503035048.681.14.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17081820-0024-0000-0000-0000170B6411
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007569; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000223; SDB=6.00904256; UDB=6.00453066; IPR=6.00684468; 
 BA=6.00005539; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016759; XFM=3.00000015;
 UTC=2017-08-18 20:38:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081820-0025-0000-0000-00004C582C1E
Message-Id: <42d093a3-3567-00e1-6eb7-009033b2919b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-18_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708180329
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
X-List-Received-Date: Fri, 18 Aug 2017 20:38:18 -0000



On 8/18/17 12:44 AM, Andrew Jeffery wrote:
> Hi Chris,
>
> On Thu, 2017-08-17 at 20:35 -0500, Christopher Bostic wrote:
>> Add a struct gpio_chip and define some methods so that this device's
>> I/O can be accessed via /sys/class/gpio.
>>   
>> Add capability to clear logged faults via sysfs.
>>   
>>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> ---
>> v3 - Correct bug in gpio_chip get method.  Wasn't retrieving
>>       gpio config information correctly.
>>     - Remove old debugfs flag from previous pmbus core changes.
>>     - Remove all sysfs files for mfr_status command.
>>     - Add comments on direct i2c_smbus calls to clarify that no page
>>       set is required.
>> v2 - Remove clear_faults file - redundant since all other sysfs
>>       core accesses result in an automatic clear fault.
>>     - Removed local status_word and status_vout register dumps and
>>       use the new pmbus core status facilities instead.
>>     - Rename gpi<x>_fault to gpi<x>_alarm to better match core naming
>>       conventions.
>>     - Add full register dump for mfr_status.
>>     - Add gpio chip to device structure and use gpio interfaces.
>> ---
>>   drivers/hwmon/pmbus/ucd9000.c | 136 +++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 134 insertions(+), 2 deletions(-)
>>   
>> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
>> index 3e3aa95..af44c1e 100644
>> --- a/drivers/hwmon/pmbus/ucd9000.c
>> +++ b/drivers/hwmon/pmbus/ucd9000.c
>> @@ -26,6 +26,9 @@
>>   #include <linux/slab.h>
>>   #include <linux/i2c.h>
>>   #include <linux/i2c/pmbus.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/gpio.h>
>>   #include "pmbus.h"
>>   
>>   enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
>> @@ -34,8 +37,16 @@
>>>   #define UCD9000_NUM_PAGES		0xd6
>>>   #define UCD9000_FAN_CONFIG_INDEX	0xe7
>>>   #define UCD9000_FAN_CONFIG		0xe8
>>> +#define UCD9000_LOGGED_FAULTS		0xea
>>> +#define UCD9000_GPIO_SELECT		0xfa
>>> +#define UCD9000_GPIO_CONFIG		0xfb
>>>   #define UCD9000_DEVICE_ID		0xfd
>>   
>> +/* GPIO CONFIG bits */
>>> +#define UCD9000_GPIO_CONFIG_ENABLE	BIT(0)
>>> +#define UCD9000_GPIO_CONFIG_OUT_ENABLE	BIT(1)
>>> +#define UCD9000_GPIO_CONFIG_STATUS	BIT(3)
>> +
>>>   #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
>>>   #define UCD9000_MON_PAGE(x)	((x) & 0x0f)
>>   
>> @@ -46,9 +57,12 @@
>>   
>>>   #define UCD9000_NUM_FAN		4
>>   
>>> +#define UCD90160_NUM_GPIOS	26
> This is mostly true, though there are only 22 physical GPIOs, plus 4 GPIs.
> We're additionally constrained on the UCD90160 by "Table 3. GPIO Pin
> Configuration Options" in "16-Rail Power Supply Sequencer and Monitor with ACPI
> Support datasheet (Rev. C)" (ucd90160.pdf, page 22) to 8/26 as GPIs and 16/22
> as GPOs. It would probably pay to think about how these constraints would
> impact the implementation.

Hi Andrew,

Will go through and review the data for the various ucd9000 devs. I 
understand the need to cover all these device types but want to also be 
able to deliver internally what is needed which is just the gpi faults.  
Maybe we can discuss further on Sunday's call.

>> +
>>   struct ucd9000_data {
>>>   	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
>>>   	struct pmbus_driver_info info;
>>> +	struct gpio_chip gpio;
>>   };
>>   #define to_ucd9000_data(_info) container_of(_info, struct ucd9000_data, info)
>>   
>> @@ -119,6 +133,92 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
>>   };
>>   MODULE_DEVICE_TABLE(i2c, ucd9000_id);
>>   
>> +static int ucd9000_gpio_read_config(struct i2c_client *client,
>>> +				unsigned int offset)
>> +{
>>> +	int ret;
>> +
>>> +	/* No page set required */
>>> +	ret = i2c_smbus_write_byte_data(client, UCD9000_GPIO_SELECT, offset);
>>> +	if (ret < 0) {
>>> +		dev_err(&client->dev,
> Why is there a linebreak here?
No good reason, will correct.

>
>>> +			"Failed to read pin ID %d\n", offset);
> The error message is confusing - it relates to the semantics of
> ucd9000_gpio_read_config() and not the operation on which the error occurred.
>
> I feel strongly that we should also report the error code as well: It provides
> additional context on what went wrong.
>
> As a consequence I would suggest something like:
>
> 		dev_err(&client->dev, "Failed to select GPIO %d: %d\n", offset,
> 			ret);
OK, will go with your suggestion.

>>> +		return ret;
>>> +	}
>> +
>>> +	return i2c_smbus_read_byte_data(client, UCD9000_GPIO_CONFIG);
>> +}
>> +
>> +static int ucd9000_gpio_get(struct gpio_chip *gc, unsigned int offset)
>> +{
>>> +	struct i2c_client *client  = gpiochip_get_data(gc);
>>> +	int ret;
>> +
>>> +	ret = ucd9000_gpio_read_config(client, offset);
>>> +	if (ret < 0) {
>>> +		dev_err(&client->dev,
>>> +			"failed to read GPIO config\n");
> Again, we don't need a linebreak above, but we probably should have one between
> the dev_err() and the return statement.

Will take care of that.


>>> +		return ret;
>>> +	}
>> +
>>> +	return ret & UCD9000_GPIO_CONFIG_STATUS ? 1 : 0;
> We can avoid the branch with:
>
> 	return !!(ret & UCD9000_GPIO_CONFIG_STATUS);
Will update.

> Interestingly it's not clear from the datasheet whether the status bit contains
> a relevant value when the pin is in output mode, as there's a separate bit (bit
> 2) to set the value. Have you tested the behaviour?

I've not tested this in output mode.  Up to this point there isn't any 
means to set direction so, at least for how we're using it currently 
these are all set to inputs.
Will see how this behaves in output mode.
>> +}
>> +
>> +static int ucd9000_gpio_get_direction(struct gpio_chip *gc,
>>> +					unsigned int offset)
>> +{
>>> +	struct i2c_client *client  = gpiochip_get_data(gc);
>>> +	int ret;
>> +
>>> +	ret = ucd9000_gpio_read_config(client, offset);
>>> +	if (ret < 0) {
>>> +		dev_err(&client->dev,
>>> +			"failed to read GPIO config\n");
>>> +		return ret;
>>> +	}
>> +
>>> +	return ret & UCD9000_GPIO_CONFIG_OUT_ENABLE ? 0 : 1;
>> +}
>> +
>> +/*
>> + * Defined so that libgpiod tool can access pin states.  No plan to actually
>> + * change pin direction within this driver.
> That's not true - the driver is general purpose. Lets not limit it too much to
> *how you intend to use it* vs the actual hardware capability.
Understand.  Will implement direction switch for next revision in any case.

>> + */
>> +static int ucd9000_gpio_direction_input(struct gpio_chip *gc,
>>> +					unsigned int offset)
>> +{
>>> +	return 0;
> I don't think we should do this for several reasons:
>
> 1) It's not that hard to implement the functionality
> 2) It's not true that all GPIOs are inputs with factory defaults
> 3) There will be uncertainty if custom defaults are programmed
>
> Again from ucd90160.pdf, on page 34:
>
> 	7.5 Programming
> 	7.5.1 Device Configuration and Programming
> 	From the factory, the device contains the sequencing and monitoring
> 	firmware. It is also configured so that all GPOs are high-impedance
> 	(except for FPWM/GPIO pins 17-24, which are driven low), with no
> 	sequencing or fault-response operation. See Configuration Programming
> 	of UCD Devices, available from the Documentation & Help Center that can
> 	be selected from the Fusion GUI Help menu, for full UCD90160
> 	configuration details.
>
> The FPWM pins are driven low, implying they are configured for output mode.
> It's not obvious to me from this whether the other GPIOs are input or output
> out-of-the-box as the chip supports active and open-drain drive types. It does
> say "GPOs" in the paragraph above, but I haven't found documentation on which
> pins are in what state from factory, and I don't know how we're configuring it
> for production.
>
> Regardless, the driver shouldn't make assumptions about how the device is
> pre-programmed - without further information there's already ambiguity as to
> whether the default settings are in play or whether the system integrator has
> configured the chip. We need information from the platform about how the device
> is/should be managed.
>
> Further, the note in section 10.43 (FBh) GPIO_CONFIG (MFR_SPECIFIC_43) says:
>
> 	Configuring a pin that is also being used by another function (enable,
> 	fan control, and so forth) may likely result in unexpected and unwanted
> 	behavior.
All good points.  Will implement direction switching for next submit.

> This suggests my favourite topic: pinctrl.
>
> Twenty-two of the pins on the UCD90160 are GPIO-capable. Of these 22 pins, 16
> of them have alternate functions. See "Table 3. GPIO Pin Configuration Options"
> on page 22 of ucd90160.pdf. But a quick rundown:
>
> 1. 4 PWM pins (GPIOs 1-4, pins 31, 32, 42, 41)
> 2. 8 FPWM (Fast PWM) pins (GPIOs 5-12, pins 17-24)
> 3. 4 pins shared with JTAG (GPIOs 19-22, pins 36-39)
>
> Now, in terms of devicetree we'd be breaking things in the future by specifying
> a GPIO controller that relies on a pinmux in hardware without also specifying
> the pin controller in the devicetree. This necessitates at least *some* pinctrl
> capability be baked into the driver as well, so we can point the gpiochip to
> the relevant pin controller (the same device, but the bindings are general) and
> map the pin spaces in the devicetree (the gpio and pin spaces are different).

I'd like to avoid implementing pinctrl for the time being given the 
limited function we need internally.   I do see the advantages as you 
point out so maybe we can phase this in?

>> +}
>> +
>> +static ssize_t ucd9000_clear_logged_faults(struct device *dev,
>>> +				struct device_attribute *attr, const char *buf,
>>> +				size_t count)
>> +{
>>> +	struct i2c_client *client = to_i2c_client(dev);
>>> +	int ret;
>> +
>>> +	/* No page set required */
>>> +	ret = i2c_smbus_write_byte_data(client, UCD9000_LOGGED_FAULTS, 0);
>>> +	if (ret) {
>>> +		dev_err(&client->dev, "Failed to clear logged faults\n");
>>> +		return ret;
>>> +	}
>> +
>>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR(clear_logged_faults, 0200, NULL,
>>> +		ucd9000_clear_logged_faults);
>> +
>> +static struct attribute *ucd9000_attributes[] = {
>>> +	&dev_attr_clear_logged_faults.attr,
>>> +	NULL
>> +};
>> +
>> +static const struct attribute_group ucd9000_attr_group = {
>>> +	.attrs = ucd9000_attributes,
>> +};
>> +
> Joel's made a fair comment here regarding upstream. Please address that.
Next patch set will be sent upstream.

>>   static int ucd9000_probe(struct i2c_client *client,
>>>   			 const struct i2c_device_id *id)
>>   {
>> @@ -227,7 +327,39 @@ static int ucd9000_probe(struct i2c_client *client,
>>>   		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
>>>   	}
>>   
>>> -	return pmbus_do_probe(client, mid, info);
>>> +	data->gpio.label = "gpio-ucd9000";
>>> +	data->gpio.get_direction = ucd9000_gpio_get_direction;
>>> +	data->gpio.direction_input = ucd9000_gpio_direction_input;
>>> +	data->gpio.get = ucd9000_gpio_get;
> I feel like it wouldn't be much effort to make this more complete and specify
> the direction_output() and set() callbacks as well.

Right, will do that.

>
>>> +	data->gpio.can_sleep = 1;
>>> +	data->gpio.base = -1;
>>> +	if (mid->driver_data == ucd90160)
>>> +		data->gpio.ngpio = UCD90160_NUM_GPIOS;
> This might need some rework in the future as the other ucd9000 variants want
> GPIO support.
>
> In fact, what's the behaviour of the other drivers now given we're
> unconditionally registering a gpiochip?
The other drivers would have a gpio_chip that is available but if they 
don't use it I'm not thinking this would break them in any way.  Would 
it be better to only register a gpiochip if its a ucd90160 in particular?

>>> +	data->gpio.parent = &client->dev;
>>> +	data->gpio.owner = THIS_MODULE;
> At some point we should think about pinconf as well (push-pull vs open-drain).
Ok, will make a note of that.


>> +
>>> +	ret = devm_gpiochip_add_data(&client->dev, &data->gpio, client);
>>> +	if (ret) {
>>> +		data->gpio.parent = NULL;
>>> +		dev_warn(&client->dev, "Count not add gpiochip\n");
>>> +		return ret;
>>> +	}
>> +
>>> +	dev_info(&client->dev, "gpios %i...%i\n", data->gpio.base,
>>> +		data->gpio.base + data->gpio.ngpio - 1);
> Let's drop this.
Will remove.

Thanks,
Chris


>
> Cheers,
>
> Andrew
>
>> +
>>> +	ret = sysfs_create_group(&client->dev.kobj,
>>> +				&ucd9000_attr_group);
>>> +	if (ret < 0)
>>> +		return ret;
>> +
>>> +	return  pmbus_do_probe(client, mid, info);
>> +}
>> +
>> +static int ucd9000_remove(struct i2c_client *client)
>> +{
>>> +	sysfs_remove_group(&client->dev.kobj, &ucd9000_attr_group);
>>> +	return pmbus_do_remove(client);
>>   }
>>   
>>   /* This is the driver that will be inserted */
>> @@ -236,7 +368,7 @@ static int ucd9000_probe(struct i2c_client *client,
>>>   		.name = "ucd9000",
>>>   	},
>>>   	.probe = ucd9000_probe,
>>> -	.remove = pmbus_do_remove,
>>> +	.remove = ucd9000_remove,
>>>   	.id_table = ucd9000_id,
>>   };
>>   
