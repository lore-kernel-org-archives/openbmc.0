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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40s9WH3zDyzF1PT
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 23:40:42 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4ODW88g126466
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 09:40:40 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2j5v75y99b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 09:40:40 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 24 May 2018 09:40:38 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 24 May 2018 09:40:36 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4ODea3E17170716
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 13:40:36 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F29CDB205F
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 10:42:23 -0400 (EDT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEFC6B206A
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 10:42:23 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.85.164.58])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 10:42:23 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.13 01/10] fsi/gpio: Include command build in
 locked section
To: openbmc@lists.ozlabs.org
References: <20180524051429.4638-1-benh@kernel.crashing.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 24 May 2018 08:40:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20180524051429.4638-1-benh@kernel.crashing.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18052413-0040-0000-0000-000004311DDA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009065; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000261; SDB=6.01036001; UDB=6.00529949; IPR=6.00815130; 
 MB=3.00021234; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-24 13:40:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18052413-0041-0000-0000-000008373AD7
Message-Id: <15817665-669a-e32f-3285-e14c5c9c86ee@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-24_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805240160
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
X-List-Received-Date: Thu, 24 May 2018 13:40:44 -0000

Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 5/24/18 12:14 AM, Benjamin Herrenschmidt wrote:
> From: Jeremy Kerr <jk@ozlabs.org>
>
> For implementing relative addressing mode, we'll need to build a command
> that is coherent with CFAM state. To do that, include the
> build_command_* functions in the locked section of read/write/term.
>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>   drivers/fsi/fsi-master-gpio.c | 25 ++++++++++++++++++-------
>   1 file changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index e1bde9e3f855..d50ea4849377 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -463,14 +463,10 @@ static int fsi_master_gpio_xfer(struct fsi_master_gpio *master, uint8_t slave,
>   {
>   	int rc;
>
> -	mutex_lock(&master->cmd_lock);
> -
>   	rc = send_request(master, cmd);
>   	if (!rc)
>   		rc = poll_for_response(master, slave, resp_len, resp);
>
> -	mutex_unlock(&master->cmd_lock);
> -
>   	return rc;
>   }
>
> @@ -479,12 +475,17 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
>   {
>   	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>   	struct fsi_gpio_msg cmd;
> +	int rc;
>
>   	if (link != 0)
>   		return -ENODEV;
>
> +	mutex_lock(&master->cmd_lock);
>   	build_abs_ar_command(&cmd, id, addr, size, NULL);
> -	return fsi_master_gpio_xfer(master, id, &cmd, size, val);
> +	rc = fsi_master_gpio_xfer(master, id, &cmd, size, val);
> +	mutex_unlock(&master->cmd_lock);
> +
> +	return rc;
>   }
>
>   static int fsi_master_gpio_write(struct fsi_master *_master, int link,
> @@ -492,12 +493,17 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>   {
>   	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>   	struct fsi_gpio_msg cmd;
> +	int rc;
>
>   	if (link != 0)
>   		return -ENODEV;
>
> +	mutex_lock(&master->cmd_lock);
>   	build_abs_ar_command(&cmd, id, addr, size, val);
> -	return fsi_master_gpio_xfer(master, id, &cmd, 0, NULL);
> +	rc = fsi_master_gpio_xfer(master, id, &cmd, 0, NULL);
> +	mutex_unlock(&master->cmd_lock);
> +
> +	return rc;
>   }
>
>   static int fsi_master_gpio_term(struct fsi_master *_master,
> @@ -505,12 +511,17 @@ static int fsi_master_gpio_term(struct fsi_master *_master,
>   {
>   	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>   	struct fsi_gpio_msg cmd;
> +	int rc;
>
>   	if (link != 0)
>   		return -ENODEV;
>
> +	mutex_lock(&master->cmd_lock);
>   	build_term_command(&cmd, id);
> -	return fsi_master_gpio_xfer(master, id, &cmd, 0, NULL);
> +	rc = fsi_master_gpio_xfer(master, id, &cmd, 0, NULL);
> +	mutex_unlock(&master->cmd_lock);
> +
> +	return rc;
>   }
>
>   static int fsi_master_gpio_break(struct fsi_master *_master, int link)
