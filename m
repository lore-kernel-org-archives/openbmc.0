Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSz2x18qJzDqrP
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 05:38:48 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7AJcCiL129686
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 15:38:45 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c8wtmg0t0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 15:38:44 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 10 Aug 2017 15:38:43 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 10 Aug 2017 15:38:42 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7AJcfeW21299348; Thu, 10 Aug 2017 19:38:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32D61AC041;
 Thu, 10 Aug 2017 15:38:59 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.3.186])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 2FF11AC03F;
 Thu, 10 Aug 2017 15:38:55 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10] hwmon: (ucd9000) Add user space access of
 status and config
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au,
 eajames@linux.vnet.ibm.com
References: <20170809013436.21050-1-cbostic@linux.vnet.ibm.com>
 <1502340533.7946.12.camel@aj.id.au>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 10 Aug 2017 14:38:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1502340533.7946.12.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17081019-0040-0000-0000-0000038DEE36
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007520; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000219; SDB=6.00900426; UDB=6.00450791; IPR=6.00680627; 
 BA=6.00005522; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016633; XFM=3.00000015;
 UTC=2017-08-10 19:38:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081019-0041-0000-0000-000007821C56
Message-Id: <4ff12f67-e6b9-1099-c37e-88ae6f66586d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-10_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708100308
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
X-List-Received-Date: Thu, 10 Aug 2017 19:38:49 -0000



On 8/9/17 11:48 PM, Andrew Jeffery wrote:
> Hi Chris,
>
> On Tue, 2017-08-08 at 20:34 -0500, Christopher Bostic wrote:
>> Create sysfs files to export status_word, status_vout, gpio_config
>> and other properties of the ucd90160 device.  There are separate
>> files for each parsed bit.
>>
>> Note that status_word and ton / toff has not yet been moved
>> into the pmbus core.  Once the final decision from the community
>> has been received I'll updating.
>>
>>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> ---
>>   drivers/hwmon/pmbus/ucd9000.c | 390 +++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 389 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
>> index 3e3aa95..f384a39 100644
>> --- a/drivers/hwmon/pmbus/ucd9000.c
>> +++ b/drivers/hwmon/pmbus/ucd9000.c
>> @@ -26,6 +26,8 @@
>>   #include <linux/slab.h>
>>   #include <linux/i2c.h>
>>   #include <linux/i2c/pmbus.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/hwmon-sysfs.h>
>>   #include "pmbus.h"
>>   
>>   enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
>> @@ -34,6 +36,10 @@
>>>   #define UCD9000_NUM_PAGES		0xd6
>>>   #define UCD9000_FAN_CONFIG_INDEX	0xe7
>>>   #define UCD9000_FAN_CONFIG		0xe8
>>> +#define UCD9000_LOGGED_FAULTS		0xea
>>> +#define UCD9000_MFR_STATUS		0xf3
>>> +#define UCD9000_GPIO_SELECT		0xfa
>>> +#define UCD9000_GPIO_CONFIG		0xfb
>>>   #define UCD9000_DEVICE_ID		0xfd
>>   
>>>   #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
>> @@ -119,6 +125,378 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
>>   };
>>   MODULE_DEVICE_TABLE(i2c, ucd9000_id);
>>   
>> +static ssize_t ucd9000_clear_faults(struct device *dev,
>>> +				struct device_attribute *attr, const char *buf,
>>> +				size_t count)
>> +{
>>> +	struct i2c_client *client = to_i2c_client(dev);
>> +
>>> +	pmbus_clear_faults(client);
>> +
>>> +	return count;
>> +}
> Eddie was exposing this in the core. I don't think we should need to
> carry it here.
Hi Andrew,

OK will use the interface Eddie is using for this.

