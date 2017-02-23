Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTmm01vybzDqKJ
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 07:58:08 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1NKra8p078034
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 15:58:05 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28t39t2ruq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 15:58:05 -0500
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 23 Feb 2017 13:58:04 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 23 Feb 2017 13:58:03 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id EE2193E40041;
 Thu, 23 Feb 2017 13:58:02 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1NKw2d110748252; Thu, 23 Feb 2017 13:58:02 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA85E78051;
 Thu, 23 Feb 2017 13:58:02 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 93B1078038;
 Thu, 23 Feb 2017 13:58:02 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7 v3 1/2] drivers/fsi: Move common read/write
 code into shared utility
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170223195837.82098-1-cbostic@linux.vnet.ibm.com>
 <20170223195837.82098-2-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 23 Feb 2017 14:57:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170223195837.82098-2-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022320-0028-0000-0000-0000071FD8DE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006670; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00826131; UDB=6.00404581; IPR=6.00603583; 
 BA=6.00005168; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014415; XFM=3.00000011;
 UTC=2017-02-23 20:58:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022320-0029-0000-0000-000033D2FF3E
Message-Id: <116aca21-6ead-919a-599a-32778a38fc0c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-23_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702230185
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
X-List-Received-Date: Thu, 23 Feb 2017 20:58:08 -0000

Looks good.

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

On 02/23/2017 01:58 PM, Christopher Bostic wrote:
> Move common code shared between fsi_master_gpio_read/write into
> send utility.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>
> ---
>
> v2 - Separate this patch from a collection of other changes in the
>       v1 related patch.
> ---
>   drivers/fsi/fsi-master-gpio.c | 38 ++++++++++++++++++--------------------
>   1 file changed, 18 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 8c8a8f4..b6feec1 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -354,26 +354,33 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
>   	cmd->msg >>= (64 - cmd->bits);
>   }
>
> +static int send_command(struct fsi_master_gpio *master,
> +			struct fsi_gpio_msg *cmd, uint8_t expected,
> +			size_t size, void *val)
> +{
> +	unsigned long flags;
> +	int rc;
> +
> +	spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
> +	serial_out(master, cmd);
> +	echo_delay(master);
> +	rc = poll_for_response(master, expected, size, val);
> +	spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
> +
> +	return rc;
> +}
> +
>   static int fsi_master_gpio_read(struct fsi_master *_master, int link,
>   		uint8_t slave, uint32_t addr, void *val, size_t size)
>   {
>   	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>   	struct fsi_gpio_msg cmd;
> -	int rc;
> -	unsigned long flags;
>
>   	if (link != 0)
>   		return -ENODEV;
>
>   	build_abs_ar_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
> -
> -	spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
> -	serial_out(master, &cmd);
> -	echo_delay(master);
> -	rc = poll_for_response(master, FSI_GPIO_RESP_ACKD, size, val);
> -	spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
> -
> -	return rc;
> +	return send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
>   }
>
>   static int fsi_master_gpio_write(struct fsi_master *_master, int link,
> @@ -381,21 +388,12 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>   {
>   	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>   	struct fsi_gpio_msg cmd;
> -	int rc;
> -	unsigned long flags;
>
>   	if (link != 0)
>   		return -ENODEV;
>
>   	build_abs_ar_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, val);
> -
> -	spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
> -	serial_out(master, &cmd);
> -	echo_delay(master);
> -	rc = poll_for_response(master, FSI_GPIO_RESP_ACK, size, NULL);
> -	spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
> -
> -	return rc;
> +	return send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
>   }
>
>   /*
