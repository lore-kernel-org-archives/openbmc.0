Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3yqD17HBzDr5V
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jul 2017 01:15:51 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v67FDZUk112271
 for <openbmc@lists.ozlabs.org>; Fri, 7 Jul 2017 11:15:50 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bjcfj8t4q-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jul 2017 11:15:49 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 7 Jul 2017 09:15:48 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 7 Jul 2017 09:15:45 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v67FFj4427918588; Fri, 7 Jul 2017 08:15:45 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2C87136048;
 Fri,  7 Jul 2017 09:15:44 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id AF50D136044;
 Fri,  7 Jul 2017 09:15:44 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10] fsi: occ: Fix spin_lock_irq errors
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20170707060052.3471-1-joel@jms.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 7 Jul 2017 10:15:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170707060052.3471-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17070715-0008-0000-0000-0000082E3800
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007336; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00884195; UDB=6.00441173; IPR=6.00664383; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016130; XFM=3.00000015;
 UTC=2017-07-07 15:15:46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070715-0009-0000-0000-000042F8EAD3
Message-Id: <fcaf86b2-d560-d186-c851-d83368fc4adc@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-07_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707070253
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
X-List-Received-Date: Fri, 07 Jul 2017 15:15:52 -0000



On 07/07/2017 01:00 AM, Joel Stanley wrote:
> We are seeing warnings whenever this driver is in use:
>
>   WARNING: CPU: 0 PID: 991 at kernel/softirq.c:162 __local_bh_enable_ip+0xa0/0xe0
>   CPU: 0 PID: 991 Comm: openpower-occ-c Not tainted 4.10.17-00313-g9165bdc8c418 #497
>   Hardware name: ASpeed SoC
>   [<80010060>] (unwind_backtrace) from [<8000d924>] (show_stack+0x20/0x24)
>   [<8000d924>] (show_stack) from [<801daedc>] (dump_stack+0x20/0x28)
>   [<801daedc>] (dump_stack) from [<80018d04>] (__warn+0xe0/0x108)
>   [<80018d04>] (__warn) from [<80018df8>] (warn_slowpath_null+0x30/0x38)
>   [<80018df8>] (warn_slowpath_null) from [<8001c350>] (__local_bh_enable_ip+0xa0/0xe0)
>   [<8001c350>] (__local_bh_enable_ip) from [<803afdd0>] (unix_release_sock+0x68/0x250)
>   [<803afdd0>] (unix_release_sock) from [<803affe4>] (unix_release+0x2c/0x3c)
>   [<803affe4>] (unix_release) from [<803153a8>] (sock_release+0x2c/0xa0)
>   [<803153a8>] (sock_release) from [<80315438>] (sock_close+0x1c/0x24)
>   [<80315438>] (sock_close) from [<800e3e60>] (__fput+0x94/0x1c4)
>   [<800e3e60>] (__fput) from [<800e3ff8>] (____fput+0x18/0x1c)
>   [<800e3ff8>] (____fput) from [<80031d34>] (task_work_run+0x78/0xa0)
>   [<80031d34>] (task_work_run) from [<8001b2b4>] (do_exit+0x274/0x8e0)
>   [<8001b2b4>] (do_exit) from [<8001b9b8>] (do_group_exit+0x4c/0xb4)
>   [<8001b9b8>] (do_group_exit) from [<800253a4>] (get_signal+0x290/0x5b4)
>   [<800253a4>] (get_signal) from [<8000ccf0>] (do_signal+0xd4/0x3dc)
>   [<8000ccf0>] (do_signal) from [<8000d1d4>] (do_work_pending+0xac/0xbc)
>   [<8000d1d4>] (do_work_pending) from [<8000a58c>] (slow_work_pending+0xc/0x20)
>
> The driver lack spin_unlock_irq calls when releasing locks. Add them.
> Also add whitespace around the locking calls so they stand out.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> Eddie, the locking in this driver is a bit scary. We need to get the driver
> properly reviewed as a priority, or else it will need to be removed from the
> tree until it is fixed.
>
> This patch is enough to avoid confusing users with WARN_ONs. It's not a full
> review or fix for the locking.

It is on the lkml.

This patch tests well, no more warning.

Thanks!

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

