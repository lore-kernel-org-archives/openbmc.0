Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fXVG6nsFzDqH5
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 04:19:02 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3AI2PUW111374
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 14:19:00 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rsmyg9rj4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 14:19:00 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Wed, 10 Apr 2019 19:18:59 +0100
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 10 Apr 2019 19:18:56 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3AIItWE19398878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Apr 2019 18:18:55 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 261EAB2065;
 Wed, 10 Apr 2019 18:18:55 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAB36B205F;
 Wed, 10 Apr 2019 18:18:54 +0000 (GMT)
Received: from [9.85.133.108] (unknown [9.85.133.108])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Apr 2019 18:18:54 +0000 (GMT)
Subject: Re: [PATCH dev-5.0 3/3] media: platform: aspeed: change irq to
 threaded irq
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
References: <20190409192059.1160-1-jae.hyun.yoo@linux.intel.com>
 <20190409192059.1160-4-jae.hyun.yoo@linux.intel.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Wed, 10 Apr 2019 13:18:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190409192059.1160-4-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19041018-0040-0000-0000-000004DF1E6E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010904; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01187169; UDB=6.00621826; IPR=6.00967932; 
 MB=3.00026379; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-10 18:18:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041018-0041-0000-0000-000008EA253C
Message-Id: <5d6a9330-0d96-8f7b-0ddb-44635d1fac71@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-10_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904100120
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2019 18:19:03 -0000


On 4/9/19 2:20 PM, Jae Hyun Yoo wrote:
> Differently fron other Aspeed drivers, this driver calls clock
> control APIs in interrupt context. Since ECLK is coupled with a
> reset bit in clk-aspeed module, aspeed_clk_enable will make 10ms of
> busy waiting delay for triggering the reset and it will eventually
> disturb other drivers' interrupt handling. To fix this issue, this
> commit changes this driver's irq to threaded irq so that the delay
> can be happened in a thread context.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>   drivers/media/platform/aspeed-video.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 75b43488ae8e..9da61beeef52 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1615,8 +1615,9 @@ static int aspeed_video_init(struct aspeed_video *video)
>   		return -ENODEV;
>   	}
>   
> -	rc = devm_request_irq(dev, irq, aspeed_video_irq, IRQF_SHARED,
> -			      DEVICE_NAME, video);
> +	rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
> +				       IRQF_ONESHOT | IRQF_SHARED, DEVICE_NAME,
> +				       video);
>   	if (rc < 0) {
>   		dev_err(dev, "Unable to request IRQ %d\n", irq);
>   		return rc;
