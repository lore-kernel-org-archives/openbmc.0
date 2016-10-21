Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0Ttk4CdRzDvWD
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 13:21:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Ed97hYYH; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id k64so9045880itb.0
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 19:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=7fVTtjcILMd4fnXDiNT7CkkgQg2Ng/m2fxjxTY/Ix8o=;
 b=Ed97hYYHiiBfWKLTsB0EBnUER4jH4Rthj0cFOY8GRREQldN2Yu12ssIJEapj/AihyG
 MIsD+tPOcJoev0cdArE3Yoa0O9+25X70wbvnfVffLNlbasIGL3wHEoE2P0dCSFw2BGU+
 G9qitwSkmQRMIvTMfFsP/HwuPcNri9yKXb7RtxyoH/MpgYzdS6jdQR22qpMJ7j6oExYS
 mGszIoA7cIMWVLP9iDXbe9RYqKnUPFb1As4EkvAoh8At0XZO9++sYOaNzByByMbd6VEp
 05i9uNCvJ78cMcufgyq9OQbM12LyeeTmV4ToffASdBQxumoRnq1VZSFo+qCy+RK9RsPb
 8Xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=7fVTtjcILMd4fnXDiNT7CkkgQg2Ng/m2fxjxTY/Ix8o=;
 b=FrIVJAAVAFNAOAhjiEOWIfbtE/DSRxI45mTTcXbfCcpYqBvMG+dldBTYYl0ZQRfbpP
 vznUpWOQzxRy1G1hYK83mHfllcDwRSotGBy1+pU6+iuvI8AxhXaeG8Ti4v1binQpnFPf
 hCeY2GwqJimuF/cbOJSJ3ocvkZGmrAgXeCg/zwhoseA7nMqnN9ue7XiT47/+dbNZSnh7
 OK1EN8x71KB69ClKK7BD3h07cji4tcBzPW4jmBZQPjwd3+Zcc1H3DLsCLARDN2rprg+o
 fodgTclsabWmYorZzZmlE26gdkiProscaotZPv+zptvmLVdbPT1tcK+n0AeYotfrXWsN
 7ghw==
X-Gm-Message-State: AA6/9RlF4+FxwJzhoT+XJh1r0h61e9NEfNQMk6fLN2V2froaQWM6JLdRRt8H2mlQMBukyNA/sWuGrAhO5VqXsg==
X-Received: by 10.202.114.216 with SMTP id p207mr9264093oic.132.1477016460281; 
 Thu, 20 Oct 2016 19:21:00 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 20 Oct 2016 19:20:39 -0700 (PDT)
In-Reply-To: <1477005092-20632-4-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1477005092-20632-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1477005092-20632-4-git-send-email-gwshan@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Oct 2016 12:50:39 +1030
X-Google-Sender-Auth: NKB_Hqq7Gsp0wXqejGLXnL3nARg
Message-ID: <CACPK8Xf2qQ601=tSdSR3OgcQpV=a9=orxvjxtSY5EQ+UdRVjEA@mail.gmail.com>
Subject: Re: [PATCH 4.7 3/4] net/ncsi: Choose hot channel as active one if
 necessary
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
X-List-Received-Date: Fri, 21 Oct 2016 02:21:03 -0000

On Fri, Oct 21, 2016 at 9:41 AM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> The issue was found on BCM5718 which has two NCSI channels in one
> package: C0 and C1. C0 is in link-up state while C1 is in link-down
> state. C0 is chosen as active channel until unplugging and plugging
> C0's cable:  On unplugging C0's cable, LSC (Link State Change) AEN
> packet received on C0 to report link-down event. After that, C1 is
> chosen as active channel. LSC AEN for link-up event is lost on C0
> when plugging C0's cable back. We lose the network even C0 is usable.
>
> This resolves the issue by recording the (hot) channel that was ever
> chosen as active one. The hot channel is chosen to be active one
> if none of available channels in link-up state. With this, C0 is still
> the active one after unplugging C0's cable. LSC AEN packet received
> on C0 when plugging its cable back.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
>  net/ncsi/internal.h    |  1 +
>  net/ncsi/ncsi-manage.c | 22 +++++++++++++++++++---
>  2 files changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index eac4858..1308a56 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -265,6 +265,7 @@ struct ncsi_dev_priv {
>  #endif
>         unsigned int        package_num;     /* Number of packages         */
>         struct list_head    packages;        /* List of packages           */
> +       struct ncsi_channel *hot_channel;    /* Channel was ever active    */
>         struct ncsi_request requests[256];   /* Request table              */
>         unsigned int        request_id;      /* Last used request ID       */
>  #define NCSI_REQ_START_IDX     1
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index 4789f86..a3bd5fa 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -645,6 +645,7 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
>         struct net_device *dev = nd->dev;
>         struct ncsi_package *np = ndp->active_package;
>         struct ncsi_channel *nc = ndp->active_channel;
> +       struct ncsi_channel *hot_nc = NULL;
>         struct ncsi_cmd_arg nca;
>         unsigned char index;
>         unsigned long flags;
> @@ -750,12 +751,20 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
>                 break;
>         case ncsi_dev_state_config_done:
>                 spin_lock_irqsave(&nc->lock, flags);
> -               if (nc->modes[NCSI_MODE_LINK].data[2] & 0x1)
> +               if (nc->modes[NCSI_MODE_LINK].data[2] & 0x1) {
> +                       hot_nc = nc;
>                         nc->state = NCSI_CHANNEL_ACTIVE;
> -               else
> +               } else {
> +                       hot_nc = NULL;
>                         nc->state = NCSI_CHANNEL_INACTIVE;
> +               }
>                 spin_unlock_irqrestore(&nc->lock, flags);
>
> +               /* Update the hot channel */
> +               spin_lock_irqsave(&ndp->lock, flags);
> +               ndp->hot_channel = hot_nc;
> +               spin_unlock_irqrestore(&ndp->lock, flags);
> +
>                 ncsi_start_channel_monitor(nc);
>                 ncsi_process_next_channel(ndp);
>                 break;
> @@ -773,10 +782,14 @@ error:
>  static int ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
>  {
>         struct ncsi_package *np;
> -       struct ncsi_channel *nc, *found;
> +       struct ncsi_channel *nc, *found, *hot_nc;
>         struct ncsi_channel_mode *ncm;
>         unsigned long flags;
>
> +       spin_lock_irqsave(&ndp->lock, flags);
> +       hot_nc = ndp->hot_channel;
> +       spin_unlock_irqrestore(&ndp->lock, flags);
> +

Can you explain why we need to take a lock here?


>         /* The search is done once an inactive channel with up
>          * link is found.
>          */
> @@ -794,6 +807,9 @@ static int ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
>                         if (!found)
>                                 found = nc;
>
> +                       if (nc == hot_nc)
> +                               found = nc;
> +
>                         ncm = &nc->modes[NCSI_MODE_LINK];
>                         if (ncm->data[2] & 0x1) {
>                                 spin_unlock_irqrestore(&nc->lock, flags);
> --
> 2.1.0
>
