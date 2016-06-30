Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgLWw1kf8zDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 23:50:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=upb/P97c; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id j2so16674058qkf.1
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Z19mS0j4zeuG312LzseYNujPyq73VxGPtN5cwBYR6eU=;
 b=upb/P97cJYXCiEj9XKbxfXNEDPxKdVFtGcXY0H2pvxHJX9jjI45fHWahbawXIsOuH4
 fE1XziAppkPIqTW/0JxzdLjE7u3+dLUNYtrPVk6WN6hVyzEXG5zWcVikAsAc3KDGje74
 7ewminzB6oxMhEgzcXlFwr0gYo0q6EjT4TFeQmm69dDn3bugT6/V5Hszvj5EWuZpQe1c
 5OMAz7JkVcCDiWzWVk9YQcAXvsISXLzEHp59fCIIT3CiMaXuZx6br4YrkG5+k+7Mz9UO
 GaB694jYCI06x7LPc/zY6Vr2CeJSneByx3kxFBBLatHffaPbNCj8osskfI6FeYnMilv3
 Kkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Z19mS0j4zeuG312LzseYNujPyq73VxGPtN5cwBYR6eU=;
 b=ceDYXPE/chAZ49GxKzCV3tkujY9vDbqzoBeQhBJSAW6CCF8a5bzPe6tycrYAHzZmyz
 EJZLNW6dPTnD5anerE0EgspLoQpOpSMtfjLX1BoiGAU7QNWK93s3Qa3LC5/jxm9VE/eE
 Baem89YVQkkLDgMc+qY/v4a44lzumQJMvs9jVHi3zRLxwPY8OIl97Yl7DocjS+sH0TJh
 aSg3ydDYB3iLyu8pzrnP1UoHtGIXL/ot89VM/2AvxGa6FzCqhb6SjY9F4K4fDQTRqBWa
 bIWX+NsGaEP94O6sCJxB2YtcpJ9UVjWuDe8gVt12Oqv3HTLZFNHs7y31QwEC9YpzXhDg
 S9gw==
X-Gm-Message-State: ALyK8tJOInYvq0KoGM79HqK6DIC9aEUupAWis0v//J2G1YsH32QuiboN6sZBkEmR1XOVjq5eLWALS/XM6O/quA==
X-Received: by 10.55.152.198 with SMTP id a189mr18691075qke.208.1467294601777; 
 Thu, 30 Jun 2016 06:50:01 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 30 Jun 2016 06:49:42 -0700 (PDT)
In-Reply-To: <1467282471-16560-7-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1467282471-16560-7-git-send-email-gwshan@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 Jun 2016 23:19:42 +0930
X-Google-Sender-Auth: Mdm9f6R-SwD79ZNC1Qb5Trds2to
Message-ID: <CACPK8Xdk6VLzk-sh+K9_iTVT-_znn=Nw2SarhqNy0rozk-T+Zg@mail.gmail.com>
Subject: Re: [PATCH 06/10] net/farady: Helper functions to create or destroy
 MDIO interface
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
X-List-Received-Date: Thu, 30 Jun 2016 13:50:05 -0000