>> +
>> +static ssize_t ucd9000_clear_logged_faults(struct device *dev,
>>> +				struct device_attribute *attr, const char *buf,
>>> +				size_t count)
>> +{
>>> +	struct i2c_client *client = to_i2c_client(dev);
>>> +	int ret;
>> +
>>> +	ret = i2c_smbus_write_byte_data(client, UCD9000_LOGGED_FAULTS, 0);
>>> +	if (ret) {
>>> +		dev_err(&client->dev, "Failed to clear logged faults\n");
>>> +		return ret;
>>> +	}
>> +
>>> +	return count;
>> +}
>> +
>> +static ssize_t ucd9000_mfr_status(struct device *dev,
>>> +				struct device_attribute *attr,
>>> +				char *buf)
>> +{
>>> +	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
>>> +	struct i2c_client *client = to_i2c_client(dev);
>>> +	int nr = sensor_attr->index, ret;
>>> +	u32 block_buffer;
>> +
>>> +	ret = pmbus_set_page(client, 0);
>>> +	if (ret < 0) {
>>> +		dev_err(&client->dev, "i2c_smbus_write failed. rc:%d\n", ret);
>>> +		return ret;
>>> +	}
>> +
>>> +	ret = i2c_smbus_read_block_data(client, UCD9000_MFR_STATUS,
>>> +					(u8 *)&block_buffer);
>>> +	if (ret < 0) {
>>> +		dev_err(&client->dev,
>>> +			"Failed to read mfr status. rc:%d\n", ret);
>>> +		return ret;
>>> +	}
>> +
>>> +	return sprintf(buf, "%1d\n", ret & BIT(nr) ? 1 : 0);
>> +}
>> +
>> +static ssize_t ucd9000_gpi_config(struct device *dev,
>>> +				struct device_attribute *attr,
>>> +				char *buf)
>> +{
>>> +	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
>>> +	struct i2c_client *client = to_i2c_client(dev);
>>> +	int nr = (sensor_attr->index & 0xf00) >> 8;
>> +	int reg = sensor_attr->index & 0xff, ret;
> Do we need to set the page?
>
I don't believe so.  GPIO select and config are listed as common scope 
in the ucd90XXX spec.

>> +
>>> +	ret = i2c_smbus_write_byte_data(client, UCD9000_GPIO_SELECT, reg);
>>> +	if (ret) {
>>> +		dev_err(&client->dev, "Failed to set gpio select %d\n", reg);
>>> +		return ret;
>>> +	}
>> +
>>> +	ret = i2c_smbus_read_byte_data(client, UCD9000_GPIO_CONFIG);
>>> +	if (ret < 0) {
>>> +		dev_err(&client->dev,
>>> +			"Failed to read gpi%02d config\n", reg);
>>> +	}
>> +
>>> +	return sprintf(buf, "%1d\n", ret & BIT(nr) ? 1 : 0);
>> +}
>> +
>> +static ssize_t ucd9000_status_vout(struct device *dev,
>>> +				struct device_attribute *attr,
>>> +				char *buf)
>> +{
>>> +	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
>>> +	struct i2c_client *client = to_i2c_client(dev);
>>> +	int nr = (sensor_attr->index & 0xf00) >> 8;
>>> +	int page = sensor_attr->index & 0xff, ret;
>> +
>>> +	ret = pmbus_set_page(client, page);
>>> +	if (ret < 0) {
>>> +		dev_err(&client->dev, "i2c_smbus_write failed. page:%d rc:%d\n",
>>> +			page, ret);
>>> +		return ret;
>>> +	}
>> +
>>> +	ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_VOUT);
>>> +	if (ret < 0) {
>>> +		dev_err(&client->dev,
>>> +			"Failed to read status_vout(%d) rc:%d\n", page, ret);
>> +	}
> The set_page()/read_byte() dance can be performed with
> pmbus_read_byte_data()
OK will change.

