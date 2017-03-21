Return-Path: <joe.hershberger@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnjdM4Wt4zDq7c
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 06:32:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nii0r3+9"; 
 dkim-atps=neutral
Received: by mail-qk0-x241.google.com with SMTP id o135so23503099qke.2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 12:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=cknOxc2f7krG0/z/SmCpzLbbDjPuSz7JlJnVjJ1fJUA=;
 b=nii0r3+9B54JZ423JiMgY8jPnX7MsGqweDxW7+gLK00SccVk4JuyvF3Dv9VNj7sgva
 sIGhkBSJwbYuC7t1QF/hI8Tl6Mzi8Nv7Fdv60KWMRzWNkzlmjjiLbcVUxDMQ8jSj9yMI
 vXGP2gUKrCv/WcgEDzo1heagix38McAk45MJiRWfJCEXg3cFE9xyWAUsbvvHpkNYugB0
 elEKvGBK58coxlXelVmn07IFLoBRs4nWt9r9fc2GLcO7bGfHBw/eF1U9RkmKGmi0wZQq
 vd1QxpQ+J0noCV0L1yfXi2j/qnLp7+VpkAZbBaPIXQW1ntX14mSUi0YDCTSKP3k5yNQZ
 sE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=cknOxc2f7krG0/z/SmCpzLbbDjPuSz7JlJnVjJ1fJUA=;
 b=R2dAcQ4Z4LEyRIz04muswqqgF4XtpjgVm24wC0fJ3GsxqYUVE7o73Qqxo0/qZYvkls
 HnOlZf1pNAoo/VY2i8QJ7bi7P7lywB+YRbYrs8wfjzsjgcnLyTqdRDTahWvN/vOodicr
 obPJdZ7Qis8Nq7qfAOJfesr+LUcqqVSlFLxyfCh7P5ReYfV/INB25UmtwbcBV61qHAeY
 YtTFqZweoB3s9pnlyGJx/gPxtvs8sjGHWC4VtaOl0vDC/M/RKYTPLSFmjeJRq9bDZ+O7
 qud2kO4Fdi9qVRDBqpE4A1ayUwAsrA5qfYuwaSCotOaM5Gdt+FHLlaBTvq9S3Ie5wKsl
 m55A==
X-Gm-Message-State: AFeK/H0Rd2rqrVZQuzcQrtGlRgCS2gAFw2/PoNbWJ1tqFJwh1ofB2H6IlSVayP3lSJ49KXMALYWkobQnYQEHtw==
X-Received: by 10.55.129.71 with SMTP id c68mr31234117qkd.195.1490124756447;
 Tue, 21 Mar 2017 12:32:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.51.230 with HTTP; Tue, 21 Mar 2017 12:32:16 -0700 (PDT)
In-Reply-To: <20170316213624.140344-17-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-17-maxims@google.com>
From: Joe Hershberger <joe.hershberger@gmail.com>
Date: Tue, 21 Mar 2017 14:32:16 -0500
Message-ID: <CANr=Z=bMy9v0G-DAHB4LJZnHB1W3rqubY8-EK5Mn4W3dqQOk3g@mail.gmail.com>
Subject: Re: [U-Boot] [PATCH 16/17] aspeed: Add AST2500/AST2400 compatible NIC
 Driver
To: Maxim Sloyko <maxims@google.com>
Cc: u-boot <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>, 
 Joe Hershberger <joe.hershberger@ni.com>, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Wed, 22 Mar 2017 16:22:32 +1100
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
X-List-Received-Date: Tue, 21 Mar 2017 19:32:40 -0000

On Thu, Mar 16, 2017 at 4:36 PM, Maxim Sloyko <maxims@google.com> wrote:
> The device that Aspeed uses is basically Faraday FTGMAC100, but with
> some differences here and there. Since I don't have access to a properly
> implemented FTGMAC100 though, I can't really test it and so I don't
> feel comfortable claiming compatibility, even though I reused a lot of
> FTGMAC100 driver code.

I think it would be better to attempt to integrate this driver with
the FTGMAC driver and ask others on the list who have that HW to test
your changes to ensure no regressions. I prefer we have fewer drivers
to maintain.

I'll review what you've got here, and presumably the comments apply to
either your changes or the FTGMAC driver.

> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
>  drivers/net/Kconfig   |   8 +
>  drivers/net/Makefile  |   1 +
>  drivers/net/ast_nic.c | 584 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/net/ast_nic.h | 198 +++++++++++++++++
>  4 files changed, 791 insertions(+)
>  create mode 100644 drivers/net/ast_nic.c
>  create mode 100644 drivers/net/ast_nic.h
>
> diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
> index 70e36611ea..6de8b35d9f 100644
> --- a/drivers/net/Kconfig
> +++ b/drivers/net/Kconfig
> @@ -208,4 +208,12 @@ config GMAC_ROCKCHIP
>           This driver provides Rockchip SoCs network support based on the
>           Synopsys Designware driver.
>
> +config AST_NIC
> +       bool "Support Aspeed ast2500/ast2400 NIC"
> +       depends on DM_ETH
> +       help
> +         This driver provides support for ast2500/ast2400 network devices.
> +         It uses Driver Model and so can support multiple devices on the same SoC.
> +         The device itself is basically a variation of Faraday FTGMAC100.
> +
>  endif # NETDEVICES
> diff --git a/drivers/net/Makefile b/drivers/net/Makefile
> index 2493a48b88..792bebb9cc 100644
> --- a/drivers/net/Makefile
> +++ b/drivers/net/Makefile
> @@ -78,3 +78,4 @@ obj-$(CONFIG_FSL_MEMAC) += fm/memac_phy.o
>  obj-$(CONFIG_VSC9953) += vsc9953.o
>  obj-$(CONFIG_PIC32_ETH) += pic32_mdio.o pic32_eth.o
>  obj-$(CONFIG_DWC_ETH_QOS) += dwc_eth_qos.o
> +obj-$(CONFIG_AST_NIC) += ast_nic.o
> diff --git a/drivers/net/ast_nic.c b/drivers/net/ast_nic.c
> new file mode 100644
> index 0000000000..881d20151c
> --- /dev/null
> +++ b/drivers/net/ast_nic.c
> @@ -0,0 +1,584 @@
> +/*
> + * (C) Copyright 2009 Faraday Technology
> + * Po-Yu Chuang <ratbert@faraday-tech.com>
> + *
> + * (C) Copyright 2010 Andes Technology
> + * Macpaul Lin <macpaul@andestech.com>
> + *
> + * Copyright 2017 Google Inc
> + *
> + * SPDX-License-Identifier:    GPL-2.0+
> + */
> +
> +/*
> + * This device is basically Faraday FTGMAC100, with some differences,
> + * which do not seem to be very big, but are in very random places, like
> + * some registers removed and completely different ones put in their place.
> + */
> +
> +#include <common.h>
> +#include <dm.h>
> +#include <clk.h>
> +#if defined(CONFIG_MII) || defined(CONFIG_CMD_MII)
> +#include <miiphy.h>
> +#endif
> +#include <net.h>
> +#include <asm/io.h>
> +#include <linux/mii.h>
> +#include "ast_nic.h"
> +
> +#define ETH_ZLEN       60
> +#define RBSR_DEFAULT_VALUE     0x640
> +
> +#define PKTBUFSTX      4
> +
> +#define MAX_PHY_ADDR 32
> +
> +struct ast_nic_xdes {
> +       u32 des[4];
> +} __aligned(16);

Can you use a constant for this, like ARCH_DMA_MINALIGN?

> +
> +struct ast_nic_xdes ast_txdes[PKTBUFSTX];
> +struct ast_nic_xdes ast_rxdes[PKTBUFSRX];

Any reason these are not static? Also, why globals instead of allocated?

