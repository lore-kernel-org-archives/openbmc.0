Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdYBt09CdzDrJw
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 04:45:25 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7OIiKwM023993
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 14:45:23 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cj03aqygu-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 14:45:22 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 24 Aug 2017 14:45:21 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 24 Aug 2017 14:45:18 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7OIjI2o25690220; Thu, 24 Aug 2017 18:45:18 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0089AB2052;
 Thu, 24 Aug 2017 14:42:43 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.36])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 991D6B2046;
 Thu, 24 Aug 2017 14:42:42 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v4 1/2] hwmon: (ucd9000) Add gpio chip
 interface and clear logged faults
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
References: <20170821220946.85617-1-cbostic@linux.vnet.ibm.com>
 <20170821220946.85617-2-cbostic@linux.vnet.ibm.com>
 <1503367256.7266.17.camel@aj.id.au>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 24 Aug 2017 13:45:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1503367256.7266.17.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17082418-0024-0000-0000-000002C4CF81
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007604; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000225; SDB=6.00907078; UDB=6.00454699; IPR=6.00687276; 
 BA=6.00005552; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016850; XFM=3.00000015;
 UTC=2017-08-24 18:45:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17082418-0025-0000-0000-00004533B775
Message-Id: <9243474d-d62f-3f36-d7e1-f7d37ad35f75@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-24_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708240288
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
X-List-Received-Date: Thu, 24 Aug 2017 18:45:26 -0000



On 8/21/17 9:00 PM, Andrew Jeffery wrote:
> Hi Chris,
>
> On Mon, 2017-08-21 at 17:09 -0500, Christopher Bostic wrote:
>> Add a struct gpio_chip and define some methods so that this device's
>> I/O can be accessed via /sys/class/gpio.
>>   
>> Present requirements only call for retrieving current state of pin
>> values and their direction.  No requirement at this time to switch
>> modes between output and input within the device driver.
>>   
>> Add capability to clear logged faults via sysfs.
>>   
>>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> ---
>> v4 - Change status check from branch to a !! non branching method
>>     - Remove usage comments on libgpiod for the struct gpio_chip
>>       methods.
>>     - Clean up some text formatting.
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
>>   drivers/hwmon/pmbus/ucd9000.c | 128 +++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 126 insertions(+), 2 deletions(-)
>>   
>> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
>> index 3e3aa95..5cea5f6 100644
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
>> +
>>   struct ucd9000_data {
>>>   	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
>>>   	struct pmbus_driver_info info;
>>> +	struct gpio_chip gpio;
>>   };
>>   #define to_ucd9000_data(_info) container_of(_info, struct ucd9000_data, info)
>>   
>> @@ -119,6 +133,87 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
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
>>> +		dev_err(&client->dev, "Failed to select GPIO %d: %d\n", offset,
>>> +			ret);
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
>>> +		dev_err(&client->dev, "failed to read GPIO config\n");
>>> +		return ret;
>>> +	}
>> +
>>> +	return !!(ret & UCD9000_GPIO_CONFIG_STATUS);
> I see you've fixed this case, but didn't audit the rest of the code to fix the
> remainder. For example the return statement in ucd9000_gpio_get_direction()
> still branches. Similarly there are error messages that don't report the error
> return value*, and unnecessary line breaks in in dev_err() calls. In the future,
> can you please audit your code for classes of problems that are identified in
> review? I'd hate to have to comment on literally every instance to get them all
> fixed, as that feels like a waste of my time and a bit patronising towards you.
>
> * Where and when we do this needs some judgement with respect to taste, but it
>    certainly frustrates me when I'm reading logs and I see vague messages like
>    "Failed". What failed? Why?

Hi Andrew,

OK, I'll be sure to be more thorough with respect to auditing as you 
suggest and will address these items for next version.

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
>> +static int ucd9000_gpio_direction_input(struct gpio_chip *gc,
>>> +					unsigned int offset)
>> +{
>>> +	return 0;
> In your reply to my comments on v3 you said you'd implement the direction
> switching, but this is still unimplemented. What happened?
Based on discussions in our meeting that followed my replies we had 
decided to only implement what was required for our implementation (non 
upstream OpenBMC).  Direction checks weren't added as a result.  For 
next pass I will add them.

> Also I spent some
> time discussing documentation of assumptions in my reply to Matt, but that
> seems to not be addressed either. Why is that?
Some basic notes on assumptions were added to the patch set cover 
letter.  I hadn't understood this was to be commented within the code.  
I'll do that for next version.
> Did you look at a bare-bones pinctrl implementation so we can describe the GPIO
> ranges appropriately? If you did and it was too much effort then it would be
> nice to know that, and why.
I haven't looked into pinctrl implementation in very much depth yet.   
I'd like to implement what the user requires for now and phase pinctrl 
in later.  It might be trivial but regardless of that fact there will, I 
assume, be some refining of any implementation requiring further 
revisions/time.

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
> Joel requested the patch be sent upstream to get a decision from the
> maintainers on this new ABI, and I suggested to you yesterday that it should
> probably be split out to address ABI changes separate to the GPIO problem, but
> neither appear to have been done. Why was that?
I have done the separate ABI changes but was interrupted by other 
unrelated high priority work before I could send out to maintainers.  It 
is on its way, I have not forgotten.

Chris
>
> Andrew
>
>>   static int ucd9000_probe(struct i2c_client *client,
>>>   			 const struct i2c_device_id *id)
>>   {
>> @@ -227,7 +322,36 @@ static int ucd9000_probe(struct i2c_client *client,
>>>   		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
>>>   	}
>>   
>>> -	return pmbus_do_probe(client, mid, info);
>>> +	data->gpio.label = "gpio-ucd9000";
>>> +	data->gpio.get_direction = ucd9000_gpio_get_direction;
>>> +	data->gpio.direction_input = ucd9000_gpio_direction_input;
>>> +	data->gpio.get = ucd9000_gpio_get;
>>> +	data->gpio.can_sleep = 1;
>>> +	data->gpio.base = -1;
>>> +	if (mid->driver_data == ucd90160)
>>> +		data->gpio.ngpio = UCD90160_NUM_GPIOS;
>>> +	data->gpio.parent = &client->dev;
>>> +	data->gpio.owner = THIS_MODULE;
>> +
>>> +	ret = devm_gpiochip_add_data(&client->dev, &data->gpio, client);
>>> +	if (ret) {
>>> +		data->gpio.parent = NULL;
>>> +		dev_warn(&client->dev, "Count not add gpiochip\n");
>>> +		return ret;
>>> +	}
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
>> @@ -236,7 +360,7 @@ static int ucd9000_probe(struct i2c_client *client,
>>>   		.name = "ucd9000",
>>>   	},
>>>   	.probe = ucd9000_probe,
>>> -	.remove = pmbus_do_remove,
>>> +	.remove = ucd9000_remove,
>>>   	.id_table = ucd9000_id,
>>   };
>>   
