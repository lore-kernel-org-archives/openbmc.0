Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8QkJ26g0zDvPX
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 11:26:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=LTGiuHnj; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id a136so3057410pfa.0
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 17:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=message-id:subject:from:to:date:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cdlIE9/sikxzfdG9831wcORlEXeA2DrlozpJ0k0hVJc=;
 b=LTGiuHnjfJP1p0igrMJgDdUjnmDXh5t96vW3wCwkLaZRnfTepS9PrVEoZrfyvCcNph
 t2dz7dqUSToNzvqHPoRZFnVyG/nhZ5vQo+yteT8MnPg6NvQC0Kc9vVDRFbVCEkHqcRAi
 HkKoP95hKYkct2cme6y13rqtUCkg14RaRBTNmcCWvl5IG3x4E4aATxbqCn478hPkeJYi
 JGwOJ3xZe1wGK6RTdGOqYMtKeYqbtWjgdTXL/Hsm3f40+2iL1Q5EOzbeFae1DvOWPH2v
 4o7Gqg+QkMc+0rlDDijvImPgnOs3Hc2GWNZsfQf6c11PS+lGniwo6MIS27d1QhD+MAbV
 A0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cdlIE9/sikxzfdG9831wcORlEXeA2DrlozpJ0k0hVJc=;
 b=BpNeEj1nTBE9qLIPqZ34+ogpCRxDahEV+yX4uSJmSRH3l6uPDYUxve9p1/AzmJUdH8
 rXhSd0De2DKFI+gtRsNAuUyYS1ndH23KCD4FJCAF3y+bjnnDJzEH/myVLsl/8g39X4Uo
 wR8tlp2ppbNo1gwpO6Pa7JoYQF/raqSMYCgWndwqMhTLDPhnTOZUcGPYBzvWSFuzsFeh
 bbZrzD+VweHGWTi5GwwPdxxLZ3ekf6kBJ43zhMBmoW25eBpqZD0ElhZVUAF7899OckCL
 Vt7rH2h6Q8OqcHz6zjzEaRHLzboFmBk1my7w/9qyMAQMCpPbyKkREZUF9rNBQDtlN/bV
 Uv6g==
X-Gm-Message-State: ABUngvetpO2BPr0cP8Du2M6gsc2PzkEbGtf+i9NqbXLC1wioPrneLYGKppWXIpVDU34oSg==
X-Received: by 10.99.216.21 with SMTP id b21mr9811800pgh.159.1478132774357;
 Wed, 02 Nov 2016 17:26:14 -0700 (PDT)
Received: from cyril.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id lf4sm7405367pab.28.2016.11.02.17.26.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Nov 2016 17:26:13 -0700 (PDT)
Message-ID: <1478132769.728.3.camel@gmail.com>
Subject: Re: [PATCH linux dev-4.7 7/8] ipmi: maintain a request expiry list
From: Cyril Bur <cyrilbur@gmail.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Thu, 03 Nov 2016 11:26:09 +1100
In-Reply-To: <1477465067-19034-8-git-send-email-clg@kaod.org>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <1477465067-19034-8-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 03 Nov 2016 00:26:16 -0000

On Wed, 2016-10-26 at 08:57 +0200, Cédric Le Goater wrote:
> Regarding the response expiration handling, the IPMI spec says :
> 
>    The BMC must not return a given response once the corresponding
>    Request-to-Response interval has passed. The BMC can ensure this
>    by maintaining its own internal list of outstanding requests
> through
>    the interface. The BMC could age and expire the entries in the
> list
>    by expiring the entries at an interval that is somewhat shorter
> than
>    the specified Request-to-Response interval....
> 
> To handle such case, we maintain list of received requests using the
> seq number of the BT message to identify them. The list is updated
> each time a request is received and a response is sent. The
> expiration
> of the reponses is handled at each updates but also with a timer.
> 

I agree that the BMC kernel is most logical place to do this, at the
moment btbridged does attempt something similar no?

Should we patch btbridged to not? Should I least remove duplicated
logic? 

> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  drivers/char/ipmi/bt-bmc.c | 132
> +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 132 insertions(+)
> 
> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> index b49e61320952..228ecdb689de 100644
> --- a/drivers/char/ipmi/bt-bmc.c
> +++ b/drivers/char/ipmi/bt-bmc.c
> @@ -17,6 +17,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/poll.h>
>  #include <linux/sched.h>
> +#include <linux/slab.h>
>  #include <linux/timer.h>
>  
>  /*
> @@ -57,6 +58,15 @@
>  
>  #define BT_BMC_BUFFER_SIZE 256
>  
> +#define BT_BMC_RESPONSE_TIME	5 /* seconds */
> +
> +struct ipmi_request {
> +	struct list_head list;
> +
> +	u8 seq;
> +	unsigned long expires;
> +};
> +
>  struct bt_bmc {
>  	struct device		dev;
>  	struct miscdevice	miscdev;
> @@ -65,6 +75,11 @@ struct bt_bmc {
>  	wait_queue_head_t	queue;
>  	struct timer_list	poll_timer;
>  	struct mutex		mutex;
> +
> +	unsigned int		response_time;
> +	struct timer_list	requests_timer;
> +	spinlock_t              requests_lock;
> +	struct list_head        requests;
>  };
>  
>  static atomic_t open_count = ATOMIC_INIT(0);
> @@ -163,6 +178,94 @@ static int bt_bmc_open(struct inode *inode,
> struct file *file)
>  }
>  
>  /*
> + * lock should be held
> + */
> +static void drop_expired_requests(struct bt_bmc *bt_bmc)
> +{
> +	unsigned long flags = 0;
> +	struct ipmi_request *req, *next;
> +	unsigned long next_expires = 0;
> +	int start_timer = 0;
> +
> +	spin_lock_irqsave(&bt_bmc->requests_lock, flags);
> +	list_for_each_entry_safe(req, next, &bt_bmc->requests, list)
> {
> +		if (time_after_eq(jiffies, req->expires)) {
> +			pr_warn("BT: request seq:%d has expired.
> dropping\n",
> +				req->seq);
> +			list_del(&req->list);
> +			kfree(req);
> +			continue;
> +		}
> +		if (!start_timer) {
> +			start_timer = 1;
> +			next_expires = req->expires;
> +		} else {
> +			next_expires = min(next_expires, req-
> >expires);
> +		}
> +	}
> +	spin_unlock_irqrestore(&bt_bmc->requests_lock, flags);
> +
> +	/* and possibly restart */
> +	if (start_timer)
> +		mod_timer(&bt_bmc->requests_timer, next_expires);
> +}
> +
> +static void requests_timer(unsigned long data)
> +{
> +	struct bt_bmc *bt_bmc = (void *)data;
> +
> +	drop_expired_requests(bt_bmc);
> +}
> +
> +static int bt_bmc_add_request(struct bt_bmc *bt_bmc, u8 seq)
> +{
> +	struct ipmi_request *req;
> +
> +	req = kmalloc(sizeof(*req), GFP_KERNEL);
> +	if (!req)
> +		return -ENOMEM;
> +
> +	req->seq = seq;
> +	req->expires = jiffies +
> +		msecs_to_jiffies(bt_bmc->response_time * 1000);
> +
> +	spin_lock(&bt_bmc->requests_lock);
> +	list_add(&req->list, &bt_bmc->requests);
> +	spin_unlock(&bt_bmc->requests_lock);
> +
> +	drop_expired_requests(bt_bmc);
> +	return 0;
> +}
> +
> +static int bt_bmc_remove_request(struct bt_bmc *bt_bmc, u8 seq)
> +{
> +	struct ipmi_request *req, *next;
> +	int ret = -EBADRQC; /* Invalid request code */
> +
> +	spin_lock(&bt_bmc->requests_lock);
> +	list_for_each_entry_safe(req, next, &bt_bmc->requests, list)
> {
> +		/*
> +		 * The sequence number should be unique, so remove
> the
> +		 * first matching request found. If there are
> others,
> +		 * they should expire
> +		 */
> +		if (req->seq == seq) {
> +			list_del(&req->list);
> +			kfree(req);
> +			ret = 0;
> +			break;
> +		}
> +	}
> +	spin_unlock(&bt_bmc->requests_lock);
> +
> +	if (ret)
> +		pr_warn("BT: request seq:%d is invalid\n", seq);
> +
> +	drop_expired_requests(bt_bmc);
> +	return ret;
> +}
> +
> +/*
>   * The BT (Block Transfer) interface means that entire messages are
>   * buffered by the host before a notification is sent to the BMC
> that
>   * there is data to be read. The first byte is the length and the
> @@ -231,6 +334,13 @@ static ssize_t bt_bmc_read(struct file *file,
> char __user *buf,
>  		len_byte = 0;
>  	}
>  
> +	if (ret > 0) {
> +		int ret2 = bt_bmc_add_request(bt_bmc, kbuffer[2]);
> +
> +		if (ret2)
> +			ret = ret2;
> +	}
> +
>  	clr_b_busy(bt_bmc);
>  
>  out_unlock:
> @@ -283,12 +393,20 @@ static ssize_t bt_bmc_write(struct file *file,
> const char __user *buf,
>  	clr_wr_ptr(bt_bmc);
>  
>  	while (count) {
> +		int ret2;
> +
>  		nwritten = min_t(ssize_t, count, sizeof(kbuffer));
>  		if (copy_from_user(&kbuffer, buf, nwritten)) {
>  			ret = -EFAULT;
>  			break;
>  		}
>  
> +		ret2 = bt_bmc_remove_request(bt_bmc, kbuffer[2]);
> +		if (ret2) {
> +			ret = ret2;
> +			break;
> +		}
> +
>  		bt_writen(bt_bmc, kbuffer, nwritten);
>  
>  		count -= nwritten;
> @@ -438,6 +556,8 @@ static int bt_bmc_probe(struct platform_device
> *pdev)
>  
>  	mutex_init(&bt_bmc->mutex);
>  	init_waitqueue_head(&bt_bmc->queue);
> +	INIT_LIST_HEAD(&bt_bmc->requests);
> +	spin_lock_init(&bt_bmc->requests_lock);
>  
>  	bt_bmc->miscdev.minor	= MISC_DYNAMIC_MINOR,
>  		bt_bmc->miscdev.name	= DEVICE_NAME,
> @@ -451,6 +571,8 @@ static int bt_bmc_probe(struct platform_device
> *pdev)
>  
>  	bt_bmc_config_irq(bt_bmc, pdev);
>  
> +	bt_bmc->response_time = BT_BMC_RESPONSE_TIME;
> +
>  	if (bt_bmc->irq) {
>  		dev_info(dev, "Using IRQ %d\n", bt_bmc->irq);
>  	} else {
> @@ -468,6 +590,9 @@ static int bt_bmc_probe(struct platform_device
> *pdev)
>  		  BT_CR0_ENABLE_IBT,
>  		  bt_bmc->base + BT_CR0);
>  
> +	setup_timer(&bt_bmc->requests_timer, requests_timer,
> +		    (unsigned long)bt_bmc);
> +
>  	clr_b_busy(bt_bmc);
>  
>  	return 0;
> @@ -476,10 +601,17 @@ static int bt_bmc_probe(struct platform_device
> *pdev)
>  static int bt_bmc_remove(struct platform_device *pdev)
>  {
>  	struct bt_bmc *bt_bmc = dev_get_drvdata(&pdev->dev);
> +	struct ipmi_request *req, *next;
>  
>  	misc_deregister(&bt_bmc->miscdev);
>  	if (!bt_bmc->irq)
>  		del_timer_sync(&bt_bmc->poll_timer);
> +
> +	del_timer_sync(&bt_bmc->requests_timer);
> +	list_for_each_entry_safe(req, next, &bt_bmc->requests, list)
> {
> +		list_del(&req->list);
> +		kfree(req);
> +	}
>  	return 0;
>  }
>  
