Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znQx92VxmzF1Zk
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 07:31:25 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1MKUhKJ129000
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:31:23 -0500
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ga2nnnax9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:31:22 -0500
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 22 Feb 2018 13:31:21 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 22 Feb 2018 13:31:17 -0700
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1MKVHcf11272682; Thu, 22 Feb 2018 13:31:17 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 690B1C603C;
 Thu, 22 Feb 2018 13:31:17 -0700 (MST)
Received: from [9.80.205.44] (unknown [9.80.205.44])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 45B61C604F;
 Thu, 22 Feb 2018 13:31:16 -0700 (MST)
Subject: Re: [PATCH linux dev-4.13 09/16] hwmon (p9_sbe): Rename lock member
 of struct p9_sbe_occ
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
References: <20180220041844.13228-1-andrew@aj.id.au>
 <20180220041844.13228-10-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 22 Feb 2018 14:31:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220041844.13228-10-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18022220-0024-0000-0000-000017FB3E6C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008578; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00993587; UDB=6.00504882; IPR=6.00772927; 
 MB=3.00019692; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-22 20:31:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18022220-0025-0000-0000-00004ED5F650
Message-Id: <2292266c-c8ef-a694-6f41-eec313fd5bad@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 22 Feb 2018 20:31:26 -0000



On 02/19/2018 10:18 PM, Andrew Jeffery wrote:
> Improve code clarity (and searchability) by renaming the lock to client_lock.
> The end result is it is easier to search for uses in the source file.

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/hwmon/occ/p9_sbe.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index 9b8f2f650895..51bdfa89f1a6 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -34,7 +34,7 @@ struct p9_sbe_occ {
>   	 * open, close and NULL assignment. This prevents simultaneous opening
>   	 * and closing of the client, or closing multiple times.
>   	 */
> -	spinlock_t lock;
> +	spinlock_t client_lock;
>   };
>
>   #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
> @@ -44,11 +44,11 @@ static void p9_sbe_occ_close_client(struct p9_sbe_occ *ctx)
>   	unsigned long flags;
>   	struct occ_client *tmp_client;
>
> -	spin_lock_irqsave(&ctx->lock, flags);
> +	spin_lock_irqsave(&ctx->client_lock, flags);
>   	tmp_client = ctx->client;
>   	ctx->client = NULL;
>   	occ_drv_release(tmp_client);
> -	spin_unlock_irqrestore(&ctx->lock, flags);
> +	spin_unlock_irqrestore(&ctx->client_lock, flags);
>   }
>
>   static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
> @@ -58,10 +58,10 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>   	struct occ_response *resp = &occ->resp;
>   	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
>
> -	spin_lock_irqsave(&ctx->lock, flags);
> +	spin_lock_irqsave(&ctx->client_lock, flags);
>   	if (ctx->sbe)
>   		ctx->client = occ_drv_open(ctx->sbe, 0);
> -	spin_unlock_irqrestore(&ctx->lock, flags);
> +	spin_unlock_irqrestore(&ctx->client_lock, flags);
>
>   	if (!ctx->client)
>   		return -ENODEV;
