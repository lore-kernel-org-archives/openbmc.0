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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fXSQ26SCzDqH5
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 04:17:25 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3AI2SKf111677
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 14:17:23 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rsmyg9pqs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 14:17:23 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Wed, 10 Apr 2019 19:17:22 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 10 Apr 2019 19:17:20 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3AIHJGn18284582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Apr 2019 18:17:19 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01591B2066;
 Wed, 10 Apr 2019 18:17:19 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4ED3B2064;
 Wed, 10 Apr 2019 18:17:18 +0000 (GMT)
Received: from [9.85.133.108] (unknown [9.85.133.108])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Apr 2019 18:17:18 +0000 (GMT)
Subject: Re: [PATCH dev-5.0 2/3] media: platform: aspeed: refine clock control
 logic
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
References: <20190409192059.1160-1-jae.hyun.yoo@linux.intel.com>
 <20190409192059.1160-3-jae.hyun.yoo@linux.intel.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Wed, 10 Apr 2019 13:17:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190409192059.1160-3-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19041018-0068-0000-0000-000003B3413D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010904; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01187168; UDB=6.00621825; IPR=6.00967931; 
 MB=3.00026379; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-10 18:17:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041018-0069-0000-0000-0000481C5CE9
Message-Id: <220458cd-df25-0130-c27a-06de80bc5c76@linux.ibm.com>
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
X-List-Received-Date: Wed, 10 Apr 2019 18:17:26 -0000


On 4/9/19 2:20 PM, Jae Hyun Yoo wrote:
> Currently, this driver calls clk_prepare and clk_unprepare from
> interrupt context too but these should be called from sleepable
> context only. To fix this issue, this commit splits out
> clk_enable/disable and clk_prepare/unprepare, and it places
> clk_prepare/unprepare calls into the module probe/remove function.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>   drivers/media/platform/aspeed-video.c | 38 ++++++++++++++++++++-------
>   1 file changed, 29 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index e70be8fdbde5..75b43488ae8e 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -491,8 +491,8 @@ static void aspeed_video_off(struct aspeed_video *video)
>   	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
>   
>   	/* Turn off the relevant clocks */
> -	clk_disable_unprepare(video->vclk);
> -	clk_disable_unprepare(video->eclk);
> +	clk_disable(video->vclk);
> +	clk_disable(video->eclk);
>   
>   	clear_bit(VIDEO_CLOCKS_ON, &video->flags);
>   }
> @@ -503,8 +503,8 @@ static void aspeed_video_on(struct aspeed_video *video)
>   		return;
>   
>   	/* Turn on the relevant clocks */
> -	clk_prepare_enable(video->eclk);
> -	clk_prepare_enable(video->vclk);
> +	clk_enable(video->eclk);
> +	clk_enable(video->vclk);
>   
>   	set_bit(VIDEO_CLOCKS_ON, &video->flags);
>   }
> @@ -1628,31 +1628,46 @@ static int aspeed_video_init(struct aspeed_video *video)
>   		return PTR_ERR(video->eclk);
>   	}
>   
> +	rc = clk_prepare(video->eclk);
> +	if (rc)
> +		return rc;
> +
>   	video->vclk = devm_clk_get(dev, "vclk");
>   	if (IS_ERR(video->vclk)) {
>   		dev_err(dev, "Unable to get VCLK\n");
> -		return PTR_ERR(video->vclk);
> +		rc = PTR_ERR(video->vclk);
> +		goto err_unprepare_eclk;
>   	}
>   
> +	rc = clk_prepare(video->vclk);
> +	if (rc)
> +		goto err_unprepare_eclk;
> +
>   	of_reserved_mem_device_init(dev);
>   
>   	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
>   	if (rc) {
>   		dev_err(dev, "Failed to set DMA mask\n");
> -		of_reserved_mem_device_release(dev);
> -		return rc;
> +		goto err_release_reserved_mem;
>   	}
>   
>   	if (!aspeed_video_alloc_buf(video, &video->jpeg,
>   				    VE_JPEG_HEADER_SIZE)) {
>   		dev_err(dev, "Failed to allocate DMA for JPEG header\n");
> -		of_reserved_mem_device_release(dev);
> -		return rc;
> +		goto err_release_reserved_mem;
>   	}
>   
>   	aspeed_video_init_jpeg_table(video->jpeg.virt, video->yuv420);
>   
>   	return 0;
> +
> +err_release_reserved_mem:
> +	of_reserved_mem_device_release(dev);
> +	clk_unprepare(video->vclk);
> +err_unprepare_eclk:
> +	clk_unprepare(video->eclk);
> +
> +	return rc;
>   }
>   
>   static int aspeed_video_probe(struct platform_device *pdev)
> @@ -1696,6 +1711,11 @@ static int aspeed_video_remove(struct platform_device *pdev)
>   	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
>   	struct aspeed_video *video = to_aspeed_video(v4l2_dev);
>   
> +	aspeed_video_off(video);
> +
> +	clk_unprepare(video->vclk);
> +	clk_unprepare(video->eclk);
> +
>   	video_unregister_device(&video->vdev);
>   
>   	vb2_queue_release(&video->queue);
