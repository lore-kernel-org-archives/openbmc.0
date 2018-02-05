Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zZzM80n08zF0XY
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 07:14:11 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w15KAd5P047321
 for <openbmc@lists.ozlabs.org>; Mon, 5 Feb 2018 15:14:09 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fxud2xma1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 05 Feb 2018 15:14:09 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 5 Feb 2018 13:14:08 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 5 Feb 2018 13:14:05 -0700
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w15KE3qG13435238; Mon, 5 Feb 2018 13:14:05 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2A4E6E040;
 Mon,  5 Feb 2018 13:14:04 -0700 (MST)
Received: from Christophers-MacBook-Pro.local (unknown [9.81.199.187])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 331796E045;
 Mon,  5 Feb 2018 13:14:02 -0700 (MST)
Subject: Re: [PATCH linux dev-4.10 3/3] drivers: fsi: occ: switch to irqsave
 and irqrestore
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1517609507-20687-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1517609507-20687-4-git-send-email-eajames@linux.vnet.ibm.com>
Cc: andrew@aj.id.au
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Mon, 5 Feb 2018 14:14:01 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1517609507-20687-4-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18020520-0016-0000-0000-0000083694E0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008478; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000248; SDB=6.00985425; UDB=6.00500005; IPR=6.00764795; 
 BA=6.00005812; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019384; XFM=3.00000015;
 UTC=2018-02-05 20:14:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18020520-0017-0000-0000-00003D58768A
