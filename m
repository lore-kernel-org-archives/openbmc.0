Return-Path: <sam@mendozajonas.com>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xW2Xt4ybvzDqms
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 14:23:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="bk8l37tr"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hziNyswT"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5C2C613F1;
 Mon, 14 Aug 2017 00:23:24 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Mon, 14 Aug 2017 00:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
 fm1; bh=1xvHPU0UY3xMYQIQ13wqImZ5wR3+W7GNKzld/qoagPk=; b=bk8l37tr
 U4lTI8PnCS6EhtTkk7R0VFSwuVHxoo4eBjLIeEZxL6nVZcfKe4t1otPwgO26401V
 CzNu29h1gEJ+roYZMkIqc5Fop/O6dEa7szancwD1FWG2uC/V/RW7P4YaMF+kqrKR
 nzAwuR95P2hruDZazHBSK/pcvtkWaldILowRAwy2k4t64nCVQuLelA+j+bSNGYxZ
 E8dXtyJIMnzNeFTdGIW3udaXiG2qdiocarmoN7yr74ZnGGF5MjrABC2qIvUirgrK
 dtek4/buTz6cBXtZjxnxh2DlcmlzGDhbMgZwAh9SESqfzQ78LU8d0pNxDDXF+v4l
 VewxFogpRk1K1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
 fm1; bh=1xvHPU0UY3xMYQIQ13wqImZ5wR3+W7GNKzld/qoagPk=; b=hziNyswT
 E0PAjTMRibDwLPqWad4L/WH+ovtPlM0jikfm/7pwL/e4EJ6+vXk0bUgoJ0YabcJx
 jeIdd2MnFRMu3G6k836PHM4efbT0OgJiGq2Dp3vpfMrJ230N2XzIvbz8KAEv42s9
 Da9D060UZGgaJxHk1Wg5Fu7dWqk4FmADpWtHO5IeybRivcPhiIWAvSHUA0Wayjs/
 uzupmJE4KEryZt92o20d05wLGZ9++fLUYvTlVR9LF3j7f15xOzsFGosMzXDvbYHL
 cIRw9QKYGEipzyU5rS3bMKgAbUpa2fs7zGaAlS4KUIHabd3VAxolecQQ5ukVe7o2
 Mc0GsyCQK1UexQ==
X-ME-Sender: <xms:uyWRWWsI38wIoNFXtnUnAfzJg_kkj2Yy_DQ_hVyr0wElbDCC6KHSFw>
X-Sasl-enc: t34abRFCYa/8levBEzvxh2Y1DUR3ZEL6LQLl6ofznBBi 1502684603
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3FF502418A;
 Mon, 14 Aug 2017 00:23:21 -0400 (EDT)
Message-ID: <1502684598.913.13.camel@mendozajonas.com>
Subject: Re: [PATCH net-next v2 2/3] net/ncsi: Configure VLAN tag filter
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Joel Stanley <joel@jms.id.au>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Gavin Shan <gwshan@linux.vnet.ibm.com>, Ratan K
 Gupta <ratagupt@in.ibm.com>
Date: Mon, 14 Aug 2017 14:23:18 +1000
In-Reply-To: <CACPK8XfD=4=Axh+waO0KMRMntLBBWrb86f92NgX134U72wofzw@mail.gmail.com>
References: <20170814012952.13740-1-sam@mendozajonas.com>
 <20170814012952.13740-3-sam@mendozajonas.com>
 <CACPK8XfD=4=Axh+waO0KMRMntLBBWrb86f92NgX134U72wofzw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.5 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 14 Aug 2017 04:23:28 -0000

