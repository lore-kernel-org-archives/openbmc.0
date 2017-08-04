Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xP9Dc1df3zDqJ7
 for <openbmc@lists.ozlabs.org>; Sat,  5 Aug 2017 01:04:00 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v74F3asW116069
 for <openbmc@lists.ozlabs.org>; Fri, 4 Aug 2017 11:03:57 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c4qh76qtg-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 04 Aug 2017 11:03:57 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 4 Aug 2017 11:03:55 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 4 Aug 2017 11:03:53 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v74F3ruM23527564; Fri, 4 Aug 2017 15:03:53 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D1C7B204E;
 Fri,  4 Aug 2017 11:01:20 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.157.86])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id B07FAB2050;
 Fri,  4 Aug 2017 11:01:19 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v3 1/5] drivers/hwmon/pmbus: Add IBM power
 supply hwmon driver
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, bjwyman@gmail.com
References: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501705534-27606-2-git-send-email-eajames@linux.vnet.ibm.com>
 <1501806869.29409.14.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 4 Aug 2017 10:03:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1501806869.29409.14.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17080415-0056-0000-0000-000003B1BC0E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007483; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000217; SDB=6.00897484; UDB=6.00449072; IPR=6.00677668; 
 BA=6.00005509; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016535; XFM=3.00000015;
 UTC=2017-08-04 15:03:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080415-0057-0000-0000-000007E7E71F
Message-Id: <80c3981a-b3b3-f9da-2fcb-f64dd06ac9b8@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-04_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708040230
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
X-List-Received-Date: Fri, 04 Aug 2017 15:04:00 -0000



