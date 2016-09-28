Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skRdK6tgwzDrXJ
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 15:50:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=wnx5SE3G; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id 6so1670154pfl.2
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 22:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bAusAqOCsv2b4C2RFsY0JsLUlwY7a1og+5ysEnEQEyQ=;
 b=wnx5SE3GIpxRIaEy5YsObhYS2XPhQQTuAqQkFjxw0JiiyTZBjlzRuOZExr8n13a25V
 4xhhQNOsSk8ZAJ/ichOHec3yMXAeWGTMLgNu50ZPZD5UOGLyIZPItpBZ5iX0aU2NRDdf
 LvHcWAVruo48803SYHPlR2kJzCga6Ec9t3JWede+qK2FB3+JZpXvIDkllkySdExQi49w
 v3S2KbMLfBwB2UeZGcXOLPfUcnqa9QgFhcwsxTJapyvAXdWmGo+DlJ7Jf4iHJsO6ugud
 WCmwrcNhc8cp1wQ1G7To6iGKQMjWhEGS+eEBw7OnhjBZO8kV1nOn2lAqY0JVHZbZefkU
 KFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bAusAqOCsv2b4C2RFsY0JsLUlwY7a1og+5ysEnEQEyQ=;
 b=DrXaxL97Eb/sZvzUb0cJVt2gf8xzHEyKiC3Yh9Y5DSsv0oIp0frOwmzLNhQl7eyeuy
 8PklgKRvoWHX+ksLDLhcwU99rKTyzgyGtUahJVvI6jpQyG5ubDX9eaUaCtYrtBB09QtS
 UTj7+ulxL8lIlJe4VMEZ5+S2iwdaH+6qo9EmS36Ll0nEEobK8VYjpHRA6mn52+5TJT6T
 BhPnzO4B8AiV9AGfOdRjkwoEAM0ZNucO+/ALDGijPaadr93dKGOMvShgW0u3tIb9bUdR
 nFqLtw0PvUW5f9aE5BbDWRHGOSUuAcjlgay+Ogv57HarPFUCjdv9mACfyoTGa5wZMaF6
 TmcQ==
X-Gm-Message-State: AE9vXwPji9Go6Ld/TQBORZH4C0xM2cLaZRvFcSmVNU6qjiC6nV9mDcWm3t1iAsuVZYU9WA==
X-Received: by 10.98.129.131 with SMTP id t125mr54973564pfd.157.1475041843570; 
 Tue, 27 Sep 2016 22:50:43 -0700 (PDT)
Received: from aurora152 ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id i8sm8919615paw.25.2016.09.27.22.50.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Sep 2016 22:50:42 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1475041832.9493.11.camel@jms.id.au>
Subject: Re: [PATCH v4.7 6/7] net/ncsi: Rework the channel monitoring
From: Joel Stanley <joel@jms.id.au>
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Date: Wed, 28 Sep 2016 15:20:32 +0930
In-Reply-To: <1475030915-9525-6-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475030915-9525-6-git-send-email-gwshan@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.21.91-1ubuntu1 
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
X-List-Received-Date: Wed, 28 Sep 2016 05:50:46 -0000

