Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40sCP05SvDzF1Pr
 for <openbmc@lists.ozlabs.org>; Fri, 25 May 2018 01:05:24 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4OF4iim009466
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 11:05:21 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2j5wuqppnc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 11:05:20 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 24 May 2018 11:05:19 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 24 May 2018 11:05:17 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4OF5GJD4849994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 May 2018 15:05:16 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E33E0B2065;
 Thu, 24 May 2018 12:07:03 -0400 (EDT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B931B2066;
 Thu, 24 May 2018 12:07:03 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.85.164.58])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 24 May 2018 12:07:03 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.13 03/10] fsi/fsi-master-gpio: Implement CRC
 error recovery
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
References: <20180524051429.4638-1-benh@kernel.crashing.org>
 <20180524051429.4638-3-benh@kernel.crashing.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 24 May 2018 10:05:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20180524051429.4638-3-benh@kernel.crashing.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18052415-0044-0000-0000-0000041A3832
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009065; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000261; SDB=6.01036001; UDB=6.00529949; IPR=6.00815130; 
 MB=3.00021234; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-24 15:05:18
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18052415-0045-0000-0000-0000084C54E3
Message-Id: <e7751d1f-baad-62ad-c62a-658a506ac257@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-24_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805240176
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
X-List-Received-Date: Thu, 24 May 2018 15:05:25 -0000

Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 5/24/18 12:14 AM, Benjamin Herrenschmidt wrote:
> The FSI protocol defines two modes of recovery from CRC errors,
> this implements both:
>
>   - If the device returns an ECRC (it detected a CRC error in the
>     command), then we simply issue the command again.
>
>   - If the master detects a CRC error in the response, we send
>     an E_POLL command which requests a resend of the response
>     without actually re-executing the command (which could otherwise
>     have unwanted side effects such as dequeuing a FIFO twice).
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>
> Note: This was actually tested by removing some of my fixes, thus
> causing us to hit occasional CRC errors during high LPC activity.
> ---
>   drivers/fsi/fsi-master-gpio.c          | 90 ++++++++++++++++++++------
>   include/trace/events/fsi_master_gpio.h | 27 ++++++++
>   2 files changed, 99 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 0a6799bda294..351c12f2ac55 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -22,20 +22,23 @@
>   #define	FSI_BREAK_CLOCKS	256	/* Number of clocks to issue break */
>   #define	FSI_POST_BREAK_CLOCKS	16000	/* Number clocks to set up cfam */
>   #define	FSI_INIT_CLOCKS		5000	/* Clock out any old data */
> +#define	FSI_GPIO_DPOLL_CLOCKS	50      /* < 21 will cause slave to hang */
> +#define	FSI_GPIO_EPOLL_CLOCKS	50      /* Number of clocks for E_POLL retry */
>   #define	FSI_GPIO_STD_DELAY	10	/* Standard GPIO delay in nS */
>   					/* todo: adjust down as low as */
>   					/* possible or eliminate */
> +#define FSI_CRC_ERR_RETRIES	10
> +
>   #define	FSI_GPIO_CMD_DPOLL      0x2
> +#define	FSI_GPIO_CMD_EPOLL      0x3
>   #define	FSI_GPIO_CMD_TERM	0x3f
>   #define FSI_GPIO_CMD_ABS_AR	0x4
>   #define FSI_GPIO_CMD_REL_AR	0x5
>   #define FSI_GPIO_CMD_SAME_AR	0x3	/* but only a 2-bit opcode... */
>
> -
> -#define	FSI_GPIO_DPOLL_CLOCKS	50      /* < 21 will cause slave to hang */
> -
> -/* Bus errors */
> -#define	FSI_GPIO_ERR_BUSY	1	/* Slave stuck in busy state */
> +/* Slave responses */
> +#define	FSI_GPIO_RESP_ACK	0	/* Success */
> +#define	FSI_GPIO_RESP_BUSY	1	/* Slave busy */
>   #define	FSI_GPIO_RESP_ERRA	2	/* Any (misc) Error */
>   #define	FSI_GPIO_RESP_ERRC	3	/* Slave reports master CRC error */
>   #define	FSI_GPIO_MTOE		4	/* Master time out error */
> @@ -330,6 +333,16 @@ static void build_dpoll_command(struct fsi_gpio_msg *cmd, uint8_t slave_id)
>   	msg_push_crc(cmd);
>   }
>
> +static void build_epoll_command(struct fsi_gpio_msg *cmd, uint8_t slave_id)
> +{
> +	cmd->bits = 0;
> +	cmd->msg = 0;
> +
> +	msg_push_bits(cmd, slave_id, 2);
> +	msg_push_bits(cmd, FSI_GPIO_CMD_EPOLL, 3);
> +	msg_push_crc(cmd);
> +}
> +
>   static void echo_delay(struct fsi_master_gpio *master)
>   {
>   	set_sda_output(master, 1);
> @@ -355,6 +368,12 @@ static void fsi_master_gpio_error(struct fsi_master_gpio *master, int error)
>
>   }
>
> +/*
> + * Note: callers rely specifically on this returning -EAGAIN for
> + * a CRC error detected in the response. Use other error code
> + * for other situations. It will be converted to something else
> + * higher up the stack before it reaches userspace.
> + */
>   static int read_one_response(struct fsi_master_gpio *master,
>   		uint8_t data_size, struct fsi_gpio_msg *msgp, uint8_t *tagp)
>   {
> @@ -379,7 +398,7 @@ static int read_one_response(struct fsi_master_gpio *master,
>   			"Master time out waiting for response\n");
>   		fsi_master_gpio_error(master, FSI_GPIO_MTOE);
>   		spin_unlock_irqrestore(&master->bit_lock, flags);
> -		return -EIO;
> +		return -ETIMEDOUT;
>   	}
>
>   	msg.bits = 0;
> @@ -405,7 +424,7 @@ static int read_one_response(struct fsi_master_gpio *master,
>   	if (crc) {
>   		dev_dbg(master->dev, "ERR response CRC\n");
>   		fsi_master_gpio_error(master, FSI_GPIO_CRC_INVAL);
> -		return -EIO;
> +		return -EAGAIN;
>   	}
>
>   	if (msgp)
> @@ -451,11 +470,33 @@ static int poll_for_response(struct fsi_master_gpio *master,
>   	unsigned long flags;
>   	uint8_t tag;
>   	uint8_t *data_byte = data;
> -
> +	int crc_err_retries = 0;
>   retry:
>   	rc = read_one_response(master, size, &response, &tag);
> -	if (rc)
> -		return rc;
> +
> +	/* Handle retries on CRC errors */
> +	if (rc == -EAGAIN) {
> +		/* Too many retries ? */
> +		if (crc_err_retries++ > FSI_CRC_ERR_RETRIES) {
> +			/*
> +			 * Pass it up as a -EIO otherwise upper level will retry
> +			 * the whole command which isn't what we want here.
> +			 */
> +			rc = -EIO;
> +			goto fail;
> +		}
> +		dev_dbg(master->dev,
> +			 "CRC error retry %d\n", crc_err_retries);
> +		trace_fsi_master_gpio_crc_rsp_error(master);
> +		build_epoll_command(&cmd, slave);
> +		spin_lock_irqsave(&master->bit_lock, flags);
> +		clock_zeros(master, FSI_GPIO_EPOLL_CLOCKS);
> +		serial_out(master, &cmd);
> +		echo_delay(master);
> +		spin_unlock_irqrestore(&master->bit_lock, flags);
> +		goto retry;
> +	} else if (rc)
> +		goto fail;
>
>   	switch (tag) {
>   	case FSI_GPIO_RESP_ACK:
> @@ -496,18 +537,21 @@ static int poll_for_response(struct fsi_master_gpio *master,
>   		break;
>
>   	case FSI_GPIO_RESP_ERRA:
> -	case FSI_GPIO_RESP_ERRC:
> -		dev_dbg(master->dev, "ERR%c received: 0x%x\n",
> -			tag == FSI_GPIO_RESP_ERRA ? 'A' : 'C',
> -			(int)response.msg);
> +		dev_dbg(master->dev, "ERRA received: 0x%x\n", (int)response.msg);
>   		fsi_master_gpio_error(master, response.msg);
>   		rc = -EIO;
>   		break;
> +	case FSI_GPIO_RESP_ERRC:
> +		dev_dbg(master->dev, "ERRC received: 0x%x\n", (int)response.msg);
> +		fsi_master_gpio_error(master, response.msg);
> +		trace_fsi_master_gpio_crc_cmd_error(master);
> +		rc = -EAGAIN;
> +		break;
>   	}
>
>   	if (busy_count > 0)
>   		trace_fsi_master_gpio_poll_response_busy(master, busy_count);
> -
> + fail:
>   	/* Clock the slave enough to be ready for next operation */
>   	spin_lock_irqsave(&master->bit_lock, flags);
>   	clock_zeros(master, FSI_GPIO_PRIME_SLAVE_CLOCKS);
> @@ -536,11 +580,21 @@ static int send_request(struct fsi_master_gpio *master,
>   static int fsi_master_gpio_xfer(struct fsi_master_gpio *master, uint8_t slave,
>   		struct fsi_gpio_msg *cmd, size_t resp_len, void *resp)
>   {
> -	int rc;
> +	int rc = -EAGAIN, retries = 0;
>
> -	rc = send_request(master, cmd);
> -	if (!rc)
> +	while ((retries++) < FSI_CRC_ERR_RETRIES) {
> +		rc = send_request(master, cmd);
> +		if (rc)
> +			break;
>   		rc = poll_for_response(master, slave, resp_len, resp);
> +		if (rc != -EAGAIN)
> +			break;
> +		rc = -EIO;
> +		dev_warn(master->dev, "ECRC retry %d\n", retries);
> +
> +		/* Pace it a bit before retry */
> +		msleep(1);
> +	}
>
>   	return rc;
>   }
> diff --git a/include/trace/events/fsi_master_gpio.h b/include/trace/events/fsi_master_gpio.h
> index 48e83e5755f4..e18b94ce85b2 100644
> --- a/include/trace/events/fsi_master_gpio.h
> +++ b/include/trace/events/fsi_master_gpio.h
> @@ -63,6 +63,33 @@ TRACE_EVENT(fsi_master_gpio_break,
>   	)
>   );
>
> +TRACE_EVENT(fsi_master_gpio_crc_cmd_error,
> +	TP_PROTO(const struct fsi_master_gpio *master),
> +	TP_ARGS(master),
> +	TP_STRUCT__entry(
> +		__field(int,	master_idx)
> +	),
> +	TP_fast_assign(
> +		__entry->master_idx = master->master.idx;
> +	),
> +	TP_printk("fsi-gpio%d ----CRC command retry---",
> +		__entry->master_idx
> +	)
> +);
> +
> +TRACE_EVENT(fsi_master_gpio_crc_rsp_error,
> +	TP_PROTO(const struct fsi_master_gpio *master),
> +	TP_ARGS(master),
> +	TP_STRUCT__entry(
> +		__field(int,	master_idx)
> +	),
> +	TP_fast_assign(
> +		__entry->master_idx = master->master.idx;
> +	),
> +	TP_printk("fsi-gpio%d ----CRC response---",
> +		__entry->master_idx
> +	)
> +);
>
>   TRACE_EVENT(fsi_master_gpio_poll_response_busy,
>   	TP_PROTO(const struct fsi_master_gpio *master, int busy),
