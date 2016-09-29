Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sl2Sv0F16zDsfl
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 15:00:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Qck/v4zd; 
 dkim-atps=neutral
Received: by mail-vk0-x242.google.com with SMTP id u196so2390366vkd.1
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 22:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=1XTPHMTk5KNYcp7YxvHIJ8JbIE82NPwCxSWsAio4PtE=;
 b=Qck/v4zdutBmabn96qFXm+tHlgYolMnAo0SaGKbbVL9l/fJ+vVwkOXrb/XTlHcPGxG
 2jZxz8v916LRos8x+NoQ2PgQrJUugp6ggaeEuICcsh8ZBHwC8TgNN9RFLN1m1nsaCdgQ
 wRzMswp/MPVZAp0VXHgdbAQP2S581+soZFCExajJry/rNRTo3qgebK4YUpxB+aJxF8Rf
 ECP71TndAZPlxUvUb6UqAHjmNTfBoWD4SCUitbXbYTG8YxMzBaku5AlHgafQBJoPzzr8
 JRr0LO0JFCLijGnNdo40XalwQFxQeVO/T43twQx5QEJWh7W0pLO2sMSn5ovC4n2ZudNm
 Ix6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=1XTPHMTk5KNYcp7YxvHIJ8JbIE82NPwCxSWsAio4PtE=;
 b=XevdIxNwe+Jquox8vzOdunryO3qciXFLgZDLYAbQcQgqJG+Oq/5FElNCdUNlW2Q2J+
 cVoOV36ordVob8SuEf316m2svhV5Kh+0JxzhMSxsJkmO+PQv7H8TGD0t4yokzUm/v+5b
 FeihvPxssxtIx7bUpGOf9acaWS8pHSuS/+6A5kroKaljUBsYrq2C9EwEM4aHkKt+JO5+
 G+PUqeIOutBkr65535+2clmT9KTqRolFgi4fh8Nv9H5CDBunvTc+BsIaTO4yZYMP/wUW
 aackqknVYWABiz0FNUhQjv2kKwTdDB8JUMzLTYvN8NMAp94sqRw1hBM4oiFI4MGurfrw
 KH0Q==
X-Gm-Message-State: AA6/9RnyYmM8X9M30AY+XP0U3/cYz0hwJOT399DQ2QArk7A4xXgOkxYfAAGcp/S8PYUPMalNc0lYgtyBFHZh+A==
X-Received: by 10.31.168.145 with SMTP id r139mr19961143vke.124.1475125229084; 
 Wed, 28 Sep 2016 22:00:29 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Wed, 28 Sep 2016 22:00:08 -0700 (PDT)
In-Reply-To: <1475113131-18048-7-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475113131-18048-7-git-send-email-gwshan@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Sep 2016 14:30:08 +0930
X-Google-Sender-Auth: Mq-GvVCkH9-qdQ72c0X6z0oMG8I
Message-ID: <CACPK8XecLY=R5NJyCJWt1n9p9JxnAq6XNTy50E2EWrw1GCjuCA@mail.gmail.com>
Subject: Re: [PATCH v2 4.7 6/8] net/ncsi: Rework the channel monitoring
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 29 Sep 2016 05:00:31 -0000

On Thu, Sep 29, 2016 at 11:08 AM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
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

Reviewed-by: Joel Stanley <joel@jms.id.au>


