Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPXf049JwzDq8X
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 10:38:16 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1GNVhQf114515
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 18:38:14 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28nkwq4hg2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 18:38:14 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 16 Feb 2017 16:38:13 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 16 Feb 2017 16:38:12 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 0B3B41FF001E;
 Thu, 16 Feb 2017 16:37:49 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1GNcB5810944938; Thu, 16 Feb 2017 16:38:11 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5584E6A03B;
 Thu, 16 Feb 2017 16:38:11 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 055F96A03C;
 Thu, 16 Feb 2017 16:38:10 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7 4/5] drivers/fsi: Add FSI bus error cleanup
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170216220434.79474-1-cbostic@linux.vnet.ibm.com>
 <20170216220434.79474-5-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 16 Feb 2017 17:38:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170216220434.79474-5-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021623-0012-0000-0000-000013AF26A0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006629; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00822981; UDB=6.00402675; IPR=6.00600427; 
 BA=6.00005146; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014313; XFM=3.00000011;
 UTC=2017-02-16 23:38:13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021623-0013-0000-0000-00004B7E23DC
Message-Id: <54b99c49-8299-28e3-2427-1991b844110f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-16_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702160218
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
X-List-Received-Date: Thu, 16 Feb 2017 23:38:17 -0000

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>


On 02/16/2017 04:04 PM, Christopher Bostic wrote:
> On detect of bus fails attempt to clean them up and try the
> command again.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>   drivers/fsi/fsi-master-gpio.c | 100 +++++++++++++++++++++++++++++++++++-------
>   1 file changed, 85 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 92af53d..bb3983c 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -67,8 +67,16 @@
>
>   #define	FSI_MASTER_GPIO_LINK_SIZE	0x00800000
>
> +static int fsi_master_gpio_read(struct fsi_master *_master, int link,
> +		uint8_t slave, uint32_t addr, void *val, size_t size);
> +static int fsi_master_gpio_write(struct fsi_master *_master, int link,
> +		uint8_t slave, uint32_t addr, const void *val, size_t size);
> +static int fsi_master_gpio_break(struct fsi_master *_master, int link);
> +
>   static DEFINE_SPINLOCK(fsi_gpio_cmd_lock);	/* lock around fsi commands */
>
> +uint8_t in_err_cleanup;
> +
>   struct fsi_master_gpio {
>   	struct fsi_master	master;
>   	struct gpio_desc	*gpio_clk;
> @@ -358,24 +366,85 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
>   	cmd->msg >>= (64 - cmd->bits);
>   }
>
> +/*
> + * Clean up the FSI bus path on detection of error.
> + * todo: get rid of magic numbers
> + */
> +static void fsi_master_gpio_handle_error(struct fsi_master_gpio *master,
> +					uint32_t addr)
> +{
> +	uint32_t smode = 0xa0ff0100;
> +
> +	/* Avoid nested error handling */
> +	if (in_err_cleanup)
> +		return;
> +
> +	in_err_cleanup = 1;
> +	fsi_master_gpio_break(&master->master, 0);
> +	udelay(200);
> +
> +	/* Set slave ID in smode */
> +	fsi_master_gpio_write(&master->master, 0, 0, 0x800, &smode,
> +				sizeof(smode));
> +
> +	/* Reset the MFSI bridge */
> +	smode = 0xc0000000;
> +	fsi_master_gpio_write(&master->master, 0, 0, 0x35D0, &smode,
> +				sizeof(smode));
> +
> +	if (addr >= 0x80000) {
> +
> +		/*
> +		 * Break to hub link 1
> +		 * todo: make this handle more arbitrary link topologies
> +		 */
> +		smode = 0xc0de0000;
> +		fsi_master_gpio_write(&master->master, 0, 0, 0x100004, &smode,
> +					sizeof(smode));
> +
> +		smode = 0xa0ff0100;
> +		fsi_master_gpio_write(&master->master, 0, 0, 0x100800, &smode,
> +					sizeof(smode));
> +	}
> +	in_err_cleanup = 0;
> +}
> +
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
>   	int rc;
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
> +	rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
> +	if (rc) {
> +		fsi_master_gpio_handle_error(master, addr);
> +
> +		/* Try again */
> +		rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
> +		if (rc)
> +			fsi_master_gpio_handle_error(master, addr);
> +	}
>
>   	return rc;
>   }
> @@ -386,18 +455,20 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>   	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>   	struct fsi_gpio_msg cmd;
>   	int rc;
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
> +	rc = send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
> +	if (rc) {
> +		fsi_master_gpio_handle_error(master, addr);
> +
> +		/* Try again */
> +		rc = send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
> +		if (rc)
> +			fsi_master_gpio_handle_error(master, addr);
> +	}
>
>   	return rc;
>   }
> @@ -480,7 +551,6 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
>   	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
>   	if (!master)
>   		return -ENOMEM;
> -	master->master.dev = &pdev->dev;
>
>   	gpio = devm_gpiod_get(&pdev->dev, "clock", 0);
>   	if (IS_ERR(gpio)) {
