Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x45CL1KqwzDr8q
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jul 2017 06:03:42 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v67K3dlM101230
 for <openbmc@lists.ozlabs.org>; Fri, 7 Jul 2017 16:03:40 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bjf8h3f59-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jul 2017 16:03:39 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 7 Jul 2017 14:03:36 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 7 Jul 2017 14:03:34 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v67K3Ywx63045874; Fri, 7 Jul 2017 13:03:34 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EBA0BE047;
 Fri,  7 Jul 2017 14:03:34 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.179.192])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 93C29BE038;
 Fri,  7 Jul 2017 14:03:33 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 2/4] i2c: fsi: Dynamically allocate port
 numbers
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20170706143503.21888-1-joel@jms.id.au>
 <20170706143503.21888-3-joel@jms.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 7 Jul 2017 15:03:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170706143503.21888-3-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17070720-0028-0000-0000-000007F8AB75
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007338; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00884291; UDB=6.00441231; IPR=6.00664479; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016133; XFM=3.00000015;
 UTC=2017-07-07 20:03:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070720-0029-0000-0000-000036923387
Message-Id: <a5e75f33-f815-c4f0-9d98-b4be247e9b93@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 07 Jul 2017 20:03:42 -0000



On 07/06/2017 09:35 AM, Joel Stanley wrote:
> The static allocation can collide if there are already devices
> registered at the adapter number. Dynamic allocation is safer.
>
> Users who wish to ensure a port appears at a specific number can use the
> device tree alias feature.

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/i2c/busses/i2c-fsi.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index da045777624e..349bea0e2a63 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -584,14 +584,11 @@ static int fsi_i2c_probe(struct device *dev)
>   		port->adapter.algo = &fsi_i2c_algorithm;
>   		port->adapter.bus_recovery_info = &fsi_i2c_bus_recovery_info;
>   		port->adapter.algo_data = port;
> -		/* number ports uniquely */
> -		port->adapter.nr = (i2c->idx * I2C_MASTER_NR_OFFSET) +
> -			port_no;
>
>   		snprintf(port->adapter.name, sizeof(port->adapter.name),
>   				"fsi_i2c%u", port_no);
>
> -		rc = i2c_add_numbered_adapter(&port->adapter);
> +		rc = i2c_add_adapter(&port->adapter);
>   		if (rc < 0)
>   			return rc;
>
