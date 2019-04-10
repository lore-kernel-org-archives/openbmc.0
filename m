Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fXP10rRLzDqH5
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 04:14:27 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3AI2I3h002462
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 14:14:24 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rskqmw8fm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 14:14:24 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Wed, 10 Apr 2019 19:14:22 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 10 Apr 2019 19:14:19 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3AIEIct20316352
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Apr 2019 18:14:18 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 937B4B2068;
 Wed, 10 Apr 2019 18:14:18 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37FC7B2065;
 Wed, 10 Apr 2019 18:14:18 +0000 (GMT)
Received: from [9.85.133.108] (unknown [9.85.133.108])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Apr 2019 18:14:18 +0000 (GMT)
Subject: Re: [PATCH dev-5.0 1/3] media: platform: aspeed: fix a kernel warning
 on clk control
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
References: <20190409192059.1160-1-jae.hyun.yoo@linux.intel.com>
 <20190409192059.1160-2-jae.hyun.yoo@linux.intel.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Wed, 10 Apr 2019 13:14:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190409192059.1160-2-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19041018-0052-0000-0000-000003AA3E6A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010904; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01187167; UDB=6.00621825; IPR=6.00967930; 
 MB=3.00026379; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-10 18:14:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041018-0053-0000-0000-000060736011
Message-Id: <2ab9add8-e0ab-6f29-fa77-0d8afe3c1cb6@linux.ibm.com>
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
X-List-Received-Date: Wed, 10 Apr 2019 18:14:29 -0000


