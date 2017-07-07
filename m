Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x455F0Y1jzDr8j
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jul 2017 05:58:24 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v67JroJ3004143
 for <openbmc@lists.ozlabs.org>; Fri, 7 Jul 2017 15:58:22 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bjdsuph7e-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jul 2017 15:58:22 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 7 Jul 2017 13:58:21 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 7 Jul 2017 13:58:20 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v67JwJmG64684092; Fri, 7 Jul 2017 12:58:19 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74F89BE040;
 Fri,  7 Jul 2017 13:58:19 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.179.192])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id F235EBE038;
 Fri,  7 Jul 2017 13:58:18 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 1/4] i2c: fsi: Remove ida counter
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20170706143503.21888-1-joel@jms.id.au>
 <20170706143503.21888-2-joel@jms.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 7 Jul 2017 14:58:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170706143503.21888-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17070719-0008-0000-0000-0000082EB64C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007337; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00884289; UDB=6.00441230; IPR=6.00664477; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016133; XFM=3.00000015;
 UTC=2017-07-07 19:58:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070719-0009-0000-0000-000042F9D7A6
Message-Id: <eb8d23e6-9ff9-92ed-3704-f85ae16dc218@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-07_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707070331
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
X-List-Received-Date: Fri, 07 Jul 2017 19:58:25 -0000



On 07/06/2017 09:35 AM, Joel Stanley wrote:
> It's not clear what the intention is. Regardless, it is not necessary so
> remove it.

Looks good and tests fine, patch doesn't apply as-is to dev-4.10 though.

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/i2c/busses/i2c-fsi.c | 17 +++--------------
>   1 file changed, 3 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index 01816466ec86..da045777624e 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -135,7 +135,6 @@ struct fsi_i2c_master {
>   	int			idx;
>   	u8			fifo_size;
>   	struct list_head	ports;
> -	struct ida		ida;
>   	wait_queue_head_t	wait;
>   	struct semaphore	lock;
>   };
> @@ -554,7 +553,7 @@ static int fsi_i2c_probe(struct device *dev)
>   	struct fsi_i2c_master *i2c;
>   	struct fsi_i2c_port *port;
>   	struct device_node *np;
> -	int rc, idx;
> +	int rc;
>   	u32 port_no;
>
>   	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
> @@ -565,7 +564,6 @@ static int fsi_i2c_probe(struct device *dev)
>   	sema_init(&i2c->lock, 1);
>   	i2c->fsi = to_fsi_dev(dev);
>   	i2c->idx = ida_simple_get(&fsi_i2c_ida, 1, INT_MAX, GFP_KERNEL);
> -	ida_init(&i2c->ida);
>   	INIT_LIST_HEAD(&i2c->ports);
>
>   	/* add adapter for each i2c port of the master */
> @@ -574,12 +572,6 @@ static int fsi_i2c_probe(struct device *dev)
>   		if (rc || port_no > 0xFFFF)
>   			continue;
>
> -		/* make sure we don't overlap index with a buggy dts */
> -		idx = ida_simple_get(&i2c->ida, port_no,
> -				port_no + 1, GFP_KERNEL);
> -		if (idx < 0)
> -			continue;
> -
>   		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
>   		if (!port)
>   			return -ENOMEM;
> @@ -596,9 +588,8 @@ static int fsi_i2c_probe(struct device *dev)
>   		port->adapter.nr = (i2c->idx * I2C_MASTER_NR_OFFSET) +
>   			port_no;
>
> -		snprintf(port->adapter.name,
> -				sizeof(port->adapter.name),
> -				"fsi%d_i2c%u", i2c->idx, port_no);
> +		snprintf(port->adapter.name, sizeof(port->adapter.name),
> +				"fsi_i2c%u", port_no);
>
>   		rc = i2c_add_numbered_adapter(&port->adapter);
>   		if (rc < 0)
> @@ -625,8 +616,6 @@ static int fsi_i2c_remove(struct device *dev)
>   		i2c_del_adapter(&port->adapter);
>   	}
>
> -	ida_destroy(&i2c->ida);
> -
>   	ida_simple_remove(&fsi_i2c_ida, i2c->idx);
>
>   	return 0;
