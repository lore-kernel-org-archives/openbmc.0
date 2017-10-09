Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9kt52cYNzDqlv
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 02:38:36 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v99FbjRk080505
 for <openbmc@lists.ozlabs.org>; Mon, 9 Oct 2017 11:38:34 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dg7fks7ak-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 09 Oct 2017 11:38:34 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 9 Oct 2017 11:38:33 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 9 Oct 2017 11:38:30 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v99FcUkX47448318; Mon, 9 Oct 2017 15:38:30 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6355411205F;
 Mon,  9 Oct 2017 11:38:05 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id D2F4D112034;
 Mon,  9 Oct 2017 11:38:04 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v4 29/31] drivers: fsi: occ: Fix client
 memory management
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>,
 Joel Stanley <joel@jms.id.au>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507255553-13301-30-git-send-email-eajames@linux.vnet.ibm.com>
Date: Mon, 9 Oct 2017 10:38:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1507255553-13301-30-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17100915-0048-0000-0000-000001F2466C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007867; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00928683; UDB=6.00467388; IPR=6.00708954; 
 BA=6.00005630; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017458; XFM=3.00000015;
 UTC=2017-10-09 15:38:32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100915-0049-0000-0000-000042CFE347
Message-Id: <7a851971-1422-b24f-fc50-1e0a34393544@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-09_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710090228
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2017 15:38:37 -0000



