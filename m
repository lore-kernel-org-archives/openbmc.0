Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="uiYZ9eW+"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="C2NK72GQ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLmvm2D93zF0Xr
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 10:41:39 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 3942820CA6;
 Tue, 16 Jan 2018 18:41:37 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Tue, 16 Jan 2018 18:41:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3Tuc9F
 +y2lRrJYKwS+zU2AvKRZ47sQGvV9O4LCqPuWg=; b=uiYZ9eW+kaLuRdxBV4vMFJ
 ehqK+jsgbRk0bLkn97M8ahip2bxpgYPm+95cN+tzoV6djd6SXDhJwSxR8OMkMtyb
 lTno7yDWkqsrIJZvAXKfGwKsTvkHfox7HdZpIqMWIDZHsZ9Dvj/oGVmwSGjeWeRa
 X+2lMGSs16IQQ7aW09rjj4Hm+Np4gJHejnwU9x/xwLiCHJEXEriWc3xWcuRRSuxq
 9gpf9jvjSmaZCU3ysW6ieu6KF4WWE4nXt+z1GDv4RXMYLanr6q4lFZy5FH6VjFFy
 y/Cjd8Q5SmB0xD9P8ZZ1z4Aq4K+S+4kM3BxIieFA+4OKK617eb9NRNuGOyj1117w
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3Tuc9F
 +y2lRrJYKwS+zU2AvKRZ47sQGvV9O4LCqPuWg=; b=C2NK72GQhrFstETEeIlkTb
 c18MCzaXPpW7+vTCGowGHvZf3bY8nHUuZ8yCF0W/QiOKTGFflKfztaHNDbOj4kec
 CFR1rb6klBP7pbqhdXdGRH9kd7f4cwYjZXtAeJlA8JyrRmAHoMYVmQBFWz1R/pL4
 xJiSC17hTO2mLut3+CuldUhE8wN1U0UEn24feS0upeHvUMXuI3DJdS9Uu88niKFF
 3s9EHyHmxLG/Xd+Hib8VbsIFrK5SVeNRP67JIZkSNw1UcsQwHoOuC6MPat0Ue8LD
 60vbfKwXibX1l4uym7JQnGxAbVxZLrptPMgADQMKycBfb5iwEHfYmMmUu9Qc8d1w
 ==
X-ME-Sender: <xms:sY1eWn5oMAH70XvJa5EjCDnL1NuSgHYPKJQx2NshAmsAt1rlZBL7pw>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 188297E125;
 Tue, 16 Jan 2018 18:41:35 -0500 (EST)
Message-ID: <1516146093.1114.0.camel@mendozajonas.com>
Subject: Re: [PATCH linux dev-4.13] net/ncsi: Don't take any action on
 HNCDSC AEN
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 17 Jan 2018 10:41:33 +1100
In-Reply-To: <CACPK8XfAsU7_dwFoOaaD5v+GevUj=WUZo5k8eZZfORowsFrZuA@mail.gmail.com>
References: <20171220030251.19337-1-sam@mendozajonas.com>
 <CACPK8XfAsU7_dwFoOaaD5v+GevUj=WUZo5k8eZZfORowsFrZuA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.4 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 16 Jan 2018 23:41:43 -0000

On Tue, 2018-01-16 at 14:26 -0600, Joel Stanley wrote:
> On Tue, Dec 19, 2017 at 9:02 PM, Samuel Mendoza-Jonas
> <sam@mendozajonas.com> wrote:
> > The current HNCDSC handler takes the status flag from the AEN packet and
> > will update or change the current channel based on this flag and the
> > current channel status.
> > 
> > However the flag from the HNCDSC packet merely represents the host link
> > state. While the state of the host interface is potentially interesting
> > information it should not affect the state of the NCSI link. Indeed the
> > NCSI specification makes no mention of any recommended action related to
> > the host network controller driver state.
> > 
> > Update the HNCDSC handler to record the host network driver status but
> > take no other action.
> > 
> > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > Acked-by: Jeremy Kerr <jk@ozlabs.org>
> > Signed-off-by: David S. Miller <davem@davemloft.net>
> > (cherry picked from commit 75e8e15635e08f2598ecd20f4f71f4d043dd6e68)
> 
> Applied to dev-4.13.
> 
> I think we discussed this and decided it was not required for dev-4.10?

I think so too, but 2017 was a very long time ago :)

> 
> Cheers,
> 
> Joel
> 
> > ---
> >  net/ncsi/ncsi-aen.c | 35 +++--------------------------------
> >  1 file changed, 3 insertions(+), 32 deletions(-)
> > 
> > diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
> > index 67e708e98ccf..e7b05de1e6d1 100644
> > --- a/net/ncsi/ncsi-aen.c
> > +++ b/net/ncsi/ncsi-aen.c
> > @@ -143,43 +143,14 @@ static int ncsi_aen_handler_hncdsc(struct ncsi_dev_priv *ndp,
> >         if (!nc)
> >                 return -ENODEV;
> > 
> > -       /* If the channel is active one, we need reconfigure it */
> >         spin_lock_irqsave(&nc->lock, flags);
> >         ncm = &nc->modes[NCSI_MODE_LINK];
> >         hncdsc = (struct ncsi_aen_hncdsc_pkt *)h;
> >         ncm->data[3] = ntohl(hncdsc->status);
> > -       netdev_info(ndp->ndev.dev, "NCSI: HNCDSC AEN - channel %u state %s\n",
> > -                   nc->id, ncm->data[3] & 0x3 ? "up" : "down");
> > -       if (!list_empty(&nc->link) ||
> > -           nc->state != NCSI_CHANNEL_ACTIVE) {
> > -               spin_unlock_irqrestore(&nc->lock, flags);
> > -               return 0;
> > -       }
> > -
> > -       spin_unlock_irqrestore(&nc->lock, flags);
> > -       if (!(ndp->flags & NCSI_DEV_HWA) && !(ncm->data[3] & 0x1))
> > -               ndp->flags |= NCSI_DEV_RESHUFFLE;
> > -
> > -       /* If this channel is the active one and the link doesn't
> > -        * work, we have to choose another channel to be active one.
> > -        * The logic here is exactly similar to what we do when link
> > -        * is down on the active channel.
> > -        *
> > -        * On the other hand, we need configure it when host driver
> > -        * state on the active channel becomes ready.
> > -        */
> > -       ncsi_stop_channel_monitor(nc);
> > -
> > -       spin_lock_irqsave(&nc->lock, flags);
> > -       nc->state = (ncm->data[3] & 0x1) ? NCSI_CHANNEL_INACTIVE :
> > -                                          NCSI_CHANNEL_ACTIVE;
> >         spin_unlock_irqrestore(&nc->lock, flags);
> > -
> > -       spin_lock_irqsave(&ndp->lock, flags);
> > -       list_add_tail_rcu(&nc->link, &ndp->channel_queue);
> > -       spin_unlock_irqrestore(&ndp->lock, flags);
> > -
> > -       ncsi_process_next_channel(ndp);
> > +       netdev_printk(KERN_DEBUG, ndp->ndev.dev,
> > +                     "NCSI: host driver %srunning on channel %u\n",
> > +                     ncm->data[3] & 0x1 ? "" : "not ", nc->id);
> > 
> >         return 0;
> >  }
> > --
> > 2.15.1
> > 
