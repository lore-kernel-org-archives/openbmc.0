Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vQ5xs0tq3zDq5x
 for <openbmc@lists.ozlabs.org>; Sat, 18 Feb 2017 08:38:56 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1HLT0dS065745
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 16:38:55 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28p6a3pcf6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 16:38:55 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 17 Feb 2017 14:38:54 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 17 Feb 2017 14:38:51 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 8D5393E40030
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 14:38:50 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1HLconI11272614; Fri, 17 Feb 2017 14:38:50 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 591C66A043;
 Fri, 17 Feb 2017 14:38:50 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 17D7B6A03F;
 Fri, 17 Feb 2017 14:38:50 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7 v2] drivers: fsi: Use kernel ida to manage
 device indexes
To: openbmc@lists.ozlabs.org
References: <1487365307-25662-1-git-send-email-eajames@linux.vnet.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 17 Feb 2017 15:38:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1487365307-25662-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021721-0004-0000-0000-0000119EF256
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006635; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00823421; UDB=6.00402939; IPR=6.00600867; 
 BA=6.00005148; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014329; XFM=3.00000011;
 UTC=2017-02-17 21:38:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021721-0005-0000-0000-00007D2A5FAC
Message-Id: <e04b1fcb-5fc7-1da4-c0cb-de766a2ae82a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-17_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702170198
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
X-List-Received-Date: Fri, 17 Feb 2017 21:38:57 -0000



On 02/17/2017 03:01 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Fixes bad device indexes and duplicates after fsi rescan
>
> since v1:
>   * don't use the unsafe atomic counter
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>   drivers/fsi/fsi-core.c        | 10 ++++++++--
>   drivers/fsi/fsi-master-gpio.c |  1 +
>   drivers/fsi/fsi-scom.c        | 10 ++++++++--
>   3 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index e8a3618..d63a892 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -15,6 +15,7 @@
>
>   #include <linux/device.h>
>   #include <linux/fsi.h>
> +#include <linux/idr.h>
>   #include <linux/kthread.h>
>   #include <linux/module.h>
>   #include <linux/slab.h>
> @@ -46,7 +47,7 @@ static const int engine_page_size = 0x400;
>   static struct task_struct *master_ipoll;
>   static unsigned int fsi_ipoll_period_ms = 100;
>
> -static atomic_t master_idx = ATOMIC_INIT(-1);
> +static DEFINE_IDA(master_ida);
>
>   struct fsi_slave {
>   	struct list_head	list_link;	/* Master's list of slaves */
> @@ -599,7 +600,7 @@ int fsi_master_register(struct fsi_master *master)
>   	if (!master || !master->dev)
>   		return -EINVAL;
>
> -	master->idx = atomic_inc_return(&master_idx);
> +	master->idx = ida_simple_get(&master_ida, 0, INT_MAX, GFP_KERNEL);
>   	master->slave_list = false;
>   	get_device(master->dev);
>   	fsi_master_scan(master);
> @@ -610,6 +611,11 @@ EXPORT_SYMBOL_GPL(fsi_master_register);
>
>   void fsi_master_unregister(struct fsi_master *master)
>   {
> +	if (master->idx >= 0) {
> +		ida_simple_remove(&master_ida, master->idx);
> +		master->idx = -1;
> +	}
> +
>   	device_remove_file(master->dev, &dev_attr_fsi_ipoll_period);
>   	fsi_master_unscan(master);
>   	put_device(master->dev);
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 91bdbf2..3ed82ea 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -512,6 +512,7 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
>   	else
>   		master->gpio_mux = gpio;
>
> +	master->master.idx = -1;
>   	master->master.n_links = 1;
>   	master->master.read = fsi_master_gpio_read;
>   	master->master.write = fsi_master_gpio_write;
> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
> index a439a5e..ff8267b 100644
> --- a/drivers/fsi/fsi-scom.c
> +++ b/drivers/fsi/fsi-scom.c
> @@ -22,6 +22,7 @@
>   #include <linux/slab.h>
>   #include <linux/miscdevice.h>
>   #include <linux/list.h>
> +#include <linux/idr.h>
>
>   #define FSI_ENGID_SCOM		0x5
>
> @@ -41,12 +42,14 @@ struct scom_device {
>   	struct fsi_device *fsi_dev;
>   	struct miscdevice mdev;
>   	char	name[32];
> +	int idx;
>   };
>
>   #define to_scom_dev(x)		container_of((x), struct scom_device, mdev)
>
>   static struct list_head scom_devices;
> -static atomic_t scom_idx = ATOMIC_INIT(0);
> +
> +static DEFINE_IDA(scom_ida);
>
>   static int put_scom(struct scom_device *scom_dev, uint64_t value,
>   			uint32_t addr)
> @@ -187,8 +190,9 @@ static int scom_probe(struct device *dev)
>   	if (!scom)
>   		return -ENOMEM;
>
> +	scom->idx = ida_simple_get(&scom_ida, 1, INT_MAX, GFP_KERNEL);
>   	snprintf(scom->name, sizeof(scom->name),
> -			"scom%d", atomic_inc_return(&scom_idx));
> +			"scom%d", scom->idx);
>   	scom->fsi_dev = fsi_dev;
>   	scom->mdev.minor = MISC_DYNAMIC_MINOR;
>   	scom->mdev.fops = &scom_fops;
> @@ -211,6 +215,8 @@ static int scom_remove(struct device *dev)
>   		}
>   	}
>
> +	ida_simple_remove(&scom_ida, scom->idx);
> +

Shouldn't access bad pointers...

nak, see v3.

>   	return 0;
>   }
>
