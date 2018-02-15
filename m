Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zj15l73NhzF1HF
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 02:53:31 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1FFnwQo102461
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 10:53:30 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2g5c673mgk-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 10:53:29 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 15 Feb 2018 10:53:27 -0500
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 15 Feb 2018 10:53:25 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1FFrOGh49676486; Thu, 15 Feb 2018 15:53:24 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 328CF112040;
 Thu, 15 Feb 2018 10:51:25 -0500 (EST)
Received: from [9.85.172.122] (unknown [9.85.172.122])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 91C28112034;
 Thu, 15 Feb 2018 10:51:24 -0500 (EST)
Subject: Re: [PATCH linux dev-4.10 11/16] fsi: sbefifo: Switch list_lock from
 spinlock to mutex
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
References: <20180215123606.25777-1-andrew@aj.id.au>
 <20180215123606.25777-12-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 15 Feb 2018 09:53:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180215123606.25777-12-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18021515-0048-0000-0000-0000023A16D9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008539; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000253; SDB=6.00990136; UDB=6.00502823; IPR=6.00769484; 
 MB=3.00019572; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-15 15:53:26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18021515-0049-0000-0000-000044254E02
Message-Id: <37428880-5fc3-8396-e9d7-bcdf30d0c412@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-15_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802150194
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
X-List-Received-Date: Thu, 15 Feb 2018 15:53:32 -0000