>
>> +
>>> +	return sprintf(buf, "%1d", ret & BIT(nr) ? 1 : 0);
>> +}
>> +
>> +static ssize_t ucd9000_status_word(struct device *dev,
>>> +				struct device_attribute *attr,
>>> +				char *buf)
>> +{
>>> +	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
>>> +	struct i2c_client *client = to_i2c_client(dev);
>>> +	int nr = sensor_attr->index, ret;
>> +
>>> +	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
>>> +	if (ret < 0) {
>>> +		dev_err(&client->dev,
>>> +			"Failed to read number of active pages\n");
>>> +		return ret;
>>> +	}
>> +
>>> +	return sprintf(buf, "%1d", ret & BIT(nr) ? 1 : 0);
>> +}
>> +
>> +static DEVICE_ATTR(clear_faults, 0200, NULL, ucd9000_clear_faults);
>> +static DEVICE_ATTR(clear_logged_faults, 0200,
>>> +			  NULL, ucd9000_clear_logged_faults);
>> +
>> +/* MFR status */
>> +static SENSOR_DEVICE_ATTR(gpi8_fault, 0444, ucd9000_mfr_status, NULL, 23);
>> +static SENSOR_DEVICE_ATTR(gpi7_fault, 0444, ucd9000_mfr_status, NULL, 22);
>> +static SENSOR_DEVICE_ATTR(gpi6_fault, 0444, ucd9000_mfr_status, NULL, 21);
>> +static SENSOR_DEVICE_ATTR(gpi5_fault, 0444, ucd9000_mfr_status, NULL, 20);
>> +static SENSOR_DEVICE_ATTR(gpi4_fault, 0444, ucd9000_mfr_status, NULL, 19);
>> +static SENSOR_DEVICE_ATTR(gpi3_fault, 0444, ucd9000_mfr_status, NULL, 18);
>> +static SENSOR_DEVICE_ATTR(gpi2_fault, 0444, ucd9000_mfr_status, NULL, 17);
>> +static SENSOR_DEVICE_ATTR(gpi1_fault, 0444, ucd9000_mfr_status, NULL, 16);
>> +static SENSOR_DEVICE_ATTR(new_logged_fault_detail, 0444,
>>> +			ucd9000_mfr_status, NULL, 12);
>> +static SENSOR_DEVICE_ATTR(system_watchdog_timeout, 0444,
>>> +			ucd9000_mfr_status, NULL, 11);
>> +static SENSOR_DEVICE_ATTR(store_default_all_error, 0444,
>>> +			ucd9000_mfr_status, NULL, 10);
>> +static SENSOR_DEVICE_ATTR(store_default_all_done, 0444,
>>> +			ucd9000_mfr_status, NULL, 9);
>> +static SENSOR_DEVICE_ATTR(watchdog_timeout, 0444,
>>> +			ucd9000_mfr_status, NULL, 8);
>> +static SENSOR_DEVICE_ATTR(invalid_logs, 0444,
>>> +			ucd9000_mfr_status, NULL, 7);
>> +static SENSOR_DEVICE_ATTR(logged_fault_detail, 0444,
>>> +			ucd9000_mfr_status, NULL, 6);
>> +static SENSOR_DEVICE_ATTR(resequence_error, 0444, ucd9000_mfr_status, NULL, 5);
>> +static SENSOR_DEVICE_ATTR(pkgid_mismatch, 0444, ucd9000_mfr_status, NULL, 4);
>> +static SENSOR_DEVICE_ATTR(hardcoded_parms, 0444, ucd9000_mfr_status, NULL, 3);
>> +static SENSOR_DEVICE_ATTR(seq_off_timeout, 0444, ucd9000_mfr_status, NULL, 2);
>> +static SENSOR_DEVICE_ATTR(seq_on_timeout, 0444, ucd9000_mfr_status, NULL, 1);
> Is this impacted by the debugfs approach that Eddie's developing?
Yes, this would be covered in the core with Eddie's change, will remove.


