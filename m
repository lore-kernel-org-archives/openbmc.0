Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::241; helo=mail-qk0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NRUc9qiu"; 
 dkim-atps=neutral
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLhZS08KhzF0cd
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 07:26:23 +1100 (AEDT)
Received: by mail-qk0-x241.google.com with SMTP id a5so19694971qkg.10
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 12:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nuv+9rFEKSjjG6Jd18ENF8xEcaTw1g9ABNMgg/6x0K8=;
 b=NRUc9qiuIUc7jhQpEtgZ+gvsjM+TCLHU7RDEWONv0LsrBdzckbeiyD/UMMhO7L4KTc
 cWa5AxEQkHoOuNuqVNhUWWEUT78tvRnMdHzJkLsoRvKEDbbb9gZ/UVldaTuWVZkcBQUW
 3i10rusRCJDwrSRb0R2DBYKYufQor1AYGcMI4oPQk4x66VjI5cL/PWNnWq6aRO7ozvwW
 Q1/b7jKkFzBUqiMZdaaxpQP2yvvyk56BBS0eNen7Pfhba1SY3K+jLnnZedHf0B848GbA
 hi8Ah9TteHVAsZCnhVdX5okpqLu/rcsCvBoRqnaMwho9KYXk4yh/6mwiJ7g9eSkii1ha
 4HYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=nuv+9rFEKSjjG6Jd18ENF8xEcaTw1g9ABNMgg/6x0K8=;
 b=P/KWHzIwzRcAVVkBgEpbP2Fm30SZn6DbWhodh5jnD+/mWyauPvSGJ9K3CJsyVzz2Ku
 t6N65+i0B0NtEcKAuxeRU5VB3lB6wUrwmrkaTxTlxal1OBnqmqYlqKbwec7YZ5Cngvw3
 hzz/Wg9mKp9emeSDhlFr/SIMxkQIT7HNYBM7DLateGWxmzYVqwfdLaM5oSF0sQdoXsR9
 X/xKVXf5aHDGT1WA8SqAGYN0UG+DWm3AzfcChP6J/4oh27IHk1RJyvQuvXyNJcX6OSSW
 UQnE2RRh3pSql7obwnD5fbodjn4nNHLhw3pSuXd3SooZirjUlunJ4OV4pQdZ0D5N+6mR
 fp/A==
X-Gm-Message-State: AKwxyteJDuYKm2yUemHEhqt9VmPkL6cDsirUDeC1Jj7b5GNVjGdm0lZx
 18q8YiGpP7DxNpoRk7C7qm0LQQuDsNS6bxn8lmQ=
X-Google-Smtp-Source: ACJfBovbzaPP/XXpvc0eM2kSK+gJwf7FcnAb5hpiW85jOx+j+IKIWTL7vcmiabg6F31fp/2oyaXq7nwOJBNzFhT0tNw=
X-Received: by 10.55.181.4 with SMTP id e4mr45517994qkf.317.1516134381122;
 Tue, 16 Jan 2018 12:26:21 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Tue, 16 Jan 2018 12:26:00 -0800 (PST)
In-Reply-To: <20171220030251.19337-1-sam@mendozajonas.com>
References: <20171220030251.19337-1-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Jan 2018 14:26:00 -0600
X-Google-Sender-Auth: 3RTAUdf6Cuv6grly5FHh5ENb6Pk
Message-ID: <CACPK8XfAsU7_dwFoOaaD5v+GevUj=WUZo5k8eZZfORowsFrZuA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] net/ncsi: Don't take any action on HNCDSC
 AEN
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 16 Jan 2018 20:26:24 -0000

On Tue, Dec 19, 2017 at 9:02 PM, Samuel Mendoza-Jonas
<sam@mendozajonas.com> wrote:
> The current HNCDSC handler takes the status flag from the AEN packet and
> will update or change the current channel based on this flag and the
> current channel status.
>
> However the flag from the HNCDSC packet merely represents the host link
> state. While the state of the host interface is potentially interesting
> information it should not affect the state of the NCSI link. Indeed the
> NCSI specification makes no mention of any recommended action related to
> the host network controller driver state.
>
> Update the HNCDSC handler to record the host network driver status but
> take no other action.
>
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> Acked-by: Jeremy Kerr <jk@ozlabs.org>
> Signed-off-by: David S. Miller <davem@davemloft.net>
> (cherry picked from commit 75e8e15635e08f2598ecd20f4f71f4d043dd6e68)

Applied to dev-4.13.

I think we discussed this and decided it was not required for dev-4.10?

Cheers,

Joel

> ---
>  net/ncsi/ncsi-aen.c | 35 +++--------------------------------
>  1 file changed, 3 insertions(+), 32 deletions(-)
>
> diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
> index 67e708e98ccf..e7b05de1e6d1 100644
> --- a/net/ncsi/ncsi-aen.c
> +++ b/net/ncsi/ncsi-aen.c
> @@ -143,43 +143,14 @@ static int ncsi_aen_handler_hncdsc(struct ncsi_dev_priv *ndp,
>         if (!nc)
>                 return -ENODEV;
>
> -       /* If the channel is active one, we need reconfigure it */
>         spin_lock_irqsave(&nc->lock, flags);
>         ncm = &nc->modes[NCSI_MODE_LINK];
>         hncdsc = (struct ncsi_aen_hncdsc_pkt *)h;
>         ncm->data[3] = ntohl(hncdsc->status);
> -       netdev_info(ndp->ndev.dev, "NCSI: HNCDSC AEN - channel %u state %s\n",
> -                   nc->id, ncm->data[3] & 0x3 ? "up" : "down");
> -       if (!list_empty(&nc->link) ||
> -           nc->state != NCSI_CHANNEL_ACTIVE) {
> -               spin_unlock_irqrestore(&nc->lock, flags);
> -               return 0;
> -       }
> -
> -       spin_unlock_irqrestore(&nc->lock, flags);
> -       if (!(ndp->flags & NCSI_DEV_HWA) && !(ncm->data[3] & 0x1))
> -               ndp->flags |= NCSI_DEV_RESHUFFLE;
> -
> -       /* If this channel is the active one and the link doesn't
> -        * work, we have to choose another channel to be active one.
> -        * The logic here is exactly similar to what we do when link
> -        * is down on the active channel.
> -        *
> -        * On the other hand, we need configure it when host driver
> -        * state on the active channel becomes ready.
> -        */
> -       ncsi_stop_channel_monitor(nc);
> -
> -       spin_lock_irqsave(&nc->lock, flags);
> -       nc->state = (ncm->data[3] & 0x1) ? NCSI_CHANNEL_INACTIVE :
> -                                          NCSI_CHANNEL_ACTIVE;
>         spin_unlock_irqrestore(&nc->lock, flags);
> -
> -       spin_lock_irqsave(&ndp->lock, flags);
> -       list_add_tail_rcu(&nc->link, &ndp->channel_queue);
> -       spin_unlock_irqrestore(&ndp->lock, flags);
> -
> -       ncsi_process_next_channel(ndp);
> +       netdev_printk(KERN_DEBUG, ndp->ndev.dev,
> +                     "NCSI: host driver %srunning on channel %u\n",
> +                     ncm->data[3] & 0x1 ? "" : "not ", nc->id);
>
>         return 0;
>  }
> --
> 2.15.1
>
