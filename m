Return-Path: <sam@mendozajonas.com>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT3BN2gvLzDr0Y
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 08:45:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="jkcWhUUu"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DhwZbVZv"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 89A28F43;
 Thu, 10 Aug 2017 18:45:29 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Thu, 10 Aug 2017 18:45:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
 fm1; bh=KnBtANUYn7EPhvEl+iYP8+K9pp37CwW5oxv1FnSqywg=; b=jkcWhUUu
 LnjMpsGtHsQR6dv3fmxCQsvNdQtvmrBX+kzN8SJOG3Iuovqhs+ZfoAjCPaJI/2XU
 jdeTjczFEcvq6tKo+ebVlJeulRMDAATrzI2lA9H0OKp/wVfQRFIq0qtN/Vr7uOZv
 ajebT9XKo3ruHsg9lZG1nB0eXGOv05NKg1GCg5iYNeOpheqyeGptxbE8EWbX/YoS
 3MTk5gE8EaKW39cJH6U7kdvuqbCcH8zlnC54Kr4K1gyS9WaXROmoiW8g9WEDcnq/
 CNNl8vGENlP5IRb3oz+OqXQWJSj9tDpSWFcBkdML25NDtOOQvMnqYpLplPXOcSAK
 evmI0QTkjd+FfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
 fm1; bh=KnBtANUYn7EPhvEl+iYP8+K9pp37CwW5oxv1FnSqywg=; b=DhwZbVZv
 oTrVhchFaMyCIZscSkC5g9TvLJeJpbp8OiRyxHzXlAZSE8sE6SSoN9KbZXUF9OQy
 z+6IrM3Xh05vWlPofEX1WoR1jxAEL5kN0fAbE/TrzypvSO9dUW1P8GNmtfYS6jcq
 AfFtbJOGbel0lD2IMDBSckQXC5KdmTLl2KuJqwqIck5S4EpG+lvYeyxxp9bsm+Kc
 LVEEnY1Fze6OaxdJOSyCI0B42N4TBcL+SReOlBIR8z1KGRwonWsdBnEMhHCx1GaK
 gxbKYLPZ6IiVoekXWZaK/2EnpAyW8lofI8L60PlKrhPNgCxqSQkHkGADO2n4d33U
 edaQNsSgttv0bQ==
X-ME-Sender: <xms:CeKMWV2bUu-InnNDqoEFfvIzVtKFlGcueDRzK8WLnMdTpk5dI6AOUA>
X-Sasl-enc: AOAfhFjj2N9qxxV2m3B/EBQOCaW6PsfjArPMkIvQ7gRD 1502405128
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 84038247AE;
 Thu, 10 Aug 2017 18:45:27 -0400 (EDT)
Message-ID: <1502405125.9340.6.camel@mendozajonas.com>
Subject: Re: [RFC PATCH 3/3] net/ncsi: Configure VLAN tag filter
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ravindra S Rao1
 <ravindra.s@in.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ratan K Gupta <ratagupt@in.ibm.com>
Date: Fri, 11 Aug 2017 08:45:25 +1000
In-Reply-To: <CACPK8XdNzYRbH2cNMe+u1J3pNXNKZBGp0pRA+O1h7q=QEQ1MjQ@mail.gmail.com>
References: <20170809085443.13148-1-sam@mendozajonas.com>
 <20170809085443.13148-4-sam@mendozajonas.com>
 <CACPK8XdNzYRbH2cNMe+u1J3pNXNKZBGp0pRA+O1h7q=QEQ1MjQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 10 Aug 2017 22:45:33 -0000

On Thu, 2017-08-10 at 17:55 +0930, Joel Stanley wrote:
> On Wed, Aug 9, 2017 at 6:24 PM, Samuel Mendoza-Jonas
> <sam@mendozajonas.com> wrote:
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
> > +                       /*
> > +                        * Channels may be busy - mark dirty instead of kicking if
> > +                        * a) not ACTIVE (configured)
> > +                        * b) in the channel_queue (to be configured)
> > +                        * c) it's ndev is in the config state
> > +                        */
> > +                       if (nc->state != NCSI_CHANNEL_ACTIVE) {
> > +                               if ((ndp->ndev.state & 0xff00) == ncsi_dev_state_config ||
> > +                                               !list_empty(&nc->link)) {
> > +                                       netdev_info(nd->dev, "nc %p marked dirty\n", nc);
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
> > +                       list_add_tail_rcu(&nc->link, &ndp->channel_queue);
> > +                       spin_unlock_irqrestore(&ndp->lock, flags);
> > +
> > +                       spin_unlock_irqrestore(&nc->lock, flags);
> 
> Oops, this is unlocking nc->lock a second time.

Oops indeed! Good spot.

> 
> > +
> > +                       netdev_info(nd->dev, "Kicked channel %p\n", nc);
> > +                       n++;
> > +               }
> > +       }