>
>   drivers/fsi/occ.c | 43 ++++++++++++++++++++++++++++---------------
>   1 file changed, 28 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index f43ae51cd2e0..d984e519a80e 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -123,9 +123,11 @@ static void occ_enqueue_xfr(struct occ_xfr *xfr)
>   	struct occ *occ = client->occ;
>
>   	spin_lock_irq(&occ->list_lock);
> +
>   	empty = list_empty(&occ->xfrs);
>   	list_add_tail(&xfr->link, &occ->xfrs);
> -	spin_unlock(&occ->list_lock);
> +
> +	spin_unlock_irq(&occ->list_lock);
>
>   	if (empty)
>   		queue_work(occ_wq, &occ->work);
> @@ -175,6 +177,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>   		return -EINVAL;
>
>   	spin_lock_irq(&client->lock);
> +
>   	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
>   		/* we just finished reading all data, return 0 */
>   		if (client->read_offset) {
> @@ -193,15 +196,17 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>   		}
>
>   		set_bit(XFR_WAITING, &xfr->flags);
> -		spin_unlock(&client->lock);
> +
> +		spin_unlock_irq(&client->lock);
>
>   		rc = wait_event_interruptible(client->wait,
>   			test_bit(XFR_COMPLETE, &xfr->flags) ||
>   			test_bit(XFR_CANCELED, &xfr->flags));
>
>   		spin_lock_irq(&client->lock);
> +
>   		if (test_bit(XFR_CANCELED, &xfr->flags)) {
> -			spin_unlock(&client->lock);
> +			spin_unlock_irq(&client->lock);
>   			kfree(client);
>   			return -EBADFD;
>   		}
> @@ -236,7 +241,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>   	rc = bytes;
>
>   done:
> -	spin_unlock(&client->lock);
> +	spin_unlock_irq(&client->lock);
>   	return rc;
>   }
>
> @@ -307,7 +312,7 @@ static ssize_t occ_write_common(struct occ_client *client,
>   	rc = len;
>
>   done:
> -	spin_unlock(&client->lock);
> +	spin_unlock_irq(&client->lock);
>   	return rc;
>   }
>
> @@ -331,36 +336,39 @@ static int occ_release_common(struct occ_client *client)
>   	struct occ *occ = client->occ;
>
>   	spin_lock_irq(&client->lock);
> +
>   	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
> -		spin_unlock(&client->lock);
> +		spin_unlock_irq(&client->lock);
>   		kfree(client);
>   		return 0;
>   	}
>
>   	spin_lock_irq(&occ->list_lock);
> +
>   	set_bit(XFR_CANCELED, &xfr->flags);
>   	if (!test_bit(XFR_IN_PROGRESS, &xfr->flags)) {
>   		/* already deleted from list if complete */
>   		if (!test_bit(XFR_COMPLETE, &xfr->flags))
>   			list_del(&xfr->link);
>
> -		spin_unlock(&occ->list_lock);
> +		spin_unlock_irq(&occ->list_lock);
>
>   		if (test_bit(XFR_WAITING, &xfr->flags)) {
>   			/* blocking read; let reader clean up */
>   			wake_up_interruptible(&client->wait);
> -			spin_unlock(&client->lock);
> +			spin_unlock_irq(&client->lock);
>   			return 0;
>   		}
>
> -		spin_unlock(&client->lock);
> +		spin_unlock_irq(&client->lock);
> +
>   		kfree(client);
>   		return 0;
>   	}
>
>   	/* operation is in progress; let worker clean up*/
> -	spin_unlock(&occ->list_lock);
> -	spin_unlock(&client->lock);
> +	spin_unlock_irq(&occ->list_lock);
> +	spin_unlock_irq(&client->lock);
>   	return 0;
>   }
>
> @@ -563,15 +571,16 @@ static void occ_worker(struct work_struct *work)
>
>   again:
>   	spin_lock_irq(&occ->list_lock);
> +
>   	xfr = list_first_entry(&occ->xfrs, struct occ_xfr, link);
>   	if (!xfr) {
> -		spin_unlock(&occ->list_lock);
> +		spin_unlock_irq(&occ->list_lock);
>   		return;
>   	}
>
>   	set_bit(XFR_IN_PROGRESS, &xfr->flags);
>
> -	spin_unlock(&occ->list_lock);
> +	spin_unlock_irq(&occ->list_lock);
>   	mutex_lock(&occ->occ_lock);
>
>   	rc = occ_putsram(sbefifo, 0xFFFBE000, xfr->buf,
> @@ -611,16 +620,20 @@ static void occ_worker(struct work_struct *work)
>
>   	/* lock client to prevent race with read() */
>   	spin_lock_irq(&client->lock);
> +
>   	set_bit(XFR_COMPLETE, &xfr->flags);
>   	waiting = test_bit(XFR_WAITING, &xfr->flags);
> -	spin_unlock(&client->lock);
> +
> +	spin_unlock_irq(&client->lock);
>
>   	spin_lock_irq(&occ->list_lock);
> +
>   	clear_bit(XFR_IN_PROGRESS, &xfr->flags);
>   	list_del(&xfr->link);
>   	empty = list_empty(&occ->xfrs);
>   	canceled = test_bit(XFR_CANCELED, &xfr->flags);
> -	spin_unlock(&occ->list_lock);
> +
> +	spin_unlock_irq(&occ->list_lock);
>
>   	if (waiting)
>   		wake_up_interruptible(&client->wait);