Message-Id: <8c681856-8318-492d-5b59-99c6f1988be4@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-05_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802050248
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Feb 2018 20:14:12 -0000

Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 2/2/18 4:11 PM, Eddie James wrote:
> Fix spinlocking by storing the interrupt state and restoring that state
> when unlocking, instead of blindly disabling and re-enabling all irqs.
>
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>   drivers/fsi/occ.c | 44 +++++++++++++++++++++++++-------------------
>   1 file changed, 25 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index adc64f3..edb5e977 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -118,18 +118,19 @@ struct occ_client {
>   static int occ_enqueue_xfr(struct occ_xfr *xfr)
>   {
>   	int empty;
> +	unsigned long flags;
>   	struct occ_client *client = to_client(xfr);
>   	struct occ *occ = client->occ;
>
>   	if (occ->cancel)
>   		return -ENODEV;
>
> -	spin_lock_irq(&occ->list_lock);
> +	spin_lock_irqsave(&occ->list_lock, flags);
>
>   	empty = list_empty(&occ->xfrs);
>   	list_add_tail(&xfr->link, &occ->xfrs);
>
> -	spin_unlock_irq(&occ->list_lock);
> +	spin_unlock_irqrestore(&occ->list_lock, flags);
>
>   	if (empty)
>   		queue_work(occ_wq, &occ->work);
> @@ -201,6 +202,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>   	size_t bytes;
>   	struct occ_xfr *xfr;
>   	struct occ *occ;
> +	unsigned long flags;
>
>   	if (!client)
>   		return -ENODEV;
> @@ -212,7 +214,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>   	xfr = &client->xfr;
>   	occ = client->occ;
>
> -	spin_lock_irq(&client->lock);
> +	spin_lock_irqsave(&client->lock, flags);
>
>   	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
>   		/* we just finished reading all data, return 0 */
> @@ -232,12 +234,12 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>   			goto done;
>   		}
>
> -		spin_unlock_irq(&client->lock);
> +		spin_unlock_irqrestore(&client->lock, flags);
>
>   		rc = wait_event_interruptible(client->wait,
>   					      occ_read_ready(xfr, occ));
>
> -		spin_lock_irq(&client->lock);
> +		spin_lock_irqsave(&client->lock, flags);
>
>   		if (!test_bit(XFR_COMPLETE, &xfr->flags)) {
>   			if (occ->cancel || test_bit(XFR_CANCELED, &xfr->flags))
> @@ -274,7 +276,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>   	rc = bytes;
>
>   done:
> -	spin_unlock_irq(&client->lock);
> +	spin_unlock_irqrestore(&client->lock, flags);
>   	occ_put_client(client);
>   	return rc;
>   }
> @@ -293,6 +295,7 @@ static ssize_t occ_write_common(struct occ_client *client,
>   {
>   	int rc;
>   	unsigned int i;
> +	unsigned long flags;
>   	u16 data_length, checksum = 0;
>   	struct occ_xfr *xfr;
>
> @@ -305,7 +308,7 @@ static ssize_t occ_write_common(struct occ_client *client,
>   	occ_get_client(client);
>   	xfr = &client->xfr;
>
> -	spin_lock_irq(&client->lock);
> +	spin_lock_irqsave(&client->lock, flags);
>
>   	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
>   		rc = -EBUSY;
> @@ -353,7 +356,7 @@ static ssize_t occ_write_common(struct occ_client *client,
>   	rc = len;
>
>   done:
> -	spin_unlock_irq(&client->lock);
> +	spin_unlock_irqrestore(&client->lock, flags);
>   	occ_put_client(client);
>   	return rc;
>   }
> @@ -370,6 +373,7 @@ static int occ_release_common(struct occ_client *client)
>   {
>   	struct occ *occ;
>   	struct occ_xfr *xfr;
> +	unsigned long flags;
>
>   	if (!client)
>   		return -ENODEV;
> @@ -377,13 +381,13 @@ static int occ_release_common(struct occ_client *client)
>   	xfr = &client->xfr;
>   	occ = client->occ;
>
> -	spin_lock_irq(&client->lock);
> +	spin_lock_irqsave(&client->lock, flags);
>
>   	set_bit(XFR_CANCELED, &xfr->flags);
>   	if (!test_bit(CLIENT_XFR_PENDING, &client->flags))
>   		goto done;
>
> -	spin_lock_irq(&occ->list_lock);
> +	spin_lock(&occ->list_lock);
>
>   	if (!test_bit(XFR_IN_PROGRESS, &xfr->flags)) {
>   		/* already deleted from list if complete */
> @@ -391,12 +395,12 @@ static int occ_release_common(struct occ_client *client)
>   			list_del(&xfr->link);
>   	}
>
> -	spin_unlock_irq(&occ->list_lock);
> +	spin_unlock(&occ->list_lock);
>
>   	wake_up_all(&client->wait);
>
>   done:
> -	spin_unlock_irq(&client->lock);
> +	spin_unlock_irqrestore(&client->lock, flags);
>
>   	occ_put_client(client);
>   	return 0;
> @@ -606,6 +610,7 @@ static void occ_worker(struct work_struct *work)
>   {
>   	int rc = 0, empty;
>   	u16 resp_data_length;
> +	unsigned long flags;
>   	unsigned long start;
>   	const unsigned long timeout = msecs_to_jiffies(OCC_TIMEOUT_MS);
>   	const long int wait_time = msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
> @@ -619,11 +624,11 @@ static void occ_worker(struct work_struct *work)
>   	if (occ->cancel)
>   		return;
>
> -	spin_lock_irq(&occ->list_lock);
> +	spin_lock_irqsave(&occ->list_lock, flags);
>
>   	xfr = list_first_entry_or_null(&occ->xfrs, struct occ_xfr, link);
>   	if (!xfr) {
> -		spin_unlock_irq(&occ->list_lock);
> +		spin_unlock_irqrestore(&occ->list_lock, flags);
>   		return;
>   	}
>
> @@ -632,7 +637,7 @@ static void occ_worker(struct work_struct *work)
>   	resp = (struct occ_response *)xfr->buf;
>   	set_bit(XFR_IN_PROGRESS, &xfr->flags);
>
> -	spin_unlock_irq(&occ->list_lock);
> +	spin_unlock_irqrestore(&occ->list_lock, flags);
>   	mutex_lock(&occ->occ_lock);
>
>   	start = jiffies;
> @@ -686,13 +691,13 @@ static void occ_worker(struct work_struct *work)
>   	xfr->rc = rc;
>   	set_bit(XFR_COMPLETE, &xfr->flags);
>
> -	spin_lock_irq(&occ->list_lock);
> +	spin_lock_irqsave(&occ->list_lock, flags);
>
>   	clear_bit(XFR_IN_PROGRESS, &xfr->flags);
>   	list_del(&xfr->link);
>   	empty = list_empty(&occ->xfrs);
>
> -	spin_unlock_irq(&occ->list_lock);
> +	spin_unlock_irqrestore(&occ->list_lock, flags);
>
>   	wake_up_interruptible(&client->wait);
>   	occ_put_client(client);
> @@ -810,15 +815,16 @@ static int occ_remove(struct platform_device *pdev)
>   	struct occ *occ = platform_get_drvdata(pdev);
>   	struct occ_xfr *xfr;
>   	struct occ_client *client;
> +	unsigned long flags;
>
>   	occ->cancel = true;
>
> -	spin_lock_irq(&occ->list_lock);
> +	spin_lock_irqsave(&occ->list_lock, flags);
>   	list_for_each_entry(xfr, &occ->xfrs, link) {
>   		client = to_client(xfr);
>   		wake_up_all(&client->wait);
>   	}
> -	spin_unlock_irq(&occ->list_lock);
> +	spin_unlock_irqrestore(&occ->list_lock, flags);
>
>   	misc_deregister(&occ->mdev);
>   	device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