> ---
>  net/ncsi/internal.h    | 12 +++++++++---
>  net/ncsi/ncsi-manage.c | 46 ++++++++++++++++++++++++++--------------------
>  net/ncsi/ncsi-rsp.c    |  2 +-
>  3 files changed, 36 insertions(+), 24 deletions(-)
>
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index 26e9295..13290a7 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -187,9 +187,15 @@ struct ncsi_channel {
>         struct ncsi_channel_mode    modes[NCSI_MODE_MAX];
>         struct ncsi_channel_filter  *filters[NCSI_FILTER_MAX];
>         struct ncsi_channel_stats   stats;
> -       struct timer_list           timer;      /* Link monitor timer  */
> -       bool                        enabled;    /* Timer is enabled    */
> -       unsigned int                timeout;    /* Times of timeout    */
> +       struct {
> +               struct timer_list   timer;
> +               bool                enabled;
> +               unsigned int        state;
> +#define NCSI_CHANNEL_MONITOR_START     0
> +#define NCSI_CHANNEL_MONITOR_RETRY     1
> +#define NCSI_CHANNEL_MONITOR_WAIT      2
> +#define NCSI_CHANNEL_MONITOR_WAIT_MAX  5
> +       } monitor;
>         struct list_head            node;
>         struct list_head            link;
>  };
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index 41d6af9..1b797c9 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -164,13 +164,13 @@ static void ncsi_channel_monitor(unsigned long data)
>         struct ncsi_dev_priv *ndp = np->ndp;
>         struct ncsi_cmd_arg nca;
>         bool enabled;
> -       unsigned int timeout;
> +       unsigned int monitor_state;
>         unsigned long flags;
>         int old_state, ret;
>
>         spin_lock_irqsave(&nc->lock, flags);
> -       timeout = nc->timeout;
> -       enabled = nc->enabled;
> +       enabled = nc->monitor.enabled;
> +       monitor_state = nc->monitor.state;
>         spin_unlock_irqrestore(&nc->lock, flags);
>
>         if (!enabled || !list_empty(&nc->link))
> @@ -181,7 +181,9 @@ static void ncsi_channel_monitor(unsigned long data)
>             old_state != NCSI_CHANNEL_ACTIVE)
>                 return;
>
> -       if (!(timeout % 2)) {
> +       switch (monitor_state) {
> +       case NCSI_CHANNEL_MONITOR_START:
> +       case NCSI_CHANNEL_MONITOR_RETRY:
>                 nca.ndp = ndp;
>                 nca.package = np->id;
>                 nca.channel = nc->id;
> @@ -193,14 +195,18 @@ static void ncsi_channel_monitor(unsigned long data)
>                                    ret);
>                         return;
>                 }
> -       }
>
> -       if (timeout + 1 >= 3) {
> +               break;
> +       case NCSI_CHANNEL_MONITOR_WAIT ... NCSI_CHANNEL_MONITOR_WAIT_MAX:
> +               break;
> +       default:
>                 if (!(ndp->flags & NCSI_DEV_HWA) &&
> -                   old_state == NCSI_CHANNEL_ACTIVE)
> +                   old_state == NCSI_CHANNEL_ACTIVE) {
>                         ncsi_report_link(ndp, true);
> +                       ndp->flags |= NCSI_DEV_RESHUFFLE;
> +               }
>
> -               WRITE_ONCE(nc->state, NCSI_CHANNEL_INACTIVE);
> +               WRITE_ONCE(nc->state, NCSI_CHANNEL_ACTIVE);
>                 spin_lock_irqsave(&ndp->lock, flags);
>                 list_add_tail_rcu(&nc->link, &ndp->channel_queue);
>                 spin_unlock_irqrestore(&ndp->lock, flags);
> @@ -209,10 +215,9 @@ static void ncsi_channel_monitor(unsigned long data)
>         }
>
>         spin_lock_irqsave(&nc->lock, flags);
> -       nc->timeout = timeout + 1;
> -       nc->enabled = true;
> +       nc->monitor.state++;
>         spin_unlock_irqrestore(&nc->lock, flags);
> -       mod_timer(&nc->timer, jiffies + HZ * (1 << (nc->timeout / 2)));
> +       mod_timer(&nc->monitor.timer, jiffies + HZ);
>  }
>
>  void ncsi_start_channel_monitor(struct ncsi_channel *nc)
> @@ -220,12 +225,12 @@ void ncsi_start_channel_monitor(struct ncsi_channel *nc)
>         unsigned long flags;
>
>         spin_lock_irqsave(&nc->lock, flags);
> -       WARN_ON_ONCE(nc->enabled);
> -       nc->timeout = 0;
> -       nc->enabled = true;
> +       WARN_ON_ONCE(nc->monitor.enabled);
> +       nc->monitor.enabled = true;
> +       nc->monitor.state = NCSI_CHANNEL_MONITOR_START;
>         spin_unlock_irqrestore(&nc->lock, flags);
>
> -       mod_timer(&nc->timer, jiffies + HZ * (1 << (nc->timeout / 2)));
> +       mod_timer(&nc->monitor.timer, jiffies + HZ);
>  }
>
>  void ncsi_stop_channel_monitor(struct ncsi_channel *nc)
> @@ -233,14 +238,14 @@ void ncsi_stop_channel_monitor(struct ncsi_channel *nc)
>         unsigned long flags;
>
>         spin_lock_irqsave(&nc->lock, flags);
> -       if (!nc->enabled) {
> +       if (!nc->monitor.enabled) {
>                 spin_unlock_irqrestore(&nc->lock, flags);
>                 return;
>         }
> -       nc->enabled = false;
> +       nc->monitor.enabled = false;
>         spin_unlock_irqrestore(&nc->lock, flags);
>
> -       del_timer_sync(&nc->timer);
> +       del_timer_sync(&nc->monitor.timer);
>  }
>
>  struct ncsi_channel *ncsi_find_channel(struct ncsi_package *np,
> @@ -269,8 +274,9 @@ struct ncsi_channel *ncsi_add_channel(struct ncsi_package *np, unsigned char id)
>         nc->id = id;
>         nc->package = np;
>         WRITE_ONCE(nc->state, NCSI_CHANNEL_INACTIVE);
> -       nc->enabled = false;
> -       setup_timer(&nc->timer, ncsi_channel_monitor, (unsigned long)nc);
> +       nc->monitor.enabled = false;
> +       setup_timer(&nc->monitor.timer,
> +                   ncsi_channel_monitor, (unsigned long)nc);
>         spin_lock_init(&nc->lock);
>         INIT_LIST_HEAD(&nc->link);
>         for (index = 0; index < NCSI_CAP_MAX; index++)
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index 5143490..1618eda 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -315,7 +315,7 @@ static int ncsi_rsp_handler_gls(struct ncsi_request *nr)
>
>         /* Reset the channel monitor if it has been enabled */
>         spin_lock_irqsave(&nc->lock, flags);
> -       nc->timeout = 0;
> +       nc->monitor.state = NCSI_CHANNEL_MONITOR_START;
>         spin_unlock_irqrestore(&nc->lock, flags);
>
>         return 0;
> --
> 2.1.0
>
