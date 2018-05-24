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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40sJNg4pVRzF1Qh
 for <openbmc@lists.ozlabs.org>; Fri, 25 May 2018 04:50:27 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4OInnat047388
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 14:50:25 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2j61p9uacb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 14:50:25 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 24 May 2018 14:50:23 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 24 May 2018 14:50:22 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4OIoLi26816112
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 18:50:21 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A66428060
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 14:50:10 -0400 (EDT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 439CF28058
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 14:50:10 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.85.164.58])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 14:50:10 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.13 04/10] fsi/fsi-master-gpio: More error
 handling cleanup
To: openbmc@lists.ozlabs.org
References: <20180524051429.4638-1-benh@kernel.crashing.org>
 <20180524051429.4638-4-benh@kernel.crashing.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 24 May 2018 13:50:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20180524051429.4638-4-benh@kernel.crashing.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18052418-0044-0000-0000-0000041A6B71
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009065; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000261; SDB=6.01036001; UDB=6.00529949; IPR=6.00815130; 
 MB=3.00021234; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-24 18:50:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18052418-0045-0000-0000-0000084C887B
Message-Id: <016a9356-1e9e-081e-bed2-d6bb991708d5@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-24_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805240215
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
X-List-Received-Date: Thu, 24 May 2018 18:50:28 -0000

Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 5/24/18 12:14 AM, Benjamin Herrenschmidt wrote:
> Remove calls to the empty and useless fsi_master_gpio_error()
> function, and report CRC errors as "FSI_ERR_NO_SLAVE" when
> reading an all 1's response.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>   drivers/fsi/fsi-master-gpio.c | 26 +++++---------------------
>   1 file changed, 5 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 351c12f2ac55..da556da62846 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -41,13 +41,6 @@
>   #define	FSI_GPIO_RESP_BUSY	1	/* Slave busy */
>   #define	FSI_GPIO_RESP_ERRA	2	/* Any (misc) Error */
>   #define	FSI_GPIO_RESP_ERRC	3	/* Slave reports master CRC error */
> -#define	FSI_GPIO_MTOE		4	/* Master time out error */
> -#define	FSI_GPIO_CRC_INVAL	5	/* Master reports slave CRC error */
> -
> -/* Normal slave responses */
> -#define	FSI_GPIO_RESP_BUSY	1
> -#define	FSI_GPIO_RESP_ACK	0
> -#define	FSI_GPIO_RESP_ACKD	4
>
>   #define	FSI_GPIO_MAX_BUSY	200
>   #define	FSI_GPIO_MTOE_COUNT	1000
> @@ -359,15 +352,6 @@ static void build_term_command(struct fsi_gpio_msg *cmd, uint8_t slave_id)
>   	msg_push_crc(cmd);
>   }
>
> -/*
> - * Store information on master errors so handler can detect and clean
> - * up the bus
> - */
> -static void fsi_master_gpio_error(struct fsi_master_gpio *master, int error)
> -{
> -
> -}
> -
>   /*
>    * Note: callers rely specifically on this returning -EAGAIN for
>    * a CRC error detected in the response. Use other error code
> @@ -396,7 +380,6 @@ static int read_one_response(struct fsi_master_gpio *master,
>   	if (i == FSI_GPIO_MTOE_COUNT) {
>   		dev_dbg(master->dev,
>   			"Master time out waiting for response\n");
> -		fsi_master_gpio_error(master, FSI_GPIO_MTOE);
>   		spin_unlock_irqrestore(&master->bit_lock, flags);
>   		return -ETIMEDOUT;
>   	}
> @@ -422,8 +405,11 @@ static int read_one_response(struct fsi_master_gpio *master,
>   	crc = crc4(0, 1, 1);
>   	crc = crc4(crc, msg.msg, msg.bits);
>   	if (crc) {
> -		dev_dbg(master->dev, "ERR response CRC\n");
> -		fsi_master_gpio_error(master, FSI_GPIO_CRC_INVAL);
> +		/* Check if it's all 1's, that probably means the host is off */
> +		if (((~msg.msg) & ((1ull << msg.bits) - 1)) == 0)
> +			return -ENODEV;
> +		dev_dbg(master->dev, "ERR response CRC msg: 0x%016llx (%d bits)\n",
> +			msg.msg, msg.bits);
>   		return -EAGAIN;
>   	}
>
> @@ -538,12 +524,10 @@ static int poll_for_response(struct fsi_master_gpio *master,
>
>   	case FSI_GPIO_RESP_ERRA:
>   		dev_dbg(master->dev, "ERRA received: 0x%x\n", (int)response.msg);
> -		fsi_master_gpio_error(master, response.msg);
>   		rc = -EIO;
>   		break;
>   	case FSI_GPIO_RESP_ERRC:
>   		dev_dbg(master->dev, "ERRC received: 0x%x\n", (int)response.msg);
> -		fsi_master_gpio_error(master, response.msg);
>   		trace_fsi_master_gpio_crc_cmd_error(master);
>   		rc = -EAGAIN;
>   		break;