>> +
>> +/* GPIO config */
>> +static SENSOR_DEVICE_ATTR(gpio8_enab, 0444, ucd9000_gpi_config, NULL, 8);
>> +static SENSOR_DEVICE_ATTR(gpio8_out_enab, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x0108);
>> +static SENSOR_DEVICE_ATTR(gpio8_out_val, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x0208);
>> +static SENSOR_DEVICE_ATTR(gpio8_stat, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x0308);
>> +static SENSOR_DEVICE_ATTR(gpio9_enab, 0444, ucd9000_gpi_config, NULL, 9);
>> +static SENSOR_DEVICE_ATTR(gpio9_out_enab, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x0109);
>> +static SENSOR_DEVICE_ATTR(gpio9_out_val, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x0209);
>> +static SENSOR_DEVICE_ATTR(gpio9_stat, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x0309);
>> +static SENSOR_DEVICE_ATTR(gpio10_enab, 0444, ucd9000_gpi_config, NULL, 10);
>> +static SENSOR_DEVICE_ATTR(gpio10_out_enab, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x010a);
>> +static SENSOR_DEVICE_ATTR(gpio10_out_val, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x020a);
>> +static SENSOR_DEVICE_ATTR(gpio10_stat, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x030a);
>> +static SENSOR_DEVICE_ATTR(gpio11_enab, 0444, ucd9000_gpi_config, NULL, 11);
>> +static SENSOR_DEVICE_ATTR(gpio11_out_enab, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x010b);
>> +static SENSOR_DEVICE_ATTR(gpio11_out_val, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x020b);
>> +static SENSOR_DEVICE_ATTR(gpio11_stat, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x030b);
>> +static SENSOR_DEVICE_ATTR(gpio14_enab, 0444, ucd9000_gpi_config, NULL, 14);
>> +static SENSOR_DEVICE_ATTR(gpio14_out_enab, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x010e);
>> +static SENSOR_DEVICE_ATTR(gpio14_out_val, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x020e);
>> +static SENSOR_DEVICE_ATTR(gpio14_stat, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x030e);
>> +static SENSOR_DEVICE_ATTR(gpio17_enab, 0444, ucd9000_gpi_config, NULL, 17);
>> +static SENSOR_DEVICE_ATTR(gpio17_out_enab, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x0111);
>> +static SENSOR_DEVICE_ATTR(gpio17_out_val, 0444, ucd9000_gpi_config,
>>> +			NULL, 0x0211);
>> +static SENSOR_DEVICE_ATTR(gpio17_stat, 0444, ucd9000_gpi_config,
>> +			NULL, 0x0311);
> Seems like it should implement a gpio_chip?
Was considering that - will look into adding.

>> +
>> +
>> +/* Status VOUT : Should be moved to PMBUS core */
> Did you investigate implementing these in the PMBus core? If so, why
> didn't you take that route? If not, why not?

I was intending to implement in the core but after spending some time on 
what method to use, and given Eddie's parallel efforts here, I first I 
wanted to have the functionality at least available locally.   This can 
be removed with the other new core additions.

