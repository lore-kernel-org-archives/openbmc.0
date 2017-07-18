Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xBp5c5bMczDrJ2
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 04:07:00 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6II6n5r009284
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 14:06:58 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bsdcfxtqr-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 14:06:58 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 18 Jul 2017 14:06:57 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 18 Jul 2017 14:06:55 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6II6tgA16580860; Tue, 18 Jul 2017 18:06:55 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D95DEAC03F;
 Tue, 18 Jul 2017 14:07:04 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 6ADD5AC046;
 Tue, 18 Jul 2017 14:07:04 -0400 (EDT)
Subject: Re: [PATCH u-boot] configs/ast: Add redundnant env
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
References: <1500053800-3923-1-git-send-email-eajames@linux.vnet.ibm.com>
Date: Tue, 18 Jul 2017 13:06:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1500053800-3923-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17071818-0044-0000-0000-0000036FE7F7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007382; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00889435; UDB=6.00444276; IPR=6.00669607; 
 BA=6.00005479; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016262; XFM=3.00000015;
 UTC=2017-07-18 18:06:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071818-0045-0000-0000-0000079DEDC6
Message-Id: <9085e08c-e2cf-16d8-ada8-2b1a3e0025e1@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-18_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707180283
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
X-List-Received-Date: Tue, 18 Jul 2017 18:07:01 -0000



On 07/14/2017 12:36 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Configure ast chips to run redundant u-boot environments.

This will need some userspace changes to work properly. The BMC will 
still boot if this is merged by itself, but there might be trouble 
updating environment variables without a serial connection (of 
particular concern would be the MAC address...). fw_setenv may update 
the flash without the correct "valid" byte that exists for redundant 
environments, and so u-boot will probably consider the updated flash 
invalid and switch to the other copy every time you reboot.

Thanks,
Eddie

>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>   include/configs/ast-common.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
> index 110c780..15e1db4 100644
> --- a/include/configs/ast-common.h
> +++ b/include/configs/ast-common.h
> @@ -92,9 +92,12 @@
>   #define CONFIG_SYS_MAX_FLASH_SECT	(8192)		/* max number of sectors on one chip */
>   #define CONFIG_ENV_IS_IN_FLASH		1
>   #define CONFIG_ENV_ADDR			(AST_FMC_CS0_BASE + 0x60000)
> +#define CONFIG_ENV_ADDR_REDUND		(AST_FMC_CS0_BASE + 0x70000)
>
>   #define CONFIG_ENV_OFFSET		0x60000	/* environment starts here  */
> -#define CONFIG_ENV_SIZE			0x20000	/* Total Size of Environment Sector */
> +#define CONFIG_ENV_OFFSET_REDUND	0x70000
> +#define CONFIG_ENV_SIZE			0x10000	/* Total Size of Environment Sector */
> +#define CONFIG_ENV_SIZE_REDUND		0x10000
>
>   #define CONFIG_BOOTCOMMAND	\
>   	"fdt addr 20080000; " \