On Mon, 2017-08-14 at 11:39 +0930, Joel Stanley wrote:
> On Mon, Aug 14, 2017 at 10:59 AM, Samuel Mendoza-Jonas
> <sam@mendozajonas.com> wrote:
> > Make use of the ndo_vlan_rx_{add,kill}_vid callbacks to have the NCSI
> > stack process new VLAN tags and configure the channel VLAN filter
> > appropriately.
> > Several VLAN tags can be set and a "Set VLAN Filter" packet must be sent
> > for each one, meaning the ncsi_dev_state_config_svf state must be
> > repeated. An internal list of VLAN tags is maintained, and compared
> > against the current channel's ncsi_channel_filter in order to keep track
> > within the state. VLAN filters are removed in a similar manner, with the
> > introduction of the ncsi_dev_state_config_clear_vids state. The maximum
> > number of VLAN tag filters is determined by the "Get Capabilities"
> > response from the channel.
> > 
> > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> 
> I've given this some testing, but there are a few things I saw below
> that we should sort out.
> 
> > --- a/net/ncsi/ncsi-manage.c
> > +++ b/net/ncsi/ncsi-manage.c
> > @@ -38,6 +38,22 @@ static inline int ncsi_filter_size(int table)
> >         return sizes[table];
> >  }
> > 
> > +u32 *ncsi_get_filter(struct ncsi_channel *nc, int table, int index)
> > +{
> > +       struct ncsi_channel_filter *ncf;
> > +       int size;
> > +
> > +       ncf = nc->filters[table];
> > +       if (!ncf)
> > +               return NULL;
> > +
> > +       size = ncsi_filter_size(table);
> > +       if (size < 0)
> > +               return NULL;
> > +
> > +       return ncf->data + size * index;
> > +}
> > +
> >  int ncsi_find_filter(struct ncsi_channel *nc, int table, void *data)
> >  {
> >         struct ncsi_channel_filter *ncf;
> > @@ -58,7 +74,7 @@ int ncsi_find_filter(struct ncsi_channel *nc, int table, void *data)
> >         index = -1;
> >         while ((index = find_next_bit(bitmap, ncf->total, index + 1))
> >                < ncf->total) {
> > -               if (!memcmp(ncf->data + size * index, data, size)) {
> > +               if (!data || !memcmp(ncf->data + size * index, data, size)) {
> 
> Not clear why this check is required?

Right, this could use a comment. This is a small workaround to having a
way to finding an arbitrary active filter, below in clear_one_vid(). We
pass NULL as a way of saying "return any enabled filter".

> 
> >                         spin_unlock_irqrestore(&nc->lock, flags);
> >                         return index;
> >                 }
> > @@ -639,6 +655,83 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
> >         nd->state = ncsi_dev_state_functional;
> >  }
> > 
> > +/* Check the VLAN filter bitmap for a set filter, and construct a
> > + * "Set VLAN Filter - Disable" packet if found.
> > + */
> > +static int clear_one_vid(struct ncsi_dev_priv *ndp, struct ncsi_channel *nc,
> > +                        struct ncsi_cmd_arg *nca)
> > +{
> > +       int index;
> > +       u16 vid;
> > +
> > +       index = ncsi_find_filter(nc, NCSI_FILTER_VLAN, NULL);
> > +       if (index < 0) {
> > +               /* Filter table empty */
> > +               return -1;
> > +       }
> > +
> > +       vid = *(u16 *)ncsi_get_filter(nc, NCSI_FILTER_VLAN, index);
> 
> You just added this function that returns a pointer to a u32. It's
> strange to see the only call site then throw half of it away.

The problem here is that the single ncsi_channel_filter struct is used to
represent several different filters, and the filter data is stored in a
u32 data[] type. We cast to u16 in clear_one_vid because we know it's a
VLAN tag (NCSI_FILTER_VLAN), although we probably should call
ncsi_filter_size() to be sure.
> 
> Also, ncsi_get_filter can return NULL.

That is indeed a problem though!

> 
> > +       netdev_printk(KERN_DEBUG, ndp->ndev.dev,
> > +                     "ncsi: removed vlan tag %u at index %d\n",
> > +                     vid, index + 1);
> > +       ncsi_remove_filter(nc, NCSI_FILTER_VLAN, index);
> > +
> > +       nca->type = NCSI_PKT_CMD_SVF;
> > +       nca->words[1] = vid;
> > +       /* HW filter index starts at 1 */
> > +       nca->bytes[6] = index + 1;
> > +       nca->bytes[7] = 0x00;
> > +       return 0;
> > +}
> > @@ -751,6 +876,26 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
> >                 break;
> >         case ncsi_dev_state_config_done:
> >                 spin_lock_irqsave(&nc->lock, flags);
> > +               if (nc->reconfigure_needed) {
> > +                       /* This channel's configuration has been updated
> > +                        * part-way during the config state - start the
> > +                        * channel configuration over
> > +                        */
> > +                       nc->reconfigure_needed = false;
> > +                       nc->state = NCSI_CHANNEL_INVISIBLE;
> > +                       spin_unlock_irqrestore(&nc->lock, flags);
> > +
> > +                       spin_lock_irqsave(&ndp->lock, flags);
> > +                       nc->state = NCSI_CHANNEL_INACTIVE;
> 
> This looks strange. What's nc->state up to? Does setting it to
> NCSI_CHANNEL_INVISIBLE have any affect?
> 
> The locking is confusing too.

The locking IS confusing!
Here I've followed existing convention from a similar case in ncsi-aen,
but I'm not convinced it's correct. Likely the following would still have
the desired effect:

                       nc->reconfigure_needed = false;
                       nc->state = NCSI_CHANNEL_INACTIVE;
                       spin_unlock_irqrestore(&nc->lock, flags); 

                       spin_lock_irqsave(&ndp->lock, flags);
                       list_add_tail_rcu(&nc->link, &ndp->channel_queue);
                       spin_unlock_irqrestore(&ndp->lock, flags);

And something similar in ncsi_kick_channels().
Ideally I would ask the author Gavin, but in lieu of that I'll need to
pick it apart a bit to see if the ncsi-aen code is doing something
important or is just wrong.

> 
> > +                       list_add_tail_rcu(&nc->link, &ndp->channel_queue);
> > +                       spin_unlock_irqrestore(&ndp->lock, flags);
> > +
> > +                       netdev_printk(KERN_DEBUG, dev,
> > +                                     "Dirty NCSI channel state reset\n");
> > +                       ncsi_process_next_channel(ndp);
> > +                       break;
> > +               }
> > +
> >                 if (nc->modes[NCSI_MODE_LINK].data[2] & 0x1) {
> >                         hot_nc = nc;
> >                         nc->state = NCSI_CHANNEL_ACTIVE;
> > @@ -1191,6 +1336,149 @@ static struct notifier_block ncsi_inet6addr_notifier = {
> >  };
> >  #endif /* CONFIG_IPV6 */
> > 
> > +static int ncsi_kick_channels(struct ncsi_dev_priv *ndp)
> > +{
> > +       struct ncsi_dev *nd = &ndp->ndev;
> > +       struct ncsi_channel *nc;
> > +       struct ncsi_package *np;
> > +       unsigned long flags;
> > +       unsigned int n = 0;
> > +
> > +       NCSI_FOR_EACH_PACKAGE(ndp, np) {
> > +               NCSI_FOR_EACH_CHANNEL(np, nc) {
> > +                       spin_lock_irqsave(&nc->lock, flags);
> > +
> > +                       /* Channels may be busy, mark dirty instead of
> > +                        * kicking if;
> > +                        * a) not ACTIVE (configured)
> > +                        * b) in the channel_queue (to be configured)
> > +                        * c) it's ndev is in the config state
> > +                        */
> > +                       if (nc->state != NCSI_CHANNEL_ACTIVE) {
> > +                               if ((ndp->ndev.state & 0xff00) ==
> > +                                               ncsi_dev_state_config ||
> > +                                               !list_empty(&nc->link)) {
> > +                                       netdev_printk(KERN_DEBUG, nd->dev,
> > +                                                     "ncsi: channel %p marked dirty\n",
> > +                                                     nc);
> > +                                       nc->reconfigure_needed = true;
> > +                               }
> > +                               spin_unlock_irqrestore(&nc->lock, flags);
> > +                               continue;
> > +                       }
> > +
> > +                       spin_unlock_irqrestore(&nc->lock, flags);
> > +
> > +                       ncsi_stop_channel_monitor(nc);
> > +                       spin_lock_irqsave(&nc->lock, flags);
> > +                       nc->state = NCSI_CHANNEL_INVISIBLE;
> > +                       spin_unlock_irqrestore(&nc->lock, flags);
> > +
> > +                       spin_lock_irqsave(&ndp->lock, flags);
> > +                       nc->state = NCSI_CHANNEL_INACTIVE;
> 
> This is a similar pattern to ncsi_configure_channel. I suspect the
> answer there will be the same as here.
> 
> > +                       list_add_tail_rcu(&nc->link, &ndp->channel_queue);
> > +                       spin_unlock_irqrestore(&ndp->lock, flags);
> > +
> > +                       netdev_printk(KERN_DEBUG, nd->dev,
> > +                                     "ncsi: kicked channel %p\n", nc);
> > +                       n++;
> > +               }
> > +       }