> +
> +struct ast_nic_priv {
> +       struct ast_nic_xdes *txdes;
> +       struct ast_nic_xdes *rxdes;
> +       struct ast_nic_regs *regs;
> +       int tx_index;
> +       int rx_index;
> +       int phy_addr;
> +};
> +
> +static int ast_nic_ofdata_to_platdata(struct udevice *dev)
> +{
> +       struct ast_nic_priv *priv = dev_get_priv(dev);
> +       struct eth_pdata *platdata = dev_get_platdata(dev);
> +
> +       priv->regs = dev_get_addr_ptr(dev);
> +       priv->txdes = ast_txdes;
> +       priv->rxdes = ast_rxdes;
> +       platdata->iobase = (phys_addr_t)priv->regs;
> +
> +       return 0;
> +}
> +
> +static void ast_nic_reset(struct udevice *dev)
> +{
> +       struct ast_nic_priv *priv = dev_get_priv(dev);
> +
> +       setbits_le32(&priv->regs->maccr, MAC_MACCR_SW_RST);
> +       while (readl(&priv->regs->maccr) & MAC_MACCR_SW_RST)
> +               ;

Use <wait_bit.h> and wait_for_bit()

> +       /*
> +        * Only needed for ast2400, for ast2500 this is the no-op,
> +        * because the register is marked read-only.
> +        */
> +       setbits_le32(&priv->regs->fear0, MAC_FEAR_NEW_MD_IFACE);
> +}
> +
> +static int ast_nic_phy_read(struct udevice *dev, int phy_addr,
> +                           int regnum, u16 *value)
> +{
> +       struct ast_nic_priv *priv = dev_get_priv(dev);
> +       int phycr;
> +       int i;
> +
> +       phycr = MAC_PHYCR_FIRE | MAC_PHYCR_ST_22 | MAC_PHYCR_READ |
> +           (phy_addr << MAC_PHYCR_PHYAD_SHIFT) |
> +           (regnum << MAC_PHYCR_REGAD_SHIFT);
> +
> +       writel(phycr, &priv->regs->phycr);
> +
> +       for (i = 0; i < 10; i++) {
> +               phycr = readl(&priv->regs->phycr);
> +
> +               if ((phycr & MAC_PHYCR_FIRE) == 0) {

Use wait_for_bit()

> +                       int data;
> +
> +                       data = readl(&priv->regs->phydata);
> +                       *value = (data & MAC_PHYDATA_MIIRDATA_MASK) >>
> +                           MAC_PHYDATA_MIIRDATA_SHIFT;
> +
> +                       return 0;
> +               }
> +
> +               mdelay(10);
> +       }
> +
> +       debug("mdio read timed out\n");

If you're going to print, better to include the phy addr that failed to respond.

> +       return -ETIMEDOUT;
> +}
> +
> +static int ast_nic_phy_write(struct udevice *dev, int phy_addr,
> +       int regnum, u16 value)
> +{
> +       struct ast_nic_priv *priv = dev_get_priv(dev);
> +       int phycr;
> +       int i;
> +
> +       phycr = (value << MAC_PHYDATA_MIIWDATA_SHIFT) |
> +                       MAC_PHYCR_FIRE | MAC_PHYCR_ST_22 |
> +                       MAC_PHYCR_WRITE |
> +                       (phy_addr << MAC_PHYCR_PHYAD_SHIFT) |
> +                       (regnum << MAC_PHYCR_REGAD_SHIFT);
> +
> +       writel(phycr, &priv->regs->phycr);
> +
> +       for (i = 0; i < 10; i++) {
> +               phycr = readl(&priv->regs->phycr);
> +
> +               if ((phycr & MAC_PHYCR_FIRE) == 0) {

Use wait_for_bit()

> +                       debug("(phycr & MAC_PHYCR_MIIWR) == 0: phy_addr: %x\n",
> +                             phy_addr);

Seems this would be chatty. Any good reason to see every phy write?

> +                       return 0;
> +               }
> +
> +               mdelay(10);
> +       }
> +
> +       debug("mdio write timed out\n");

If you're going to print, better to include the phy addr that failed to respond.

> +
> +       return -ETIMEDOUT;
> +}
> +
> +#if defined(CONFIG_MII) || defined(CONFIG_CMD_MII)
> +static int ast_nic_reg_read(struct mii_dev *bus, int addr, int devad, int reg)
> +{
> +       struct udevice *dev = eth_get_dev_by_name(bus->name);
> +       u16 value;
> +
> +       ast_nic_phy_read(dev, addr, reg, &value);
> +
> +       return value;
> +}
> +
> +static int ast_nic_reg_write(struct mii_dev *bus, int addr, int devad, int reg,
> +                            u16 value)
> +{
> +       struct udevice *dev = eth_get_dev_by_name(bus->name);
> +
> +       return ast_nic_phy_write(dev, addr, reg, value);
> +}
> +#endif
> +
> +static int ast_nic_probe(struct udevice *dev)
> +{
> +       struct clk mac_clk;
> +       struct clk d2pll_clk;
> +       int ret;
> +
> +       debug("%s()\n", __func__);
> +
> +       ret = clk_get_by_index(dev, 0, &mac_clk);
> +       if (ret) {
> +               debug("%s(): get_clk_by_index failed: %d\n", __func__, ret);
> +               return ret;
> +       }
> +
> +       clk_enable(&mac_clk);
> +
> +       ret = clk_get_by_index(dev, 1, &d2pll_clk);
> +       if (ret) {
> +               debug("%s(): get_clk_by_index failed: %d\n", __func__, ret);
> +               return ret;
> +       }
> +
> +       clk_enable(&d2pll_clk);
> +
> +#if defined(CONFIG_MII) || defined(CONFIG_CMD_MII)
> +       struct mii_dev *mdiodev = mdio_alloc();
> +       if (!mdiodev)
> +               return -ENOMEM;
> +       strncpy(mdiodev->name, dev->name, MDIO_NAME_LEN);
> +       mdiodev->read = ast_nic_reg_read;
> +       mdiodev->write = ast_nic_reg_write;
> +
> +       ret = mdio_register(mdiodev);
> +       if (ret < 0)
> +               return ret;
> +#endif
> +
> +       ast_nic_reset(dev);
> +
> +       return 0;
> +}
> +
> +static int ast_nic_phy_reset(struct udevice *dev)
> +{
> +       struct ast_nic_priv *priv = dev_get_priv(dev);
> +       int i;
> +       u16 status, adv;
> +
> +       adv = ADVERTISE_CSMA | ADVERTISE_ALL;
> +
> +       ast_nic_phy_write(dev, priv->phy_addr, MII_ADVERTISE, adv);
> +
> +       printf("%s: Starting autonegotiation...\n", dev->name);
> +
> +       ast_nic_phy_write(dev, priv->phy_addr,
> +                         MII_BMCR, (BMCR_ANENABLE | BMCR_ANRESTART));
> +
> +       for (i = 0; i < 1000; i++) {
> +               ast_nic_phy_read(dev, priv->phy_addr, MII_BMSR, &status);
> +
> +               if (status & BMSR_ANEGCOMPLETE)
> +                       break;

Use wait_for_bit()

> +               mdelay(1);
> +       }
> +
> +       if (status & BMSR_ANEGCOMPLETE) {
> +               printf("%s: Autonegotiation complete\n", dev->name);
> +       } else {
> +               printf("%s: Autonegotiation timed out (status=0x%04x)\n",
> +                      dev->name, status);
> +               return -ETIMEDOUT;
> +       }
> +
> +       return 0;
> +}
> +
> +static int ast_nic_phy_init(struct udevice *dev)
> +{

It seems this function should be replaced with phylib support.

> +       struct ast_nic_priv *priv = dev_get_priv(dev);
> +       int phy_addr;
> +       u16 phy_id, status, adv, lpa, stat_ge;
> +       int media, speed, duplex;
> +       int i;
> +
> +       /* Check if the PHY is up to snuff... */

I'm not sure how "up to snuff" is defined for a phy... so maybe remove
this comment or reword it.

> +       for (phy_addr = 0; phy_addr < MAX_PHY_ADDR; phy_addr++) {
> +               ast_nic_phy_read(dev, phy_addr, MII_PHYSID1, &phy_id);
> +
> +               /*
> +                * When it is unable to found PHY,

"found" -> "find the"

> +                * the interface usually return 0xffff or 0x0000
> +                */
> +               if (phy_id != 0xffff && phy_id != 0x0) {
> +                       debug("%s: found PHY at 0x%02x\n", dev->name, phy_addr);
> +                       priv->phy_addr = phy_addr;
> +                       break;
> +               }
> +       }
> +
> +       if (phy_id == 0xffff || phy_id == 0x0) {
> +               debug("%s: no PHY present\n", dev->name);
> +               return -ENODEV;
> +       }
> +
> +       ast_nic_phy_read(dev, priv->phy_addr, MII_BMSR, &status);
> +
> +       if (!(status & BMSR_LSTATUS)) {
> +               /* Try to re-negotiate if we don't have link already. */
> +               ast_nic_phy_reset(dev);
> +
> +               for (i = 0; i < 100000 / 100; i++) {
> +                       ast_nic_phy_read(dev, priv->phy_addr,
> +                                        MII_BMSR, &status);
> +                       if (status & BMSR_LSTATUS)

Use wait_for_bit()

> +                               break;
> +                       udelay(100);
> +               }
> +       }
> +
> +       if (!(status & BMSR_LSTATUS)) {
> +               printf("%s: link down\n", dev->name);
> +               return -ENOLINK;
> +       }
> +
> +       /* 1000 Base-T Status Register */
> +       ast_nic_phy_read(dev, priv->phy_addr, MII_STAT1000, &stat_ge);
> +
> +       speed = (stat_ge & (LPA_1000FULL | LPA_1000HALF)
> +                ? 1 : 0);

This variable should be named "speed_is_1000" since that's what it
appears to mean.

> +
> +       duplex = ((stat_ge & LPA_1000FULL)
> +                 ? 1 : 0);

This variable should be named "full_duplex" since that's what it
appears to mean.

> +
> +       if (speed) {            /* Speed is 1000 */
> +               debug("%s: link up, 1000bps %s-duplex\n",
> +                     dev->name, duplex ? "full" : "half");
> +               return 0;
> +       }
> +
> +       ast_nic_phy_read(dev, priv->phy_addr, MII_ADVERTISE, &adv);
> +       ast_nic_phy_read(dev, priv->phy_addr, MII_LPA, &lpa);
> +
> +       media = mii_nway_result(lpa & adv);
> +       speed = (media & (ADVERTISE_100FULL | ADVERTISE_100HALF) ? 1 : 0);

Name this "speed_is_100".

> +       duplex = (media & ADVERTISE_FULL) ? 1 : 0;
> +
> +       debug("%s: link up, %sMbps %s-duplex\n",
> +             dev->name, speed ? "100" : "10", duplex ? "full" : "half");
> +
> +       return 0;
> +}
> +
> +static int ast_nic_update_link_speed(struct udevice *dev)
> +{
> +       struct ast_nic_priv *priv = dev_get_priv(dev);
> +       u16 stat_fe;
> +       u16 stat_ge;
> +       u32 maccr;
> +
> +       /* 1000 Base-T Status Register */
> +       ast_nic_phy_read(dev, priv->phy_addr, MII_STAT1000, &stat_ge);
> +       ast_nic_phy_read(dev, priv->phy_addr, MII_BMSR, &stat_fe);
> +
> +       if (!(stat_fe & BMSR_LSTATUS))  /* link status up? */
> +               return -EIO;
> +
> +       /* read MAC control register and clear related bits */
> +       maccr = readl(&priv->regs->maccr) &
> +               ~(MAC_MACCR_GIGA_MODE |
> +                 MAC_MACCR_FAST_MODE |
> +                 MAC_MACCR_FULLDUP);
> +
> +       if (stat_ge & LPA_1000FULL) {
> +               /* set gmac for 1000BaseTX and Full Duplex */
> +               maccr |= MAC_MACCR_GIGA_MODE | MAC_MACCR_FULLDUP;
> +       }
> +
> +       if (stat_ge & LPA_1000HALF) {
> +               /* set gmac for 1000BaseTX and Half Duplex */
> +               maccr |= MAC_MACCR_GIGA_MODE;
> +       }
> +
> +       if (stat_fe & BMSR_100FULL) {
> +               /* set MII for 100BaseTX and Full Duplex */
> +               maccr |= MAC_MACCR_FAST_MODE | MAC_MACCR_FULLDUP;
> +       }
> +
> +       if (stat_fe & BMSR_10FULL) {
> +               /* set MII for 10BaseT and Full Duplex */
> +               maccr |= MAC_MACCR_FULLDUP;
> +       }
> +
> +       if (stat_fe & BMSR_100HALF) {
> +               /* set MII for 100BaseTX and Half Duplex */
> +               maccr |= MAC_MACCR_FAST_MODE;
> +       }
> +
> +       if (stat_fe & BMSR_10HALF) {
> +               /* set MII for 10BaseT and Half Duplex */
> +               /* we have already clear these bits, do nothing */
> +               ;
> +       }
> +
> +       /* update MII config into maccr */
> +       writel(maccr, &priv->regs->maccr);
> +
> +       return 0;
> +}
> +
> +static int ast_nic_start(struct udevice *dev)
> +{
> +       struct ast_nic_priv *priv = dev_get_priv(dev);
> +       struct ast_nic_xdes *txdes = priv->txdes;
> +       struct ast_nic_xdes *rxdes = priv->rxdes;
> +       u32 maccr;
> +       int i;
> +
> +       debug("%s()\n", __func__);
> +
> +       ast_nic_reset(dev);
> +
> +       /* disable all interrupts */
> +       writel(0, &priv->regs->ier);
> +
> +       /* initialize descriptors */
> +       priv->tx_index = 0;
> +       priv->rx_index = 0;
> +
> +       txdes[PKTBUFSTX - 1].des[0]     = cpu_to_le32(MAC_TXDES0_EDOTR);
> +       rxdes[PKTBUFSRX - 1].des[0]     = cpu_to_le32(MAC_RXDES0_EDORR);
> +
> +       for (i = 0; i < PKTBUFSTX; i++) {
> +               /* TXBUF_BADR */
> +               txdes[i].des[3] = 0;
> +               txdes[i].des[1] = 0;
> +       }
> +
> +       for (i = 0; i < PKTBUFSRX; i++) {
> +               /* RXBUF_BADR */
> +               rxdes[i].des[3] = (u32)net_rx_packets[i];
> +
> +               rxdes[i].des[0] &= ~MAC_RXDES0_RXPKT_RDY;
> +       }
> +
> +       /* transmit ring */
> +       writel((u32)txdes, &priv->regs->txr_badr);
> +
> +       /* receive ring */
> +       writel((u32)rxdes, &priv->regs->rxr_badr);
> +
> +       /* poll receive descriptor automatically */
> +       writel((1 << MAC_APTC_RXPOLL_CNT_SHIFT), &priv->regs->aptc);
> +
> +       /* config receive buffer size register */
> +       writel(RBSR_DEFAULT_VALUE, &priv->regs->rbsr);
> +
> +       /* enable transmitter, receiver */
> +       maccr = MAC_MACCR_TXMAC_EN |
> +               MAC_MACCR_RXMAC_EN |
> +               MAC_MACCR_TXDMA_EN |
> +               MAC_MACCR_RXDMA_EN |
> +               MAC_MACCR_FULLDUP |
> +               MAC_MACCR_CRC_APD |
> +               MAC_MACCR_RX_RUNT |
> +               MAC_MACCR_RX_BROADPKT;
> +
> +       writel(maccr, &priv->regs->maccr);
> +
> +       ast_nic_phy_init(dev);
> +
> +       return ast_nic_update_link_speed(dev);
> +}
> +
> +static void ast_nic_stop(struct udevice *dev)
> +{
> +       struct ast_nic_priv *priv = dev_get_priv(dev);
> +
> +       debug("%s()\n", __func__);
> +
> +       clrbits_le32(&priv->regs->maccr,
> +                    MAC_MACCR_TXDMA_EN | MAC_MACCR_RXDMA_EN |
> +                    MAC_MACCR_TXMAC_EN | MAC_MACCR_RXMAC_EN);
> +}
> +
> +static int ast_nic_send(struct udevice *dev, void *packet, int length)
> +{
> +       struct ast_nic_priv *priv = dev_get_priv(dev);
> +       struct ast_nic_xdes *curr_des = &priv->txdes[priv->tx_index];
> +       unsigned long start;
> +       unsigned long now;
> +       unsigned long diff_time;
> +
> +       if (curr_des->des[0] & MAC_TXDES0_TXDMA_OWN) {
> +               debug("%s(): no TX descriptor available\n", __func__);
> +               return -EIO;
> +       }
> +
> +       debug("%s(%x, %x)\n", __func__, (int)packet, length);
> +
> +       length = (length < ETH_ZLEN) ? ETH_ZLEN : length;
> +
> +       /* initiate a transmit sequence */
> +       curr_des->des[3] = (u32) packet;        /* TXBUF_BADR */
> +
> +       curr_des->des[0] &= MAC_TXDES0_EDOTR;
> +
> +       curr_des->des[0] |= (MAC_TXDES0_FTS |
> +                            MAC_TXDES0_LTS |
> +                            ((length << MAC_TXDES0_TXBUF_SIZE_SHIFT) &
> +                             MAC_TXDES0_TXBUF_SIZE_MASK) |
> +                            MAC_TXDES0_TXDMA_OWN);
> +
> +       /* start transmit */
> +       writel(1, &priv->regs->txpd);
> +       invalidate_dcache_range((u32) curr_des,
> +                               (u32) curr_des + sizeof(*curr_des));
> +
> +       /* wait for transfer to succeed */
> +       start = get_timer(0);
> +
> +       while (curr_des->des[0] & MAC_TXDES0_TXDMA_OWN) {
> +               now = get_timer(0);
> +               if (now < start)
> +                       now += 0xffffffff;
> +               diff_time = now - start;
> +               if (diff_time >= 5000) {
> +                       debug("%s(): timed out\n", __func__);
> +                       return -ETIMEDOUT;
> +               }
> +       }
> +
> +       debug("%s(): packet sent\n", __func__);
> +
> +       priv->tx_index = (priv->tx_index + 1) % PKTBUFSTX;
> +
> +       return 0;
> +}
> +
> +static int ast_nic_recv(struct udevice *dev, int flags, uchar **packetp)
> +{
> +       struct ast_nic_priv *priv = dev_get_priv(dev);
> +       struct ast_nic_xdes *curr_des;
> +       unsigned short rxlen;
> +
> +       curr_des = &priv->rxdes[priv->rx_index];
> +
> +       invalidate_dcache_range((u32) curr_des,
> +                               (u32) curr_des + sizeof(*curr_des));
> +
> +       if (!(curr_des->des[0] & MAC_RXDES0_RXPKT_RDY))
> +               return -ENOMSG;
> +
> +       if (curr_des->des[0] & (MAC_RXDES0_RX_ERR |
> +                               MAC_RXDES0_CRC_ERR |
> +                               MAC_RXDES0_FTL |
> +                               MAC_RXDES0_RUNT | MAC_RXDES0_RX_ODD_NB)) {
> +               return -EIO;
> +       }
> +
> +       rxlen =
> +           (curr_des->des[0] >> MAC_RXDES0_VDBC_SHIFT) & MAC_RXDES0_VDBC_MASK;
> +
> +       debug("%s(): RX buffer %d, %x received\n",
> +             __func__, priv->rx_index, rxlen);
> +
> +       invalidate_dcache_range((u32) curr_des->des[3],
> +                               (u32) curr_des->des[3] + rxlen);
> +
> +       /* pass the packet up to the protocol layers. */
> +       net_process_received_packet((void *)curr_des->des[3], rxlen);
> +
> +       curr_des->des[0] &= ~MAC_RXDES0_RXPKT_RDY;
> +
> +       priv->rx_index = (priv->rx_index + 1) % PKTBUFSRX;
> +
> +       return 0;
> +}
> +
> +static int ast_nic_write_hwaddr(struct udevice *dev)
> +{
> +       struct ast_nic_priv *priv = dev_get_priv(dev);
> +       struct eth_pdata *platdata = dev_get_platdata(dev);
> +       u32 madr, ladr;
> +
> +       debug("%s(%pM)\n", __func__, platdata->enetaddr);
> +
> +       madr = platdata->enetaddr[0] << 8 | platdata->enetaddr[1];
> +       ladr = platdata->enetaddr[2] << 24 | platdata->enetaddr[3] << 16
> +           | platdata->enetaddr[4] << 8 | platdata->enetaddr[5];
> +
> +       writel(madr, &priv->regs->mac_madr);
> +       writel(ladr, &priv->regs->mac_ladr);
> +
> +       return 0;
> +}
> +
> +static const struct eth_ops ast_nic_ops = {
> +       .start = ast_nic_start,
> +       .send = ast_nic_send,
> +       .recv = ast_nic_recv,
> +       .stop = ast_nic_stop,
> +       .write_hwaddr = ast_nic_write_hwaddr,
> +};
> +
> +static const struct udevice_id ast_nic_ids[] = {
> +       { .compatible = "aspeed,ast2500-nic" },
> +       { .compatible = "aspeed,ast2400-nic" },
> +       { }
> +};
> +
> +U_BOOT_DRIVER(ast_nic) = {
> +       .name   = "ast_nic",
> +       .id     = UCLASS_ETH,
> +       .of_match = ast_nic_ids,
> +       .probe  = ast_nic_probe,
> +       .ops    = &ast_nic_ops,
> +       .ofdata_to_platdata = ast_nic_ofdata_to_platdata,
> +       .priv_auto_alloc_size = sizeof(struct ast_nic_priv),
> +       .platdata_auto_alloc_size = sizeof(struct eth_pdata),
> +};
> diff --git a/drivers/net/ast_nic.h b/drivers/net/ast_nic.h
> new file mode 100644
> index 0000000000..0d4332bd95
> --- /dev/null
> +++ b/drivers/net/ast_nic.h
> @@ -0,0 +1,198 @@
> +/*
> + * (C) Copyright 2010 Faraday Technology
> + * Po-Yu Chuang <ratbert@faraday-tech.com>
> + *
> + * (C) Copyright 2010 Andes Technology
> + * Macpaul Lin <macpaul@andestech.com>
> + *
> + * Copyright 2017 Google Inc
> + *
> + * SPDX-License-Identifier:    GPL-2.0+
> + */
> +
> +#ifndef __AST_NIC_H
> +#define __AST_NIC_H
> +
> +struct ast_nic_regs {
> +       u32     isr;            /* 0x00 */
> +       u32     ier;            /* 0x04 */
> +       u32     mac_madr;       /* 0x08 */
> +       u32     mac_ladr;       /* 0x0c */
> +       u32     maht0;          /* 0x10 */
> +       u32     maht1;          /* 0x14 */
> +       u32     txpd;           /* 0x18 */
> +       u32     rxpd;           /* 0x1c */
> +       u32     txr_badr;       /* 0x20 */
> +       u32     rxr_badr;       /* 0x24 */
> +       u32     hptxpd;         /* 0x28 */
> +       u32     hptxpd_badr;    /* 0x2c */
> +       u32     itc;            /* 0x30 */
> +       u32     aptc;           /* 0x34 */
> +       u32     dblac;          /* 0x38 */
> +       u32     dmafifos;       /* 0x3c */
> +       u32     fear0;          /* 0x40 */
> +       u32     fear1;          /* 0x44 */
> +       u32     tpafcr;         /* 0x48 */
> +       u32     rbsr;           /* 0x4c */
> +       u32     maccr;          /* 0x50 */
> +       u32     macsr;          /* 0x54 */
> +       u32     tm;             /* 0x58 */
> +       u32     physts;         /* 0x5c */
> +       u32     phycr;          /* 0x60 */
> +       u32     phydata;        /* 0x64 */
> +       u32     fcr;            /* 0x68 */
> +       u32     bpr;            /* 0x6c */
> +       u32     wolcr;          /* 0x70 */
> +       u32     wolsr;          /* 0x74 */
> +       u32     wfbm1m;         /* 0x78 */
> +       u32     wfbm1l;         /* 0x7c */
> +       u32     wfbm2m;         /* 0x80 */
> +       u32     wfbm2l;         /* 0x84 */
> +       u32     wfbm3m;         /* 0x88 */
> +       u32     wfbm3l;         /* 0x8c */
> +       u32     nptxr_ptr;      /* 0x90 */
> +       u32     hptxr_ptr;      /* 0x94 */
> +       u32     rxr_ptr;        /* 0x98 */
> +       u32     resv3;          /* 0x9c */
> +       u32     tx;             /* 0xa0 */
> +       u32     tx_mcol_scol;   /* 0xa4 */
> +       u32     tx_ecol_fail;   /* 0xa8 */
> +       u32     tx_lcol_und;    /* 0xac */
> +       u32     rx;             /* 0xb0 */
> +       u32     rx_bc;          /* 0xb4 */
> +       u32     rx_mc;          /* 0xb8 */
> +       u32     rx_pf_aep;      /* 0xbc */
> +       u32     rx_runt;        /* 0xc0 */
> +       u32     rx_crcer_ftl;   /* 0xc4 */
> +       u32     rx_col_lost;    /* 0xc8 */
> +};
> +
> +/*
> + * Interrupt status register & interrupt enable register
> + */
> +#define MAC_INT_RPKT_BUF               (1 << 0)
> +#define MAC_INT_RPKT_FIFO              (1 << 1)
> +#define MAC_INT_NO_RXBUF               (1 << 2)
> +#define MAC_INT_RPKT_LOST              (1 << 3)
> +#define MAC_INT_XPKT_ETH               (1 << 4)
> +#define MAC_INT_XPKT_FIFO              (1 << 5)
> +#define MAC_INT_NO_NPTXBUF     (1 << 6)
> +#define MAC_INT_XPKT_LOST              (1 << 7)
> +#define MAC_INT_AHB_ERR                (1 << 8)
> +#define MAC_INT_PHYSTS_CHG     (1 << 9)
> +#define MAC_INT_NO_HPTXBUF     (1 << 10)
> +#define MAC_INT_PHY_CHG                (1 << 28)
> +#define MAC_INT_PHY_TIMEOUT    (1 << 29)
> +#define MAC_INT_FLAG_ACK               (1 << 30)
> +#define MAC_INT_FLAG_REQ               (1 << 31)
> +
> +/*
> + * MAC control register
> + */
> +#define MAC_MACCR_TXDMA_EN     (1 << 0)
> +#define MAC_MACCR_RXDMA_EN     (1 << 1)
> +#define MAC_MACCR_TXMAC_EN     (1 << 2)
> +#define MAC_MACCR_RXMAC_EN     (1 << 3)
> +#define MAC_MACCR_RM_VLAN              (1 << 4)
> +#define MAC_MACCR_HPTXR_EN     (1 << 5)
> +#define MAC_MACCR_LOOP_EN              (1 << 6)
> +#define MAC_MACCR_ENRX_IN_HALFTX       (1 << 7)
> +#define MAC_MACCR_FULLDUP              (1 << 8)
> +#define MAC_MACCR_GIGA_MODE    (1 << 9)
> +#define MAC_MACCR_CRC_APD              (1 << 10)
> +#define MAC_MACCR_LOW_SEN              (1 << 11)
> +#define MAC_MACCR_RX_RUNT              (1 << 12)
> +#define MAC_MACCR_JUMBO_LF     (1 << 13)
> +#define MAC_MACCR_RX_ALL               (1 << 14)
> +#define MAC_MACCR_HT_MULTI_EN  (1 << 15)
> +#define MAC_MACCR_RX_MULTIPKT  (1 << 16)
> +#define MAC_MACCR_RX_BROADPKT  (1 << 17)
> +#define MAC_MACCR_DISCARD_CRCERR       (1 << 18)
> +#define MAC_MACCR_FAST_MODE    (1 << 19)
> +#define MAC_MACCR_SW_RST               (1 << 31)
> +
> +/*
> + * Feature Enable Register
> + */
> +#define MAC_FEAR_NEW_MD_IFACE          (1 << 31)
> +#define MAC_FEAR_LOOPBACK                      (1 << 30)
> +
> +/*
> + * Automatic polling timer control register
> + */
> +#define MAC_APTC_RXPOLL_CNT_SHIFT      0
> +#define MAC_APTC_RXPOLL_CNT_MASK       0xf
> +#define MAC_APTC_RXPOLL_TIME_SEL       (1 << 4)
> +#define MAC_APTC_TXPOLL_CNT_SHIFT      8
> +#define MAC_APTC_TXPOLL_CNT_MASK       (0xf << MAC_APTC_TXPOLL_CNT_SHIFT)
> +#define MAC_APTC_TXPOLL_TIME_SEL       (1 << 12)
> +
> +/*
> + * Receive buffer size register
> + */
> +#define MAC_RBSR_SIZE_MASK             0x3fff
> +
> +/*
> + * PHY control register
> + */
> +#define MAC_PHYCR_FIRE         (1 << 15)
> +#define MAC_PHYCR_ST_22                (1 << 12)
> +#define MAC_PHYCR_WRITE                (1 << 10)
> +#define MAC_PHYCR_READ         (2 << 10)
> +#define MAC_PHYCR_PHYAD_SHIFT  5
> +#define MAC_PHYCR_PHYAD_MASK   (0x1f << MAC_PHYCR_PHYAD_SHIFT)
> +#define MAC_PHYCR_REGAD_SHIFT  0
> +#define MAC_PHYCR_REGAD_MASK   (0x1f << MAC_PHYCR_REGAD_SHIFT)
> +
> +/*
> + * PHY data register
> + */
> +#define MAC_PHYDATA_MIIRDATA_SHIFT     0
> +#define MAC_PHYDATA_MIIRDATA_MASK      (0xffff << MAC_PHYDATA_MIIRDATA_SHIFT)
> +#define MAC_PHYDATA_MIIWDATA_SHIFT     16
> +#define MAC_PHYDATA_MIIWDATA_MASK      (0xffff << MAC_PHYDATA_MIIWDATA_SHIFT)
> +
> +#define MAC_TXDES0_TXBUF_SIZE_SHIFT    0
> +#define MAC_TXDES0_TXBUF_SIZE_MASK     0x3fff
> +#define MAC_TXDES0_CRC_ERR     (1 << 19)
> +#define MAC_TXDES0_LTS         (1 << 28)
> +#define MAC_TXDES0_FTS         (1 << 29)
> +#define MAC_TXDES0_EDOTR               (1 << 30)
> +#define MAC_TXDES0_TXDMA_OWN   (1 << 31)
> +
> +#define MAC_TXDES1_INS_VLANTAG (1 << 16)
> +#define MAC_TXDES1_LLC         (1 << 22)
> +#define MAC_TXDES1_TX2FIC              (1 << 30)
> +#define MAC_TXDES1_TXIC                (1 << 31)
> +
> +#define MAC_RXDES0_VDBC_SHIFT  0
> +#define MAC_RXDES0_VDBC_MASK   0x3fff
> +#define MAC_RXDES0_MULTICAST   (1 << 16)
> +#define MAC_RXDES0_BROADCAST   (1 << 17)
> +#define MAC_RXDES0_RX_ERR              (1 << 18)
> +#define MAC_RXDES0_CRC_ERR     (1 << 19)
> +#define MAC_RXDES0_FTL         (1 << 20)
> +#define MAC_RXDES0_RUNT                (1 << 21)
> +#define MAC_RXDES0_RX_ODD_NB   (1 << 22)
> +#define MAC_RXDES0_FIFO_FULL   (1 << 23)
> +#define MAC_RXDES0_PAUSE_OPCODE        (1 << 24)
> +#define MAC_RXDES0_PAUSE_FRAME (1 << 25)
> +#define MAC_RXDES0_LRS         (1 << 28)
> +#define MAC_RXDES0_FRS         (1 << 29)
> +#define MAC_RXDES0_EDORR               (1 << 30)
> +#define MAC_RXDES0_RXPKT_RDY   (1 << 31)
> +
> +#define MAC_RXDES1_VLANTAG_CI  0xffff
> +#define MAC_RXDES1_PROT_MASK   (0x3 << 20)
> +#define MAC_RXDES1_PROT_NONIP  (0x0 << 20)
> +#define MAC_RXDES1_PROT_IP     (0x1 << 20)
> +#define MAC_RXDES1_PROT_TCPIP  (0x2 << 20)
> +#define MAC_RXDES1_PROT_UDPIP  (0x3 << 20)
> +#define MAC_RXDES1_LLC         (1 << 22)
> +#define MAC_RXDES1_DF          (1 << 23)
> +#define MAC_RXDES1_VLANTAG_AVAIL       (1 << 24)
> +#define MAC_RXDES1_TCP_CHKSUM_ERR      (1 << 25)
> +#define MAC_RXDES1_UDP_CHKSUM_ERR      (1 << 26)
> +#define MAC_RXDES1_IP_CHKSUM_ERR       (1 << 27)
> +
> +#endif  /* __AST_NIC_H */
> --
> 2.12.0.367.g23dc2f6d3c-goog
>
> _______________________________________________
> U-Boot mailing list
> U-Boot@lists.denx.de
> https://lists.denx.de/listinfo/u-boot