>
>> +static SENSOR_DEVICE_ATTR(ton1_max_fault, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0201);
>> +static SENSOR_DEVICE_ATTR(toff1_max_warning, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0101);
>> +static SENSOR_DEVICE_ATTR(ton2_max_fault, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0202);
>> +static SENSOR_DEVICE_ATTR(toff2_max_warning, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0102);
>> +static SENSOR_DEVICE_ATTR(ton3_max_fault, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0203);
>> +static SENSOR_DEVICE_ATTR(toff3_max_warning, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0103);
>> +static SENSOR_DEVICE_ATTR(ton4_max_fault, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0204);
>> +static SENSOR_DEVICE_ATTR(toff4_max_warning, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0104);
>> +static SENSOR_DEVICE_ATTR(ton5_max_fault, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0205);
>> +static SENSOR_DEVICE_ATTR(toff5_max_warning, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0105);
>> +static SENSOR_DEVICE_ATTR(ton6_max_fault, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0206);
>> +static SENSOR_DEVICE_ATTR(toff6_max_warning, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0106);
>> +static SENSOR_DEVICE_ATTR(ton7_max_fault, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0207);
>> +static SENSOR_DEVICE_ATTR(toff7_max_warning, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0107);
>> +static SENSOR_DEVICE_ATTR(ton8_max_fault, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0208);
>> +static SENSOR_DEVICE_ATTR(toff8_max_warning, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0108);
>> +static SENSOR_DEVICE_ATTR(ton9_max_fault, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0209);
>> +static SENSOR_DEVICE_ATTR(toff9_max_warning, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0109);
>> +static SENSOR_DEVICE_ATTR(ton10_max_fault, 0444, ucd9000_status_vout,
>>> +			NULL, 0x020a);
>> +static SENSOR_DEVICE_ATTR(toff10_max_warning, 0444, ucd9000_status_vout,
>>> +			NULL, 0x010a);
>> +static SENSOR_DEVICE_ATTR(ton11_max_fault, 0444, ucd9000_status_vout,
>>> +			NULL, 0x020b);
>> +static SENSOR_DEVICE_ATTR(toff11_max_warning, 0444, ucd9000_status_vout,
>>> +			NULL, 0x010b);
>> +static SENSOR_DEVICE_ATTR(ton12_max_fault, 0444, ucd9000_status_vout,
>>> +			NULL, 0x020c);
>> +static SENSOR_DEVICE_ATTR(toff12_max_warning, 0444, ucd9000_status_vout,
>>> +			NULL, 0x010c);
>> +static SENSOR_DEVICE_ATTR(ton13_max_fault, 0444, ucd9000_status_vout,
>>> +			NULL, 0x020d);
>> +static SENSOR_DEVICE_ATTR(toff13_max_warning, 0444, ucd9000_status_vout,
>>> +			NULL, 0x010d);
>> +static SENSOR_DEVICE_ATTR(ton14_max_fault, 0444, ucd9000_status_vout,
>>> +			NULL, 0x020e);
>> +static SENSOR_DEVICE_ATTR(toff14_max_warning, 0444, ucd9000_status_vout,
>>> +			NULL, 0x010e);
>> +static SENSOR_DEVICE_ATTR(ton15_max_fault, 0444, ucd9000_status_vout,
>>> +			NULL, 0x020f);
>> +static SENSOR_DEVICE_ATTR(toff15_max_warning, 0444, ucd9000_status_vout,
>>> +			NULL, 0x010f);
>> +static SENSOR_DEVICE_ATTR(ton16_max_fault, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0210);
>> +static SENSOR_DEVICE_ATTR(toff16_max_warning, 0444, ucd9000_status_vout,
>>> +			NULL, 0x0110);
>> +
>> +/*
>> + * Status Word
>> + * Why is this not in the core?  In process of being added to pmbus core
>> + * but for the mean time its local for testing purposes
>> + */
>> +static SENSOR_DEVICE_ATTR(misc_alarm, 0444, ucd9000_status_word, NULL, 0);
>> +static SENSOR_DEVICE_ATTR(cml_alarm, 0444, ucd9000_status_word, NULL, 1);
>> +static SENSOR_DEVICE_ATTR(vout_crit_alarm, 0444, ucd9000_status_word, NULL, 5);
>> +static SENSOR_DEVICE_ATTR(off_alarm, 0444, ucd9000_status_word, NULL, 6);
>> +static SENSOR_DEVICE_ATTR(fans_alarm, 0444, ucd9000_status_word, NULL, 10);
>> +static SENSOR_DEVICE_ATTR(pgood_alarm, 0444, ucd9000_status_word, NULL, 11);
>> +static SENSOR_DEVICE_ATTR(mfr_alarm, 0444, ucd9000_status_word, NULL, 12);
>> +static SENSOR_DEVICE_ATTR(vout_alarm, 0444, ucd9000_status_word, NULL, 15);
> So Eddie's patch addresses some of these - can you please rework your
> patch in terms of his?

Yes will do that.

Thanks
-Chris

