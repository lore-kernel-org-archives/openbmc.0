Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whPXQ0LzrzDqGr
 for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2017 05:10:13 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v55J9n7R018711
 for <openbmc@lists.ozlabs.org>; Mon, 5 Jun 2017 15:10:11 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2awcjx1gfh-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 15:10:11 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 5 Jun 2017 15:10:10 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 5 Jun 2017 15:10:07 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v55JA7uK32768092; Mon, 5 Jun 2017 19:10:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37D24AC03A;
 Mon,  5 Jun 2017 15:10:05 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id F11A9AC051;
 Mon,  5 Jun 2017 15:10:04 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10] hwmon (occ): Fix kconfig and makefile
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20170605084954.8512-1-joel@jms.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 5 Jun 2017 14:10:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170605084954.8512-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17060519-0052-0000-0000-00000217A8BC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007178; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00870597; UDB=6.00432916; IPR=6.00650579; 
 BA=6.00005398; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015711; XFM=3.00000015;
 UTC=2017-06-05 19:10:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060519-0053-0000-0000-000050D8DA8D
Message-Id: <bf0c8c88-af0d-529b-bab5-c04e266014f7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-05_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706050362
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
X-List-Received-Date: Mon, 05 Jun 2017 19:10:15 -0000



On 06/05/2017 03:49 AM, Joel Stanley wrote:
> The OCC driver was not buildable. Clean up the makefile and kconfig.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Thanks Joel, but please don't merge. I just sent up a patch to Kconfig 
that will play nicely with my P8 updates soon, and worked building 
in-tree for me.

Thanks,
Eddie

> ---
>   drivers/hwmon/Makefile     |  2 +-
>   drivers/hwmon/occ/Kconfig  | 15 +--------------
>   drivers/hwmon/occ/Makefile |  8 +-------
>   3 files changed, 3 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index f03dd0a15933..2e803f56446e 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -46,6 +46,7 @@ obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
>   obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
>   obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
>   obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
> +obj-$(CONFIG_SENSORS_OCC_P9_SBE) += occ/
>   obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
>   obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
>   obj-$(CONFIG_SENSORS_DA9052_ADC)+= da9052-hwmon.o
> @@ -170,7 +171,6 @@ obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
>   obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
>
>   obj-$(CONFIG_PMBUS)		+= pmbus/
> -obj-$(CONFIG_SENSORS_OCC)	+= occ/
>
>   ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
>
> diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
> index 34488de15900..8196b50c1693 100644
> --- a/drivers/hwmon/occ/Kconfig
> +++ b/drivers/hwmon/occ/Kconfig
> @@ -2,23 +2,10 @@
>   # On-Chip Controller configuration
>   #
>
> -menuconfig SENSORS_OCC
> -	tristate "POWER On-Chip Controller"
> -	help
> -	  If you say yes here you get support for monitoring the IBM POWER
> -	  processor sensors via the On-Chip Controller (OCC).
> -
> -	  This driver can also be built as a module. If so, the module will be
> -	  called occ-hwmon.
> -
> -if SENSORS_OCC
> -
>   config SENSORS_OCC_P9_SBE
>   	bool "POWER9 OCC via SBE"
> -	depends on SBEFIFO_OCC
> +	depends on OCCFIFO
>   	help
>   	  If you say yes here you get support for monitoring the POWER9
>   	  processor sensors via the OCC, from a service processor, over SBE
>   	  engine on FSI bus.
> -
> -endif
> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
> index adc7a9c458d6..3b0ddc6c1e52 100644
> --- a/drivers/hwmon/occ/Makefile
> +++ b/drivers/hwmon/occ/Makefile
> @@ -1,7 +1 @@
> -occ-hwmon-objs := common.o
> -
> -ifeq ($(CONFIG_SENSORS_OCC_P9_SBE), y)
> -occ-hwmon-objs += p9.o p9_sbe.o
> -endif
> -
> -obj-$(CONFIG_SENSORS_OCC) += occ-hwmon.o
> +obj-y += p9.o p9_sbe.o common.o
