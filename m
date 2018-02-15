Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zj12B5gLJzF1L5
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 02:50:26 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1FFnACV106100
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 10:50:24 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2g5cb7b0xy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 10:50:23 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 15 Feb 2018 10:50:21 -0500
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 15 Feb 2018 10:50:19 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1FFoIe743647218; Thu, 15 Feb 2018 15:50:18 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3DF7112034;
 Thu, 15 Feb 2018 10:48:18 -0500 (EST)
Received: from [9.85.172.122] (unknown [9.85.172.122])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 532F6112040;
 Thu, 15 Feb 2018 10:48:18 -0500 (EST)
Subject: Re: [PATCH linux dev-4.10 06/16] hwmon (p9_sbe): Rename context
 variable
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
References: <20180215123606.25777-1-andrew@aj.id.au>
 <20180215123606.25777-7-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 15 Feb 2018 09:50:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180215123606.25777-7-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18021515-0040-0000-0000-000003F7D381
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008539; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000253; SDB=6.00990135; UDB=6.00502823; IPR=6.00769483; 
 MB=3.00019572; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-15 15:50:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18021515-0041-0000-0000-000007F8D461
Message-Id: <23eb97d6-e167-551a-9224-e8ef4e0c9faf@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 15 Feb 2018 15:50:27 -0000



On 02/15/2018 06:35 AM, Andrew Jeffery wrote:
> Using 'occ' as the context variable caused naming conflicts in some instances.
> Instead use 'ctx' which should make it clear it's the associated drvdata and
> make way for calling other object pointers 'occ'.

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/hwmon/occ/p9_sbe.c | 54 +++++++++++++++++++++++-----------------------
>   1 file changed, 27 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index a583c4b3b280..52473d020b24 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -40,42 +40,42 @@ struct p9_sbe_occ {
>
>   #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
>
> -static void p9_sbe_occ_close_client(struct p9_sbe_occ *occ)
> +static void p9_sbe_occ_close_client(struct p9_sbe_occ *ctx)
>   {
>   	struct occ_client *tmp_client;
>
> -	spin_lock_irq(&occ->lock);
> -	tmp_client = occ->client;
> -	occ->client = NULL;
> +	spin_lock_irq(&ctx->lock);
> +	tmp_client = ctx->client;
> +	ctx->client = NULL;
>   	occ_drv_release(tmp_client);
> -	spin_unlock_irq(&occ->lock);
> +	spin_unlock_irq(&ctx->lock);
>   }
>
>   static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>   {
>   	int rc, error;
>   	struct occ_response *resp = &occ->resp;
> -	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
> +	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
>
> -	spin_lock_irq(&p9_sbe_occ->lock);
> -	if (p9_sbe_occ->sbe)
> -		p9_sbe_occ->client = occ_drv_open(p9_sbe_occ->sbe, 0);
> -	spin_unlock_irq(&p9_sbe_occ->lock);
> +	spin_lock_irq(&ctx->lock);
> +	if (ctx->sbe)
> +		ctx->client = occ_drv_open(ctx->sbe, 0);
> +	spin_unlock_irq(&ctx->lock);
>
> -	if (!p9_sbe_occ->client) {
> +	if (!ctx->client) {
>   		rc = -ENODEV;
>   		goto assign;
>   	}
>
> -	rc = occ_drv_write(p9_sbe_occ->client, (const char *)&cmd[1], 7);
> +	rc = occ_drv_write(ctx->client, (const char *)&cmd[1], 7);
>   	if (rc < 0)
>   		goto err;
>
> -	rc = occ_drv_read(p9_sbe_occ->client, (char *)resp, sizeof(*resp));
> +	rc = occ_drv_read(ctx->client, (char *)resp, sizeof(*resp));
>   	if (rc < 0)
>   		goto err;
>
> -	p9_sbe_occ_close_client(p9_sbe_occ);
> +	p9_sbe_occ_close_client(ctx);
>
>   	switch (resp->return_status) {
>   	case RESP_RETURN_CMD_IN_PRG:
> @@ -103,7 +103,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>   	goto done;
>
>   err:
> -	p9_sbe_occ_close_client(p9_sbe_occ);
> +	p9_sbe_occ_close_client(ctx);
>   	dev_err(occ->bus_dev, "occ bus op failed rc:%d\n", rc);
>   assign:
>   	error = rc;
> @@ -112,10 +112,10 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>   	return rc;
>   }
>
> -static int p9_sbe_occ_setup(struct p9_sbe_occ *p9_sbe_occ)
> +static int p9_sbe_occ_setup(struct p9_sbe_occ *ctx)
>   {
>   	int rc;
> -	struct occ *occ = &p9_sbe_occ->occ;
> +	struct occ *occ = &ctx->occ;
>
>   	/* no need to lock */
>   	rc = occ_poll(occ);
> @@ -154,16 +154,16 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
>   {
>   	int rc;
>   	struct occ *occ;
> -	struct p9_sbe_occ *p9_sbe_occ = devm_kzalloc(&pdev->dev,
> -						     sizeof(*p9_sbe_occ),
> +	struct p9_sbe_occ *ctx = devm_kzalloc(&pdev->dev,
> +						     sizeof(*ctx),
>   						     GFP_KERNEL);
> -	if (!p9_sbe_occ)
> +	if (!ctx)
>   		return -ENOMEM;
>
> -	p9_sbe_occ->sbe = pdev->dev.parent;
> +	ctx->sbe = pdev->dev.parent;
>
> -	occ = &p9_sbe_occ->occ;
> -	spin_lock_init(&p9_sbe_occ->lock);
> +	occ = &ctx->occ;
> +	spin_lock_init(&ctx->lock);
>   	occ->bus_dev = &pdev->dev;
>   	occ->groups[0] = &occ->group;
>   	occ->poll_cmd_data = 0x20;
> @@ -172,7 +172,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
>
>   	platform_set_drvdata(pdev, occ);
>
> -	rc = p9_sbe_occ_setup(p9_sbe_occ);
> +	rc = p9_sbe_occ_setup(ctx);
>   	if (rc)
>   		return rc;
>
> @@ -182,10 +182,10 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
>   static int p9_sbe_occ_remove(struct platform_device *pdev)
>   {
>   	struct occ *occ = platform_get_drvdata(pdev);
> -	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
> +	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
>
> -	p9_sbe_occ->sbe = NULL;
> -	p9_sbe_occ_close_client(p9_sbe_occ);
> +	ctx->sbe = NULL;
> +	p9_sbe_occ_close_client(ctx);
>   	occ_remove_status_attrs(occ);
>
>   	return 0;