On Wed, 2016-09-28 at 12:48 +1000, Gavin Shan wrote:
> The original NCSI channel monitoring was implemented based on a
> backoff algorithm: the GLS response should be received in the
> specified interval. Otherwise, the channel is regarded as dead
> and failover should be taken if current channel is an active one.
> There are several problems in the implementation: (A) On BCM5718,
> we found when the IID (Instance ID) in the GLS command packet
> changes from 255 to 1, the response corresponding to IID#1 never
> comes in. It means we cannot make the unfair judgement that the
> channel is dead when one response is missed. (B) The code's
> readability should be improved. (C) We should do failover when
> current channel is active one and the channel monitoring should
> be marked as disabled before doing failover.
> 
> This reworks the channel monitoring to address all above issues.
> The fields for channel monitoring is put into separate struct
> and the state of channel monitoring is predefined. The channel
> is regarded alive if the network controller responses to one of
> two GLS commands or both of them in 5 seconds.
> 
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
>  net/ncsi/internal.h    | 12 +++++++++---
>  net/ncsi/ncsi-manage.c | 46 ++++++++++++++++++++++++++------------
> --------
>  net/ncsi/ncsi-rsp.c    |  2 +-
>  3 files changed, 36 insertions(+), 24 deletions(-)
> 
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index a2e3af9..d9b3705 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -187,9 +187,15 @@ struct ncsi_channel {
>  	struct ncsi_channel_mode    modes[NCSI_MODE_MAX];
>  	struct ncsi_channel_filter  *filters[NCSI_FILTER_MAX];
>  	struct ncsi_channel_stats   stats;
> -	struct timer_list           timer;	/* Link monitor
> timer  */
> -	bool                        enabled;	/* Timer is
> enabled    */
> -	unsigned int                timeout;	/* Times of
> timeout    */
> +	struct {
> +		struct timer_list   timer;	/* Link monitor
> timer  */
> +		bool                enabled;	/* Timer is
> enabled    */
> +		unsigned int        state;	/* Link monitor
> state  */

These comments don't add much value.

> +#define NCSI_CHANNEL_MONITOR_START	0
> +#define NCSI_CHANNEL_MONITOR_RETRY	1
> +#define NCSI_CHANNEL_MONITOR_WAIT	2
> +#define NCSI_CHANNEL_MONITOR_WAIT_MAX	5
> +	} monitor;
>  	struct list_head            node;
>  	struct list_head            link;
>  };
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index 3019432..5813ebe 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -165,13 +165,13 @@ static void ncsi_channel_monitor(unsigned long
> data)
>  	struct ncsi_dev_priv *ndp = np->ndp;
>  	struct ncsi_cmd_arg nca;
>  	bool enabled;
> -	unsigned int timeout;
> +	unsigned int monitor_state;
>  	unsigned long flags;
>  	int state, ret;
>  
>  	spin_lock_irqsave(&nc->lock, flags);
> -	timeout = nc->timeout;
> -	enabled = nc->enabled;
> +	monitor_state = nc->monitor.state;
> +	enabled = nc->monitor.enabled;
>  	spin_unlock_irqrestore(&nc->lock, flags);
>  
>  	if (!enabled || !list_empty(&nc->link))
> @@ -181,7 +181,9 @@ static void ncsi_channel_monitor(unsigned long
> data)
>  	if (state != NCSI_CHANNEL_INACTIVE && state !=
> NCSI_CHANNEL_ACTIVE)
>  		return;
>  
> -	if (!(timeout % 2)) {
> +	switch (monitor_state) {
> +	case NCSI_CHANNEL_MONITOR_START:
> +	case NCSI_CHANNEL_MONITOR_RETRY:
>  		nca.ndp = ndp;
>  		nca.package = np->id;
>  		nca.channel = nc->id;
> @@ -193,15 +195,19 @@ static void ncsi_channel_monitor(unsigned long
> data)
>  				   ret);
>  			return;
>  		}
> -	}
>  
> -	if (timeout + 1 >= 3) {
> +		break;
> +	case NCSI_CHANNEL_MONITOR_WAIT ...
> NCSI_CHANNEL_MONITOR_WAIT_MAX:

It's not clear why you have the MAX_WAIT state if it's doing the same
thing as WAIT.

> +		break;
> +	default:
>  		if (!(ndp->flags & NCSI_DEV_HWA) &&
> -		    state == NCSI_CHANNEL_ACTIVE)
> +		    state == NCSI_CHANNEL_ACTIVE) {
>  			ncsi_report_link(ndp, true);
> +			ndp->flags |= NCSI_DEV_RESHUFFLE;
> +		}
>  
>  		spin_lock_irqsave(&ndp->lock, flags);
> -		atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
> +		atomic_set(&nc->state, NCSI_CHANNEL_ACTIVE);
>  		list_add_tail_rcu(&nc->link, &ndp->channel_queue);
>  		spin_unlock_irqrestore(&ndp->lock, flags);
>  		ncsi_process_next_channel(ndp);
> @@ -209,10 +215,9 @@ static void ncsi_channel_monitor(unsigned long
> data)
>  	}
>  
>  	spin_lock_irqsave(&nc->lock, flags);
> -	nc->timeout = timeout + 1;
> -	nc->enabled = true;
> +	nc->monitor.state++;
>  	spin_unlock_irqrestore(&nc->lock, flags);
> -	mod_timer(&nc->timer, jiffies + HZ * (1 << (nc->timeout /
> 2)));
> +	mod_timer(&nc->monitor.timer, jiffies + HZ);
>  }
>  
>  void ncsi_start_channel_monitor(struct ncsi_channel *nc)
> @@ -220,12 +225,12 @@ void ncsi_start_channel_monitor(struct
> ncsi_channel *nc)
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&nc->lock, flags);
> -	WARN_ON_ONCE(nc->enabled);
> -	nc->timeout = 0;
> -	nc->enabled = true;
> +	WARN_ON_ONCE(nc->monitor.enabled);
> +	nc->monitor.enabled = true;
> +	nc->monitor.state = NCSI_CHANNEL_MONITOR_START;
>  	spin_unlock_irqrestore(&nc->lock, flags);
>  
> -	mod_timer(&nc->timer, jiffies + HZ * (1 << (nc->timeout /
> 2)));
> +	mod_timer(&nc->monitor.timer, jiffies + HZ);
>  }
>  
>  void ncsi_stop_channel_monitor(struct ncsi_channel *nc)
> @@ -233,14 +238,14 @@ void ncsi_stop_channel_monitor(struct
> ncsi_channel *nc)
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&nc->lock, flags);
> -	if (!nc->enabled) {
> +	if (!nc->monitor.enabled) {
>  		spin_unlock_irqrestore(&nc->lock, flags);
>  		return;
>  	}
> -	nc->enabled = false;
> +	nc->monitor.enabled = false;
>  	spin_unlock_irqrestore(&nc->lock, flags);
>  
> -	del_timer_sync(&nc->timer);
> +	del_timer_sync(&nc->monitor.timer);
>  }
>  
>  struct ncsi_channel *ncsi_find_channel(struct ncsi_package *np,
> @@ -269,8 +274,9 @@ struct ncsi_channel *ncsi_add_channel(struct
> ncsi_package *np, unsigned char id)
>  	nc->id = id;
>  	nc->package = np;
>  	atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
> -	nc->enabled = false;
> -	setup_timer(&nc->timer, ncsi_channel_monitor, (unsigned
> long)nc);
> +	nc->monitor.enabled = false;
> +	setup_timer(&nc->monitor.timer,
> +		    ncsi_channel_monitor, (unsigned long)nc);
>  	spin_lock_init(&nc->lock);
>  	INIT_LIST_HEAD(&nc->link);
>  	for (index = 0; index < NCSI_CAP_MAX; index++)
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index 1429e8b..eec88c7 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -322,7 +322,7 @@ static int ncsi_rsp_handler_gls(struct
> ncsi_request *nr)
>  
>  	/* Reset the channel monitor if it has been enabled */
>  	spin_lock_irqsave(&nc->lock, flags);
> -	nc->timeout = 0;
> +	nc->monitor.state = NCSI_CHANNEL_MONITOR_START;
>  	spin_unlock_irqrestore(&nc->lock, flags);
>  
>  	return 0;
> 
