Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40jNWS5QhHzF2RF
 for <openbmc@lists.ozlabs.org>; Sat, 12 May 2018 07:28:52 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4BLSfOp023925
 for <openbmc@lists.ozlabs.org>; Fri, 11 May 2018 17:28:50 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2hwh3rvfj4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 May 2018 17:28:49 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Fri, 11 May 2018 17:28:49 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 11 May 2018 17:28:47 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4BLSl9i54788226; Fri, 11 May 2018 21:28:47 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18B11AE03C;
 Fri, 11 May 2018 17:30:46 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.80.193.230])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id C6AAFAE034;
 Fri, 11 May 2018 17:30:45 -0400 (EDT)
Subject: Re: [PATCH v2 linux dev-4.13 1/2] fsi/gpio: Include command build in
 locked section
To: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org
References: <20180510092205.32245-1-jk@ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Fri, 11 May 2018 16:28:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20180510092205.32245-1-jk@ozlabs.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18051121-0052-0000-0000-000002ED3FC0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009008; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000260; SDB=6.01030902; UDB=6.00526895; IPR=6.00810033; 
 MB=3.00021057; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-11 21:28:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18051121-0053-0000-0000-00005CA67BD1
Message-Id: <8d7f1b62-937c-2626-7f5d-0092c974e91b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-11_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805110195
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
X-List-Received-Date: Fri, 11 May 2018 21:28:53 -0000

Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 5/10/18 4:22 AM, Jeremy Kerr wrote:
> For implementing relative addressing mode, we'll need to build a command
> that is coherent with CFAM state. To do that, include the
> build_command_* functions in the locked section of read/write/term.
>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>   drivers/fsi/fsi-master-gpio.c | 25 ++++++++++++++++++-------
>   1 file changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 029b0a5b6d89..1723fe4284b0 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -457,14 +457,10 @@ static int fsi_master_gpio_xfer(struct fsi_master_gpio *master, uint8_t slave,
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
> @@ -473,12 +469,17 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
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
> @@ -486,12 +487,17 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
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
> @@ -499,12 +505,17 @@ static int fsi_master_gpio_term(struct fsi_master *_master,
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
