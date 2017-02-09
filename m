Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKDqb1v4wzDq8M
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 10:31:38 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v19NSgAe033013
 for <openbmc@lists.ozlabs.org>; Thu, 9 Feb 2017 18:31:36 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28gvmxmf83-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 09 Feb 2017 18:31:35 -0500
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 9 Feb 2017 16:31:35 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 9 Feb 2017 16:31:33 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 8974819D8026;
 Thu,  9 Feb 2017 16:30:46 -0700 (MST)
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v19NVXDU9240986; Thu, 9 Feb 2017 16:31:33 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E84F5BE04A;
 Thu,  9 Feb 2017 16:31:32 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.85.167.191])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 67A7DBE038;
 Thu,  9 Feb 2017 16:31:32 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7 v2] drivers/fsi: Adjust slave ID based on
 address
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
References: <20170209201737.74109-1-cbostic@linux.vnet.ibm.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 9 Feb 2017 17:31:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170209201737.74109-1-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020923-8235-0000-0000-00000AEBCA70
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006587; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00819633; UDB=6.00400664; IPR=6.00597087; 
 BA=6.00005130; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014238; XFM=3.00000011;
 UTC=2017-02-09 23:31:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020923-8236-0000-0000-000039777659
Message-Id: <fddca6ab-22b6-8d75-de64-c52f264676b5@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-09_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702090211
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
X-List-Received-Date: Thu, 09 Feb 2017 23:31:39 -0000

Looks good to me.

Reviewed-by: Eddie James <eajames@us.ibm.com>

On 02/09/2017 02:17 PM, Christopher Bostic wrote:
> In order to access slave address ranges > 0x1FFFFF the slave ID
> must be adjusted accordingly in the command encoding:
>
> ID 0: 0x00000000 - 0x001FFFFF
> ID 1: 0x00200000 - 0x003FFFFF
> ID 2: 0x00400000 - 0x005FFFFF
> ID 3: 0x00600000 - 0x007FFFFF
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>
> ---
>
> Changes in V2
>      - Remove alignment masking as per recommendation of Alistair Popple
>        <alistair@popple.id.au>
> ---
>   drivers/fsi/fsi-master-gpio.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 73d9985..91bdbf2 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -40,6 +40,9 @@
>   #define	FSI_GPIO_CMD_DFLT_LEN	28
>   #define	FSI_GPIO_CMD_CRC_SHIFT	60
>
> +#define	FSI_SLAVE_SHIFT		21
> +#define	FSI_SLAVE_MASK		0x3
> +
>   /* Bus errors */
>   #define	FSI_GPIO_ERR_BUSY	1	/* Slave stuck in busy state */
>   #define	FSI_GPIO_RESP_ERRA	2	/* Any (misc) Error */
> @@ -305,7 +308,8 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
>   	cmd->bits = FSI_GPIO_CMD_DFLT_LEN;
>   	cmd->msg = FSI_GPIO_CMD_DEFAULT;
>   	cmd->msg |= mode;
> -	cmd->msg &= ~FSI_GPIO_CMD_SLAVE_MASK;
> +	if (!slave)
> +		slave = (addr >> FSI_SLAVE_SHIFT) & FSI_SLAVE_MASK;
>   	cmd->msg |= (((uint64_t)slave) << FSI_GPIO_CMD_SLV_SHIFT);
>   	addr &= FSI_GPIO_CMD_ADDR_MASK;
>   	cmd->msg |= (((uint64_t)addr) << FSI_GPIO_CMD_ADDR_SHIFT);
