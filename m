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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40gVhX61PhzF217
 for <openbmc@lists.ozlabs.org>; Wed,  9 May 2018 06:00:12 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w48Js0hj008479
 for <openbmc@lists.ozlabs.org>; Tue, 8 May 2018 16:00:10 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2huf2dsyeb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 May 2018 16:00:09 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 8 May 2018 14:00:08 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 8 May 2018 14:00:06 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w48K05VU19136798; Tue, 8 May 2018 13:00:05 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A90FBE038;
 Tue,  8 May 2018 14:00:05 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.80.194.186])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 33E88BE03E;
 Tue,  8 May 2018 14:00:05 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.13 6/6] fsi/fsi-master-gpio: Reduce dpoll
 clocks
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
References: <20180508010640.14113-1-benh@kernel.crashing.org>
 <05e89ea8549634e750d783360590f2802954437d.camel@kernel.crashing.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Tue, 8 May 2018 15:00:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <05e89ea8549634e750d783360590f2802954437d.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18050820-0012-0000-0000-0000162F78B6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008994; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000259; SDB=6.01029434; UDB=6.00526021; IPR=6.00808568; 
 MB=3.00021000; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-08 20:00:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050820-0013-0000-0000-000052A6C974
Message-Id: <f2a71866-7ab5-8017-0865-14f4e9b57b91@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805080187
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
X-List-Received-Date: Tue, 08 May 2018 20:00:13 -0000

Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 5/7/18 8:46 PM, Benjamin Herrenschmidt wrote:
> FSI_GPIO_DPOLL_CLOCKS is the number of clocks before sending
> a DPOLL command after receiving a BUSY status. It should be
> at least tSendDelay (16 clocks).
>
> According to comments in the code, it needs to also be at least
> 21 clocks due to HW issues.
>
> It's currently 100 clocks which impacts performances negatively
> in some cases. Reduces it in half to 50 clocks which seems to
> still be solid.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>   drivers/fsi/fsi-master-gpio.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 029b0a5b6d89..bd2b2cbd5eb5 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -29,7 +29,8 @@
>   #define	FSI_GPIO_CMD_TERM	0x3f
>   #define FSI_GPIO_CMD_ABS_AR	0x4
>
> -#define	FSI_GPIO_DPOLL_CLOCKS	100      /* < 21 will cause slave to hang */
> +
> +#define	FSI_GPIO_DPOLL_CLOCKS	50      /* < 21 will cause slave to hang */
>
>   /* Bus errors */
>   #define	FSI_GPIO_ERR_BUSY	1	/* Slave stuck in busy state */
> @@ -43,7 +44,7 @@
>   #define	FSI_GPIO_RESP_ACK	0
>   #define	FSI_GPIO_RESP_ACKD	4
>
> -#define	FSI_GPIO_MAX_BUSY	100
> +#define	FSI_GPIO_MAX_BUSY	200
>   #define	FSI_GPIO_MTOE_COUNT	1000
>   #define	FSI_GPIO_DRAIN_BITS	20
>   #define	FSI_GPIO_CRC_SIZE	4
>
