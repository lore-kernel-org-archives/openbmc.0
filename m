Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com
 [IPv6:2a00:1450:4010:c07::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xVzbF1ZtFzDqXn
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 12:10:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HOgeC7VQ"; 
 dkim-atps=neutral
Received: by mail-lf0-x242.google.com with SMTP id o85so5711249lff.1
 for <openbmc@lists.ozlabs.org>; Sun, 13 Aug 2017 19:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8CtLoVBo7BFpPVZT1952+AnH6ZSdmGUncrAejh8PAv0=;
 b=HOgeC7VQSE3hFN7kzqqcLsSs3aUmwjfLxy74sgtmtOIY38JqsTI25vQYIXZvUmELwJ
 zAqns5yEs/6ue2KQC+oZoLnu9cSE286G4JFDbv1dbdVA36rRI18obQjctAr8kWWDPeML
 vT4/pAe4BCNyZe58727VQInLO0e1/PzFlxsgTuSIb+VHi651hmUnlvxeyeEUACxSmD+u
 7W9oAXqDdm3FpTWcjRJZU0jyckKp95CcRApwR47BqicJPajSJpesmOgEInD4a5h6FMPT
 bECx3LUCyS+ZawM0k1uGjl0uOKFyoQzirZdzd+Y9dM7WMDebgxy1jvnUEAphfTfsd5LH
 61cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8CtLoVBo7BFpPVZT1952+AnH6ZSdmGUncrAejh8PAv0=;
 b=c/ZBAvi0z9/71ij4wUbtuvP6WIdyKHth+zWpr4Lpz0/OxVB9LeXwSNn+06MTFRadKL
 4yNdc0fWNmXSTH60M4+bze3AOgIgHcwY9u1xqVhOc7Z3RdRSULQomAQz2o9RaPMLaazO
 F0srSMdSyadQZcIrEfy4gWPMTmZDvdAZ7WN5utdd5+VT28Ii1uxapC4z0R+aK1bMvMES
 Qh7v8/eWk6Sw9Rx8Tp7VvZMqzWQCv4TVoi6wXG5sGC1khcsk6YCsJG6Hy/55xrg2yQKY
 DkbAnxZX+Y//7bqADx/GBOPretRJg5VQlpOQD/SYYMC0tY8HdhuppwwCfa1eiEs4z+WD
 I76w==
X-Gm-Message-State: AHYfb5g88irExp49a6sRlGJfU5VI6v4CCbsC7MRisUfM5GYn90LafepO
 6ySSDSLq5Fr2AkbSerA6FsWWlRoycA==
X-Received: by 10.46.87.25 with SMTP id l25mr6581949ljb.138.1502676613665;
 Sun, 13 Aug 2017 19:10:13 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Sun, 13 Aug 2017 19:09:52 -0700 (PDT)
In-Reply-To: <20170814012952.13740-3-sam@mendozajonas.com>
References: <20170814012952.13740-1-sam@mendozajonas.com>
 <20170814012952.13740-3-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Aug 2017 11:39:52 +0930
X-Google-Sender-Auth: s88_aeyfhLi4lnHFzh68m6UCp_E
Message-ID: <CACPK8XfD=4=Axh+waO0KMRMntLBBWrb86f92NgX134U72wofzw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/3] net/ncsi: Configure VLAN tag filter
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, 
 Ratan K Gupta <ratagupt@in.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 14 Aug 2017 02:10:18 -0000

On Mon, Aug 14, 2017 at 10:59 AM, Samuel Mendoza-Jonas
<sam@mendozajonas.com> wrote:
> Make use of the ndo_vlan_rx_{add,kill}_vid callbacks to have the NCSI
> stack process new VLAN tags and configure the channel VLAN filter
> appropriately.
> Several VLAN tags can be set and a "Set VLAN Filter" packet must be sent
> for each one, meaning the ncsi_dev_state_config_svf state must be
> repeated. An internal list of VLAN tags is maintained, and compared
> against the current channel's ncsi_channel_filter in order to keep track
> within the state. VLAN filters are removed in a similar manner, with the
> introduction of the ncsi_dev_state_config_clear_vids state. The maximum
> number of VLAN tag filters is determined by the "Get Capabilities"
> response from the channel.
>
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

I've given this some testing, but there are a few things I saw below
that we should sort out.

> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -38,6 +38,22 @@ static inline int ncsi_filter_size(int table)
>         return sizes[table];
>  }
>
> +u32 *ncsi_get_filter(struct ncsi_channel *nc, int table, int index)
> +{
> +       struct ncsi_channel_filter *ncf;
> +       int size;
> +
> +       ncf = nc->filters[table];
> +       if (!ncf)
> +               return NULL;
> +
> +       size = ncsi_filter_size(table);
> +       if (size < 0)
> +               return NULL;
> +
> +       return ncf->data + size * index;
> +}
> +
>  int ncsi_find_filter(struct ncsi_channel *nc, int table, void *data)
>  {
>         struct ncsi_channel_filter *ncf;
> @@ -58,7 +74,7 @@ int ncsi_find_filter(struct ncsi_channel *nc, int table, void *data)
>         index = -1;
>         while ((index = find_next_bit(bitmap, ncf->total, index + 1))
>                < ncf->total) {
> -               if (!memcmp(ncf->data + size * index, data, size)) {
> +               if (!data || !memcmp(ncf->data + size * index, data, size)) {

Not clear why this check is required?

>                         spin_unlock_irqrestore(&nc->lock, flags);
>                         return index;
>                 }
> @@ -639,6 +655,83 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
>         nd->state = ncsi_dev_state_functional;
>  }
>
> +/* Check the VLAN filter bitmap for a set filter, and construct a
> + * "Set VLAN Filter - Disable" packet if found.
> + */
> +static int clear_one_vid(struct ncsi_dev_priv *ndp, struct ncsi_channel *nc,
> +                        struct ncsi_cmd_arg *nca)
> +{
> +       int index;
> +       u16 vid;
> +
> +       index = ncsi_find_filter(nc, NCSI_FILTER_VLAN, NULL);
> +       if (index < 0) {
> +               /* Filter table empty */
> +               return -1;
> +       }
> +
> +       vid = *(u16 *)ncsi_get_filter(nc, NCSI_FILTER_VLAN, index);

You just added this function that returns a pointer to a u32. It's
strange to see the only call site then throw half of it away.

Also, ncsi_get_filter can return NULL.

> +       netdev_printk(KERN_DEBUG, ndp->ndev.dev,
> +                     "ncsi: removed vlan tag %u at index %d\n",
> +                     vid, index + 1);
> +       ncsi_remove_filter(nc, NCSI_FILTER_VLAN, index);
> +
> +       nca->type = NCSI_PKT_CMD_SVF;
> +       nca->words[1] = vid;
> +       /* HW filter index starts at 1 */
> +       nca->bytes[6] = index + 1;
> +       nca->bytes[7] = 0x00;
> +       return 0;
> +}

> @@ -751,6 +876,26 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
>                 break;
>         case ncsi_dev_state_config_done:
>                 spin_lock_irqsave(&nc->lock, flags);
> +               if (nc->reconfigure_needed) {
> +                       /* This channel's configuration has been updated
> +                        * part-way during the config state - start the
> +                        * channel configuration over
> +                        */
> +                       nc->reconfigure_needed = false;
> +                       nc->state = NCSI_CHANNEL_INVISIBLE;
> +                       spin_unlock_irqrestore(&nc->lock, flags);
> +
> +                       spin_lock_irqsave(&ndp->lock, flags);
> +                       nc->state = NCSI_CHANNEL_INACTIVE;

This looks strange. What's nc->state up to? Does setting it to
NCSI_CHANNEL_INVISIBLE have any affect?

The locking is confusing too.

> +                       list_add_tail_rcu(&nc->link, &ndp->channel_queue);
> +                       spin_unlock_irqrestore(&ndp->lock, flags);
> +
> +                       netdev_printk(KERN_DEBUG, dev,
> +                                     "Dirty NCSI channel state reset\n");
> +                       ncsi_process_next_channel(ndp);
> +                       break;
> +               }
> +
>                 if (nc->modes[NCSI_MODE_LINK].data[2] & 0x1) {
>                         hot_nc = nc;
>                         nc->state = NCSI_CHANNEL_ACTIVE;
> @@ -1191,6 +1336,149 @@ static struct notifier_block ncsi_inet6addr_notifier = {
>  };
>  #endif /* CONFIG_IPV6 */
>
> +static int ncsi_kick_channels(struct ncsi_dev_priv *ndp)
> +{
> +       struct ncsi_dev *nd = &ndp->ndev;
> +       struct ncsi_channel *nc;
> +       struct ncsi_package *np;
> +       unsigned long flags;
> +       unsigned int n = 0;
> +
> +       NCSI_FOR_EACH_PACKAGE(ndp, np) {
> +               NCSI_FOR_EACH_CHANNEL(np, nc) {
> +                       spin_lock_irqsave(&nc->lock, flags);
> +
> +                       /* Channels may be busy, mark dirty instead of
> +                        * kicking if;
> +                        * a) not ACTIVE (configured)
> +                        * b) in the channel_queue (to be configured)
> +                        * c) it's ndev is in the config state
> +                        */
> +                       if (nc->state != NCSI_CHANNEL_ACTIVE) {
> +                               if ((ndp->ndev.state & 0xff00) ==
> +                                               ncsi_dev_state_config ||
> +                                               !list_empty(&nc->link)) {
> +                                       netdev_printk(KERN_DEBUG, nd->dev,
> +                                                     "ncsi: channel %p marked dirty\n",
> +                                                     nc);
> +                                       nc->reconfigure_needed = true;
> +                               }
> +                               spin_unlock_irqrestore(&nc->lock, flags);
> +                               continue;
> +                       }
> +
> +                       spin_unlock_irqrestore(&nc->lock, flags);
> +
> +                       ncsi_stop_channel_monitor(nc);
> +                       spin_lock_irqsave(&nc->lock, flags);
> +                       nc->state = NCSI_CHANNEL_INVISIBLE;
> +                       spin_unlock_irqrestore(&nc->lock, flags);
> +
> +                       spin_lock_irqsave(&ndp->lock, flags);
> +                       nc->state = NCSI_CHANNEL_INACTIVE;

This is a similar pattern to ncsi_configure_channel. I suspect the
answer there will be the same as here.

> +                       list_add_tail_rcu(&nc->link, &ndp->channel_queue);
> +                       spin_unlock_irqrestore(&ndp->lock, flags);
> +
> +                       netdev_printk(KERN_DEBUG, nd->dev,
> +                                     "ncsi: kicked channel %p\n", nc);
> +                       n++;
> +               }
> +       }