On 10/05/2017 09:05 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Potential for bad memory access in the worker function. Now fixed by
> using reference counters.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>   drivers/fsi/occ.c | 92 ++++++++++++++++++++++++++-----------------------------
>   1 file changed, 43 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index ec42fc0..800e8b6 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -70,15 +70,11 @@ struct occ_response {
>    *  and cleared if the transfer fails or occ_worker_getsram completes.
>    * XFR_COMPLETE is set when a transfer fails or finishes occ_worker_getsram.
>    * XFR_CANCELED is set when the transfer's client is released.
> - * XFR_WAITING is set from read() if the transfer isn't complete and
> - *  O_NONBLOCK wasn't specified. Cleared in read() when transfer completes or
> - *  fails.
>    */
>   enum {
>   	XFR_IN_PROGRESS,
>   	XFR_COMPLETE,
>   	XFR_CANCELED,
> -	XFR_WAITING,
>   };
>
>   struct occ_xfr {
> @@ -104,6 +100,7 @@ enum {
>   };
>
>   struct occ_client {
> +	struct kref kref;
>   	struct occ *occ;
>   	struct occ_xfr xfr;
>   	spinlock_t lock;		/* lock access to the client state */
> @@ -140,6 +137,24 @@ static int occ_enqueue_xfr(struct occ_xfr *xfr)
>   	return 0;
>   }
>
> +static void occ_get_client(struct occ_client *client)
> +{
> +	kref_get(&client->kref);
> +}
> +
> +static void occ_client_release(struct kref *kref)
> +{
> +	struct occ_client *client = container_of(kref, struct occ_client,
> +						 kref);
> +
> +	kfree(client);
> +}
> +
> +static void occ_put_client(struct occ_client *client)
> +{
> +	kref_put(&client->kref, occ_client_release);
> +}
> +
>   static struct occ_client *occ_open_common(struct occ *occ, unsigned long flags)
>   {
>   	struct occ_client *client = kzalloc(sizeof(*client), GFP_KERNEL);
> @@ -148,6 +163,7 @@ static struct occ_client *occ_open_common(struct occ *occ, unsigned long flags)
>   		return NULL;
>
>   	client->occ = occ;
> +	kref_init(&client->kref);
>   	spin_lock_init(&client->lock);
>   	init_waitqueue_head(&client->wait);
>
> @@ -192,6 +208,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>   	if (len > OCC_SRAM_BYTES)
>   		return -EINVAL;
>
> +	occ_get_client(client);
>   	xfr = &client->xfr;
>   	occ = client->occ;
>
> @@ -215,8 +232,6 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>   			goto done;
>   		}
>
> -		set_bit(XFR_WAITING, &xfr->flags);
> -
>   		spin_unlock_irq(&client->lock);
>
>   		rc = wait_event_interruptible(client->wait,
> @@ -224,15 +239,12 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>
>   		spin_lock_irq(&client->lock);
>
> -		if (test_bit(XFR_CANCELED, &xfr->flags)) {
> -			spin_unlock_irq(&client->lock);
> -			kfree(client);
> -			return -EBADFD;
> -		}
> -
> -		clear_bit(XFR_WAITING, &xfr->flags);
>   		if (!test_bit(XFR_COMPLETE, &xfr->flags)) {
> -			rc = -EINTR;
> +			if (occ->cancel || test_bit(XFR_CANCELED, &xfr->flags))
> +				rc = -ECANCELED;

We probably need this ENODEV too. We get here if the client is released 
or the device is removed while we're waiting for a read to complete.

> +			else
> +				rc = -EINTR;
> +
>   			goto done;
>   		}
>   	}
> @@ -263,6 +275,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>
>   done:
>   	spin_unlock_irq(&client->lock);
> +	occ_put_client(client);
>   	return rc;
>   }
>
> @@ -289,6 +302,7 @@ static ssize_t occ_write_common(struct occ_client *client,
>   	if (len > (OCC_CMD_DATA_BYTES + 3) || len < 3)
>   		return -EINVAL;
>
> +	occ_get_client(client);
>   	xfr = &client->xfr;
>
>   	spin_lock_irq(&client->lock);
> @@ -340,6 +354,7 @@ static ssize_t occ_write_common(struct occ_client *client,
>
>   done:
>   	spin_unlock_irq(&client->lock);
> +	occ_put_client(client);
>   	return rc;
>   }
>
> @@ -364,38 +379,26 @@ static int occ_release_common(struct occ_client *client)
>
>   	spin_lock_irq(&client->lock);
>
> -	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
> -		spin_unlock_irq(&client->lock);
> -		kfree(client);
> -		return 0;
> -	}
> +	set_bit(XFR_CANCELED, &xfr->flags);
> +	if (!test_bit(CLIENT_XFR_PENDING, &client->flags))
> +		goto done;
>
>   	spin_lock_irq(&occ->list_lock);
>
> -	set_bit(XFR_CANCELED, &xfr->flags);
>   	if (!test_bit(XFR_IN_PROGRESS, &xfr->flags)) {
>   		/* already deleted from list if complete */
>   		if (!test_bit(XFR_COMPLETE, &xfr->flags))
>   			list_del(&xfr->link);
> -
> -		spin_unlock_irq(&occ->list_lock);
> -
> -		if (test_bit(XFR_WAITING, &xfr->flags)) {
> -			/* blocking read; let reader clean up */
> -			wake_up_interruptible(&client->wait);
> -			spin_unlock_irq(&client->lock);
> -			return 0;
> -		}
> -
> -		spin_unlock_irq(&client->lock);
> -
> -		kfree(client);
> -		return 0;
>   	}
>
> -	/* operation is in progress; let worker clean up */
>   	spin_unlock_irq(&occ->list_lock);
> +
> +	wake_up_all(&client->wait);
> +
> +done:
>   	spin_unlock_irq(&client->lock);
> +
> +	occ_put_client(client);
>   	return 0;
>   }
>
> @@ -601,7 +604,7 @@ static int occ_trigger_attn(struct device *sbefifo)
>
>   static void occ_worker(struct work_struct *work)
>   {
> -	int rc = 0, empty, waiting, canceled;
> +	int rc = 0, empty;
>   	u16 resp_data_length;
>   	unsigned long start;
>   	const unsigned long timeout = msecs_to_jiffies(OCC_TIMEOUT_MS);
> @@ -624,6 +627,8 @@ static void occ_worker(struct work_struct *work)
>   		return;
>   	}
>
> +	client = to_client(xfr);
> +	occ_get_client(client);
>   	resp = (struct occ_response *)xfr->buf;
>   	set_bit(XFR_IN_PROGRESS, &xfr->flags);
>
> @@ -679,29 +684,18 @@ static void occ_worker(struct work_struct *work)
>   	mutex_unlock(&occ->occ_lock);
>
>   	xfr->rc = rc;
> -	client = to_client(xfr);
> -
> -	/* lock client to prevent race with read() */
> -	spin_lock_irq(&client->lock);
> -
>   	set_bit(XFR_COMPLETE, &xfr->flags);
> -	waiting = test_bit(XFR_WAITING, &xfr->flags);
> -
> -	spin_unlock_irq(&client->lock);
>
>   	spin_lock_irq(&occ->list_lock);
>
>   	clear_bit(XFR_IN_PROGRESS, &xfr->flags);
>   	list_del(&xfr->link);
>   	empty = list_empty(&occ->xfrs);
> -	canceled = test_bit(XFR_CANCELED, &xfr->flags);
>
>   	spin_unlock_irq(&occ->list_lock);
>
> -	if (waiting)
> -		wake_up_interruptible(&client->wait);
> -	else if (canceled)
> -		kfree(client);
> +	wake_up_interruptible(&client->wait);
> +	occ_put_client(client);
>
>   	if (!empty)
>   		goto again;