On 4/9/19 2:20 PM, Jae Hyun Yoo wrote:
> Video engine clock control functions in the Aspeed video engine
> driver are being called from multiple context without any
> protection so video clocks can be double disabled and eventually
> it causes a kernel warning with stack dump printing out like below:
>
> [  515.540498] ------------[ cut here ]------------
> [  515.545174] WARNING: CPU: 0 PID: 1310 at drivers/clk/clk.c:684 clk_core_unprepare+0x13c/0x170
> [  515.553806] vclk-gate already unprepared
> [  515.557841] CPU: 0 PID: 1310 Comm: obmc-ikvm Tainted: G        W         5.0.6-df66fbc97853fbba90a0bfa44de32f3d5f7602b4 #1
> [  515.568973] Hardware name: Generic DT based system
> [  515.573777] Backtrace:
> [  515.576272] [<80107cdc>] (dump_backtrace) from [<80107f10>] (show_stack+0x20/0x24)
> [  515.583930]  r7:803a5614 r6:00000009 r5:00000000 r4:9d88fe1c
> [  515.589712] [<80107ef0>] (show_stack) from [<80690184>] (dump_stack+0x20/0x28)
> [  515.597053] [<80690164>] (dump_stack) from [<80116044>] (__warn.part.3+0xb4/0xdc)
> [  515.604557] [<80115f90>] (__warn.part.3) from [<801160d8>] (warn_slowpath_fmt+0x6c/0x90)
> [  515.612734]  r6:000002ac r5:8080befc r4:80a07008
> [  515.617463] [<80116070>] (warn_slowpath_fmt) from [<803a5614>] (clk_core_unprepare+0x13c/0x170)
> [  515.626167]  r3:8080cdf4 r2:8080bfc0
> [  515.629834]  r7:98d682a8 r6:9d8a9200 r5:9e5151a0 r4:97abd620
> [  515.635530] [<803a54d8>] (clk_core_unprepare) from [<803a76a4>] (clk_unprepare+0x34/0x3c)
> [  515.643812]  r5:9e5151a0 r4:97abd620
> [  515.647529] [<803a7670>] (clk_unprepare) from [<804f36ec>] (aspeed_video_off+0x38/0x50)
> [  515.655539]  r5:9e5151a0 r4:9e504000
> [  515.659242] [<804f36b4>] (aspeed_video_off) from [<804f4358>] (aspeed_video_release+0x90/0x114)
> [  515.668036]  r5:9e5044b0 r4:9e504000
> [  515.671643] [<804f42c8>] (aspeed_video_release) from [<804d302c>] (v4l2_release+0xd4/0xe8)
> [  515.679999]  r7:98d682a8 r6:9d087810 r5:9d8a9200 r4:9e504318
> [  515.685695] [<804d2f58>] (v4l2_release) from [<80236454>] (__fput+0x98/0x1c4)
> [  515.692914]  r5:9e51b608 r4:9d8a9200
> [  515.696597] [<802363bc>] (__fput) from [<802365e8>] (____fput+0x18/0x1c)
> [  515.703315]  r9:80a0700c r8:801011e4 r7:00000000 r6:80a64b9c r5:9d8e35a0 r4:9d8e38dc
> [  515.711167] [<802365d0>] (____fput) from [<80131ca4>] (task_work_run+0x7c/0xa0)
> [  515.718596] [<80131c28>] (task_work_run) from [<80106884>] (do_work_pending+0x4a8/0x578)
> [  515.726777]  r7:801011e4 r6:80a07008 r5:9d88ffb0 r4:ffffe000
> [  515.732466] [<801063dc>] (do_work_pending) from [<8010106c>] (slow_work_pending+0xc/0x20)
> [  515.740727] Exception stack(0x9d88ffb0 to 0x9d88fff8)
> [  515.745840] ffa0:                                     00000000 76f18094 00000000 00000000
> [  515.754122] ffc0: 00000007 00176778 7eda4c20 00000006 00000000 00000000 48e20fa4 00000000
> [  515.762386] ffe0: 00000002 7eda4b08 00000000 48f91efc 80000010 00000007
> [  515.769097]  r10:00000000 r9:9d88e000 r8:801011e4 r7:00000006 r6:7eda4c20 r5:00176778
> [  515.777006]  r4:00000007
> [  515.779558] ---[ end trace 12c04aadef8afbbb ]---
> [  515.784176] ------------[ cut here ]------------
> [  515.788817] WARNING: CPU: 0 PID: 1310 at drivers/clk/clk.c:825 clk_core_disable+0x18c/0x204
> [  515.797161] eclk-gate already disabled
> [  515.800916] CPU: 0 PID: 1310 Comm: obmc-ikvm Tainted: G        W         5.0.6-df66fbc97853fbba90a0bfa44de32f3d5f7602b4 #1
> [  515.811945] Hardware name: Generic DT based system
> [  515.816730] Backtrace:
> [  515.819210] [<80107cdc>] (dump_backtrace) from [<80107f10>] (show_stack+0x20/0x24)
> [  515.826782]  r7:803a5900 r6:00000009 r5:00000000 r4:9d88fe04
> [  515.832454] [<80107ef0>] (show_stack) from [<80690184>] (dump_stack+0x20/0x28)
> [  515.839687] [<80690164>] (dump_stack) from [<80116044>] (__warn.part.3+0xb4/0xdc)
> [  515.847170] [<80115f90>] (__warn.part.3) from [<801160d8>] (warn_slowpath_fmt+0x6c/0x90)
> [  515.855247]  r6:00000339 r5:8080befc r4:80a07008
> [  515.859868] [<80116070>] (warn_slowpath_fmt) from [<803a5900>] (clk_core_disable+0x18c/0x204)
> [  515.868385]  r3:8080cdd0 r2:8080c00c
> [  515.871957]  r7:98d682a8 r6:9d8a9200 r5:97abd560 r4:97abd560
> [  515.877615] [<803a5774>] (clk_core_disable) from [<803a59a0>] (clk_core_disable_lock+0x28/0x34)
> [  515.886301]  r7:98d682a8 r6:9d8a9200 r5:97abd560 r4:a0000013
> [  515.891960] [<803a5978>] (clk_core_disable_lock) from [<803a7714>] (clk_disable+0x2c/0x30)
> [  515.900216]  r5:9e5151a0 r4:9e515f60
> [  515.903816] [<803a76e8>] (clk_disable) from [<804f36f8>] (aspeed_video_off+0x44/0x50)
> [  515.911656] [<804f36b4>] (aspeed_video_off) from [<804f4358>] (aspeed_video_release+0x90/0x114)
> [  515.920341]  r5:9e5044b0 r4:9e504000
> [  515.923921] [<804f42c8>] (aspeed_video_release) from [<804d302c>] (v4l2_release+0xd4/0xe8)
> [  515.932184]  r7:98d682a8 r6:9d087810 r5:9d8a9200 r4:9e504318
> [  515.937851] [<804d2f58>] (v4l2_release) from [<80236454>] (__fput+0x98/0x1c4)
> [  515.944980]  r5:9e51b608 r4:9d8a9200
> [  515.948559] [<802363bc>] (__fput) from [<802365e8>] (____fput+0x18/0x1c)
> [  515.955257]  r9:80a0700c r8:801011e4 r7:00000000 r6:80a64b9c r5:9d8e35a0 r4:9d8e38dc
> [  515.963008] [<802365d0>] (____fput) from [<80131ca4>] (task_work_run+0x7c/0xa0)
> [  515.970333] [<80131c28>] (task_work_run) from [<80106884>] (do_work_pending+0x4a8/0x578)
> [  515.978421]  r7:801011e4 r6:80a07008 r5:9d88ffb0 r4:ffffe000
> [  515.984086] [<801063dc>] (do_work_pending) from [<8010106c>] (slow_work_pending+0xc/0x20)
> [  515.992247] Exception stack(0x9d88ffb0 to 0x9d88fff8)
> [  515.997296] ffa0:                                     00000000 76f18094 00000000 00000000
> [  516.005473] ffc0: 00000007 00176778 7eda4c20 00000006 00000000 00000000 48e20fa4 00000000
> [  516.013642] ffe0: 00000002 7eda4b08 00000000 48f91efc 80000010 00000007
> [  516.020257]  r10:00000000 r9:9d88e000 r8:801011e4 r7:00000006 r6:7eda4c20 r5:00176778
> [  516.028072]  r4:00000007
> [  516.030606] ---[ end trace 12c04aadef8afbbc ]---
>
> To prevent this issue, this commit adds spinlock protection and
> clock status checking logic into the Aspeed video engine driver.


