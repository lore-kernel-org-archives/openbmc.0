Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSgJw5ZVDzDqrx
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 17:49:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pLlBto0J"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id s143so5646444ywg.4
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 00:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=VOmpCFzQyyO8SyhMy67eWDIz6ZQ6SImJOE+tzy+5UJk=;
 b=pLlBto0JEM/jaEy/y6w+youHLAkpGsLDq4H7fb5OqvMGwdsgenCDMe39NNsoNRJNVH
 gMcPgfMzsnJ2qB0YyytV1ZBmaZ68sVmj2Jc+7mWLUMKmdxwbMGMinlzQI8CVTG4cWQjp
 nxNlGNNIUFywP/F2t/CJluUTvcPHMSOzv+7QCblYL5hrl8QgvNqpNd9TAFcR0vVAUSmL
 oNdxOvr9zF9M7fk4VZoaeKPjYneOjgd9z/wukKTDx7NFvZICLUobN8BfsGTnwNzUVUIg
 Wxdk6WYQ4Qo9p3GYrDpHysSE2hDTyqtfWJeS/tz/rPkMKR5TcOoV/cfKO4+nH0y4CQ7c
 qQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=VOmpCFzQyyO8SyhMy67eWDIz6ZQ6SImJOE+tzy+5UJk=;
 b=Q2WeAbTfueFcQoRWk1BY36AE4sl96LAjDqO3i4gwKQqKf6+DRA8tBvGXM0xGIe+MM/
 luoQEGBp8mZ1hqbnHnV6+UX+337G/raja2xtvyv2gznh3kOtIkfyuk0TuPM+mdmEl8eo
 OD9gX9StkZFKopkX4sI9YGFPO/O0+PFiDztRrLWILFO57+hmEerdY4N2akZJHTiPh86g
 4/uoaCZlVyyfHNDed9djAvRYjr2CKdfRwJMvKSeUhnzbxoliL8wWkKY+1x8F/MFW+M2t
 O2iRJqEx3mKg8wQKBBGvnbVTn10X86TN6Xo/TqDMp1OfQrYII4Easko8I2in1Q/dg9vh
 5waw==
X-Gm-Message-State: AHYfb5gX2IQqOb4g9mJ8QlspdzNgw0hwv+vF8ZmKwYIu4yhsR9Z2YCzm
 m38iGMGg1rW98RMWFsnp6FWCerJ6Sw==
X-Received: by 10.13.210.67 with SMTP id u64mr9030781ywd.218.1502351390372;
 Thu, 10 Aug 2017 00:49:50 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Thu, 10 Aug 2017 00:49:29 -0700 (PDT)
In-Reply-To: <20170809085443.13148-4-sam@mendozajonas.com>
References: <20170809085443.13148-1-sam@mendozajonas.com>
 <20170809085443.13148-4-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Aug 2017 17:19:29 +0930
X-Google-Sender-Auth: 2s6kgxOFtF600Kl6CEHIC_I9eQA
Message-ID: <CACPK8XeHv3JGaGExkmEiznsUeh5sFHkxyPw45OGeD_KUq2Mx7w@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] net/ncsi: Configure VLAN tag filter
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ravindra S Rao1 <ravindra.s@in.ibm.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
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
X-List-Received-Date: Thu, 10 Aug 2017 07:49:53 -0000

On Wed, Aug 9, 2017 at 6:24 PM, Samuel Mendoza-Jonas
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

Thanks Sam. I've made some comments below.

> ---
>  drivers/net/ethernet/faraday/ftgmac100.c |   2 +
>  include/net/ncsi.h                       |   2 +
>  net/ncsi/internal.h                      |  11 ++
>  net/ncsi/ncsi-manage.c                   | 257 ++++++++++++++++++++++++++++++-
>  net/ncsi/ncsi-rsp.c                      |  13 +-
>  5 files changed, 281 insertions(+), 4 deletions(-)


> @@ -699,11 +706,93 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
>                 nca.package = np->id;
>                 nca.channel = nc->id;
>
> +               /* Clear any active filters on the channel before setting */
> +               if (nd->state == ncsi_dev_state_config_clear_vids) {

This is epic. Could it go in a function?

> +                       clear = false;
> +                       vlan_index = -1;
> +                       spin_lock_irqsave(&nc->lock, flags);
> +                       ncf = nc->filters[NCSI_FILTER_VLAN];
> +                       while ((vlan_index = find_next_bit((void *)&ncf->bitmap, ncf->total, vlan_index + 1))

We should make ->bitmap an unsigned long, then we can pass it to
find_next_bit without casting. Other users of it do the same thing
with a temporary variable.

> +                              < ncf->total) {
> +                               clear = true;
> +                               // TODO retrieve the vid that was set

Still WIP?

> +                               netdev_printk(KERN_DEBUG, dev, "ncsi: removed vlan tag at index %d\n",

Do we get a ncsi prefix from the driver name?

> +                                               vlan_index);
> +                               ncsi_remove_filter(nc, NCSI_FILTER_VLAN, vlan_index);
> +                               break;
> +                       }
> +                       spin_unlock_irqrestore(&nc->lock, flags);
> +

> +int ncsi_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid)
> +{
> +       struct ncsi_channel_filter *ncf;
> +       struct ncsi_dev_priv *ndp;
> +       unsigned int n_vids = 0;
> +       struct vlan_vid *vlan;
> +       struct ncsi_dev *nd;
> +       bool found = false;

> +
> +       if (n_vids >= ncf->total) {
> +               netdev_info(dev, "NCSI Channel supports up to %u VLAN tags but %u are already set\n",
> +                               ncf->total, n_vids);
> +               return -EINVAL;
> +       }
> +
> +       vlan = kzalloc(sizeof(struct vlan_vid), GFP_KERNEL);

Does this get freed anywhere?

> +       if (!vlan) {
> +               netdev_err(dev, "could not alloc vlan_vid struct\n");
> +               return -ENOMEM;
> +       }
>
