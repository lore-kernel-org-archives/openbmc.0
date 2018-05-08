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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40gVcb6FYzzF217
 for <openbmc@lists.ozlabs.org>; Wed,  9 May 2018 05:56:47 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w48Js1BE047000
 for <openbmc@lists.ozlabs.org>; Tue, 8 May 2018 15:56:44 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2huj68rvrn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 May 2018 15:56:44 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 8 May 2018 13:56:43 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 8 May 2018 13:56:41 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w48JtPRK10027324; Tue, 8 May 2018 12:55:26 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E21D078038;
 Tue,  8 May 2018 13:55:25 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.80.194.186])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 802D678041;
 Tue,  8 May 2018 13:55:25 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.13 5/6] fsi/fsi-master-gpio: Reduce turnaround
 clocks
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
References: <20180508010640.14113-1-benh@kernel.crashing.org>
 <20180508010640.14113-5-benh@kernel.crashing.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Tue, 8 May 2018 14:55:24 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20180508010640.14113-5-benh@kernel.crashing.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18050819-0012-0000-0000-0000162F77E5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008994; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000259; SDB=6.01029433; UDB=6.00526021; IPR=6.00808567; 
 MB=3.00021000; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-08 19:56:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050819-0013-0000-0000-000052A6C537
Message-Id: <531b4f41-61b5-cf32-8839-91bd3085cede@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 08 May 2018 19:56:48 -0000

Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 5/7/18 8:06 PM, Benjamin Herrenschmidt wrote:
> FSI_GPIO_PRIME_SLAVE_CLOCKS is the number of clocks if the
> "idle" phase between the end of a response and the beginning
> of the next one. It corresponds to tSendDelay in the FSI
> specification.
>
> The default value in the slave is 16 clocks. 100 is way overkill
> and significantly reduces the driver performance.
>
> This changes it to 20 (which gives the HW a bit of margin still
> just in case).
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>   drivers/fsi/fsi-master-gpio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index c82bbd35276e..029b0a5b6d89 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -49,7 +49,7 @@
>   #define	FSI_GPIO_CRC_SIZE	4
>   #define	FSI_GPIO_MSG_ID_SIZE		2
>   #define	FSI_GPIO_MSG_RESPID_SIZE	2
> -#define	FSI_GPIO_PRIME_SLAVE_CLOCKS	100
> +#define	FSI_GPIO_PRIME_SLAVE_CLOCKS	20
>
>   struct fsi_master_gpio {
>   	struct fsi_master	master;