On 08/03/2017 07:34 PM, Andrew Jeffery wrote:
> On Wed, 2017-08-02 at 15:25 -0500, Eddie James wrote:
>>> From: "Edward A. James" <eajames@us.ibm.com>
>> Add the driver to monitor power supplies with hwmon over pmbus.
>>
>>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/hwmon/pmbus/Kconfig  |  10 +++
>>   drivers/hwmon/pmbus/Makefile |   1 +
>>   drivers/hwmon/pmbus/ibmps.c  | 164 +++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 175 insertions(+)
>>   create mode 100644 drivers/hwmon/pmbus/ibmps.c
>>
>> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
>> index 04f6baa..079a087 100644
>> --- a/drivers/hwmon/pmbus/Kconfig
>> +++ b/drivers/hwmon/pmbus/Kconfig
>> @@ -37,6 +37,16 @@ config SENSORS_ADM1275
>>>   	  This driver can also be built as a module. If so, the module will
>>>   	  be called adm1275.
>>   
>> +config SENSORS_IBMPS
>>> +	tristate "IBM Power Supply"
>>> +	default n
>>> +	help
>>> +	  If you say yes here you get hardware monitoring support for IBM
>>> +	  power supply.
>> +
>>> +	  This driver can also be built as a module. If so, the module will
>>> +	  be called ibmps.
>> +
>>   config SENSORS_IR35221
>>>   	tristate "Infineon IR35221"
>>>   	default n
>> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
>> index 663801c..76d77e0 100644
>> --- a/drivers/hwmon/pmbus/Makefile
>> +++ b/drivers/hwmon/pmbus/Makefile
>> @@ -5,6 +5,7 @@
>>>   obj-$(CONFIG_PMBUS)		+= pmbus_core.o
>>>   obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
>>>   obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
>>> +obj-$(CONFIG_SENSORS_IBMPS)	+= ibmps.o
>>>   obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
>>>   obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
>>>   obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
>> diff --git a/drivers/hwmon/pmbus/ibmps.c b/drivers/hwmon/pmbus/ibmps.c
>> new file mode 100644
>> index 0000000..1928dd9
>> --- /dev/null
>> +++ b/drivers/hwmon/pmbus/ibmps.c
>> @@ -0,0 +1,164 @@
>> +/*
>> + * Copyright 2017 IBM Corp.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/i2c.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/module.h>
>> +
>> +#include "pmbus.h"
>> +
> I think a comment is needed here to point out these bits are for
> STATUS_MFR_SPECIFIC.
>
>> +#define IBMPS_MFR_FAN_FAULT			BIT(0)
>>> +#define IBMPS_MFR_THERMAL_FAULT			BIT(1)
>>> +#define IBMPS_MFR_OV_FAULT			BIT(2)
>>> +#define IBMPS_MFR_UV_FAULT			BIT(3)
>>> +#define IBMPS_MFR_PS_KILL			BIT(4)
>>> +#define IBMPS_MFR_OC_FAULT			BIT(5)
>>> +#define IBMPS_MFR_VAUX_FAULT			BIT(6)
>>> +#define IBMPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
>> +
>> +static int ibmps_read_word_data(struct i2c_client *client, int page, int reg);
>> +
> This makes me curious.
>
>> +static int ibmps_read_byte_data(struct i2c_client *client, int page, int reg)
>> +{
>>> +	int rc, mfr;
>> +
>>> +	switch (reg) {
>>> +	case PMBUS_STATUS_BYTE:
>>> +	case PMBUS_STATUS_WORD:
>> +		rc = ibmps_read_word_data(client, page, PMBUS_STATUS_WORD);
> Feels wrong to return "junk" in the result for a PMBUS_STATUS_BYTE
> query.

Good point, I'll mask the byte one.

>
>> +		break;
>>> +	case PMBUS_STATUS_VOUT:
>>> +	case PMBUS_STATUS_IOUT:
>>> +	case PMBUS_STATUS_TEMPERATURE:
>>> +	case PMBUS_STATUS_FAN_12:
>>> +		rc = pmbus_read_byte_data(client, page, reg);
>>> +		if (rc < 0)
>>> +			return rc;
>> +
>>> +		mfr = pmbus_read_byte_data(client, page,
>>> +					   PMBUS_STATUS_MFR_SPECIFIC);
>>> +		if (mfr < 0)
>>> +			return rc;
>> +
>>> +		if (reg == PMBUS_STATUS_FAN_12) {
>>> +			if (mfr & IBMPS_MFR_FAN_FAULT)
>>> +				rc |= PB_FAN_FAN1_FAULT;
>>> +		} else if (reg == PMBUS_STATUS_TEMPERATURE) {
>>> +			if (mfr & IBMPS_MFR_THERMAL_FAULT)
>>> +				rc |= PB_TEMP_OT_FAULT;
>>> +		} else if (reg == PMBUS_STATUS_VOUT) {
>>> +			if (mfr & (IBMPS_MFR_OV_FAULT | IBMPS_MFR_VAUX_FAULT))
>>> +				rc |= PB_VOLTAGE_OV_FAULT;
>>> +			if (mfr & IBMPS_MFR_UV_FAULT)
>>> +				rc |= PB_VOLTAGE_UV_FAULT;
>>> +		} else if (reg == PMBUS_STATUS_IOUT) {
>>> +			if (mfr & IBMPS_MFR_OC_FAULT)
>>> +				rc |= PB_IOUT_OC_FAULT;
>>> +			if (mfr & IBMPS_MFR_CURRENT_SHARE_WARNING)
>> +				rc |= PB_CURRENT_SHARE_FAULT;
>> +		}
> I wonder why it was done this way and not simply via the spec'ed bits?
> Maybe some don't fit, but it seems there's a pretty direct mapping for
> the most part.
>
> Do the spec'ed status bits ever get set? As in, is there ever some
> ambiguity about how the bits got set?

Yes I believe some are set by the "normal" status bits, but I'm not sure 
the coverage is complete, so we definitely need to add the MFR register 
bits as well.

>
>>> +		break;
>>> +	default:
>>> +		if (reg >= PMBUS_VIRT_BASE)
>>> +			return -ENXIO;
>> +
>> +		rc = pmbus_read_byte_data(client, page, reg);
> The alternative here is -ENODATA; not sure which is better though.
>
>> +		break;
>>> +	}
>> +
>>> +	return rc;
>> +}
>> +
>> +static int ibmps_read_word_data(struct i2c_client *client, int page, int reg)
>> +{
>>> +	int rc, mfr;
>> +
>>> +	switch (reg) {
>>> +	case PMBUS_STATUS_BYTE:
>>> +	case PMBUS_STATUS_WORD:
>>> +		rc = pmbus_read_word_data(client, page, PMBUS_STATUS_WORD);
>>> +		if (rc < 0)
>>> +			return rc;
>> +
>>> +		mfr = pmbus_read_byte_data(client, page,
>>> +					   PMBUS_STATUS_MFR_SPECIFIC);
>>> +		if (mfr < 0)
>>> +			return rc;
>> +
>>> +		if (mfr & IBMPS_MFR_PS_KILL)
>>> +			rc |= PB_STATUS_OFF;
>> +
>>> +		if (mfr)
>> +			rc |= PB_STATUS_WORD_MFR;
> This isn't set automatically by the device?

I'll have to check on that.

>
>> +		break;
>>> +	default:
>>> +		if (reg >= PMBUS_VIRT_BASE)
>>> +			return -ENXIO;
>> +
>>> +		rc = pmbus_read_word_data(client, page, reg);
>>> +		if (rc < 0)
>> +			rc = ibmps_read_byte_data(client, page, reg);
> Is this really the way we should go about accesses?

The power supply seems to mix up byte and word accesses. For example, 
the actual data regs are words, but the status_* are bytes (except 
status_word, obviously). This was basically the only way I could get 
everything working.

>
>> +		break;
>>> +	}
>> +
>>> +	return rc;
>> +}
>> +
>> +static struct pmbus_driver_info ibmps_info = {
>>> +	.pages = 1,
>>> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
>>> +		PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP |
>>> +		PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
>>> +		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
>>> +		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
>>> +	.read_byte_data = ibmps_read_byte_data,
>>> +	.read_word_data = ibmps_read_word_data,
>> +};
>> +
>> +static int ibmps_probe(struct i2c_client *client,
>>> +		       const struct i2c_device_id *id)
>> +{
>> +	return pmbus_do_probe(client, id, &ibmps_info);
> Is there anything we need to check before probe, e.g.
> MFR_ID/MFR_MODEL/MFR_REVISION? Are there options that might need to be
> configured (and exposed via devicetree bindings)?

Nothing in the spec that I see.

>
> I note we support fans: Is FAN_CONFIG_1_2 configured as needed? Or do
> we need to enable the fan, configure PWM vs RPM and the tach pulses
> value? If it is pre-configured, is this register always going to be
> pre-configured? Or do we need a property like my proposed 'use-stored-
> presence' for the MAX31785?

I believe they are all configured internally. FAN_CONFIG_1_2 is listed 
in the spec but doesn't state that anything needs to be setup.

>
> Have you had a look at my proposed bindings for the max31785? I think
> it would be worth your input, as we have another case of fans here, and
> it will help us shape a better picture of whether my generic properties
>   and node structure are appropriate.

Sure, I'll take a look.

>
>> +}
>> +
>> +static int ibmps_remove(struct i2c_client *client)
>> +{
>>> +	return pmbus_do_remove(client);
>> +}
>> +
>> +enum chips { witherspoon };
> This doesn't look necessary.

Agreed, it's somewhat of a pmbus convention, but maybe since there's 
just one I'll remove it.

>
>> +
>> +static const struct i2c_device_id ibmps_id[] = {
>>> +	{ "witherspoon", witherspoon },
>>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, ibmps_id);
>> +
>> +static const struct of_device_id ibmps_of_match[] = {
>>> +	{ .compatible = "ibm,ibmps" },
>>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, p8_i2c_occ_of_match);
> p8_i2c_occ_of_match isn't right. Do we need both device tables?
> "witherspoon" as a device ID also seems unusual. What's going on there?

Uhh, not sure how that got in there... How does this compile?? I'll fix 
it. The power supply doesn't have any device id or anything, so I just 
went with witherspoon...

>
>> +
>> +static struct i2c_driver ibmps_driver = {
>>> +	.driver = {
>>> +		.name = "ibmps",
>>> +		.of_match_table = ibmps_of_match,
>>> +	},
>>> +	.probe = ibmps_probe,
>>> +	.remove = ibmps_remove,
>>> +	.id_table = ibmps_id,
>> +};
>> +
>> +module_i2c_driver(ibmps_driver);
>> +
>> +MODULE_AUTHOR("Eddie James");
>> +MODULE_DESCRIPTION("PMBus driver for IBM power supply");
> So do we anticipate only ever having one power supply design? The name
> feels a bit generic. In the device id table above you suggest it's
> called 'witherspoon'. Is the design specific to Witherspoon? If so this
> fact should be included in the driver name and description.

I was told it is specific to witherspoon. I just hate to make it so 
specific when I'm pretty sure there will be future similar power 
supplies (in fact there was another compatible one that's buggy, present 
on some older witherspoons). But that will work.

>
> If there are other power supplies that are similar, then when we add
> support we can rename the driver, and add any necessary module aliases,
> and have a common device id table listing all of the supported devices.
>
> Cheers,
>
> Andrew
>
>> +MODULE_LICENSE("GPL");