Thanks Jae!

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>   drivers/media/platform/aspeed-video.c | 32 ++++++++++++++++++++++++---
>   1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 8144fe36ad48..e70be8fdbde5 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -187,6 +187,7 @@ enum {
>   	VIDEO_STREAMING,
>   	VIDEO_FRAME_INPRG,
>   	VIDEO_STOPPED,
> +	VIDEO_CLOCKS_ON,
>   };
>   
>   struct aspeed_video_addr {
> @@ -483,19 +484,29 @@ static void aspeed_video_enable_mode_detect(struct aspeed_video *video)
>   
>   static void aspeed_video_off(struct aspeed_video *video)
>   {
> +	if (!test_bit(VIDEO_CLOCKS_ON, &video->flags))
> +		return;
> +
>   	/* Disable interrupts */
>   	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
>   
>   	/* Turn off the relevant clocks */
>   	clk_disable_unprepare(video->vclk);
>   	clk_disable_unprepare(video->eclk);
> +
> +	clear_bit(VIDEO_CLOCKS_ON, &video->flags);
>   }
>   
>   static void aspeed_video_on(struct aspeed_video *video)
>   {
> +	if (test_bit(VIDEO_CLOCKS_ON, &video->flags))
> +		return;
> +
>   	/* Turn on the relevant clocks */
>   	clk_prepare_enable(video->eclk);
>   	clk_prepare_enable(video->vclk);
> +
> +	set_bit(VIDEO_CLOCKS_ON, &video->flags);
>   }
>   
>   static void aspeed_video_bufs_done(struct aspeed_video *video,
> @@ -513,12 +524,14 @@ static void aspeed_video_bufs_done(struct aspeed_video *video,
>   
>   static void aspeed_video_irq_res_change(struct aspeed_video *video)
>   {
> +	spin_lock(&video->lock);
>   	dev_dbg(video->dev, "Resolution changed; resetting\n");
>   
>   	set_bit(VIDEO_RES_CHANGE, &video->flags);
>   	clear_bit(VIDEO_FRAME_INPRG, &video->flags);
>   
>   	aspeed_video_off(video);
> +	spin_unlock(&video->lock);
>   	aspeed_video_bufs_done(video, VB2_BUF_STATE_ERROR);
>   
>   	schedule_delayed_work(&video->res_work, RESOLUTION_CHANGE_DELAY);
> @@ -938,9 +951,13 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
>   
>   static void aspeed_video_start(struct aspeed_video *video)
>   {
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&video->lock, flags);
>   	aspeed_video_on(video);
>   
>   	aspeed_video_init_regs(video);
> +	spin_unlock_irqrestore(&video->lock, flags);
>   
>   	/* Resolution set to 640x480 if no signal found */
>   	aspeed_video_get_resolution(video);
> @@ -956,6 +973,9 @@ static void aspeed_video_start(struct aspeed_video *video)
>   
>   static void aspeed_video_stop(struct aspeed_video *video)
>   {
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&video->lock, flags);
>   	set_bit(VIDEO_STOPPED, &video->flags);
>   	cancel_delayed_work_sync(&video->res_work);
>   
> @@ -969,6 +989,7 @@ static void aspeed_video_stop(struct aspeed_video *video)
>   
>   	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
>   	video->flags = 0;
> +	spin_unlock_irqrestore(&video->lock, flags);
>   }
>   
>   static int aspeed_video_querycap(struct file *file, void *fh,
> @@ -1306,16 +1327,21 @@ static void aspeed_video_resolution_work(struct work_struct *work)
>   	struct delayed_work *dwork = to_delayed_work(work);
>   	struct aspeed_video *video = container_of(dwork, struct aspeed_video,
>   						  res_work);
> -	u32 input_status = video->v4l2_input_status;
> +	unsigned long flags;
> +	u32 input_status;
>   
> +	spin_lock_irqsave(&video->lock, flags);
> +	input_status = video->v4l2_input_status;
>   	aspeed_video_on(video);
>   
>   	/* Exit early in case no clients remain */
> -	if (test_bit(VIDEO_STOPPED, &video->flags))
> +	if (test_bit(VIDEO_STOPPED, &video->flags)) {
> +		spin_unlock_irqrestore(&video->lock, flags);
>   		goto done;
> +	}
>   
>   	aspeed_video_init_regs(video);
> -
> +	spin_unlock_irqrestore(&video->lock, flags);
>   	aspeed_video_get_resolution(video);
>   
>   	if (video->detected_timings.width != video->active_timings.width ||
