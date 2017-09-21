Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xyLNb4RsJzDqBc
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 12:37:03 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8L2XKcF141040
 for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2017 22:37:00 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2d3ur54uh8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2017 22:37:00 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 20 Sep 2017 22:36:59 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 20 Sep 2017 22:36:58 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8L2aws649086570; Thu, 21 Sep 2017 02:36:58 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1AA7AE04E;
 Wed, 20 Sep 2017 22:37:29 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.80.234.180])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 5F9F7AE03B;
 Wed, 20 Sep 2017 22:37:29 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v3] drivers/hwmon/occ: Add reference count
 and switch to non-blocking read
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: Eddie James <eajames@us.ibm.com>
References: <1505944685-6695-1-git-send-email-eajames@linux.vnet.ibm.com>
Date: Wed, 20 Sep 2017 21:36:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1505944685-6695-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17092102-0040-0000-0000-000003A59860
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007770; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000230; SDB=6.00920026; UDB=6.00462266; IPR=6.00700253; 
 BA=6.00005599; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017228; XFM=3.00000015;
 UTC=2017-09-21 02:36:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17092102-0041-0000-0000-0000079A9D40
Message-Id: <9f0839c7-5189-1fd7-160b-198ce5f20efc@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-20_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709210033
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Sep 2017 02:37:04 -0000



On 09/20/2017 04:58 PM, Eddie James wrote:
> From: Eddie James <eajames@us.ibm.com>
>
> It's possible for the sbefifo ops to hang entirely if the system goes
> down (checkstop, etc). If a hwmon sysfs operation is hung, then unbind
> may hang as it waits for the kernfs mutex to remove hwmon attributes.
>
> This change switches the p9 occ op to use a non-blocking read with a
> retry on -EAGAIN. This continues forever until either user cancels or
> driver sets the cancel bit in remove(). In addition, we need to switch
> our occ structure to be dynamically allocated separate from the device,
> as the device resources will be freed immediately after remove(), while
> hwmon ops may still be ocurring. This necessitates reference counting so
> we can free the occ structure once all users are done.
>
> This patch depends on "kobject: Export kobject_get_unless_zero()".

Abandoned. Will instead fix some outstanding problems in occ remove() 
function and look at changing the behavior when we see checkstop or occ 
error/inactive.

