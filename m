Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xPBss1WQ6zDqJ7
 for <openbmc@lists.ozlabs.org>; Sat,  5 Aug 2017 02:17:52 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v74GDpD6083587
 for <openbmc@lists.ozlabs.org>; Fri, 4 Aug 2017 12:17:50 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c4th76k8j-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 04 Aug 2017 12:17:50 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Fri, 4 Aug 2017 10:17:49 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 4 Aug 2017 10:17:47 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v74GHkZp1180018; Fri, 4 Aug 2017 09:17:46 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96D226A04C;
 Fri,  4 Aug 2017 10:17:46 -0600 (MDT)
Received: from [9.10.99.182] (unknown [9.10.99.182])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 4DF9A6A043;
 Fri,  4 Aug 2017 10:17:46 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 v3 2/5] drivers/hwmon/pmbus: ibmps: Add
 non-hwmon attributes
To: Eddie James <eajames@linux.vnet.ibm.com>, Andrew Jeffery
 <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501705534-27606-3-git-send-email-eajames@linux.vnet.ibm.com>
 <1501806822.29409.13.camel@aj.id.au>
 <bd9944cf-b3e1-68bd-b5c9-cbe4767a95e5@linux.vnet.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>, bjwyman@gmail.com
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Fri, 4 Aug 2017 11:17:51 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <bd9944cf-b3e1-68bd-b5c9-cbe4767a95e5@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17080416-0016-0000-0000-0000074B8487
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007483; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000217; SDB=6.00897509; UDB=6.00449087; IPR=6.00677692; 
 BA=6.00005509; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016535; XFM=3.00000015;
 UTC=2017-08-04 16:17:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080416-0017-0000-0000-00003AE525C9
Message-Id: <8cf1b3f6-83c6-ac3c-8385-a65d29d95ce4@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-04_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708040249
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
X-List-Received-Date: Fri, 04 Aug 2017 16:17:53 -0000



On 8/4/2017 10:16 AM, Eddie James wrote:
>
>
> On 08/03/2017 07:33 PM, Andrew Jeffery wrote:
>> On Wed, 2017-08-02 at 15:25 -0500, Eddie James wrote:
>>>> From: "Edward A. James" <eajames@us.ibm.com>
>>> Add sysfs entries to dump out PS registers
>> Why are we working against what the pmbus subsystem already gives us?
>> Why not augment support in pmbus core to give us the information we
>> need in a manner acceptable to upstream?
>
> Yea, that would be great. I feel like we're a little short on time for 
> that, as we need this functionality basically now. But we can give it 
> a shot.
>
>>
>> Flipping to the other end of the spectrum: The device only has one
>> page. We can just use `i2cget -f -y ...` without risk of corruption.
>
> Yea, I just get a lot of requests to have it all in the device driver. 
> I guess we need to just push back and ask people to use i2c tools. But 
> we will have to solve this for the UCD driver.
In general, IBM likes to capture a lot of registers on failures so we 
can actually figure out what went wrong after the fact, as we have 
customers who get mad when we can't give them root cause.  It's a bummer 
that is so hard to do here.  And if we had to use the i2cdev stuff for 
that, then why even use a device driver for any of this...


>
>>
>>>   and clear faults.
>> Can you describe the motivation for this? I feel like it would be worth
>> having this as a separate patch, and to the core rather than in an
>> arbitrary driver.
>
> Users need to be able to clear faults, that was just on my list of 
> requirements :) They could probably use i2cset though.

Yea, userspace needs this.  I'm kinda surprised there wasn't already a 
way to expose it.