On 02/15/2018 06:36 AM, Andrew Jeffery wrote:
> We allocate GFP_KERNEL memory for a list element in sbefifo_enq_xfr() (elided
> from the stack trace presumably by inlining) but do so under list_lock, which
> was previously a spin lock. Enabling lock debugging gives the following
> warning:

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> [  188.830000] BUG: sleeping function called from invalid context at mm/slab.h:408
> [  188.830000] in_atomic(): 1, irqs_disabled(): 128, pid: 110, name: kworker/u2:9
> [  188.830000] INFO: lockdep is turned off.
> [  188.830000] irq event stamp: 9002
> [  188.830000] hardirqs last  enabled at (9001): [<801105bc>] kmem_cache_alloc_trace+0x8c/0x284
> [  188.830000] hardirqs last disabled at (9002): [<8049458c>] _raw_spin_lock_irqsave+0x2c/0xa0
> [  188.830000] softirqs last  enabled at (5370): [<8000987c>] __do_softirq+0x38c/0x510
> [  188.830000] softirqs last disabled at (5363): [<8001f154>] irq_exit+0x120/0x16c
> [  188.830000] CPU: 0 PID: 110 Comm: kworker/u2:9 Tainted: G        W       4.10.17-00534-gb846201e7a2d #2277
> [  188.830000] Hardware name: ASpeed SoC
> [  188.830000] Workqueue: occ occ_worker
> [  188.830000] [<800108f8>] (unwind_backtrace) from [<8000e02c>] (show_stack+0x20/0x24)
> [  188.830000] [<8000e02c>] (show_stack) from [<8022d1c0>] (dump_stack+0x20/0x28)
> [  188.830000] [<8022d1c0>] (dump_stack) from [<80048bf8>] (___might_sleep+0x174/0x2ac)
> [  188.830000] [<80048bf8>] (___might_sleep) from [<80048da0>] (__might_sleep+0x70/0xb0)
> [  188.830000] [<80048da0>] (__might_sleep) from [<801106f8>] (kmem_cache_alloc_trace+0x1c8/0x284)
> [  188.830000] [<801106f8>] (kmem_cache_alloc_trace) from [<803330e8>] (sbefifo_write_common+0x228/0x4b4)
> [  188.830000] [<803330e8>] (sbefifo_write_common) from [<80333740>] (sbefifo_drv_write+0x24/0x28)
> [  188.830000] [<80333740>] (sbefifo_drv_write) from [<80333b58>] (occ_write_sbefifo+0x44/0x60)
> [  188.830000] [<80333b58>] (occ_write_sbefifo) from [<80334530>] (occ_worker+0x38/0x4a0)
> [  188.830000] [<80334530>] (occ_worker) from [<80034a2c>] (process_one_work+0x23c/0x6d4)
> [  188.830000] [<80034a2c>] (process_one_work) from [<80034f08>] (worker_thread+0x44/0x528)
> [  188.830000] [<80034f08>] (worker_thread) from [<8003c8c0>] (kthread+0x160/0x17c)
> [  188.830000] [<8003c8c0>] (kthread) from [<8000a888>] (ret_from_fork+0x14/0x2c)
>
> Avoid the warning (or using GFP_ATOMIC memory) by switching to a mutex, as we
> only require mutual exclusion, not pre-emption be disabled (occ_worker() is
> executed on a workqueue). This should also reduce the latency impact of calling
> into the OCC.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/fsi/fsi-sbefifo.c | 35 ++++++++++++++++-------------------
>   1 file changed, 16 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 7b3c7a22b4a2..27df244c8930 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -67,7 +67,7 @@ struct sbefifo {
>   	wait_queue_head_t wait;
>   	struct list_head xfrs;
>   	struct kref kref;
> -	spinlock_t list_lock;		/* lock access to the xfrs list */
> +	struct mutex list_lock;		/* lock access to the xfrs list */
>   	struct mutex sbefifo_lock;	/* lock access to the hardware */
>   	char name[32];
>   	int idx;
> @@ -399,12 +399,11 @@ static void sbefifo_worker(struct work_struct *work)
>   	int ret = 0;
>   	u32 sts;
>   	int i;
> -	unsigned long flags;
>
> -	spin_lock_irqsave(&sbefifo->list_lock, flags);
> +	mutex_lock(&sbefifo->list_lock);
>   	xfr = list_first_entry_or_null(&sbefifo->xfrs, struct sbefifo_xfr,
>   				       xfrs);
> -	spin_unlock_irqrestore(&sbefifo->list_lock, flags);
> +	mutex_unlock(&sbefifo->list_lock);
>   	if (!xfr)
>   		return;
>
> @@ -516,9 +515,9 @@ static void sbefifo_worker(struct work_struct *work)
>
>   			set_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags);
>
> -			spin_lock_irqsave(&sbefifo->list_lock, flags);
> +			mutex_lock(&sbefifo->list_lock);
>   			list_del(&xfr->xfrs);
> -			spin_unlock_irqrestore(&sbefifo->list_lock, flags);
> +			mutex_unlock(&sbefifo->list_lock);
>
>   			if (unlikely(test_bit(SBEFIFO_XFR_CANCEL,
>   					      &xfr->flags)))
> @@ -535,17 +534,17 @@ static void sbefifo_worker(struct work_struct *work)
>   		dev_err(&sbefifo->fsi_dev->dev,
>   			"Fatal bus access failure: %d\n", ret);
>
> -		spin_lock_irqsave(&sbefifo->list_lock, flags);
> +		mutex_lock(&sbefifo->list_lock);
>   		list_for_each_entry_safe(xfr, tmp, &sbefifo->xfrs, xfrs) {
>   			list_del(&xfr->xfrs);
>   			kfree(xfr);
>   		}
>   		INIT_LIST_HEAD(&sbefifo->xfrs);
> -		spin_unlock_irqrestore(&sbefifo->list_lock, flags);
> +		mutex_unlock(&sbefifo->list_lock);
>   	} else if (eot) {
> -		spin_lock_irqsave(&sbefifo->list_lock, flags);
> +		mutex_lock(&sbefifo->list_lock);
>   		xfr = sbefifo_next_xfr(sbefifo);
> -		spin_unlock_irqrestore(&sbefifo->list_lock, flags);
> +		mutex_unlock(&sbefifo->list_lock);
>
>   		if (xfr) {
>   			wake_up_interruptible(&sbefifo->wait);
> @@ -717,7 +716,6 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
>   	struct sbefifo_xfr *xfr;
>   	ssize_t ret = 0;
>   	size_t n;
> -	unsigned long flags;
>
>   	if ((len >> 2) << 2 != len)
>   		return -EINVAL;
> @@ -728,26 +726,26 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
>   	sbefifo_get_client(client);
>   	n = sbefifo_buf_nbwriteable(&client->wbuf);
>
> -	spin_lock_irqsave(&sbefifo->list_lock, flags);
> +	mutex_lock(&sbefifo->list_lock);
>    
>   	/* next xfr to be executed */
>   	xfr = list_first_entry_or_null(&sbefifo->xfrs, struct sbefifo_xfr,
>   				       xfrs);
>
>   	if ((client->f_flags & O_NONBLOCK) && xfr && n < len) {
> -		spin_unlock_irqrestore(&sbefifo->list_lock, flags);
> +		mutex_unlock(&sbefifo->list_lock);
>   		ret = -EAGAIN;
>   		goto out;
>   	}
>
>   	xfr = sbefifo_enq_xfr(client);		/* this xfr queued up */
>   	if (IS_ERR(xfr)) {
> -		spin_unlock_irqrestore(&sbefifo->list_lock, flags);
> +		mutex_unlock(&sbefifo->list_lock);
>   		ret = PTR_ERR(xfr);
>   		goto out;
>   	}
>
> -	spin_unlock_irqrestore(&sbefifo->list_lock, flags);
> +	mutex_unlock(&sbefifo->list_lock);
>
>   	/*
>   	 * Partial writes are not really allowed in that EOT is sent exactly
> @@ -958,7 +956,7 @@ static int sbefifo_probe(struct device *dev)
>   		}
>   	}
>
> -	spin_lock_init(&sbefifo->list_lock);
> +	mutex_init(&sbefifo->list_lock);
>   	mutex_init(&sbefifo->sbefifo_lock);
>   	kref_init(&sbefifo->kref);
>   	init_waitqueue_head(&sbefifo->wait);
> @@ -1002,11 +1000,10 @@ static int sbefifo_remove(struct device *dev)
>   {
>   	struct sbefifo *sbefifo = dev_get_drvdata(dev);
>   	struct sbefifo_xfr *xfr, *tmp;
> -	unsigned long flags;
>
>   	/* lock the sbefifo so to prevent deleting an ongoing xfr */
>   	mutex_lock(&sbefifo->sbefifo_lock);
> -	spin_lock_irqsave(&sbefifo->list_lock, flags);
> +	mutex_lock(&sbefifo->list_lock);
>
>   	WRITE_ONCE(sbefifo->rc, -ENODEV);
>   	list_for_each_entry_safe(xfr, tmp, &sbefifo->xfrs, xfrs) {
> @@ -1016,7 +1013,7 @@ static int sbefifo_remove(struct device *dev)
>
>   	INIT_LIST_HEAD(&sbefifo->xfrs);
>
> -	spin_unlock_irqrestore(&sbefifo->list_lock, flags);
> +	mutex_unlock(&sbefifo->list_lock);
>   	mutex_unlock(&sbefifo->sbefifo_lock);
>
>   	wake_up_all(&sbefifo->wait);
