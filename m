Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSmCm5HShzDqs4
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 21:30:44 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v7ABUOqS008755;
 Thu, 10 Aug 2017 06:30:26 -0500
Message-ID: <1502364624.2563.60.camel@kernel.crashing.org>
Subject: Re: [RFC PATCH 1/3] ftgmac: Include NETIF_F_HW_VLAN_CTAG_FILTER in
 features
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ravindra S Rao1
 <ravindra.s@in.ibm.com>, Ratan K Gupta <ratagupt@in.ibm.com>
Date: Thu, 10 Aug 2017 21:30:24 +1000
In-Reply-To: <CACPK8Xce-EnAuG-Gbd8TbK89W_ADsi6BOn8pb1p=4T3YwKfycQ@mail.gmail.com>
References: <20170809085443.13148-1-sam@mendozajonas.com>
 <20170809085443.13148-2-sam@mendozajonas.com>
 <CACPK8Xce-EnAuG-Gbd8TbK89W_ADsi6BOn8pb1p=4T3YwKfycQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.4 (3.24.4-1.fc26) 
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
X-List-Received-Date: Thu, 10 Aug 2017 11:30:45 -0000

On Thu, 2017-08-10 at 17:19 +0930, Joel Stanley wrote:
> > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > @@ -1837,6 +1837,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
> >                  NETIF_F_GRO | NETIF_F_SG | NETIF_F_HW_VLAN_CTAG_RX |
> >                  NETIF_F_HW_VLAN_CTAG_TX;
> > 
> > +       if (priv->use_ncsi)
> > +               netdev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
> 
> I'm a VLAN noob. Why is this conditional on ncsi?
> 
> Can the ftgmac100 support vlan with a directly attached PHY?

ftgmac100 supports vlans fine. This flag is telling the network stack
that we can offload the filtering so we need to get notified of vlans
being added or removed.

There is no point setting it when not doing ncsi. The HW doesn't have a
filter in that case (we do have HW vlan tag extraction and injection,
which my driver supports, but that's different flags).

Cheers,
Ben.