On Thu, Jun 30, 2016 at 7:57 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> This introduces two helper functions to create or destroy MDIO
> interface. No logical changes introduced.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 93 ++++++++++++++++++++------------
>  1 file changed, 58 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index e7cf313..2c22f74 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1146,6 +1146,58 @@ static const struct net_device_ops ftgmac100_netdev_ops = {
>         .ndo_do_ioctl           = ftgmac100_do_ioctl,
>  };
>
> +static int ftgmac100_setup_mdio(struct net_device *netdev)
> +{
> +       struct ftgmac100 *priv = netdev_priv(netdev);
> +       int i, err = 0;
> +
> +       /* initialize mdio bus */
> +       priv->mii_bus = mdiobus_alloc();
> +       if (!priv->mii_bus)
> +               return -EIO;
> +
> +       priv->mii_bus->name = "ftgmac100_mdio";
> +       snprintf(priv->mii_bus->id, MII_BUS_ID_SIZE, "ftgmac100_mii");

If we have two ftgmac100 drivers loaded (such as on the ast2500-evb),
when the second goes to create the mdiobus kobject it will have the
same name. We need to make this name unique (or fix up the mdiobus
code).

You can see a backtrace here:

  https://github.com/openbmc/linux/issues/87


> +       priv->mii_bus->priv = priv->netdev;
> +       priv->mii_bus->read = ftgmac100_mdiobus_read;
> +       priv->mii_bus->write = ftgmac100_mdiobus_write;
> +
> +       for (i = 0; i < PHY_MAX_ADDR; i++)
> +               priv->mii_bus->irq[i] = PHY_POLL;
> +
> +       err = mdiobus_register(priv->mii_bus);
> +       if (err) {
> +               dev_err(priv->dev, "Cannot register MDIO bus!\n");
> +               goto err_register_mdiobus;
> +       }
> +
> +       err = ftgmac100_mii_probe(priv);
> +       if (err) {
> +               dev_err(priv->dev, "MII Probe failed!\n");
> +               goto err_mii_probe;
> +       }
> +
> +       return 0;
> +
> +err_mii_probe:
> +       mdiobus_unregister(priv->mii_bus);
> +err_register_mdiobus:
> +       mdiobus_free(priv->mii_bus);
> +       return err;
> +}
> +
> +static void ftgmac100_destroy_mdio(struct net_device *netdev)
> +{
> +       struct ftgmac100 *priv = netdev_priv(netdev);
> +
> +       if (!netdev->phydev)
> +               return;
> +
> +       phy_disconnect(netdev->phydev);
> +       mdiobus_unregister(priv->mii_bus);
> +       mdiobus_free(priv->mii_bus);
> +}
> +
>  /******************************************************************************
>   * struct platform_driver functions
>   *****************************************************************************/
> @@ -1211,31 +1263,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
>
>         priv->irq = irq;
>
> -       /* initialize mdio bus */
> -       priv->mii_bus = mdiobus_alloc();
> -       if (!priv->mii_bus) {
> -               err = -EIO;
> -               goto err_alloc_mdiobus;
> -       }
> -
> -       priv->mii_bus->name = "ftgmac100_mdio";
> -       snprintf(priv->mii_bus->id, MII_BUS_ID_SIZE, "ftgmac100_mii");
> -
> -       priv->mii_bus->priv = netdev;
> -       priv->mii_bus->read = ftgmac100_mdiobus_read;
> -       priv->mii_bus->write = ftgmac100_mdiobus_write;
> -
> -       err = mdiobus_register(priv->mii_bus);
> -       if (err) {
> -               dev_err(&pdev->dev, "Cannot register MDIO bus!\n");
> -               goto err_register_mdiobus;
> -       }
> -
> -       err = ftgmac100_mii_probe(priv);
> -       if (err) {
> -               dev_err(&pdev->dev, "MII Probe failed!\n");
> -               goto err_mii_probe;
> -       }
> +       err = ftgmac100_setup_mdio(netdev);
> +       if (err)
> +               goto err_setup_mdio;
>
>         /* register network device */
>         err = register_netdev(netdev);
> @@ -1255,12 +1285,8 @@ static int ftgmac100_probe(struct platform_device *pdev)
>         return 0;
>
>  err_register_netdev:
> -       phy_disconnect(netdev->phydev);
> -err_mii_probe:
> -       mdiobus_unregister(priv->mii_bus);
> -err_register_mdiobus:
> -       mdiobus_free(priv->mii_bus);
> -err_alloc_mdiobus:
> +       ftgmac100_destroy_mdio(netdev);
> +err_setup_mdio:
>         iounmap(priv->base);
>  err_ioremap:
>         release_resource(priv->res);
> @@ -1280,10 +1306,7 @@ static int __exit ftgmac100_remove(struct platform_device *pdev)
>         priv = netdev_priv(netdev);
>
>         unregister_netdev(netdev);
> -
> -       phy_disconnect(netdev->phydev);
> -       mdiobus_unregister(priv->mii_bus);
> -       mdiobus_free(priv->mii_bus);
> +       ftgmac100_destroy_mdio(netdev);
>
>         iounmap(priv->base);
>         release_resource(priv->res);
> --
> 2.1.0
>
