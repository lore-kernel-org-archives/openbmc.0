Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znQx543SSzF1TH
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 07:31:21 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1MKVGeL002736
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:31:19 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ga2pjn580-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:31:13 -0500
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 22 Feb 2018 13:30:55 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 22 Feb 2018 13:30:52 -0700
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1MKUpOa8847682; Thu, 22 Feb 2018 13:30:51 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE062C6043;
 Thu, 22 Feb 2018 13:30:51 -0700 (MST)
Received: from [9.80.205.44] (unknown [9.80.205.44])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id CF7C0C6037;
 Thu, 22 Feb 2018 13:30:50 -0700 (MST)
Subject: Re: [PATCH linux dev-4.13 08/16] hwmon (p9_sbe): Rename context
 variable
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
References: <20180220041844.13228-1-andrew@aj.id.au>
 <20180220041844.13228-9-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 22 Feb 2018 14:30:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220041844.13228-9-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18022220-0028-0000-0000-00000935D218
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008578; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00993586; UDB=6.00504883; IPR=6.00772927; 
 MB=3.00019692; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-22 20:30:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18022220-0029-0000-0000-000039B553AC
Message-Id: <e0a0a1b2-711a-ae54-ca6b-6d03abada158@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 22 Feb 2018 20:31:22 -0000



On 02/19/2018 10:18 PM, Andrew Jeffery wrote:
> Using 'occ' as the context variable caused naming conflicts in some instances.
> Instead use 'ctx' which should make it clear it's the associated drvdata and
> make way for calling other object pointers 'occ'.

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/hwmon/occ/p9_sbe.c | 47 +++++++++++++++++++++++-----------------------
>   1 file changed, 23 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index cda29f47f8ff..9b8f2f650895 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -39,16 +39,16 @@ struct p9_sbe_occ {
>
>   #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
>
> -static void p9_sbe_occ_close_client(struct p9_sbe_occ *occ)
> +static void p9_sbe_occ_close_client(struct p9_sbe_occ *ctx)
>   {
>   	unsigned long flags;
>   	struct occ_client *tmp_client;
>
> -	spin_lock_irqsave(&occ->lock, flags);
> -	tmp_client = occ->client;
> -	occ->client = NULL;
> +	spin_lock_irqsave(&ctx->lock, flags);
> +	tmp_client = ctx->client;
> +	ctx->client = NULL;
>   	occ_drv_release(tmp_client);
> -	spin_unlock_irqrestore(&occ->lock, flags);
> +	spin_unlock_irqrestore(&ctx->lock, flags);
>   }
>
>   static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
> @@ -56,26 +56,25 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>   	int rc;
>   	unsigned long flags;
>   	struct occ_response *resp = &occ->resp;
> -	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
> +	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
>
> -	spin_lock_irqsave(&p9_sbe_occ->lock, flags);
> -	if (p9_sbe_occ->sbe)
> -		p9_sbe_occ->client = occ_drv_open(p9_sbe_occ->sbe, 0);
> -	spin_unlock_irqrestore(&p9_sbe_occ->lock, flags);
> +	spin_lock_irqsave(&ctx->lock, flags);
> +	if (ctx->sbe)
> +		ctx->client = occ_drv_open(ctx->sbe, 0);
> +	spin_unlock_irqrestore(&ctx->lock, flags);
>
> -	if (!p9_sbe_occ->client)
> +	if (!ctx->client)
>   		return -ENODEV;
>
>   	/* skip first byte (sequence number), OCC driver handles it */
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
> -	/* check the OCC response */
>   	switch (resp->return_status) {
>   	case OCC_RESP_CMD_IN_PRG:
>   		rc = -ETIMEDOUT;
> @@ -103,22 +102,22 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>   	}
>
>   err:
> -	p9_sbe_occ_close_client(p9_sbe_occ);
> +	p9_sbe_occ_close_client(ctx);
>   	return rc;
>   }
>
>   static int p9_sbe_occ_probe(struct platform_device *pdev)
>   {
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
> -	spin_lock_init(&p9_sbe_occ->lock);
> -	p9_sbe_occ->sbe = pdev->dev.parent;
> -	occ = &p9_sbe_occ->occ;
> +	spin_lock_init(&ctx->lock);
> +	ctx->sbe = pdev->dev.parent;
> +	occ = &ctx->occ;
>   	occ->bus_dev = &pdev->dev;
>   	platform_set_drvdata(pdev, occ);
>
> @@ -131,10 +130,10 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
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
>
>   	occ_shutdown(occ);
>
