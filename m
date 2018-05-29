Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wHJJ5cY4zDr4N
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 01:12:00 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4TF4NeU010086
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 11:11:57 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2j9955rhnc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 11:11:57 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 29 May 2018 11:11:56 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 29 May 2018 11:11:53 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4TFBqrr37093522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 May 2018 15:11:52 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F07128083;
 Tue, 29 May 2018 11:11:51 -0400 (EDT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1FCD28078;
 Tue, 29 May 2018 11:11:50 -0400 (EDT)
Received: from [9.80.223.183] (unknown [9.80.223.183])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 29 May 2018 11:11:50 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.13] i2c: fsi: Don't take a lock around FSI
 accesses
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
References: <20180529042849.11282-1-benh@kernel.crashing.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 29 May 2018 10:11:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180529042849.11282-1-benh@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18052915-0024-0000-0000-000003620647
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009096; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000264; SDB=6.01039412; UDB=6.00531978; IPR=6.00818541; 
 MB=3.00021359; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-29 15:11:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18052915-0025-0000-0000-0000482B48B5
Message-Id: <332bd020-2168-1cc2-ad58-1efcfdf38b33@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-29_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805290170
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
X-List-Received-Date: Tue, 29 May 2018 15:12:01 -0000



On 05/28/2018 11:28 PM, Benjamin Herrenschmidt wrote:
> That lock is incorrect as FSI can sleep and thus will
> trigger lockdep warnings. It is also unnecessary as
> it was meant to "speed up" the reset process for
> unspecified reasons, not to protect against anything.
>
> The the master semaphore should prevent any concurrent user from
> seeing the intermediate state already and the recent improvements
> to the FSI layer should take care of potential speed issues.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>   drivers/i2c/busses/i2c-fsi.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index 10f693fc855b..41cbffea4325 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -23,6 +23,7 @@
>   #include <linux/semaphore.h>
>   #include <linux/spinlock.h>
>   #include <linux/wait.h>
> +#include <linux/delay.h>

delay.h was already included :)

And probably need to remove the spinlock from the master structure, as 
it's unused.

Thanks,
Eddie

>
>   #define FSI_ENGID_I2C		0x7
>
> @@ -427,10 +428,6 @@ static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
>   {
>   	int rc;
>   	u32 mode, stat, dummy = 0;
> -	unsigned long flags;
> -
> -	/* disable pre-emption; bus won't get left in a bad state for long */
> -	spin_lock_irqsave(&i2c->reset_lock, flags);
>
>   	/* reset engine */
>   	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
> @@ -472,7 +469,7 @@ static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
>   		goto done;
>
>   	/* wait for command complete; time from legacy driver */
> -	udelay(1000);
> +	msleep(1);
>
>   	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
>   	if (rc)
> @@ -490,7 +487,6 @@ static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
>   	rc = fsi_i2c_dev_init(i2c);
>
>   done:
> -	spin_unlock_irqrestore(&i2c->reset_lock, flags);
>   	return rc;
>   }
>
