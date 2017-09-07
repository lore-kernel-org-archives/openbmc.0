Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xp79C3ZNTzDrWV
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 03:43:43 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v87Hd6BM033032
 for <openbmc@lists.ozlabs.org>; Thu, 7 Sep 2017 13:43:40 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cua3rj38w-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2017 13:43:40 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 7 Sep 2017 11:43:39 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 7 Sep 2017 11:43:37 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v87HhWHa2753022; Thu, 7 Sep 2017 10:43:36 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA1C6C6042;
 Thu,  7 Sep 2017 11:43:36 -0600 (MDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.1.167])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id B5B38C6043;
 Thu,  7 Sep 2017 11:43:34 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 v7 2/2] hwmon: (ucd9000) Add debugfs to
 list mfr_status info
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
References: <20170906210041.22533-1-cbostic@linux.vnet.ibm.com>
 <20170906210041.22533-3-cbostic@linux.vnet.ibm.com>
 <1504747075.5105.2.camel@aj.id.au>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 7 Sep 2017 12:43:32 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1504747075.5105.2.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17090717-0004-0000-0000-000012E2F642
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007684; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00913651; UDB=6.00458580; IPR=6.00693909; 
 BA=6.00005576; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017054; XFM=3.00000015;
 UTC=2017-09-07 17:43:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17090717-0005-0000-0000-0000810611BB
Message-Id: <ddc579e3-d9e6-837a-7f98-75adaa745600@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-07_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709070261
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
X-List-Received-Date: Thu, 07 Sep 2017 17:43:44 -0000



