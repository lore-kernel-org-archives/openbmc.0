Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPWv95qJ5zDq8X
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 10:04:37 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1GN450L056950
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 18:04:35 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28nkym391b-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 18:04:35 -0500
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 16 Feb 2017 18:04:34 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 16 Feb 2017 18:04:31 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id DF20B6E803C;
 Thu, 16 Feb 2017 18:04:01 -0500 (EST)
Received: from b01ledav03.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1GN4Uag61800590; Thu, 16 Feb 2017 23:04:30 GMT
Received: from b01ledav03.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C691EB2058;
 Thu, 16 Feb 2017 18:04:29 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav03.gho.pok.ibm.com (Postfix) with ESMTP id 78D1DB204D;
 Thu, 16 Feb 2017 18:04:29 -0500 (EST)
Subject: Re: [PATCH linux dev-4.7 1/5] drivers/fsi: Add MFSI a.k.a. hub master
 device driver
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170216220434.79474-1-cbostic@linux.vnet.ibm.com>
 <20170216220434.79474-2-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 16 Feb 2017 17:04:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170216220434.79474-2-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021623-0044-0000-0000-00000295182E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006629; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00822969; UDB=6.00402668; IPR=6.00600416; 
 BA=6.00005146; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014312; XFM=3.00000011;
 UTC=2017-02-16 23:04:32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021623-0045-0000-0000-000006C219FC
Message-Id: <901b80f7-468d-dbb8-039e-0a75e3fbd92c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-16_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702160216
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
X-List-Received-Date: Thu, 16 Feb 2017 23:04:38 -0000

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>


On 02/16/2017 04:04 PM, Christopher Bostic wrote:
> Add the basic hub master device driver.  Registers with the
> FSI core to be notified of its engine device and its link devices.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>   drivers/fsi/Kconfig          |  9 ++++++
>   drivers/fsi/Makefile         |  1 +
>   drivers/fsi/fsi-master-hub.c | 65 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 75 insertions(+)
>   create mode 100644 drivers/fsi/fsi-master-hub.c
>
> diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
> index c78b9b6e..bb7c5d5 100644
> --- a/drivers/fsi/Kconfig
> +++ b/drivers/fsi/Kconfig
> @@ -18,6 +18,15 @@ config FSI_MASTER_GPIO
>   	---help---
>   	This option enables a FSI master driver using GPIO lines.
>
> +config FSI_MASTER_HUB
> +	tristate "Hub FSI master"
> +	depends on FSI
> +	---help---
> +	This option enables a hub FSI master. Hub masters extend the
> +	address space of the primary master and allow chaining of
> +	multiple devices. Chaining FSI links from one hub to another
> +	allows for very high device fan out.
> +
>   config FSI_SCOM
>   	tristate "SCOM FSI client device driver"
>   	depends on FSI
> diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
> index 3a106ba..37b5f5e 100644
> --- a/drivers/fsi/Makefile
> +++ b/drivers/fsi/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_FSI) += fsi-core.o
>   obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
>   obj-$(CONFIG_FSI_SCOM) += fsi-scom.o
>   obj-$(CONFIG_FSI_I2C) += i2c/
> +obj-$(CONFIG_FSI_MASTER_HUB) += fsi-master-hub.o
> diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
> new file mode 100644
> index 0000000..19b7c77
> --- /dev/null
> +++ b/drivers/fsi/fsi-master-hub.c
> @@ -0,0 +1,65 @@
> +/*
> + * Hub Master FSI Client device driver
> + *
> + * Copyright (C) IBM Corporation 2017
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERGCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/fsi.h>
> +#include <linux/module.h>
> +#include <linux/cdev.h>
> +#include <linux/fs.h>
> +#include <linux/uaccess.h>
> +
> +#include "fsi-master.h"
> +
> +#define FSI_ENGID_HUB_MASTER	0x1C
> +#define FSI_ENGID_HUB_LINK	0x1D
> +
> +static int hub_master_probe(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static struct fsi_device_id hub_master_ids[] = {
> +	{
> +		.engine_type = FSI_ENGID_HUB_MASTER,
> +		.version = FSI_VERSION_ANY,
> +	},
> +	{
> +		.engine_type = FSI_ENGID_HUB_LINK,
> +		.version = FSI_VERSION_ANY,
> +	},
> +	{ 0 }
> +};
> +
> +static struct fsi_driver hub_master_drv = {
> +	.id_table = hub_master_ids,
> +	.drv = {
> +		.name = "hub_master",
> +		.bus = &fsi_bus_type,
> +		.probe = hub_master_probe,
> +	}
> +};
> +
> +static int hub_master_init(void)
> +{
> +	return fsi_driver_register(&hub_master_drv);
> +}
> +
> +static void hub_master_exit(void)
> +{
> +	fsi_driver_unregister(&hub_master_drv);
> +}
> +
> +module_init(hub_master_init);
> +module_exit(hub_master_exit);
> +MODULE_LICENSE("GPL");
