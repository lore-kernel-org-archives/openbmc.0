Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w21Q53TMGzDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2017 06:05:33 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3AJxQPj025461
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 16:05:23 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29r5s67uuw-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 16:05:22 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 10 Apr 2017 14:05:22 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 10 Apr 2017 14:05:18 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3AK5IG78192488; Mon, 10 Apr 2017 13:05:18 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CA887804D;
 Mon, 10 Apr 2017 14:05:18 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 0F2317803F;
 Mon, 10 Apr 2017 14:05:17 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.7 2/4] drivers/fsi: Look for Hub sourced IRQs
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170407135225.20387-1-cbostic@linux.vnet.ibm.com>
 <20170407135225.20387-3-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 10 Apr 2017 15:05:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170407135225.20387-3-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17041020-0012-0000-0000-00001407ADD6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006912; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00845696; UDB=6.00417061; IPR=6.00624129; 
 BA=6.00005281; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014997; XFM=3.00000013;
 UTC=2017-04-10 20:05:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17041020-0013-0000-0000-00004CE3B1E3
Message-Id: <00baef11-b70c-51c7-2ef2-22c7875b8982@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-10_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1704100159
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
X-List-Received-Date: Mon, 10 Apr 2017 20:05:33 -0000



On 04/07/2017 08:52 AM, Christopher Bostic wrote:
> In addition to looking for local device IRQs on the slave also
> check if the IRQ came from a hub source in the interrupt handler.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>   drivers/fsi/fsi-core.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 36dde94..45e1171 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -98,6 +98,11 @@ static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
>   #define FSI_SI1S		0x1C	/* R: IRQ status */
>
>   /*
> + * SI1S, SI1M fields
> + */
> +#define FSI_SI1_HUB_SRC		0x00100000	/* hub IRQ source */
> +
> +/*
>    * SMODE fields
>    */
>   #define	FSI_SMODE_WSC		0x80000000	/* Warm start done */
> @@ -793,6 +798,13 @@ static int __fsi_dev_irq(struct device *dev, void *data)
>   		return 1;
>   	}
>
> +	if (!(*si1s & FSI_SI1_HUB_SRC)) {
> +		dev_dbg(dev, "IRQ not from a hub source\n");
> +		return 0;
> +	}
> +
> +	/* TODO: handle hub sourced IRQ */
> +
>   	return 0;
>   }
>

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>