>
>>
>> Cheers,
>>
>> Andrew
>>
>>>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>>> ---
>>>   drivers/hwmon/pmbus/ibmps.c | 78 
>>> +++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 78 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/pmbus/ibmps.c b/drivers/hwmon/pmbus/ibmps.c
>>> index 1928dd9..f55d2bf 100644
>>> --- a/drivers/hwmon/pmbus/ibmps.c
>>> +++ b/drivers/hwmon/pmbus/ibmps.c
>>> @@ -9,8 +9,10 @@
>>>     #include <linux/device.h>
>>>   #include <linux/i2c.h>
>>> +#include <linux/hwmon-sysfs.h>
>>>   #include <linux/jiffies.h>
>>>   #include <linux/module.h>
>>> +#include <linux/sysfs.h>
>>>     #include "pmbus.h"
>>>   @@ -122,14 +124,90 @@ static int ibmps_read_word_data(struct 
>>> i2c_client *client, int page, int reg)
>>>>       .read_word_data = ibmps_read_word_data,
>>>   };
>>>   +static ssize_t ibmps_clear_faults(struct device *dev,
>>>> +                  struct device_attribute *dev_attr,
>>>> +                  const char *buf, size_t count)
>>> +{
>>>> +    struct i2c_client *client = to_i2c_client(dev);
>>> +
>>>> +    pmbus_clear_faults(client);
>>> +
>>>> +    return count;
>>> +}
>>> +static DEVICE_ATTR(clear_faults, 0200, NULL, ibmps_clear_faults);
>>> +
>>> +static ssize_t ibmps_show_status_word(struct device *dev,
>>>> +                      struct device_attribute *dev_attr,
>>>> +                      char *buf)
>>> +{
>>>> +    int rc;
>>>> +    struct i2c_client *client = to_i2c_client(dev);
>>> +
>>>> +    rc = pmbus_read_word_data(client, 0, PMBUS_STATUS_WORD);
>>>> +    if (rc < 0)
>>>> +        return rc;
>>> +
>>>> +    return snprintf(buf, PAGE_SIZE - 1, "%04x\n", rc);
>>> +}
>>> +static DEVICE_ATTR(status_word, 0444, ibmps_show_status_word, NULL);
>>> +
>>> +static ssize_t ibmps_show_status_byte(struct device *dev,
>>>> +                      struct device_attribute *dev_attr,
>>>> +                      char *buf)
>>> +{
>>>> +    int rc;
>>>> +    struct i2c_client *client = to_i2c_client(dev);
>>>> +    struct sensor_device_attribute *sattr = 
>>>> to_sensor_dev_attr(dev_attr);
>>> +
>>>> +    rc = pmbus_read_byte_data(client, 0, PMBUS_STATUS_VOUT + 
>>>> sattr->index);
>>>> +    if (rc < 0)
>>>> +        return rc;
>>> +
>>>> +    return snprintf(buf, PAGE_SIZE - 1, "%02x\n", rc);
>>> +}
>>> +
>>> +static SENSOR_DEVICE_ATTR(status_vout, 0444, 
>>> ibmps_show_status_byte, NULL, 0);
>>> +static SENSOR_DEVICE_ATTR(status_iout, 0444, 
>>> ibmps_show_status_byte, NULL, 1);
>>> +static SENSOR_DEVICE_ATTR(status_input, 0444, 
>>> ibmps_show_status_byte, NULL, 2);
>>> +static SENSOR_DEVICE_ATTR(status_temp, 0444, 
>>> ibmps_show_status_byte, NULL, 3);
>>> +static SENSOR_DEVICE_ATTR(status_cml, 0444, ibmps_show_status_byte, 
>>> NULL, 4);
>>> +static SENSOR_DEVICE_ATTR(status_other, 0444, 
>>> ibmps_show_status_byte, NULL, 5);
>>> +static SENSOR_DEVICE_ATTR(status_mfr, 0444, ibmps_show_status_byte, 
>>> NULL, 6);
>>> +static SENSOR_DEVICE_ATTR(status_fan, 0444, ibmps_show_status_byte, 
>>> NULL, 7);
>>> +
>>> +static struct attribute *ibmps_attributes[] = {
>>>> +    &dev_attr_clear_faults.attr,
>>>> +    &dev_attr_status_word.attr,
>>>> +    &sensor_dev_attr_status_vout.dev_attr.attr,
>>>> +    &sensor_dev_attr_status_iout.dev_attr.attr,
>>>> +    &sensor_dev_attr_status_input.dev_attr.attr,
>>>> +    &sensor_dev_attr_status_temp.dev_attr.attr,
>>>> +    &sensor_dev_attr_status_cml.dev_attr.attr,
>>>> +    &sensor_dev_attr_status_other.dev_attr.attr,
>>>> +    &sensor_dev_attr_status_mfr.dev_attr.attr,
>>>> +    &sensor_dev_attr_status_fan.dev_attr.attr,
>>>> +    NULL
>>> +};
>>> +
>>> +static const struct attribute_group ibmps_attribute_group = {
>>>> +    .attrs = ibmps_attributes,
>>> +};
>>> +
>>>   static int ibmps_probe(struct i2c_client *client,
>>>>                  const struct i2c_device_id *id)
>>>   {
>>>> +    int rc = sysfs_create_group(&client->dev.kobj,
>>>> +                    &ibmps_attribute_group);
>>>> +    if (rc)
>>>> +        return rc;
>>> +
>>>>       return pmbus_do_probe(client, id, &ibmps_info);
>>>   }
>>>     static int ibmps_remove(struct i2c_client *client)
>>>   {
>>>> + sysfs_remove_group(&client->dev.kobj, &ibmps_attribute_group);
>>> +
>>>>       return pmbus_do_remove(client);
>>>   }
>
