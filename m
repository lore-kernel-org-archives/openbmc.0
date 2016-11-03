Return-Path: <clg@kaod.org>
Received: from 5.mo1.mail-out.ovh.net (5.mo1.mail-out.ovh.net [178.33.45.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8fTn4hwczDvWT
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 20:16:13 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id D7F89182E3
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 10:07:04 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id B4FD53C0076;
 Thu,  3 Nov 2016 10:06:59 +0100 (CET)
Subject: Re: [PATCH linux dev-4.7 7/8] ipmi: maintain a request expiry list
To: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <1477465067-19034-8-git-send-email-clg@kaod.org>
 <1478132769.728.3.camel@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d53f2c10-4ae7-a7f6-827f-581d671341a7@kaod.org>
Date: Thu, 3 Nov 2016 10:06:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478132769.728.3.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18317828536679369683
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrkeehgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 03 Nov 2016 09:16:14 -0000

On 11/03/2016 01:26 AM, Cyril Bur wrote:
> On Wed, 2016-10-26 at 08:57 +0200, Cédric Le Goater wrote:
>> Regarding the response expiration handling, the IPMI spec says :
>>
>>    The BMC must not return a given response once the corresponding
>>    Request-to-Response interval has passed. The BMC can ensure this
>>    by maintaining its own internal list of outstanding requests
>> through
>>    the interface. The BMC could age and expire the entries in the
>> list
>>    by expiring the entries at an interval that is somewhat shorter
>> than
>>    the specified Request-to-Response interval....
>>
>> To handle such case, we maintain list of received requests using the
>> seq number of the BT message to identify them. The list is updated
>> each time a request is received and a response is sent. The
>> expiration
>> of the reponses is handled at each updates but also with a timer.
>>
> 
> I agree that the BMC kernel is most logical place to do this, at the
> moment btbridged does attempt something similar no?
>
> 
> Should we patch btbridged to not? Should I least remove duplicated
> logic? 

yes probably. Let's see what mainline says about it first. 
The patch has a minor flaw: struct ipmi_request should include 
the NetFn and Command values. Corey might ask for a resend.


More globally speaking, the patch raises the question on how we 
manage the BT interface capabilities, the in/out buffer message 
sizes, allowed retries, etc. For now, this is a bit foggy, there
are bits in the kernel, in btbridged and in phosphor-host-ipmid.

I think we should configure the driver BT capabilities when 
btbridged is started. I have sent a patch using sysfs but maybe 
we will switch to an ioctl as Joel proposed. if btbridged knows 
about the driver configuration, it should probably handle the 
"Get BT Interface Capabilities" and not phosphor-host-ipmid.


May be I should open an issue on that topic ? 

C.


>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  drivers/char/ipmi/bt-bmc.c | 132
>> +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 132 insertions(+)
>>
>> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
>> index b49e61320952..228ecdb689de 100644
>> --- a/drivers/char/ipmi/bt-bmc.c
>> +++ b/drivers/char/ipmi/bt-bmc.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/poll.h>
>>  #include <linux/sched.h>
>> +#include <linux/slab.h>
>>  #include <linux/timer.h>
>>  
>>  /*
>> @@ -57,6 +58,15 @@
>>  
>>  #define BT_BMC_BUFFER_SIZE 256
>>  
>> +#define BT_BMC_RESPONSE_TIME	5 /* seconds */
>> +
>> +struct ipmi_request {
>> +	struct list_head list;
>> +
>> +	u8 seq;
>> +	unsigned long expires;
>> +};
>> +
>>  struct bt_bmc {
>>  	struct device		dev;
>>  	struct miscdevice	miscdev;
>> @@ -65,6 +75,11 @@ struct bt_bmc {
>>  	wait_queue_head_t	queue;
>>  	struct timer_list	poll_timer;
>>  	struct mutex		mutex;
>> +
>> +	unsigned int		response_time;
>> +	struct timer_list	requests_timer;
>> +	spinlock_t              requests_lock;
>> +	struct list_head        requests;
>>  };
>>  
>>  static atomic_t open_count = ATOMIC_INIT(0);
>> @@ -163,6 +178,94 @@ static int bt_bmc_open(struct inode *inode,
>> struct file *file)
>>  }
>>  
>>  /*
>> + * lock should be held
>> + */
>> +static void drop_expired_requests(struct bt_bmc *bt_bmc)
>> +{
>> +	unsigned long flags = 0;
>> +	struct ipmi_request *req, *next;
>> +	unsigned long next_expires = 0;
>> +	int start_timer = 0;
>> +
>> +	spin_lock_irqsave(&bt_bmc->requests_lock, flags);
>> +	list_for_each_entry_safe(req, next, &bt_bmc->requests, list)
>> {
>> +		if (time_after_eq(jiffies, req->expires)) {
>> +			pr_warn("BT: request seq:%d has expired.
>> dropping\n",
>> +				req->seq);
>> +			list_del(&req->list);
>> +			kfree(req);
>> +			continue;
>> +		}
>> +		if (!start_timer) {
>> +			start_timer = 1;
>> +			next_expires = req->expires;
>> +		} else {
>> +			next_expires = min(next_expires, req-
>>> expires);
>> +		}
>> +	}
>> +	spin_unlock_irqrestore(&bt_bmc->requests_lock, flags);
>> +
>> +	/* and possibly restart */
>> +	if (start_timer)
>> +		mod_timer(&bt_bmc->requests_timer, next_expires);
>> +}
>> +
>> +static void requests_timer(unsigned long data)
>> +{
>> +	struct bt_bmc *bt_bmc = (void *)data;
>> +
>> +	drop_expired_requests(bt_bmc);
>> +}
>> +
>> +static int bt_bmc_add_request(struct bt_bmc *bt_bmc, u8 seq)
>> +{
>> +	struct ipmi_request *req;
>> +
>> +	req = kmalloc(sizeof(*req), GFP_KERNEL);
>> +	if (!req)
>> +		return -ENOMEM;
>> +
>> +	req->seq = seq;
>> +	req->expires = jiffies +
>> +		msecs_to_jiffies(bt_bmc->response_time * 1000);
>> +
>> +	spin_lock(&bt_bmc->requests_lock);
>> +	list_add(&req->list, &bt_bmc->requests);
>> +	spin_unlock(&bt_bmc->requests_lock);
>> +
>> +	drop_expired_requests(bt_bmc);
>> +	return 0;
>> +}
>> +
>> +static int bt_bmc_remove_request(struct bt_bmc *bt_bmc, u8 seq)
>> +{
>> +	struct ipmi_request *req, *next;
>> +	int ret = -EBADRQC; /* Invalid request code */
>> +
>> +	spin_lock(&bt_bmc->requests_lock);
>> +	list_for_each_entry_safe(req, next, &bt_bmc->requests, list)
>> {
>> +		/*
>> +		 * The sequence number should be unique, so remove
>> the
>> +		 * first matching request found. If there are
>> others,
>> +		 * they should expire
>> +		 */
>> +		if (req->seq == seq) {
>> +			list_del(&req->list);
>> +			kfree(req);
>> +			ret = 0;
>> +			break;
>> +		}
>> +	}
>> +	spin_unlock(&bt_bmc->requests_lock);
>> +
>> +	if (ret)
>> +		pr_warn("BT: request seq:%d is invalid\n", seq);
>> +
>> +	drop_expired_requests(bt_bmc);
>> +	return ret;
>> +}
>> +
>> +/*
>>   * The BT (Block Transfer) interface means that entire messages are
>>   * buffered by the host before a notification is sent to the BMC
>> that
>>   * there is data to be read. The first byte is the length and the
>> @@ -231,6 +334,13 @@ static ssize_t bt_bmc_read(struct file *file,
>> char __user *buf,
>>  		len_byte = 0;
>>  	}
>>  
>> +	if (ret > 0) {
>> +		int ret2 = bt_bmc_add_request(bt_bmc, kbuffer[2]);
>> +
>> +		if (ret2)
>> +			ret = ret2;
>> +	}
>> +
>>  	clr_b_busy(bt_bmc);
>>  
>>  out_unlock:
>> @@ -283,12 +393,20 @@ static ssize_t bt_bmc_write(struct file *file,
>> const char __user *buf,
>>  	clr_wr_ptr(bt_bmc);
>>  
>>  	while (count) {
>> +		int ret2;
>> +
>>  		nwritten = min_t(ssize_t, count, sizeof(kbuffer));
>>  		if (copy_from_user(&kbuffer, buf, nwritten)) {
>>  			ret = -EFAULT;
>>  			break;
>>  		}
>>  
>> +		ret2 = bt_bmc_remove_request(bt_bmc, kbuffer[2]);
>> +		if (ret2) {
>> +			ret = ret2;
>> +			break;
>> +		}
>> +
>>  		bt_writen(bt_bmc, kbuffer, nwritten);
>>  
>>  		count -= nwritten;
>> @@ -438,6 +556,8 @@ static int bt_bmc_probe(struct platform_device
>> *pdev)
>>  
>>  	mutex_init(&bt_bmc->mutex);
>>  	init_waitqueue_head(&bt_bmc->queue);
>> +	INIT_LIST_HEAD(&bt_bmc->requests);
>> +	spin_lock_init(&bt_bmc->requests_lock);
>>  
>>  	bt_bmc->miscdev.minor	= MISC_DYNAMIC_MINOR,
>>  		bt_bmc->miscdev.name	= DEVICE_NAME,
>> @@ -451,6 +571,8 @@ static int bt_bmc_probe(struct platform_device
>> *pdev)
>>  
>>  	bt_bmc_config_irq(bt_bmc, pdev);
>>  
>> +	bt_bmc->response_time = BT_BMC_RESPONSE_TIME;
>> +
>>  	if (bt_bmc->irq) {
>>  		dev_info(dev, "Using IRQ %d\n", bt_bmc->irq);
>>  	} else {
>> @@ -468,6 +590,9 @@ static int bt_bmc_probe(struct platform_device
>> *pdev)
>>  		  BT_CR0_ENABLE_IBT,
>>  		  bt_bmc->base + BT_CR0);
>>  
>> +	setup_timer(&bt_bmc->requests_timer, requests_timer,
>> +		    (unsigned long)bt_bmc);
>> +
>>  	clr_b_busy(bt_bmc);
>>  
>>  	return 0;
>> @@ -476,10 +601,17 @@ static int bt_bmc_probe(struct platform_device
>> *pdev)
>>  static int bt_bmc_remove(struct platform_device *pdev)
>>  {
>>  	struct bt_bmc *bt_bmc = dev_get_drvdata(&pdev->dev);
>> +	struct ipmi_request *req, *next;
>>  
>>  	misc_deregister(&bt_bmc->miscdev);
>>  	if (!bt_bmc->irq)
>>  		del_timer_sync(&bt_bmc->poll_timer);
>> +
>> +	del_timer_sync(&bt_bmc->requests_timer);
>> +	list_for_each_entry_safe(req, next, &bt_bmc->requests, list)
>> {
>> +		list_del(&req->list);
>> +		kfree(req);
>> +	}
>>  	return 0;
>>  }
>>  