Thanks,
Eddie
>
> Signed-off-by: Eddie James <eajames@us.ibm.com>
> ---
>   drivers/hwmon/occ/common.c | 42 +++++++++++++++++++++++++++++++++---------
>   drivers/hwmon/occ/common.h |  2 ++
>   drivers/hwmon/occ/p8_i2c.c | 23 ++++++++++++++++++++---
>   drivers/hwmon/occ/p9_sbe.c | 37 ++++++++++++++++++++++++++++++++-----
>   4 files changed, 87 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 34002fb..747c6e1 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -216,7 +216,8 @@ int occ_poll(struct occ *occ)
>
>   done:
>   	/* notify userspace if we change error state and have an error */
> -	if (occ->error != error && occ->error && occ->error_attr_name)
> +	if (occ->error != error && occ->error && occ->error_attr_name &&
> +	    !occ->cancel)
>   		sysfs_notify(&occ->bus_dev->kobj, NULL, occ->error_attr_name);
>
>   	return rc;
> @@ -224,19 +225,28 @@ int occ_poll(struct occ *occ)
>
>   int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
>   {
> -	int rc, error = occ->error;
> +	int rc, error;
>   	u8 cmd[8];
>   	u16 checksum = 0x24;
>   	__be16 user_power_cap_be;
> -	struct occ_poll_response_header *header =
> -		(struct occ_poll_response_header *)occ->resp.data;
> +	struct occ_poll_response_header *header;
> +
> +	if (!kobject_get_unless_zero(&occ->kobj))
> +		return -ENODEV;
>
> -	if (!(header->status & OCC_STAT_MASTER))
> -		return -EPERM;
> +	header = (struct occ_poll_response_header *)occ->resp.data;
> +
> +	if (!(header->status & OCC_STAT_MASTER)) {
> +		rc = -EPERM;
> +		goto done;
> +	}
>
> -	if (!(header->status & OCC_STAT_ACTIVE))
> -		return -EACCES;
> +	if (!(header->status & OCC_STAT_ACTIVE)) {
> +		rc = -EACCES;
> +		goto done;
> +	}
>
> +	error = occ->error;
>   	user_power_cap_be = cpu_to_be16(user_power_cap);
>
>   	cmd[0] = 0;
> @@ -255,9 +265,12 @@ int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
>   	mutex_unlock(&occ->lock);
>
>   	/* notify userspace if we change error state and have an error*/
> -	if (occ->error != error && occ->error && occ->error_attr_name)
> +	if (occ->error != error && occ->error && occ->error_attr_name &&
> +	    !occ->cancel)
>   		sysfs_notify(&occ->bus_dev->kobj, NULL, occ->error_attr_name);
>
> +done:
> +	kobject_put(&occ->kobj);
>   	return rc;
>   }
>
> @@ -265,6 +278,9 @@ int occ_update_response(struct occ *occ)
>   {
>   	int rc = 0;
>
> +	if (!kobject_get_unless_zero(&occ->kobj))
> +		return -ENODEV;
> +
>   	mutex_lock(&occ->lock);
>
>   	if (time_after(jiffies, occ->last_update + OCC_UPDATE_FREQUENCY)) {
> @@ -272,7 +288,15 @@ int occ_update_response(struct occ *occ)
>   		occ->last_update = jiffies;
>   	}
>
> +	/*
> +	 * Make sure we fail if canceled so we don't access occ structure in
> +	 * subsequent functions.
> +	 */
> +	if (occ->cancel)
> +		rc = -ECANCELED;
> +
>   	mutex_unlock(&occ->lock);
> +	kobject_put(&occ->kobj);
>   	return rc;
>   }
>
> diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
> index acb50bc..242d90c 100644
> --- a/drivers/hwmon/occ/common.h
> +++ b/drivers/hwmon/occ/common.h
> @@ -98,9 +98,11 @@ struct occ_attribute {
>   };
>
>   struct occ {
> +	struct kobject kobj;
>   	struct device *bus_dev;
>   	struct device *hwmon;
>
> +	bool cancel;
>   	int error;
>   	unsigned int error_count;
>   	unsigned long last_safe;
> diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
> index e1c6234..6856b2f 100644
> --- a/drivers/hwmon/occ/p8_i2c.c
> +++ b/drivers/hwmon/occ/p8_i2c.c
> @@ -13,6 +13,7 @@
>   #include <linux/i2c.h>
>   #include <linux/init.h>
>   #include <linux/module.h>
> +#include <linux/slab.h>
>
>   struct p8_i2c_occ {
>   	struct occ occ;
> @@ -21,6 +22,18 @@ struct p8_i2c_occ {
>
>   #define to_p8_i2c_occ(x)	container_of((x), struct p8_i2c_occ, occ)
>
> +static void p8_i2c_occ_release(struct kobject *kobj)
> +{
> +	struct occ *occ = container_of(kobj, struct occ, kobj);
> +	struct p8_i2c_occ *p8_i2c_occ = to_p8_i2c_occ(occ);
> +
> +	kfree(p8_i2c_occ);
> +}
> +
> +static struct kobj_type p8_i2c_occ_type = {
> +	.release = p8_i2c_occ_release,
> +};
> +
>   static int p8_i2c_occ_getscom(struct i2c_client *client, u32 address, u8 *data)
>   {
>   	ssize_t rc;
> @@ -198,15 +211,15 @@ static int p8_i2c_occ_probe(struct i2c_client *client,
>   {
>   	int rc;
>   	struct occ *occ;
> -	struct p8_i2c_occ *p8_i2c_occ = devm_kzalloc(&client->dev,
> -						     sizeof(*p8_i2c_occ),
> -						     GFP_KERNEL);
> +	struct p8_i2c_occ *p8_i2c_occ = kzalloc(sizeof(*p8_i2c_occ),
> +						GFP_KERNEL);
>   	if (!p8_i2c_occ)
>   		return -ENOMEM;
>
>   	p8_i2c_occ->client = client;
>
>   	occ = &p8_i2c_occ->occ;
> +	kobject_init(&occ->kobj, &p8_i2c_occ_type);
>   	occ->bus_dev = &client->dev;
>   	occ->groups[0] = &occ->group;
>   	occ->poll_cmd_data = 0x10;
> @@ -257,10 +270,14 @@ static int p8_i2c_occ_remove(struct i2c_client *client)
>   {
>   	struct occ *occ = dev_get_drvdata(&client->dev);
>
> +	occ->cancel = true;
> +
>   	occ_remove_status_attrs(occ);
>
>   	atomic_dec(&occ_num_occs);
>
> +	kobject_put(&occ->kobj);
> +
>   	return 0;
>   }
>
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index 2d50a94..99a6415 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -14,8 +14,11 @@
>   #include <linux/platform_device.h>
>   #include <linux/occ.h>
>   #include <linux/sched.h>
> +#include <linux/slab.h>
>   #include <linux/workqueue.h>
>
> +#define OCC_CMD_INCOMPLETE_MS		10
> +
>   struct p9_sbe_occ {
>   	struct occ occ;
>   	struct device *sbe;
> @@ -23,6 +26,18 @@ struct p9_sbe_occ {
>
>   #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
>
> +static void p9_sbe_occ_release(struct kobject *kobj)
> +{
> +	struct occ *occ = container_of(kobj, struct occ, kobj);
> +	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
> +
> +	kfree(p9_sbe_occ);
> +}
> +
> +static struct kobj_type p9_sbe_occ_type = {
> +	.release = p9_sbe_occ_release,
> +};
> +
>   static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>   {
>   	int rc, error;
> @@ -34,7 +49,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>   	start = jiffies;
>
>   retry:
> -	client = occ_drv_open(p9_sbe_occ->sbe, 0);
> +	client = occ_drv_open(p9_sbe_occ->sbe, O_NONBLOCK);
>   	if (!client) {
>   		rc = -ENODEV;
>   		goto assign;
> @@ -44,7 +59,15 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>   	if (rc < 0)
>   		goto err;
>
> -	rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
> +	do {
> +		rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
> +		if (rc != -EAGAIN)
> +			break;
> +
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		schedule_timeout(msecs_to_jiffies(OCC_CMD_INCOMPLETE_MS));
> +	} while (!occ->cancel);
> +
>   	if (rc < 0)
>   		goto err;
>
> @@ -135,15 +158,15 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
>   {
>   	int rc;
>   	struct occ *occ;
> -	struct p9_sbe_occ *p9_sbe_occ = devm_kzalloc(&pdev->dev,
> -						     sizeof(*p9_sbe_occ),
> -						     GFP_KERNEL);
> +	struct p9_sbe_occ *p9_sbe_occ = kzalloc(sizeof(*p9_sbe_occ),
> +						GFP_KERNEL);
>   	if (!p9_sbe_occ)
>   		return -ENOMEM;
>
>   	p9_sbe_occ->sbe = pdev->dev.parent;
>
>   	occ = &p9_sbe_occ->occ;
> +	kobject_init(&occ->kobj, &p9_sbe_occ_type);
>   	occ->bus_dev = &pdev->dev;
>   	occ->groups[0] = &occ->group;
>   	occ->poll_cmd_data = 0x20;
> @@ -165,10 +188,14 @@ static int p9_sbe_occ_remove(struct platform_device *pdev)
>   {
>   	struct occ *occ = platform_get_drvdata(pdev);
>
> +	occ->cancel = true;
> +
>   	occ_remove_status_attrs(occ);
>
>   	atomic_dec(&occ_num_occs);
>
> +	kobject_put(&occ->kobj);
> +
>   	return 0;
>   }
>
