Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znQyf0H1RzF1gx
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 07:32:41 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1MKVUQB134172
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:32:40 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ga31w4gya-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:32:39 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 22 Feb 2018 13:32:38 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 22 Feb 2018 13:32:35 -0700
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1MKWZbQ9896256; Thu, 22 Feb 2018 13:32:35 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16826C6047;
 Thu, 22 Feb 2018 13:32:35 -0700 (MST)
Received: from [9.80.205.44] (unknown [9.80.205.44])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 13699C6037;
 Thu, 22 Feb 2018 13:32:33 -0700 (MST)
Subject: Re: [PATCH linux dev-4.13 11/16] hwmon (p9_sbe): Add static key to
 satisfy lockdep
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
References: <20180220041844.13228-1-andrew@aj.id.au>
 <20180220041844.13228-12-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 22 Feb 2018 14:32:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220041844.13228-12-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18022220-0004-0000-0000-000013B42BD4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008578; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00993587; UDB=6.00504883; IPR=6.00772927; 
 MB=3.00019693; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-22 20:32:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18022220-0005-0000-0000-000086323906
Message-Id: <225825b4-de18-da90-c239-1ab6c464cb6b@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 22 Feb 2018 20:32:42 -0000



On 02/19/2018 10:18 PM, Andrew Jeffery wrote:
> Previously we received the following warning:

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> [    7.221161] INFO: trying to register non-static key.
> [    7.226163] the code is fine but needs lockdep annotation.
> [    7.231650] turning off the locking correctness validator.
> [    7.237152] CPU: 0 PID: 1 Comm: swapper Tainted: G        W       4.13.16-00190-g78a200cb21ab #2393
> [    7.246194] Hardware name: Generic DT based system
> [    7.251040] [<8001141c>] (unwind_backtrace) from [<8000e87c>] (show_stack+0x20/0x24)
> [    7.258827] [<8000e87c>] (show_stack) from [<804a65ec>] (dump_stack+0x20/0x28)
> [    7.266098] [<804a65ec>] (dump_stack) from [<80054b08>] (register_lock_class+0x270/0x614)
> [    7.274308] [<80054b08>] (register_lock_class) from [<800589f0>] (__lock_acquire+0x7c/0x17f4)
> [    7.282857] [<800589f0>] (__lock_acquire) from [<8005ac18>] (lock_acquire+0xd8/0x204)
> [    7.290719] [<8005ac18>] (lock_acquire) from [<804c0dcc>] (_raw_spin_lock_irqsave+0x60/0x74)
> [    7.299200] [<804c0dcc>] (_raw_spin_lock_irqsave) from [<8035ecc0>] (p9_sbe_occ_send_cmd+0x30/0x100)
> [    7.308363] [<8035ecc0>] (p9_sbe_occ_send_cmd) from [<8035c9ac>] (occ_poll+0x60/0x210)
> [    7.316309] [<8035c9ac>] (occ_poll) from [<8035d9c8>] (occ_setup+0x50/0x1260)
> [    7.323475] [<8035d9c8>] (occ_setup) from [<8035edf0>] (p9_sbe_occ_probe+0x60/0x7c)
> [    7.331167] [<8035edf0>] (p9_sbe_occ_probe) from [<802b97c8>] (platform_drv_probe+0x60/0xbc)
> [    7.339629] [<802b97c8>] (platform_drv_probe) from [<802b78f0>] (driver_probe_device+0x2e4/0x450)
> [    7.348516] [<802b78f0>] (driver_probe_device) from [<802b7c0c>] (__device_attach_driver+0xa4/0x10c)
> [    7.357668] [<802b7c0c>] (__device_attach_driver) from [<802b5de0>] (bus_for_each_drv+0x54/0xa4)
> [    7.366477] [<802b5de0>] (bus_for_each_drv) from [<802b7454>] (__device_attach+0xc0/0x148)
> [    7.374758] [<802b7454>] (__device_attach) from [<802b7cd8>] (device_initial_probe+0x1c/0x20)
> [    7.383301] [<802b7cd8>] (device_initial_probe) from [<802b5ff8>] (bus_probe_device+0x98/0xa0)
> [    7.391943] [<802b5ff8>] (bus_probe_device) from [<802b426c>] (device_add+0x398/0x5c4)
> [    7.399895] [<802b426c>] (device_add) from [<8037ab10>] (of_device_add+0x40/0x48)
> [    7.407405] [<8037ab10>] (of_device_add) from [<8037b618>] (of_platform_device_create_pdata+0x88/0xc8)
> [    7.416735] [<8037b618>] (of_platform_device_create_pdata) from [<8037b94c>] (of_platform_device_create+0x20/0x24)
> [    7.427109] [<8037b94c>] (of_platform_device_create) from [<80394894>] (occ_probe+0x19c/0x238)
> [    7.435746] [<80394894>] (occ_probe) from [<802b97c8>] (platform_drv_probe+0x60/0xbc)
> [    7.443604] [<802b97c8>] (platform_drv_probe) from [<802b78f0>] (driver_probe_device+0x2e4/0x450)
> [    7.452497] [<802b78f0>] (driver_probe_device) from [<802b7b28>] (__driver_attach+0xcc/0x10c)
> [    7.461044] [<802b7b28>] (__driver_attach) from [<802b58a4>] (bus_for_each_dev+0x5c/0xac)
> [    7.469240] [<802b58a4>] (bus_for_each_dev) from [<802b7d04>] (driver_attach+0x28/0x30)
> [    7.477258] [<802b7d04>] (driver_attach) from [<802b62dc>] (bus_add_driver+0x194/0x254)
> [    7.485284] [<802b62dc>] (bus_add_driver) from [<802b8b54>] (driver_register+0x88/0x104)
> [    7.493398] [<802b8b54>] (driver_register) from [<802ba42c>] (__platform_driver_register+0x3c/0x50)
> [    7.502469] [<802ba42c>] (__platform_driver_register) from [<803943f0>] (occ_init+0x58/0x80)
> [    7.510945] [<803943f0>] (occ_init) from [<80669f1c>] (do_one_initcall+0xb0/0x170)
> [    7.518545] [<80669f1c>] (do_one_initcall) from [<8066a0f4>] (kernel_init_freeable+0x118/0x1d0)
> [    7.527280] [<8066a0f4>] (kernel_init_freeable) from [<804b9b94>] (kernel_init+0x18/0x104)
> [    7.535579] [<804b9b94>] (kernel_init) from [<8000a868>] (ret_from_fork+0x14/0x2c)
>
> Provide a static key to lockdep to help with this dynamically allocated mutex.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/hwmon/occ/p9_sbe.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index 38cf57ad1bb8..b84cb1733fdf 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -16,6 +16,9 @@
>
>   #include "common.h"
>
> +/* Satisfy lockdep's need for static keys */
> +static struct lock_class_key p9_sbe_occ_client_lock_key;
> +
>   struct p9_sbe_occ {
>   	struct occ occ;
>   	struct device *sbe;
> @@ -114,6 +117,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>
>   	mutex_init(&ctx->client_lock);
> +	lockdep_set_class(&ctx->client_lock, &p9_sbe_occ_client_lock_key);
>   	ctx->sbe = pdev->dev.parent;
>   	occ = &ctx->occ;
>   	occ->bus_dev = &pdev->dev;
