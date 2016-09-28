Return-Path: <joel.stan@gmail.com>
Received: from mail-pa0-x242.google.com (mail-pa0-x242.google.com
 [IPv6:2607:f8b0:400e:c03::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skR443F2WzDrXg
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 15:25:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=TKfwWAhK; 
 dkim-atps=neutral
Received: by mail-pa0-x242.google.com with SMTP id r9so919291paz.1
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 22:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fs5Cq0cRzeFtdynmn5Zo9lHMWlwo9OF1OFW9H7gYLI0=;
 b=TKfwWAhKN015NlhTOP6FaiKf2uZB0ywRftGOeEClrX5X6cOnKcakXUhEmoaNYLNkh3
 1jACZ4ka57S6WJdfoAT8rEs4jsplklEwcOb43rh7CW8iV9fxQm1dNw14X3IH1AFuFMUv
 lVXucWio1Ya0mHORNx/BfedREyICFbGg1e+PimN9/ytfCwqA+ZKpTdRFRk0YUa5ez+Xb
 +MaM+FDVQ+gObTsX/naVx7whfONaO6AyGTCBygeBdVbpb1bDz9DbM0cpRRnq42AER2sO
 Gzmxx8SmaOdx+s3IXLiK47uPuMDcuPtMBV4mz07x97FSEY8MjmL0BXx5EY+ZM6QTLIhN
 2BuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fs5Cq0cRzeFtdynmn5Zo9lHMWlwo9OF1OFW9H7gYLI0=;
 b=VKCqw75af4CYB4M9urlYA6c+dNZn+ryoO1k6tRKdRE7eS2jpgrQzzniLwvVr+71cVN
 OCtCF/cyvqNG9HC3ZMqrpYBUwyIxYzOqVP4V5AwJHmBg2pz7IJkVKGe6bscLL6HAzsqb
 h4uK0SjaYDBjB8+RvayVkObmrxP8WfKwaOdOfGnrtmnyGeCBlFp5o+pTIrabxeQiHvQD
 ffwVbKmpOUJ5cIz/5UfXtGCPilxtiCzM4frU1NIfsz+l0tOJ1N+5cBL35Uz6b9A6Wzo0
 u1UWmpecuDOUHIFG26Neuw1zTADlzc8YvUlZ9fxXToby4X2TlClYS3PskoXLx3UCpZje
 NyMg==
X-Gm-Message-State: AA6/9Rk1qeT5qHMsDxdDQJBdSpKmA7PDvVfye04JkbUaaJ2TwnGs/cHHDErBR/Ia3BYQcw==
X-Received: by 10.66.25.199 with SMTP id e7mr36183288pag.90.1475040322828;
 Tue, 27 Sep 2016 22:25:22 -0700 (PDT)
Received: from aurora152 ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id p128sm8683266pfg.38.2016.09.27.22.25.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Sep 2016 22:25:22 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1475040310.9493.2.camel@jms.id.au>
Subject: Re: [PATCH v4.7 1/7] net/ncsi: Avoid unused-value warning
From: Joel Stanley <joel@jms.id.au>
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Date: Wed, 28 Sep 2016 14:55:10 +0930
In-Reply-To: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 28 Sep 2016 05:25:25 -0000

On Wed, 2016-09-28 at 12:48 +1000, Gavin Shan wrote:
> xchg() is used to set NCSI channel's state in order for consistent
> access to the state. xchg()'s return value should be used. Otherwise,
> one build warning will be raised (with -Wunused-value) as below
> message
> indicates. It is reported by ia64-linux-gcc (GCC) 4.9.0.
> 
>  net/ncsi/ncsi-manage.c: In function 'ncsi_channel_monitor':
>  arch/ia64/include/uapi/asm/cmpxchg.h:56:2: warning: value computed
> is \
>  not used [-Wunused-value]
>   ((__typeof__(*(ptr))) __xchg((unsigned long) (x), (ptr),
> sizeof(*(ptr))))
>    ^
>  net/ncsi/ncsi-manage.c:202:3: note: in expansion of macro 'xchg'
>   xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
> 
> This avoids the build warning by replacing xchg() with atomic_set()
> and atomic_xchg(). atomic_read() is used to retrieve the NCSI
> channel's
> state. No functional change introduced.
> 
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
>  net/ncsi/internal.h    |  2 +-
>  net/ncsi/ncsi-aen.c    | 17 ++++++++++-------
>  net/ncsi/ncsi-manage.c | 36 ++++++++++++++++++++----------------
>  net/ncsi/ncsi-rsp.c    |  4 ++--
>  4 files changed, 33 insertions(+), 26 deletions(-)
> 
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index 33738c0..549846b 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -175,7 +175,7 @@ struct ncsi_package;
>  
>  struct ncsi_channel {
>  	unsigned char               id;
> -	int                         state;
> +	atomic_t                    state;
>  #define NCSI_CHANNEL_INACTIVE		1
>  #define NCSI_CHANNEL_ACTIVE		2
>  #define NCSI_CHANNEL_INVISIBLE		3
> diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
> index d463468..77303da 100644
> --- a/net/ncsi/ncsi-aen.c
> +++ b/net/ncsi/ncsi-aen.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/atomic.h>
>  #include <linux/netdevice.h>
>  #include <linux/skbuff.h>
>  
> @@ -55,6 +56,7 @@ static int ncsi_aen_handler_lsc(struct
> ncsi_dev_priv *ndp,
>  	struct ncsi_channel_mode *ncm;
>  	unsigned long old_data;
>  	unsigned long flags;
> +	int state;
>  
>  	/* Find the NCSI channel */
>  	ncsi_find_package_and_channel(ndp, h->common.channel, NULL,
> &nc);
> @@ -70,12 +72,13 @@ static int ncsi_aen_handler_lsc(struct
> ncsi_dev_priv *ndp,
>  	if (!((old_data ^ ncm->data[2]) & 0x1) ||
>  	    !list_empty(&nc->link))
>  		return 0;
> -	if (!(nc->state == NCSI_CHANNEL_INACTIVE && (ncm->data[2] &
> 0x1)) &&
> -	    !(nc->state == NCSI_CHANNEL_ACTIVE && !(ncm->data[2] &
> 0x1)))
> +
> +	state = atomic_read(&nc->state);

It's not clear that state needs to have atomic access. Can you explain
why you made the change?

Would leaving it as an int and using READ_ONCE() be sufficient?

> +	if (!(state == NCSI_CHANNEL_INACTIVE && (ncm->data[2] &
> 0x1)) &&
> +	    !(state == NCSI_CHANNEL_ACTIVE && !(ncm->data[2] &
> 0x1)))
>  		return 0;
>  
> -	if (!(ndp->flags & NCSI_DEV_HWA) &&
> -	    nc->state == NCSI_CHANNEL_ACTIVE)
> +	if (!(ndp->flags & NCSI_DEV_HWA) && state ==
> NCSI_CHANNEL_ACTIVE)
>  		ndp->flags |= NCSI_DEV_RESHUFFLE;
>  
>  	ncsi_stop_channel_monitor(nc);
> @@ -98,12 +101,12 @@ static int ncsi_aen_handler_cr(struct
> ncsi_dev_priv *ndp,
>  		return -ENODEV;
>  
>  	if (!list_empty(&nc->link) ||
> -	    nc->state != NCSI_CHANNEL_ACTIVE)
> +	    atomic_read(&nc->state) != NCSI_CHANNEL_ACTIVE)
>  		return 0;
>  
>  	ncsi_stop_channel_monitor(nc);
>  	spin_lock_irqsave(&ndp->lock, flags);
> -	xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
> +	atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
>  	list_add_tail_rcu(&nc->link, &ndp->channel_queue);
>  	spin_unlock_irqrestore(&ndp->lock, flags);
>  
> @@ -128,7 +131,7 @@ static int ncsi_aen_handler_hncdsc(struct
> ncsi_dev_priv *ndp,
>  	hncdsc = (struct ncsi_aen_hncdsc_pkt *)h;
>  	ncm->data[3] = ntohl(hncdsc->status);
>  	if (!list_empty(&nc->link) ||
> -	    nc->state != NCSI_CHANNEL_ACTIVE ||
> +	    atomic_read(&nc->state) != NCSI_CHANNEL_ACTIVE ||
>  	    (ncm->data[3] & 0x1))
>  		return 0;
>  
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index ef017b8..b325c1d 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/atomic.h>
>  #include <linux/netdevice.h>
>  #include <linux/skbuff.h>
>  #include <linux/netlink.h>
> @@ -143,7 +144,7 @@ static void ncsi_report_link(struct ncsi_dev_priv
> *ndp, bool force_down)
>  	NCSI_FOR_EACH_PACKAGE(ndp, np) {
>  		NCSI_FOR_EACH_CHANNEL(np, nc) {
>  			if (!list_empty(&nc->link) ||
> -			    nc->state != NCSI_CHANNEL_ACTIVE)
> +			    atomic_read(&nc->state) !=
> NCSI_CHANNEL_ACTIVE)
>  				continue;
>  
>  			if (nc->modes[NCSI_MODE_LINK].data[2] & 0x1)
> {
> @@ -166,7 +167,7 @@ static void ncsi_channel_monitor(unsigned long
> data)
>  	bool enabled;
>  	unsigned int timeout;
>  	unsigned long flags;
> -	int ret;
> +	int state, ret;
>  
>  	spin_lock_irqsave(&nc->lock, flags);
>  	timeout = nc->timeout;
> @@ -175,8 +176,9 @@ static void ncsi_channel_monitor(unsigned long
> data)
>  
>  	if (!enabled || !list_empty(&nc->link))
>  		return;
> -	if (nc->state != NCSI_CHANNEL_INACTIVE &&
> -	    nc->state != NCSI_CHANNEL_ACTIVE)
> +
> +	state = atomic_read(&nc->state);
> +	if (state != NCSI_CHANNEL_INACTIVE && state !=
> NCSI_CHANNEL_ACTIVE)
>  		return;
>  
>  	if (!(timeout % 2)) {
> @@ -195,11 +197,11 @@ static void ncsi_channel_monitor(unsigned long
> data)
>  
>  	if (timeout + 1 >= 3) {
>  		if (!(ndp->flags & NCSI_DEV_HWA) &&
> -		    nc->state == NCSI_CHANNEL_ACTIVE)
> +		    state == NCSI_CHANNEL_ACTIVE)
>  			ncsi_report_link(ndp, true);
>  
>  		spin_lock_irqsave(&ndp->lock, flags);
> -		xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
> +		atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
>  		list_add_tail_rcu(&nc->link, &ndp->channel_queue);
>  		spin_unlock_irqrestore(&ndp->lock, flags);
>  		ncsi_process_next_channel(ndp);
> @@ -266,7 +268,7 @@ struct ncsi_channel *ncsi_add_channel(struct
> ncsi_package *np, unsigned char id)
>  
>  	nc->id = id;
>  	nc->package = np;
> -	nc->state = NCSI_CHANNEL_INACTIVE;
> +	atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
>  	nc->enabled = false;
>  	setup_timer(&nc->timer, ncsi_channel_monitor, (unsigned
> long)nc);
>  	spin_lock_init(&nc->lock);
> @@ -309,7 +311,7 @@ static void ncsi_remove_channel(struct
> ncsi_channel *nc)
>  		kfree(ncf);
>  	}
>  
> -	nc->state = NCSI_CHANNEL_INACTIVE;
> +	atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
>  	spin_unlock_irqrestore(&nc->lock, flags);
>  	ncsi_stop_channel_monitor(nc);
>  
> @@ -556,7 +558,7 @@ static void ncsi_suspend_channel(struct
> ncsi_dev_priv *ndp)
>  
>  		break;
>  	case ncsi_dev_state_suspend_done:
> -		xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
> +		atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
>  		ncsi_process_next_channel(ndp);
>  
>  		break;
> @@ -676,9 +678,9 @@ static void ncsi_configure_channel(struct
> ncsi_dev_priv *ndp)
>  		break;
>  	case ncsi_dev_state_config_done:
>  		if (nc->modes[NCSI_MODE_LINK].data[2] & 0x1)
> -			xchg(&nc->state, NCSI_CHANNEL_ACTIVE);
> +			atomic_set(&nc->state, NCSI_CHANNEL_ACTIVE);
>  		else
> -			xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
> +			atomic_set(&nc->state,
> NCSI_CHANNEL_INACTIVE);
>  
>  		ncsi_start_channel_monitor(nc);
>  		ncsi_process_next_channel(ndp);
> @@ -708,7 +710,7 @@ static int ncsi_choose_active_channel(struct
> ncsi_dev_priv *ndp)
>  	NCSI_FOR_EACH_PACKAGE(ndp, np) {
>  		NCSI_FOR_EACH_CHANNEL(np, nc) {
>  			if (!list_empty(&nc->link) ||
> -			    nc->state != NCSI_CHANNEL_INACTIVE)
> +			    atomic_read(&nc->state) !=
> NCSI_CHANNEL_INACTIVE)
>  				continue;
>  
>  			if (!found)
> @@ -770,7 +772,8 @@ static int ncsi_enable_hwa(struct ncsi_dev_priv
> *ndp)
>  	spin_lock_irqsave(&ndp->lock, flags);
>  	NCSI_FOR_EACH_PACKAGE(ndp, np) {
>  		NCSI_FOR_EACH_CHANNEL(np, nc) {
> -			WARN_ON_ONCE(nc->state !=
> NCSI_CHANNEL_INACTIVE ||
> +			WARN_ON_ONCE(atomic_read(&nc->state) !=
> +				     NCSI_CHANNEL_INACTIVE ||
>  				     !list_empty(&nc->link));
>  			ncsi_stop_channel_monitor(nc);
>  			list_add_tail_rcu(&nc->link, &ndp-
> >channel_queue);
> @@ -987,7 +990,7 @@ int ncsi_process_next_channel(struct
> ncsi_dev_priv *ndp)
>  		goto out;
>  	}
>  
> -	old_state = xchg(&nc->state, NCSI_CHANNEL_INVISIBLE);
> +	old_state = atomic_xchg(&nc->state, NCSI_CHANNEL_INVISIBLE);
>  	list_del_init(&nc->link);
>  
>  	spin_unlock_irqrestore(&ndp->lock, flags);
> @@ -1006,7 +1009,7 @@ int ncsi_process_next_channel(struct
> ncsi_dev_priv *ndp)
>  		break;
>  	default:
>  		netdev_err(ndp->ndev.dev, "Invalid state 0x%x on
> %d:%d\n",
> -			   nc->state, nc->package->id, nc->id);
> +			   old_state, nc->package->id, nc->id);
>  		ncsi_report_link(ndp, false);
>  		return -EINVAL;
>  	}
> @@ -1166,7 +1169,8 @@ int ncsi_start_dev(struct ncsi_dev *nd)
>  	/* Reset channel's state and start over */
>  	NCSI_FOR_EACH_PACKAGE(ndp, np) {
>  		NCSI_FOR_EACH_CHANNEL(np, nc) {
> -			old_state = xchg(&nc->state,
> NCSI_CHANNEL_INACTIVE);
> +			old_state = atomic_xchg(&nc->state,
> +						NCSI_CHANNEL_INACTIV
> E);
>  			WARN_ON_ONCE(!list_empty(&nc->link) ||
>  				     old_state ==
> NCSI_CHANNEL_INVISIBLE);
>  		}
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index af84389..54f7eed 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -123,7 +123,7 @@ static int ncsi_rsp_handler_dp(struct
> ncsi_request *nr)
>  	/* Change state of all channels attached to the package */
>  	NCSI_FOR_EACH_CHANNEL(np, nc) {
>  		spin_lock_irqsave(&nc->lock, flags);
> -		nc->state = NCSI_CHANNEL_INACTIVE;
> +		atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
>  		spin_unlock_irqrestore(&nc->lock, flags);

We don't need both the atomic_set and the spin locks. One or the other
should be enough.

>  	}
>  
> @@ -195,7 +195,7 @@ static int ncsi_rsp_handler_rc(struct
> ncsi_request *nr)
>  
>  	/* Update state for the specified channel */
>  	spin_lock_irqsave(&nc->lock, flags);
> -	nc->state = NCSI_CHANNEL_INACTIVE;
> +	atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
>  	spin_unlock_irqrestore(&nc->lock, flags);
>  
>  	return 0;
> 
