Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjnRz3VjCzDqGX
 for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2017 02:11:26 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7VGAZlJ043760
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 12:11:24 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2cpmx9tkqm-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 12:11:24 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Thu, 31 Aug 2017 12:11:23 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 31 Aug 2017 12:11:21 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7VGBLKM23330832; Thu, 31 Aug 2017 16:11:21 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F34BAAE034;
 Thu, 31 Aug 2017 12:11:45 -0400 (EDT)
Received: from [9.10.99.183] (unknown [9.10.99.183])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id C5514AE03B;
 Thu, 31 Aug 2017 12:11:45 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v6 1/3] hwmon: (ucd9000) Add interface to
 clear logged faults.
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
References: <20170830214953.73327-1-cbostic@linux.vnet.ibm.com>
 <20170830214953.73327-2-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Thu, 31 Aug 2017 11:11:22 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170830214953.73327-2-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17083116-2213-0000-0000-000002126EC0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007642; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00910273; UDB=6.00456616; IPR=6.00690553; 
 BA=6.00005563; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016945; XFM=3.00000015;
 UTC=2017-08-31 16:11:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17083116-2214-0000-0000-00005765504E
Message-Id: <1ab25031-39d3-2968-e86b-a42051cb9fd8@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 31 Aug 2017 16:11:28 -0000

Tested-by: Matt Spinler mspinler@linux.vnet.ibm.com


On 8/30/2017 4:49 PM, Christopher Bostic wrote:
> Provide a means for user space to clear out any logged faults
> on these types of devices.  Ability to do so allows user to
> start with a clean slate at system poweron which can be done
> multiple times after this driver loads.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>   drivers/hwmon/pmbus/ucd9000.c | 49 ++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 48 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
> index 3e3aa95..c401e5b 100644
> --- a/drivers/hwmon/pmbus/ucd9000.c
> +++ b/drivers/hwmon/pmbus/ucd9000.c
> @@ -26,6 +26,8 @@
>   #include <linux/slab.h>
>   #include <linux/i2c.h>
>   #include <linux/i2c/pmbus.h>
> +#include <linux/sysfs.h>
> +#include <linux/hwmon-sysfs.h>
>   #include "pmbus.h"
>
>   enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
> @@ -34,6 +36,7 @@
>   #define UCD9000_NUM_PAGES		0xd6
>   #define UCD9000_FAN_CONFIG_INDEX	0xe7
>   #define UCD9000_FAN_CONFIG		0xe8
> +#define UCD9000_LOGGED_FAULTS		0xea
>   #define UCD9000_DEVICE_ID		0xfd
>
>   #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
> @@ -119,6 +122,37 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
>   };
>   MODULE_DEVICE_TABLE(i2c, ucd9000_id);
>
> +static ssize_t ucd9000_clear_logged_faults(struct device *dev,
> +				struct device_attribute *attr, const char *buf,
> +				size_t count)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	int ret;
> +
> +	/* No page set required */
> +	ret = i2c_smbus_write_byte_data(client, UCD9000_LOGGED_FAULTS, 0);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to clear logged faults: %d\n",
> +			ret);
> +
> +		return ret;
> +	}
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR(clear_logged_faults, 0200, NULL,
> +		ucd9000_clear_logged_faults);
> +
> +static struct attribute *ucd9000_attributes[] = {
> +	&dev_attr_clear_logged_faults.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group ucd9000_attr_group = {
> +	.attrs = ucd9000_attributes,
> +};
> +
>   static int ucd9000_probe(struct i2c_client *client,
>   			 const struct i2c_device_id *id)
>   {
> @@ -227,16 +261,29 @@ static int ucd9000_probe(struct i2c_client *client,
>   		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
>   	}
>
> +	ret = sysfs_create_group(&client->dev.kobj, &ucd9000_attr_group);
> +	if (ret < 0) {
> +		dev_warn(&client->dev, "Failed to add sysfs files: %d\n", ret);
> +
> +		return ret;
> +	}
> +
>   	return pmbus_do_probe(client, mid, info);
>   }
>
> +static int ucd9000_remove(struct i2c_client *client)
> +{
> +	sysfs_remove_group(&client->dev.kobj, &ucd9000_attr_group);
> +	return pmbus_do_remove(client);
> +}
> +
>   /* This is the driver that will be inserted */
>   static struct i2c_driver ucd9000_driver = {
>   	.driver = {
>   		.name = "ucd9000",
>   	},
>   	.probe = ucd9000_probe,
> -	.remove = pmbus_do_remove,
> +	.remove = ucd9000_remove,
>   	.id_table = ucd9000_id,
>   };
>
