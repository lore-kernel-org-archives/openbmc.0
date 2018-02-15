Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zj12j6PZlzF1Lj
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 02:50:53 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1FFn0P4098452
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 10:50:51 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2g5atnfcvt-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 10:50:50 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 15 Feb 2018 10:50:50 -0500
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 15 Feb 2018 10:50:47 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1FFokDX49479728; Thu, 15 Feb 2018 15:50:47 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DCDC112040;
 Thu, 15 Feb 2018 10:48:47 -0500 (EST)
Received: from [9.85.172.122] (unknown [9.85.172.122])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id B5D65112034;
 Thu, 15 Feb 2018 10:48:46 -0500 (EST)
Subject: Re: [PATCH linux dev-4.10 07/16] hwmon (p9_sbe): Rename lock member
 of struct p9_sbe_occ
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
References: <20180215123606.25777-1-andrew@aj.id.au>
 <20180215123606.25777-8-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 15 Feb 2018 09:50:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180215123606.25777-8-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18021515-0056-0000-0000-0000041ED374
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008539; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000253; SDB=6.00990135; UDB=6.00502823; IPR=6.00769483; 
 MB=3.00019572; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-15 15:50:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18021515-0057-0000-0000-00000860D448
Message-Id: <1128a6e9-19a6-2437-307a-42f3bd69e4f5@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 15 Feb 2018 15:50:54 -0000



On 02/15/2018 06:35 AM, Andrew Jeffery wrote:
> Improve code clarity (and searchability) by renaming the lock to client_lock.
> The end result is it is easier to search for uses in the source file.

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/hwmon/occ/p9_sbe.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index 52473d020b24..7b1da81515e2 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -35,7 +35,7 @@ struct p9_sbe_occ {
>   	 * open, close and NULL assignment. This prevents simultaneous opening
>   	 * and closing of the client, or closing multiple times.
>   	 */
> -	spinlock_t lock;
> +	spinlock_t client_lock;
>   };
>
>   #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
> @@ -44,11 +44,11 @@ static void p9_sbe_occ_close_client(struct p9_sbe_occ *ctx)
>   {
>   	struct occ_client *tmp_client;
>
> -	spin_lock_irq(&ctx->lock);
> +	spin_lock_irq(&ctx->client_lock);
>   	tmp_client = ctx->client;
>   	ctx->client = NULL;
>   	occ_drv_release(tmp_client);
> -	spin_unlock_irq(&ctx->lock);
> +	spin_unlock_irq(&ctx->client_lock);
>   }
>
>   static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
> @@ -57,10 +57,10 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>   	struct occ_response *resp = &occ->resp;
>   	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
>
> -	spin_lock_irq(&ctx->lock);
> +	spin_lock_irq(&ctx->client_lock);
>   	if (ctx->sbe)
>   		ctx->client = occ_drv_open(ctx->sbe, 0);
> -	spin_unlock_irq(&ctx->lock);
> +	spin_unlock_irq(&ctx->client_lock);
>
>   	if (!ctx->client) {
>   		rc = -ENODEV;
> @@ -163,7 +163,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
>   	ctx->sbe = pdev->dev.parent;
>
>   	occ = &ctx->occ;
> -	spin_lock_init(&ctx->lock);
> +	spin_lock_init(&ctx->client_lock);
>   	occ->bus_dev = &pdev->dev;
>   	occ->groups[0] = &occ->group;
>   	occ->poll_cmd_data = 0x20;
