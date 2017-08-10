Return-Path: <sam@mendozajonas.com>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT37M4CJFzDr0G
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 08:42:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="m4qRfLvr"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SvwCVx5y"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4E0E03389;
 Thu, 10 Aug 2017 18:42:53 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Thu, 10 Aug 2017 18:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
 fm1; bh=EU41IIG5pHByCBVmS5b1+UkRF0xF0Vfjt6loR7xV39c=; b=m4qRfLvr
 oQbwyYHOZdocp8bTiYyiScQBgM5Xh5boJeI2iT7VoH3mRQnavUi57kpENmxUelsp
 DSa6yh0EFraTLUVnbsJHR2ZRN//qhYCcwXzphSzvIIWgpEZyS8xJIqtfmaQ4AeMu
 JsDmTgR0KHo4bV8tA6kiQhF64jzBuOOMOq686umKLWofqVzNIYZri0BxL68yLhGp
 afI8aoGURtnT4OlbMzevPjs9K847tlV7tBE9oImpKV8VydqO9mpZdpzfzNo7vy4a
 jtsyZXfpFuBQ3y2o35yWk8/FwG+MJqZ+I+3iAHraxif8NXaqMyVgw6Plf25s0RKt
 zkqS83rJpg6VLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
 fm1; bh=EU41IIG5pHByCBVmS5b1+UkRF0xF0Vfjt6loR7xV39c=; b=SvwCVx5y
 p9phz1aqnTzhzwK1cpoY1HZb0u2h52+fy7yQ2leWWxarWJkC3v4WPlUROBUIJiw5
 8V+BSrbwiCVHLmuu8soPwwRmXyRfQCDPBAulJQEDjHFfwvBgGvoGO/YP3ZXe3Wqu
 Dc3WLOORJ/pKxO+3ZEE/D5hY2bAS87KWPP0NZzGQAJnA2XpJZyhzd3n66TM0IM5g
 hZPEq1C+qwj+Rcwcv45n3RRw4rugbSquzJpW2GP98bqOVlVDe2np6obIIEZHYB7a
 xvMBAhYtTg3lfndbdceOLjG50ek4RtLQ0Kd8NfL0fxlNBlO9Qa7RHTluZniSTzLM
 zZLtUDOLjqCGJw==
X-ME-Sender: <xms:beGMWebLq8PM5RMeAEp43Uj9MTiy-lHCvMXVMY7fyawTUcAVy0M30g>
X-Sasl-enc: v53zTaceA1+lqzO+zODYxv/tddXBXlBgVkGAKbT4Gq5p 1502404972
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 448B37E300;
 Thu, 10 Aug 2017 18:42:51 -0400 (EDT)
Message-ID: <1502404969.9340.3.camel@mendozajonas.com>
Subject: Re: [RFC PATCH 3/3] net/ncsi: Configure VLAN tag filter
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ravindra S Rao1
 <ravindra.s@in.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ratan K Gupta <ratagupt@in.ibm.com>
Date: Fri, 11 Aug 2017 08:42:49 +1000
In-Reply-To: <CACPK8XeHv3JGaGExkmEiznsUeh5sFHkxyPw45OGeD_KUq2Mx7w@mail.gmail.com>
References: <20170809085443.13148-1-sam@mendozajonas.com>
 <20170809085443.13148-4-sam@mendozajonas.com>
 <CACPK8XeHv3JGaGExkmEiznsUeh5sFHkxyPw45OGeD_KUq2Mx7w@mail.gmail.com>
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
X-List-Received-Date: Thu, 10 Aug 2017 22:42:56 -0000

On Thu, 2017-08-10 at 17:19 +0930, Joel Stanley wrote:
> On Wed, Aug 9, 2017 at 6:24 PM, Samuel Mendoza-Jonas
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
> Thanks Sam. I've made some comments below.
> 
> > ---
> >  drivers/net/ethernet/faraday/ftgmac100.c |   2 +
> >  include/net/ncsi.h                       |   2 +
> >  net/ncsi/internal.h                      |  11 ++
> >  net/ncsi/ncsi-manage.c                   | 257 ++++++++++++++++++++++++++++++-
> >  net/ncsi/ncsi-rsp.c                      |  13 +-
> >  5 files changed, 281 insertions(+), 4 deletions(-)
> 
> 
> > @@ -699,11 +706,93 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
> >                 nca.package = np->id;
> >                 nca.channel = nc->id;
> > 
> > +               /* Clear any active filters on the channel before setting */
> > +               if (nd->state == ncsi_dev_state_config_clear_vids) {
> 
> This is epic. Could it go in a function?

Yep, I'll clean up and split out what I can.

> 
> > +                       clear = false;
> > +                       vlan_index = -1;
> > +                       spin_lock_irqsave(&nc->lock, flags);
> > +                       ncf = nc->filters[NCSI_FILTER_VLAN];
> > +                       while ((vlan_index = find_next_bit((void *)&ncf->bitmap, ncf->total, vlan_index + 1))
> 
> We should make ->bitmap an unsigned long, then we can pass it to
> find_next_bit without casting. Other users of it do the same thing
> with a temporary variable.

Ack

> 
> > +                              < ncf->total) {
> > +                               clear = true;
> > +                               // TODO retrieve the vid that was set
> 
> Still WIP?

Definitely still 'rough' :)

> 
> > +                               netdev_printk(KERN_DEBUG, dev, "ncsi: removed vlan tag at index %d\n",
> 
> Do we get a ncsi prefix from the driver name?

No we get a prefix of the form
	"ftgmac100 1e660000.ethernet eth0:"
so yes adding a NCSI prefix would be good.

> 
> > +                                               vlan_index);
> > +                               ncsi_remove_filter(nc, NCSI_FILTER_VLAN, vlan_index);
> > +                               break;
> > +                       }
> > +                       spin_unlock_irqrestore(&nc->lock, flags);
> > +
> > +int ncsi_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid)
> > +{
> > +       struct ncsi_channel_filter *ncf;
> > +       struct ncsi_dev_priv *ndp;
> > +       unsigned int n_vids = 0;
> > +       struct vlan_vid *vlan;
> > +       struct ncsi_dev *nd;
> > +       bool found = false;
> > +
> > +       if (n_vids >= ncf->total) {
> > +               netdev_info(dev, "NCSI Channel supports up to %u VLAN tags but %u are already set\n",
> > +                               ncf->total, n_vids);
> > +               return -EINVAL;
> > +       }
> > +
> > +       vlan = kzalloc(sizeof(struct vlan_vid), GFP_KERNEL);
> 
> Does this get freed anywhere?

Whoops!

> 
> > +       if (!vlan) {
> > +               netdev_err(dev, "could not alloc vlan_vid struct\n");
> > +               return -ENOMEM;
> > +       }
> > 
