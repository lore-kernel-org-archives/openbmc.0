Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgvGW5BpdzDql5
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 21:25:23 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id u61BP7PH009867;
 Fri, 1 Jul 2016 06:25:11 -0500
Message-ID: <1467372307.7422.40.camel@kernel.crashing.org>
Subject: Re: [PATCH 07/10] net/farady: Read MAC address from chip
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 01 Jul 2016 21:25:07 +1000
In-Reply-To: <CACPK8XemtUzUMZXFjZSe9aQixcgiQnZimxMA7aMrts-1Yoya1Q@mail.gmail.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1467282471-16560-8-git-send-email-gwshan@linux.vnet.ibm.com>
 <CACPK8XemtUzUMZXFjZSe9aQixcgiQnZimxMA7aMrts-1Yoya1Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.3 (3.20.3-1.fc24.1) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jul 2016 11:25:24 -0000

On Thu, 2016-06-30 at 23:35 +0930, Joel Stanley wrote:
> On Thu, Jun 30, 2016 at 7:57 PM, Gavin Shan  wrote:
> > The device is assigned with random MAC address. It isn't reasonable.
> > An valid MAC address might have been in the chip. It's reasonable
> > to use it to maintain consistency.
> > 
> > This uses the MAC address in the chip if it's valid. Otherwise, a
> > random MAC address is given as before.

If that is a worry we could use a device-tree property. Does our
uboot update the DT ? If yes it can set the local-mac-address prop.

> > Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> > ---
> >  drivers/net/ethernet/faraday/ftgmac100.c | 60 ++++++++++++++++++++++++++++----
> >  1 file changed, 53 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> > index 2c22f74..120993e 100644
> > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > @@ -141,6 +141,55 @@ static void ftgmac100_set_mac(struct ftgmac100 *priv, const unsigned char *mac)
> >         iowrite32(laddr, priv->base + FTGMAC100_OFFSET_MAC_LADR);
> >  }
> > 
> > +static void ftgmac100_setup_mac(struct ftgmac100 *priv)
> > +{
> > +       unsigned char mac[6];
> > +       unsigned int m;
> > +       unsigned int l;
> > +
> > +       m = ioread32(priv->base + FTGMAC100_OFFSET_MAC_MADR);
> > +       l = ioread32(priv->base + FTGMAC100_OFFSET_MAC_LADR);
> > +
> > +       mac[0] = (m >> 8) & 0xff;
> > +       mac[1] = m & 0xff;
> > +       mac[2] = (l >> 24) & 0xff;
> > +       mac[3] = (l >> 16) & 0xff;
> > +       mac[4] = (l >> 8) & 0xff;
> > +       mac[5] = l & 0xff;
> > +
> > +       if (!is_valid_ether_addr(mac)) {
> > +               mac[5] = (m >> 8) & 0xff;
> > +               mac[4] = m & 0xff;
> > +               mac[3] = (l >> 24) & 0xff;
> > +               mac[2] = (l >> 16) & 0xff;
> > +               mac[1] = (l >>  8) & 0xff;
> > +               mac[0] = l & 0xff;
> > +       }
> > +
> > +       if (!is_valid_ether_addr(mac)) {
> > +               eth_hw_addr_random(priv->netdev);
> > +               dev_info(priv->dev, "Generated random MAC address %pM\n",
> > +                        priv->netdev->dev_addr);
> > +       } else {
> > +               memcpy(priv->netdev->dev_addr, mac, 6);
> > +               dev_info(priv->dev, "Read MAC address from chip %pM\n", mac);
> > +       }
> > +}
> > +
> > +static int ftgmac100_set_mac_addr(struct net_device *dev, void *p)
> > +{
> > +       int ret;
> > +
> > +       ret = eth_prepare_mac_addr_change(dev, p);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       eth_commit_mac_addr_change(dev, p);
> > +       ftgmac100_set_mac(netdev_priv(dev), dev->dev_addr);
> > +
> > +       return 0;
> > +}
> > +
> >  static void ftgmac100_init_hw(struct ftgmac100 *priv)
> >  {
> >         /* setup ring buffer base registers */
> > @@ -1141,7 +1190,7 @@ static const struct net_device_ops ftgmac100_netdev_ops = {
> >         .ndo_open               = ftgmac100_open,
> >         .ndo_stop               = ftgmac100_stop,
> >         .ndo_start_xmit         = ftgmac100_hard_start_xmit,
> > -       .ndo_set_mac_address    = eth_mac_addr,
> > +       .ndo_set_mac_address    = ftgmac100_set_mac_addr,
> >         .ndo_validate_addr      = eth_validate_addr,
> >         .ndo_do_ioctl           = ftgmac100_do_ioctl,
> >  };
> > @@ -1263,6 +1312,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
> > 
> >         priv->irq = irq;
> > 
> > +       /* MAC address from chip or random one */
> > +       ftgmac100_setup_mac(priv);
> > +
> >         err = ftgmac100_setup_mdio(netdev);
> >         if (err)
> >                 goto err_setup_mdio;
> > @@ -1276,12 +1328,6 @@ static int ftgmac100_probe(struct platform_device *pdev)
> > 
> >         netdev_info(netdev, "irq %d, mapped at %p\n", priv->irq, priv->base);
> > 
> > -       if (!is_valid_ether_addr(netdev->dev_addr)) {
> > -               eth_hw_addr_random(netdev);
> > -               netdev_info(netdev, "generated random MAC address %pM\n",
> > -                           netdev->dev_addr);
> > -       }
> > -
> >         return 0;
> > 
> >  err_register_netdev:
> > --
> > 2.1.0
> > 
