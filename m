Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgLtc4rn8zDqm9
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 00:06:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=p84SmYNX; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id b136so16799970qkg.2
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 07:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=kVZhL3Qqhq8LLZomm5IrLyqGzxiGjbuiXrsr1eA5wv0=;
 b=p84SmYNX8S/zvG/3oB1a3hYDCY2WQG8AvdAEwOfTiNe2Zj4wlNTt26/PQkG65tBuB6
 Wi7+MSGXPazOyd6llq//YAAq8Dt1HWZ8H1KNU0QNoE9URNYHg5pP/SvkEaKTZgZSqxrC
 ETx7B7t5FwDgeLGxdM6kPAZuk5VO+E0v2VbOQPTE3PbA8ZYKs1Z4LrwonHo5vPRH+LM0
 jFJQaKMr38HiA7NhPngZqePQE6ysa0mBqVgLklAizMp4mDSZYqYk1EJXK0pm+saLFf3Z
 JX/5KiFf1J09fougS5i/ctewCGJ2aM+DHs0NqH2AkEJuSrl3eVyBQSShdwb/hjL/XF9R
 e/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=kVZhL3Qqhq8LLZomm5IrLyqGzxiGjbuiXrsr1eA5wv0=;
 b=LmnO8kGbPLDqZja9UBVblJYnNl2W66IooYa+l3smJAWDaBwiX1yeETqqMdV6wc5mXD
 CaNYMFpYxUxUxmWajHHjBRfcdzsad+gFxb+lc/6nhvVQ25VGEPFJx9OW9iRun8eaMguW
 64cgOwEbREaaDxCaOXFn/XrkRPpPp/UVa9M0XakXqLyU4JGxoYmOccECZHOEqJfMeANo
 uh4ZTZq3jIAPjht9QdIv8qMlCeqC9ndX0fe2wxvD0S4bdth7jCABCo8ncjrlu+oRqiOz
 z3d3sHIRzyglbQ1A8Hu9eIwS1BAYi9BH/b0IUVwXa0YZjbJaN8UZ8d2KuJsxNFETVP1a
 VFeg==
X-Gm-Message-State: ALyK8tJJ6HP8Na+Kp5dMTgR8X+N8VLcXS4uktjH8/KW8Y2bNnneC/3nQTaFxUM6XzDmmkKxLHL0of8e1zpebIg==
X-Received: by 10.55.217.89 with SMTP id u86mr19851944qki.114.1467295574700;
 Thu, 30 Jun 2016 07:06:14 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 30 Jun 2016 07:05:55 -0700 (PDT)
In-Reply-To: <1467282471-16560-9-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1467282471-16560-9-git-send-email-gwshan@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 Jun 2016 23:35:55 +0930
X-Google-Sender-Auth: 2O_vf2Yqa30zUU94UvKnwKYDRCM
Message-ID: <CACPK8Xeh12tWRvoQ=b32qj+78PPOMEO9+rEvL-X03ZrK_WVh-Q@mail.gmail.com>
Subject: Re: [PATCH 08/10] net/farady: Support NCSI mode
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 30 Jun 2016 14:06:17 -0000

