Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w20Wb3tGYzDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2017 05:25:15 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3AJIrWh054750
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 15:25:09 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 29rfe3a2un-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 15:25:09 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 10 Apr 2017 13:25:08 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 10 Apr 2017 13:25:04 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3AJP4md8520048; Mon, 10 Apr 2017 12:25:04 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D42BC6055;
 Mon, 10 Apr 2017 13:25:04 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 32F64C603E;
 Mon, 10 Apr 2017 13:25:04 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: FSI protocol updates to
 improve reliability
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170410175506.62007-1-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 10 Apr 2017 14:24:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170410175506.62007-1-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17041019-0016-0000-0000-000006889F34
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006912; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00845682; UDB=6.00417053; IPR=6.00624116; 
 BA=6.00005281; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014997; XFM=3.00000013;
 UTC=2017-04-10 19:25:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17041019-0017-0000-0000-000038DE96B4
Message-Id: <86c244b7-123c-939f-1c5b-1680e15a6037@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-10_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1704100153
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
X-List-Received-Date: Mon, 10 Apr 2017 19:25:16 -0000



On 04/10/2017 12:55 PM, Christopher Bostic wrote:
> Re-order delays in the clock toggle from: delay clock 0, delay,
> clock 1 to clock 0, delay, clock 1, delay.  Allows removal of
> delay added just prior to sampling SDA line for SDA input.
>
> Slow down the delay period from 1ns to 3us.  The original 1ns
> delay was actually 1-2 us based on real time measurements so
> this isn't a factor of 3000x slowdown.
>
> Removed echo delay on send command as its not needed.
>
> Removed the 100x prime clocks after command and now send 50x
> clocks prior to command as is done by the pdbg tool.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>   drivers/fsi/fsi-master-gpio.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index a8976d5..1517c21 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -13,7 +13,7 @@
>
>   #include "fsi-master.h"
>
> -#define	FSI_GPIO_STD_DLY	1	/* Standard pin delay in nS */
> +#define	FSI_GPIO_STD_DLY	3	/* Standard pin delay in uS */
>   #define	FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for echo delay */
>   #define	FSI_PRE_BREAK_CLOCKS	50	/* Number clocks to prep for break */
>   #define	FSI_BREAK_CLOCKS	256	/* Number of clocks to issue break */
> @@ -61,7 +61,6 @@
>   #define	FSI_GPIO_CRC_SIZE	4
>   #define	FSI_GPIO_MSG_ID_SIZE		2
>   #define	FSI_GPIO_MSG_RESPID_SIZE	2
> -#define	FSI_GPIO_PRIME_SLAVE_CLOCKS	100
>
>   static DEFINE_SPINLOCK(fsi_gpio_cmd_lock);	/* lock around fsi commands */
>
> @@ -86,10 +85,10 @@ static void clock_toggle(struct fsi_master_gpio *master, int count)
>   	int i;
>
>   	for (i = 0; i < count; i++) {
> -		ndelay(FSI_GPIO_STD_DLY);
>   		gpiod_set_value(master->gpio_clk, 0);
> -		ndelay(FSI_GPIO_STD_DLY);
> +		udelay(FSI_GPIO_STD_DLY);
>   		gpiod_set_value(master->gpio_clk, 1);
> +		udelay(FSI_GPIO_STD_DLY);
>   	}
>   }
>
> @@ -97,7 +96,6 @@ static int sda_in(struct fsi_master_gpio *master)
>   {
>   	int in;
>
> -	ndelay(FSI_GPIO_STD_DLY);
>   	in = gpiod_get_value(master->gpio_data);
>   	return in ? 1 : 0;
>   }
> @@ -287,8 +285,6 @@ static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
>   			fsi_master_gpio_error(master, FSI_GPIO_CRC_INVAL);
>   			return -EIO;
>   		}
> -		/* Clock the slave enough to be ready for next operation */
> -		clock_toggle(master, FSI_GPIO_PRIME_SLAVE_CLOCKS);
>   		return 0;
>
>   	} while (busy_count++ < FSI_GPIO_MAX_BUSY);
> @@ -362,8 +358,9 @@ static int send_command(struct fsi_master_gpio *master,
>   	int rc;
>
>   	spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
> +	set_sda_output(master, 1);
> +	clock_toggle(master, 50);
>   	serial_out(master, cmd);
> -	echo_delay(master);
>   	rc = poll_for_response(master, expected, size, val);
>   	spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
>

Looks good to me.

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>