>
> Cheers,
>
> Andrew
>
>> +
>> +static struct attribute *ucd9000_attributes[] = {
>>> +	&dev_attr_clear_faults.attr,
>>> +	&dev_attr_clear_logged_faults.attr,
>>> +	&sensor_dev_attr_misc_alarm.dev_attr.attr,
>>> +	&sensor_dev_attr_cml_alarm.dev_attr.attr,
>>> +	&sensor_dev_attr_vout_crit_alarm.dev_attr.attr,
>>> +	&sensor_dev_attr_off_alarm.dev_attr.attr,
>>> +	&sensor_dev_attr_fans_alarm.dev_attr.attr,
>>> +	&sensor_dev_attr_pgood_alarm.dev_attr.attr,
>>> +	&sensor_dev_attr_mfr_alarm.dev_attr.attr,
>>> +	&sensor_dev_attr_vout_alarm.dev_attr.attr,
>>> +	&sensor_dev_attr_gpi8_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_gpi7_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_gpi6_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_gpi5_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_gpi4_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_gpi3_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_gpi2_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_gpi1_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_new_logged_fault_detail.dev_attr.attr,
>>> +	&sensor_dev_attr_system_watchdog_timeout.dev_attr.attr,
>>> +	&sensor_dev_attr_store_default_all_error.dev_attr.attr,
>>> +	&sensor_dev_attr_store_default_all_done.dev_attr.attr,
>>> +	&sensor_dev_attr_watchdog_timeout.dev_attr.attr,
>>> +	&sensor_dev_attr_invalid_logs.dev_attr.attr,
>>> +	&sensor_dev_attr_logged_fault_detail.dev_attr.attr,
>>> +	&sensor_dev_attr_resequence_error.dev_attr.attr,
>>> +	&sensor_dev_attr_pkgid_mismatch.dev_attr.attr,
>>> +	&sensor_dev_attr_hardcoded_parms.dev_attr.attr,
>>> +	&sensor_dev_attr_seq_off_timeout.dev_attr.attr,
>>> +	&sensor_dev_attr_seq_on_timeout.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio8_enab.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio8_out_enab.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio8_out_val.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio8_stat.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio9_enab.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio9_out_enab.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio9_out_val.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio9_stat.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio10_enab.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio10_out_enab.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio10_out_val.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio10_stat.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio11_enab.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio11_out_enab.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio11_out_val.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio11_stat.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio14_enab.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio14_out_enab.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio14_out_val.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio14_stat.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio17_enab.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio17_out_enab.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio17_out_val.dev_attr.attr,
>>> +	&sensor_dev_attr_gpio17_stat.dev_attr.attr,
>>> +	&sensor_dev_attr_toff1_max_warning.dev_attr.attr,
>>> +	&sensor_dev_attr_toff2_max_warning.dev_attr.attr,
>>> +	&sensor_dev_attr_toff3_max_warning.dev_attr.attr,
>>> +	&sensor_dev_attr_toff4_max_warning.dev_attr.attr,
>>> +	&sensor_dev_attr_toff5_max_warning.dev_attr.attr,
>>> +	&sensor_dev_attr_toff6_max_warning.dev_attr.attr,
>>> +	&sensor_dev_attr_toff7_max_warning.dev_attr.attr,
>>> +	&sensor_dev_attr_toff8_max_warning.dev_attr.attr,
>>> +	&sensor_dev_attr_toff9_max_warning.dev_attr.attr,
>>> +	&sensor_dev_attr_toff10_max_warning.dev_attr.attr,
>>> +	&sensor_dev_attr_toff11_max_warning.dev_attr.attr,
>>> +	&sensor_dev_attr_toff12_max_warning.dev_attr.attr,
>>> +	&sensor_dev_attr_toff13_max_warning.dev_attr.attr,
>>> +	&sensor_dev_attr_toff14_max_warning.dev_attr.attr,
>>> +	&sensor_dev_attr_toff15_max_warning.dev_attr.attr,
>>> +	&sensor_dev_attr_toff16_max_warning.dev_attr.attr,
>>> +	&sensor_dev_attr_ton1_max_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_ton2_max_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_ton3_max_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_ton4_max_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_ton5_max_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_ton6_max_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_ton7_max_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_ton8_max_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_ton9_max_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_ton10_max_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_ton11_max_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_ton12_max_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_ton13_max_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_ton14_max_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_ton15_max_fault.dev_attr.attr,
>>> +	&sensor_dev_attr_ton16_max_fault.dev_attr.attr,
>>> +	NULL
>> +};
>> +
>> +static const struct attribute_group ucd9000_attr_group = {
>>> +	.attrs = ucd9000_attributes,
>> +};
>> +
>>   static int ucd9000_probe(struct i2c_client *client,
>>>   			 const struct i2c_device_id *id)
>>   {
>> @@ -227,16 +605,26 @@ static int ucd9000_probe(struct i2c_client *client,
>>>   		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
>>>   	}
>>   
>>> +	ret = sysfs_create_group(&client->dev.kobj, &ucd9000_attr_group);
>>> +	if (ret < 0)
>>> +		return ret;
>> +
>>>   	return pmbus_do_probe(client, mid, info);
>>   }
>>   
>> +static int ucd9000_remove(struct i2c_client *client)
>> +{
>>> +	sysfs_remove_group(&client->dev.kobj, &ucd9000_attr_group);
>>> +	return pmbus_do_remove(client);
>> +}
>> +
>>   /* This is the driver that will be inserted */
>>   static struct i2c_driver ucd9000_driver = {
>>>   	.driver = {
>>>   		.name = "ucd9000",
>>>   	},
>>>   	.probe = ucd9000_probe,
>>> -	.remove = pmbus_do_remove,
>>> +	.remove = ucd9000_remove,
>>>   	.id_table = ucd9000_id,
>>   };
>>   