On 9/6/17 8:17 PM, Andrew Jeffery wrote:
> On Wed, 2017-09-06 at 16:00 -0500, Christopher Bostic wrote:
>> Expose via files in debugfs the gpiN_fault fields as well as
>> the entire contents of the mfr_status register.  Allows user
>> space to pull this data for error logging etc...
>>   
>>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> ---
>> v7 - Patch order changed from #3 to #2 and as a result needed
>>       to add the ucd9000_remove definition here.
>> v6 - Remove chip idx values on remove so that we can retain the
>>       same indexes regardless how many times we're bound/unbound.
>>     - Remove type 90160 check when adding debugfs.
>> v5 - Add unique debugfs dir ID for each ucd9000 sysfs device.
>>     - Change branching return to a !! method.
>>     - Clean up line breaks, other white space.
>>     - Add comments on assumptions made regarding ucd90160 versus other
>>       types.
>> v2 - Remove mfr_status directory in debugfs and place the files
>>       up in the parent ucd9000 directory.
>> ---
>>   drivers/hwmon/pmbus/ucd9000.c | 166 +++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 165 insertions(+), 1 deletion(-)
>>   
>> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
>> index 9a82e88..26870e6 100644
>> --- a/drivers/hwmon/pmbus/ucd9000.c
>> +++ b/drivers/hwmon/pmbus/ucd9000.c
>> @@ -19,6 +19,7 @@
>>    * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
>>    */
>>   
>> +#include <linux/debugfs.h>
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>>   #include <linux/init.h>
>> @@ -27,6 +28,7 @@
>>   #include <linux/i2c.h>
>>   #include <linux/i2c/pmbus.h>
>>   #include <linux/gpio.h>
>> +#include <linux/idr.h>
>>   #include "pmbus.h"
>>   
>>   enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
>> @@ -35,6 +37,7 @@
>>   #define UCD9000_NUM_PAGES		0xd6
>>   #define UCD9000_FAN_CONFIG_INDEX	0xe7
>>   #define UCD9000_FAN_CONFIG		0xe8
>> +#define UCD9000_MFR_STATUS		0xf3
>>   #define UCD9000_GPIO_SELECT		0xfa
>>   #define UCD9000_GPIO_CONFIG		0xfb
>>   #define UCD9000_DEVICE_ID		0xfd
>> @@ -56,17 +59,29 @@
>>   #define UCD9000_MON_VOLTAGE_HW	4
>>   
>>   #define UCD9000_NUM_FAN		4
>> +#define UCD9000_NAME_SIZE	24
>>   
>>   #define UCD9000_GPIO_NAME_LEN	16
>>   #define UCD90160_NUM_GPIOS	26
>> +#define UCD90160_GPI_COUNT	8
>> +#define UCD90160_GPI_FAULT_BASE	16
>> +
>> +static DEFINE_IDA(ucd9000_ida);
>>   
>>   struct ucd9000_data {
>>   	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
>>   	struct pmbus_driver_info info;
>>   	struct gpio_chip gpio;
>> +	struct dentry *debugfs;
>> +	int idx;
>>   };
>>   #define to_ucd9000_data(_info) container_of(_info, struct ucd9000_data, info)
>>   
>> +struct ucd9000_debugfs_entry {
>> +	struct i2c_client *client;
>> +	u8 index;
>> +};
>> +
>>   static int ucd9000_get_fan_config(struct i2c_client *client, int fan)
>>   {
>>   	int fan_config = 0;
>> @@ -294,6 +309,141 @@ static int ucd9000_gpio_direction_output(struct gpio_chip *gc,
>>   	return ucd9000_gpio_set_direction(gc, offset, UCD9000_GPIO_OUTPUT, val);
>>   }
>>   
>> +static struct dentry *ucd9000_debugfs_dir;
> I thought we were fixing this up?
>
>> +
>> +#if IS_ENABLED(CONFIG_DEBUG_FS)
>> +static int ucd9000_get_mfr_status(struct i2c_client *client, u32 *buffer)
>> +{
>> +	int ret;
>> +
>> +	ret = pmbus_set_page(client, 0);
>> +	if (ret < 0) {
>> +		dev_err(&client->dev, "pmbus_set_page failed. rc:%d\n", ret);
>> +
>> +		return ret;
>> +	}
>> +
>> +	/*
>> +	 * Warning:
>> +	 *
>> +	 * Though not currently supported this will cause stack corruption for
>> +	 * ucd90240!  Command reference, page 81:
>> +	 *
>> +	 *    With the ucd90120 and ucd90124 devices, this command [MFR_STATUS]
>> +	 *    is 2 bytes long (bits 0-15).  With the ucd90240 this command is 5
>> +	 *    bytes long.  With all other devices, it is 4 bytes long.
>> +	 */
>> +	return i2c_smbus_read_block_data(client, UCD9000_MFR_STATUS,
>> +					(u8 *)buffer);
>> +}
>> +
>> +static int ucd9000_debugfs_get_mfr_status_bit(void *data, u64 *val)
>> +{
>> +	struct ucd9000_debugfs_entry *entry = data;
>> +	struct i2c_client *client = entry->client;
>> +	int nr = entry->index;
>> +	u32 buffer;
>> +	int ret;
>> +
>> +	ret = ucd9000_get_mfr_status(client, &buffer);
>> +	if (ret < 0) {
>> +		dev_err(&client->dev, "Failed to read mfr status. rc:%d\n",
>> +			ret);
>> +
>> +		return ret;
>> +	}
>> +
>> +	*val = !!(ret & BIT(nr));
>> +
>> +	return 0;
>> +}
>> +
>> +DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_ops_mfr_status_bit,
>> +		ucd9000_debugfs_get_mfr_status_bit, NULL, "%1lld\n");
>> +
>> +static int ucd9000_debugfs_get_mfr_status_word(void *data, u64 *val)
>> +{
>> +	struct ucd9000_debugfs_entry *entry = data;
>> +	struct i2c_client *client = entry->client;
>> +	u32 buffer;
>> +	int ret;
>> +
>> +	ret = ucd9000_get_mfr_status(client, &buffer);
>> +	if (ret < 0) {
>> +		dev_err(&client->dev, "Failed to read mfr status. rc:%d\n",
>> +			ret);
>> +
>> +		return ret;
>> +	}
>> +
>> +	*val = ret;
>> +
>> +	return 0;
>> +}
>> +DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_ops_mfr_status_word,
>> +		ucd9000_debugfs_get_mfr_status_word, NULL, "%08llx\n");
>> +
>> +static int ucd9000_init_debugfs(struct i2c_client *client,
>> +				struct ucd9000_data *data)
>> +{
>> +	struct ucd9000_debugfs_entry *entries;
>> +	char name[UCD9000_NAME_SIZE];
>> +	int i;
>> +
>> +	data->idx = ida_simple_get(&ucd9000_ida, 0, INT_MAX, GFP_KERNEL);
>> +	scnprintf(name, UCD9000_NAME_SIZE, "ucd9000.%d", data->idx);
>> +	ucd9000_debugfs_dir = debugfs_create_dir(name, NULL);
> We should be storing the dentry in the context struct. We're now uniquely
> naming the directory, but we're still storing the dentry in static storage. The
> code as it stands will still stomp over the top of existing devices on probe,
> and it cannot be cleaned up properly. In fact, we'll cleanup the wrong entry
> depending on the order of probe/remove across the devices. It's not just fixed
> by uniquely naming the directory.

OK, will correct for next set.

Thanks,
Chris

>
> Andrew
>
>> +	if (IS_ERR(ucd9000_debugfs_dir)) {
>> +		dev_warn(&client->dev, "Failed to create debugfs dir: %p\n",
>> +			ucd9000_debugfs_dir);
>> +		ucd9000_debugfs_dir = NULL;
>> +		ida_simple_remove(&ucd9000_ida, data->idx);
>> +		return 0;
>> +	}
>> +
>> +	/*
>> +	 * Warning:
>> +	 *
>> +	 * Makes assumption we're on a ucd90160 type! entries will be different
>> +	 * sizes for other types.
>> +	 */
>> +	entries = devm_kzalloc(&client->dev, sizeof(*entries) *
>> +				(UCD90160_GPI_COUNT + 1) * 10, GFP_KERNEL);
>> +	if (!entries) {
>> +		ida_simple_remove(&ucd9000_ida, data->idx);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	/*
>> +	 * Warning:
>> +	 *
>> +	 * This makes the assumption we're probing a ucd90160 type and how the
>> +	 * GPI information is organized.  Needs to account for all other
>> +	 * ucd9000 varieties.
>> +	 */
>> +	for (i = 0; i < UCD90160_GPI_COUNT; i++) {
>> +		entries[i].client = client;
>> +		entries[i].index = UCD90160_GPI_FAULT_BASE + i;
>> +		scnprintf(name, UCD9000_NAME_SIZE, "gpi%d_alarm", i+1);
>> +		debugfs_create_file(name, 0444, ucd9000_debugfs_dir,
>> +				&entries[i],
>> +				&ucd9000_debugfs_ops_mfr_status_bit);
>> +	}
>> +	entries[i].client = client;
>> +	scnprintf(name, UCD9000_NAME_SIZE, "mfr_status");
>> +	debugfs_create_file(name, 0444, ucd9000_debugfs_dir, &entries[i],
>> +			&ucd9000_debugfs_ops_mfr_status_word);
>> +
>> +	return 0;
>> +}
>> +#else
>> +static int ucd9000_init_debugfs(struct i2c_client *client,
>> +				struct ucd9000_data *data)
>> +{
>> +	return 0;
>> +}
>> +#endif /* IS_ENABLED(CONFIG_DEBUG_FS) */
>> +
>>   static int ucd9000_probe(struct i2c_client *client,
>>   			 const struct i2c_device_id *id)
>>   {
>> @@ -433,16 +583,30 @@ static int ucd9000_probe(struct i2c_client *client,
>>   		return ret;
>>   	}
>>   
>> +	ret = ucd9000_init_debugfs(client, data);
>> +	if (ret < 0)
>> +		dev_warn(&client->dev, "Failed to register debugfs: %d\n", ret);
>> +
>>   	return pmbus_do_probe(client, mid, info);
>>   }
>>   
>> +static int ucd9000_remove(struct i2c_client *client)
>> +{
>> +	struct ucd9000_data *data
>> +		= to_ucd9000_data(pmbus_get_driver_info(client));
>> +
>> +	ida_simple_remove(&ucd9000_ida, data->idx);
>> +	debugfs_remove_recursive(ucd9000_debugfs_dir);
>> +	return pmbus_do_remove(client);
>> +}
>> +
>>   /* This is the driver that will be inserted */
>>   static struct i2c_driver ucd9000_driver = {
>>   	.driver = {
>>   		.name = "ucd9000",
>>   	},
>>   	.probe = ucd9000_probe,
>> -	.remove = pmbus_do_remove,
>> +	.remove = ucd9000_remove,
>>   	.id_table = ucd9000_id,
>>   };
>>   
