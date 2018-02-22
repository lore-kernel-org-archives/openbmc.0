Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znQxd2MX9zF1jB
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 07:31:49 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1MKTlv2105640
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:31:46 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ga4cthcwb-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:31:46 -0500
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 22 Feb 2018 13:31:45 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 22 Feb 2018 13:31:42 -0700
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1MKVgw413435280; Thu, 22 Feb 2018 13:31:42 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D77FC604C;
 Thu, 22 Feb 2018 13:31:42 -0700 (MST)
Received: from [9.80.205.44] (unknown [9.80.205.44])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 40ED9C6037;
 Thu, 22 Feb 2018 13:31:41 -0700 (MST)
Subject: Re: [PATCH linux dev-4.13 10/16] hwmon (p9_sbe): Convert client_lock
 from a spinlock to a mutex
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
References: <20180220041844.13228-1-andrew@aj.id.au>
 <20180220041844.13228-11-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 22 Feb 2018 14:31:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220041844.13228-11-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18022220-0028-0000-0000-00000935D252
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008578; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00993587; UDB=6.00504883; IPR=6.00772927; 
 MB=3.00019692; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-22 20:31:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18022220-0029-0000-0000-000039B55448
Message-Id: <ca3d745e-f6ff-f319-a398-e1731f30b0b7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-22_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802220257
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
X-List-Received-Date: Thu, 22 Feb 2018 20:31:50 -0000



On 02/19/2018 10:18 PM, Andrew Jeffery wrote:
> The hwmon occ implementation allocates GFP_KERNEL memory in occ_open_common(),
> therefore we cannot call it under a spinlock as it may sleep. Compiling with
> lock debugging enabled gives us the following warning:

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> [    4.420000] WARNING: CPU: 0 PID: 1 at kernel/locking/lockdep.c:2879 lockdep_trace_alloc+0xf0/0x124
> [    4.420000] DEBUG_LOCKS_WARN_ON(irqs_disabled_flags(flags))
> [    4.420000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.10.17-00526-g1cbacc6bd3a1 #2334
> [    4.420000] Hardware name: ASpeed SoC
> [    4.420000] [<80010eec>] (unwind_backtrace) from [<8000e664>] (show_stack+0x20/0x24)
> [    4.420000] [<8000e664>] (show_stack) from [<80249160>] (dump_stack+0x20/0x28)
> [    4.420000] [<80249160>] (dump_stack) from [<8001d3a0>] (__warn+0xe0/0x108)
> [    4.420000] [<8001d3a0>] (__warn) from [<8001d40c>] (warn_slowpath_fmt+0x44/0x4c)
> [    4.420000] [<8001d40c>] (warn_slowpath_fmt) from [<8005d2cc>] (lockdep_trace_alloc+0xf0/0x124)
> [    4.420000] [<8005d2cc>] (lockdep_trace_alloc) from [<8012bb1c>] (kmem_cache_alloc_trace+0x3c/0x284)
> [    4.420000] [<8012bb1c>] (kmem_cache_alloc_trace) from [<8034fa2c>] (occ_open_common+0x30/0xac)
> [    4.420000] [<8034fa2c>] (occ_open_common) from [<80350bac>] (occ_drv_open+0x24/0x28)
> [    4.420000] [<80350bac>] (occ_drv_open) from [<803638fc>] (p9_sbe_occ_send_cmd+0x44/0x13c)
> [    4.420000] [<803638fc>] (p9_sbe_occ_send_cmd) from [<803615b8>] (occ_poll+0x6c/0x1c0)
> [    4.420000] [<803615b8>] (occ_poll) from [<80363a84>] (p9_sbe_occ_probe+0x90/0x178)
> [    4.420000] [<80363a84>] (p9_sbe_occ_probe) from [<802b9850>] (platform_drv_probe+0x60/0xbc)
> [    4.420000] [<802b9850>] (platform_drv_probe) from [<802b76b0>] (driver_probe_device+0x114/0x430)
> [    4.420000] [<802b76b0>] (driver_probe_device) from [<802b7a98>] (__driver_attach+0xcc/0x10c)
> [    4.420000] [<802b7a98>] (__driver_attach) from [<802b5770>] (bus_for_each_dev+0x5c/0xac)
> [    4.420000] [<802b5770>] (bus_for_each_dev) from [<802b7c74>] (driver_attach+0x28/0x30)
> [    4.420000] [<802b7c74>] (driver_attach) from [<802b6268>] (bus_add_driver+0x19c/0x25c)
> [    4.420000] [<802b6268>] (bus_add_driver) from [<802b8abc>] (driver_register+0x88/0x104)
> [    4.420000] [<802b8abc>] (driver_register) from [<802ba468>] (__platform_driver_register+0x3c/0x50)
> [    4.420000] [<802ba468>] (__platform_driver_register) from [<8066d804>] (p9_sbe_occ_driver_init+0x18/0x20)
> [    4.420000] [<8066d804>] (p9_sbe_occ_driver_init) from [<8064ae7c>] (do_one_initcall+0xa8/0x168)
> [    4.420000] [<8064ae7c>] (do_one_initcall) from [<8064b04c>] (kernel_init_freeable+0x110/0x1c8)
> [    4.420000] [<8064b04c>] (kernel_init_freeable) from [<804a9034>] (kernel_init+0x18/0x104)
> [    4.420000] [<804a9034>] (kernel_init) from [<8000a888>] (ret_from_fork+0x14/0x2c)
>
> Avoid the warning (or the need for GFP_ATOMIC) and allow for reduced system
> latency by using a mutex instead. Mutual exclusion is the only requirement, we
> do not need to block pre-emption.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/hwmon/occ/p9_sbe.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index 51bdfa89f1a6..38cf57ad1bb8 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -34,34 +34,32 @@ struct p9_sbe_occ {
>   	 * open, close and NULL assignment. This prevents simultaneous opening
>   	 * and closing of the client, or closing multiple times.
>   	 */
> -	spinlock_t client_lock;
> +	struct mutex client_lock;
>   };
>
>   #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
>
>   static void p9_sbe_occ_close_client(struct p9_sbe_occ *ctx)
>   {
> -	unsigned long flags;
>   	struct occ_client *tmp_client;
>
> -	spin_lock_irqsave(&ctx->client_lock, flags);
> +	mutex_lock(&ctx->client_lock);
>   	tmp_client = ctx->client;
>   	ctx->client = NULL;
>   	occ_drv_release(tmp_client);
> -	spin_unlock_irqrestore(&ctx->client_lock, flags);
> +	mutex_unlock(&ctx->client_lock);
>   }
>
>   static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>   {
>   	int rc;
> -	unsigned long flags;
>   	struct occ_response *resp = &occ->resp;
>   	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
>
> -	spin_lock_irqsave(&ctx->client_lock, flags);
> +	mutex_lock(&ctx->client_lock);
>   	if (ctx->sbe)
>   		ctx->client = occ_drv_open(ctx->sbe, 0);
> -	spin_unlock_irqrestore(&ctx->client_lock, flags);
> +	mutex_unlock(&ctx->client_lock);
>
>   	if (!ctx->client)
>   		return -ENODEV;
> @@ -115,7 +113,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
>   	if (!ctx)
>   		return -ENOMEM;
>
> -	spin_lock_init(&ctx->lock);
> +	mutex_init(&ctx->client_lock);
>   	ctx->sbe = pdev->dev.parent;
>   	occ = &ctx->occ;
>   	occ->bus_dev = &pdev->dev;
