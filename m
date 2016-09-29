Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sl2Gr4xfYzDsff
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 14:51:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=xR3/zfjc; 
 dkim-atps=neutral
Received: by mail-vk0-x242.google.com with SMTP id v205so2377919vke.3
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 21:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=JS+efJGbaj4lUHxIcODlMgt33GBv2qjanDstS+qU9EM=;
 b=xR3/zfjch2TNygpRIE77x5mDqhDn9WvfXr05rkCPOVaGMJEnWiQ8GAP7KtW0LJbTOw
 74NQ0yJY9vWy6PBgvdwGq1EG1cpV9MDue2Wzd3YsBHCZwyOKIazyXo0/3tDG0fE2xxFZ
 VlEbsS2gT9J2AQmT1/ShiS0v4sWE7RU2ymlNRAIMQ2+TbKawgF7NdYz/Oh54z8mR62fP
 RqNl9HsSNA5NsGcX73QIWZlrWiAATKAyZk1qgWCj8qQTPWwJnUAgMVA95JLTjEsSt7QR
 D5f3qs6mCOSlohIuwO8ZaMdvS++sA5pHcsJRxkQLeXwZPTon2jUV1dBNu9wnoPCCM10L
 0WTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=JS+efJGbaj4lUHxIcODlMgt33GBv2qjanDstS+qU9EM=;
 b=Jq8oWHQRw9e/C762KamALhCiIqcJ6dV0u8rREAjNWUTsyJutmugWjub0+m8MmI7kMh
 pRE5WZiEWTv7kvCMDvaUf00h5DL3wOG/shWmop9fKUd4C1PezM8STcjF+4FOCLv2zj00
 FRGNtlD7ovSwOMywAy+g6gAOz7hnF+mjuXCS1Vi1N03VyDSbvJlnhZ3NSjGqhUPFjON5
 fD1ILFaGVbp9Bpuqm6gUvUprzly3I5nDFjmOCqfsFAs4jbINuvpHMuv26acUqMYzFaer
 QuNvfCDm0yfm+O+adLxdQwHAKHiBQPV67qQGTwtM5tSQZ162HUShCK7FWVcY0cnmtVKG
 cuPA==
X-Gm-Message-State: AA6/9RlU8cYSUb7/vfzcqIngRCtpDPdgM5XRemmM9fetJjFojg28+pbL+Qgeoms5knkUGpNlun9hAGbDbc9UVw==
X-Received: by 10.31.183.78 with SMTP id h75mr19141148vkf.148.1475124706356;
 Wed, 28 Sep 2016 21:51:46 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Wed, 28 Sep 2016 21:51:25 -0700 (PDT)
In-Reply-To: <1475113131-18048-8-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475113131-18048-8-git-send-email-gwshan@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Sep 2016 14:21:25 +0930
X-Google-Sender-Auth: o8Y0Ao_G7e_Q4en1SdM6GnX7xAs
Message-ID: <CACPK8XdYcQys4aKuOm7XyvKSOn16WbVLgcCcEG4EDLjXoEJ=kA@mail.gmail.com>
Subject: Re: [PATCH v2 4.7 7/8] net/ncsi: Introduce ncsi_stop_dev()
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
X-List-Received-Date: Thu, 29 Sep 2016 04:51:49 -0000

On Thu, Sep 29, 2016 at 11:08 AM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> This introduces ncsi_stop_dev(), as counterpart to ncsi_start_dev(),
> to stop the NCSI device so that it can be reenabled in future. This
> API should be called when the network device driver is going to
> shutdown the device. There are 3 things done in the function: Stop
> the channel monitoring; Reset channels to inactive state; Report
> NCSI link down.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  include/net/ncsi.h     |  5 +++++
>  net/ncsi/ncsi-manage.c | 33 ++++++++++++++++++++++-----------
>  2 files changed, 27 insertions(+), 11 deletions(-)
>
> diff --git a/include/net/ncsi.h b/include/net/ncsi.h
> index 1dbf42f..68680ba 100644
> --- a/include/net/ncsi.h
> +++ b/include/net/ncsi.h
> @@ -31,6 +31,7 @@ struct ncsi_dev {
>  struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
>                                    void (*notifier)(struct ncsi_dev *nd));
>  int ncsi_start_dev(struct ncsi_dev *nd);
> +void ncsi_stop_dev(struct ncsi_dev *nd);
>  void ncsi_unregister_dev(struct ncsi_dev *nd);
>  #else /* !CONFIG_NET_NCSI */
>  static inline struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
> @@ -44,6 +45,10 @@ static inline int ncsi_start_dev(struct ncsi_dev *nd)
>         return -ENOTTY;
>  }
>
> +static void ncsi_stop_dev(struct ncsi_dev *nd)
> +{
> +}
> +
>  static inline void ncsi_unregister_dev(struct ncsi_dev *nd)
>  {
>  }
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index 1b797c9..6a96873 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -1161,9 +1161,7 @@ EXPORT_SYMBOL_GPL(ncsi_register_dev);
>  int ncsi_start_dev(struct ncsi_dev *nd)
>  {
>         struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
> -       struct ncsi_package *np;
> -       struct ncsi_channel *nc;
> -       int old_state, ret;
> +       int ret;
>
>         if (nd->state != ncsi_dev_state_registered &&
>             nd->state != ncsi_dev_state_functional)
> @@ -1175,9 +1173,27 @@ int ncsi_start_dev(struct ncsi_dev *nd)
>                 return 0;
>         }
>
> -       /* Reset channel's state and start over */
> +       if (ndp->flags & NCSI_DEV_HWA)
> +               ret = ncsi_enable_hwa(ndp);
> +       else
> +               ret = ncsi_choose_active_channel(ndp);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(ncsi_start_dev);
> +
> +void ncsi_stop_dev(struct ncsi_dev *nd)
> +{
> +       struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
> +       struct ncsi_package *np;
> +       struct ncsi_channel *nc;
> +       int old_state;
> +
> +       /* Stop the channel monitor and reset channel's state */
>         NCSI_FOR_EACH_PACKAGE(ndp, np) {
>                 NCSI_FOR_EACH_CHANNEL(np, nc) {
> +                       ncsi_stop_channel_monitor(nc);
> +
>                         old_state = READ_ONCE(nc->state);
>                         WRITE_ONCE(nc->state, NCSI_CHANNEL_INACTIVE);
>                         WARN_ON_ONCE(!list_empty(&nc->link) ||
> @@ -1185,14 +1201,9 @@ int ncsi_start_dev(struct ncsi_dev *nd)
>                 }
>         }
>
> -       if (ndp->flags & NCSI_DEV_HWA)
> -               ret = ncsi_enable_hwa(ndp);
> -       else
> -               ret = ncsi_choose_active_channel(ndp);
> -
> -       return ret;
> +       ncsi_report_link(ndp, true);
>  }
> -EXPORT_SYMBOL_GPL(ncsi_start_dev);
> +EXPORT_SYMBOL_GPL(ncsi_stop_dev);
>
>  void ncsi_unregister_dev(struct ncsi_dev *nd)
>  {
> --
> 2.1.0
>