On Thu, Jun 30, 2016 at 7:57 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> This makes ftgmac100 driver support NCSI mode. The NCSI is enabled
> on the interface if property "use-nc-si" or "use-ncsi" is found from
> the device node in device tree.
>
>    * No PHY device is used when NCSI mode is enabled.
>    * The NCSI device (struct ncsi_dev) is created when probing the
>      device while it's enabled/started when the interface is brought
>      up.
>    * Hardware IP checksum dosn't work when NCSI mode is enabled. It
>      is disabled on enabled NCSI.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 78 ++++++++++++++++++++++++++++----
>  1 file changed, 69 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 120993e..f2205ae 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -31,6 +31,7 @@
>  #include <linux/phy.h>
>  #include <linux/platform_device.h>
>  #include <net/ip.h>
> +#include <net/ncsi.h>
>
>  #include "ftgmac100.h"
>
> @@ -68,10 +69,13 @@ struct ftgmac100 {
>
>         struct net_device *netdev;
>         struct device *dev;
> +       struct ncsi_dev *ndev;
>         struct napi_struct napi;
>
>         struct mii_bus *mii_bus;
>         int old_speed;
> +       bool use_ncsi;
> +       bool enabled;
>  };
>
>  static int ftgmac100_alloc_rx_page(struct ftgmac100 *priv,
> @@ -1001,7 +1005,10 @@ static irqreturn_t ftgmac100_interrupt(int irq, void *dev_id)
>         struct net_device *netdev = dev_id;
>         struct ftgmac100 *priv = netdev_priv(netdev);
>
> -       if (likely(netif_running(netdev))) {
> +       /* When running in NCSI mode, the interface should be ready for
> +        * receiving or transmitting NCSI packets before it's opened.
> +        */
> +       if (likely(priv->use_ncsi || netif_running(netdev))) {
>                 /* Disable interrupts for polling */
>                 iowrite32(0, priv->base + FTGMAC100_OFFSET_IER);
>                 napi_schedule(&priv->napi);
> @@ -1114,17 +1121,33 @@ static int ftgmac100_open(struct net_device *netdev)
>                 goto err_hw;
>
>         ftgmac100_init_hw(priv);
> -       ftgmac100_start_hw(priv, 10);
> -
> -       phy_start(netdev->phydev);
> +       ftgmac100_start_hw(priv, priv->use_ncsi ? 100 : 10);
> +       if (netdev->phydev)
> +               phy_start(netdev->phydev);
> +       else if (priv->use_ncsi)
> +               netif_carrier_on(netdev);
>
>         napi_enable(&priv->napi);
>         netif_start_queue(netdev);
>
>         /* enable all interrupts */
>         iowrite32(INT_MASK_ALL_ENABLED, priv->base + FTGMAC100_OFFSET_IER);
> +
> +       /* Start the NCSI device */
> +       if (priv->use_ncsi) {
> +               err = ncsi_start_dev(priv->ndev);
> +               if (err)
> +                       goto err_ncsi;
> +       }
> +
> +       priv->enabled = true;
> +
>         return 0;
>
> +err_ncsi:
> +       napi_disable(&priv->napi);
> +       netif_stop_queue(netdev);
> +       iowrite32(0, priv->base + FTGMAC100_OFFSET_IER);
>  err_hw:
>         free_irq(priv->irq, netdev);
>  err_irq:
> @@ -1137,12 +1160,17 @@ static int ftgmac100_stop(struct net_device *netdev)
>  {
>         struct ftgmac100 *priv = netdev_priv(netdev);
>
> +       if (!priv->enabled)
> +               return 0;
> +
>         /* disable all interrupts */
> +       priv->enabled = false;
>         iowrite32(0, priv->base + FTGMAC100_OFFSET_IER);
>
>         netif_stop_queue(netdev);
>         napi_disable(&priv->napi);
> -       phy_stop(netdev->phydev);
> +       if (netdev->phydev)
> +               phy_stop(netdev->phydev);
>
>         ftgmac100_stop_hw(priv);
>         free_irq(priv->irq, netdev);
> @@ -1183,6 +1211,9 @@ static int ftgmac100_hard_start_xmit(struct sk_buff *skb,
>  /* optional */
>  static int ftgmac100_do_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
>  {
> +       if (!netdev->phydev)
> +               return -ENXIO;
> +
>         return phy_mii_ioctl(netdev->phydev, ifr, cmd);
>  }
>
> @@ -1247,6 +1278,15 @@ static void ftgmac100_destroy_mdio(struct net_device *netdev)
>         mdiobus_free(priv->mii_bus);
>  }
>
> +static void ftgmac100_ncsi_handler(struct ncsi_dev *nd)
> +{
> +       if (unlikely(nd->nd_state != ncsi_dev_state_functional))
> +               return;
> +
> +       netdev_info(nd->nd_dev, "NCSI interface %s\n",
> +                   nd->nd_link_up ? "up" : "down");

We get this message whenever the device is brought up or down. This
includes when the host reboots, filling up the bmc's kernel logs.

However, when we had the timer race it was the only way to know what
was going on. Can we detect when it's the host bringing the device
down opposed to an "ifconfig up" failing to bring it up?


> +}
> +
>  /******************************************************************************
>   * struct platform_driver functions
>   *****************************************************************************/
> @@ -1256,7 +1296,7 @@ static int ftgmac100_probe(struct platform_device *pdev)
>         int irq;
>         struct net_device *netdev;
>         struct ftgmac100 *priv;
> -       int err;
> +       int err = 0;
>
>         if (!pdev)
>                 return -ENODEV;
> @@ -1280,7 +1320,15 @@ static int ftgmac100_probe(struct platform_device *pdev)
>
>         netdev->ethtool_ops = &ftgmac100_ethtool_ops;
>         netdev->netdev_ops = &ftgmac100_netdev_ops;
> +
> +       /* We have to disable on-chip IP checksum functionality
> +        * when NCSI is enabled on the interface. It doesn't work
> +        * in that case.
> +        */
>         netdev->features = NETIF_F_IP_CSUM | NETIF_F_GRO;
> +       if (pdev->dev.of_node &&
> +           of_get_property(pdev->dev.of_node, "no-hw-checksum", NULL))
> +               netdev->features &= ~NETIF_F_IP_CSUM;

We set this in all of the aspeed BMC platforms, including the
firestone which uses the device with a dedicated PHY. Should we
instead match off the aspeed platform?

>
>         platform_set_drvdata(pdev, netdev);
>
> @@ -1315,9 +1363,20 @@ static int ftgmac100_probe(struct platform_device *pdev)
>         /* MAC address from chip or random one */
>         ftgmac100_setup_mac(priv);
>
> -       err = ftgmac100_setup_mdio(netdev);
> -       if (err)
> -               goto err_setup_mdio;
> +       if (pdev->dev.of_node &&
> +           (of_get_property(pdev->dev.of_node, "use-nc-si", NULL) ||
> +           of_get_property(pdev->dev.of_node, "use-ncsi", NULL))) {

I think we want to settle on one spelling when going upstream.

> +               dev_info(&pdev->dev, "Using NCSI interface\n");
> +               priv->use_ncsi = true;
> +               priv->ndev = ncsi_register_dev(netdev, ftgmac100_ncsi_handler);
> +               if (!priv->ndev)
> +                       goto err_ncsi_dev;

When the user (read: Joel) mistakenly puts "use-ncsi" in the device
tree, but forgets to enable CONFIG_NET_NCSI in their kernel, the
driver silently. I added this hack in my tree:

 https://github.com/shenki/linux/commit/e52b8ec4f16a6467860ee705599c7cf282272d97

Could we do something similar to protect dumb users from themselves?

> +       } else {
> +               priv->use_ncsi = false;
> +               err = ftgmac100_setup_mdio(netdev);
> +               if (err)
> +                       goto err_setup_mdio;
> +       }
>
>         /* register network device */
>         err = register_netdev(netdev);
> @@ -1330,6 +1389,7 @@ static int ftgmac100_probe(struct platform_device *pdev)
>
>         return 0;
>
> +err_ncsi_dev:
>  err_register_netdev:
>         ftgmac100_destroy_mdio(netdev);
>  err_setup_mdio:
> --
> 2.1.0
>
