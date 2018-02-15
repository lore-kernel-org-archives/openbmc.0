Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zj3cd68hBzF10n
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 04:46:54 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1FHjHCm032697
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 12:46:52 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2g5e0jjbkn-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 12:46:51 -0500
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 15 Feb 2018 12:46:49 -0500
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 15 Feb 2018 12:46:47 -0500
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1FHkkCV55115958; Thu, 15 Feb 2018 17:46:46 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36ECFAE03B;
 Thu, 15 Feb 2018 12:48:06 -0500 (EST)
Received: from Christophers-MacBook-Pro.local (unknown [9.81.205.119])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id D6389AE034;
 Thu, 15 Feb 2018 12:48:01 -0500 (EST)
Subject: Re: [PATCH linux dev-4.10 13/16] Revert "drivers/fsi: GPIO stability
 changes for Cronus/Hostboot"
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 eajames@linux.vnet.ibm.com, bradleyb@fuzziesquirrel.com
References: <20180215123606.25777-1-andrew@aj.id.au>
 <20180215123606.25777-14-andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 15 Feb 2018 11:46:39 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20180215123606.25777-14-andrew@aj.id.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18021517-0024-0000-0000-00000327214C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008539; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000253; SDB=6.00990174; UDB=6.00502846; IPR=6.00769522; 
 MB=3.00019572; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-15 17:46:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18021517-0025-0000-0000-0000470A852C
Message-Id: <4e06220a-98ae-fb62-405f-75c138e2d178@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-15_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802150214
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Feb 2018 17:46:59 -0000



On 2/15/18 6:36 AM, Andrew Jeffery wrote:
> This reverts commit cecf390c294cd6cf1080ed45cf0966691879750d.
>
> The cost of reading OCC hwmon attributes is reduced by roughly 50%[0] when we
> do not incur large delays between cycles in the FSI GPIO master. No impact was
> observed on the stability of Hostboot by reverting the delays, though
> admittedly it was not tested with Cronus.
Hi Andrew,

The delay values you are reverting were chosen because they fixed highly 
intermittent FSI ECC bus failures flagged during heavy bus traffic 
generated via Cronus.   I'd not feel comfortable with this update unless 
it can be verified this is no longer an issue.

Regards,
Chris
>
> [0] Down from ~0.5 to ~0.25 seconds
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/fsi/fsi-master-gpio.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 3d31e50269fe..485ecb88b115 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -15,7 +15,7 @@
>
>   #include "fsi-master.h"
>
> -#define	FSI_GPIO_STD_DLY	3	/* Standard pin delay in uS */
> +#define	FSI_GPIO_STD_DLY	1	/* Standard pin delay in nS */
>   #define	FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for echo delay */
>   #define	FSI_PRE_BREAK_CLOCKS	50	/* Number clocks to prep for break */
>   #define	FSI_BREAK_CLOCKS	256	/* Number of clocks to issue break */
> @@ -78,10 +78,10 @@ static void clock_toggle(struct fsi_master_gpio *master, int count)
>   	int i;
>
>   	for (i = 0; i < count; i++) {
> +		ndelay(FSI_GPIO_STD_DLY);
>   		gpiod_set_value(master->gpio_clk, 0);
> -		udelay(FSI_GPIO_STD_DLY);
> +		ndelay(FSI_GPIO_STD_DLY);
>   		gpiod_set_value(master->gpio_clk, 1);
> -		udelay(FSI_GPIO_STD_DLY);
>   	}
>   }
>
> @@ -89,6 +89,7 @@ static int sda_in(struct fsi_master_gpio *master)
>   {
>   	int in;
>
> +	ndelay(FSI_GPIO_STD_DLY);
>   	in = gpiod_get_value(master->gpio_data);
>   	return in ? 1 : 0;
>   }
