Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x45DB2SDyzDr5d
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jul 2017 06:04:26 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v67K3fk9040106
 for <openbmc@lists.ozlabs.org>; Fri, 7 Jul 2017 16:04:24 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bjf403w46-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jul 2017 16:04:23 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 7 Jul 2017 14:04:22 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 7 Jul 2017 14:04:20 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v67K4KTM9634130; Fri, 7 Jul 2017 13:04:20 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4613BBE03A;
 Fri,  7 Jul 2017 14:04:20 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.179.192])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id CC29DBE04C;
 Fri,  7 Jul 2017 14:04:19 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 3/4] i2c: fsi: Remove idx counter
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20170706143503.21888-1-joel@jms.id.au>
 <20170706143503.21888-4-joel@jms.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 7 Jul 2017 15:04:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170706143503.21888-4-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17070720-0004-0000-0000-00001288B0C8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007338; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00884291; UDB=6.00441232; IPR=6.00664479; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016133; XFM=3.00000015;
 UTC=2017-07-07 20:04:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070720-0005-0000-0000-0000801FB1D3
Message-Id: <4c078819-a579-7d61-c75e-ffba9eeb34b0@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-07_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707070334
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Jul 2017 20:04:26 -0000


On 07/06/2017 09:35 AM, Joel Stanley wrote:
> It is no longer used.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Thanks!

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

> ---
>   drivers/i2c/busses/i2c-fsi.c | 6 ------
>   1 file changed, 6 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index 349bea0e2a63..0c7efb667427 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -132,7 +132,6 @@
>
>   struct fsi_i2c_master {
>   	struct fsi_device	*fsi;
> -	int			idx;
>   	u8			fifo_size;
>   	struct list_head	ports;
>   	wait_queue_head_t	wait;
> @@ -147,8 +146,6 @@ struct fsi_i2c_port {
>   	u16			xfrd;
>   };
>
> -static DEFINE_IDA(fsi_i2c_ida);
> -
>   static int fsi_i2c_read_reg(struct fsi_device *fsi, unsigned int reg,
>   			    u32 *data)
>   {
> @@ -563,7 +560,6 @@ static int fsi_i2c_probe(struct device *dev)
>   	init_waitqueue_head(&i2c->wait);
>   	sema_init(&i2c->lock, 1);
>   	i2c->fsi = to_fsi_dev(dev);
> -	i2c->idx = ida_simple_get(&fsi_i2c_ida, 1, INT_MAX, GFP_KERNEL);
>   	INIT_LIST_HEAD(&i2c->ports);
>
>   	/* add adapter for each i2c port of the master */
> @@ -613,8 +609,6 @@ static int fsi_i2c_remove(struct device *dev)
>   		i2c_del_adapter(&port->adapter);
>   	}
>
> -	ida_simple_remove(&fsi_i2c_ida, i2c->idx);
> -
>   	return 0;
>   }
>
