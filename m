Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3szHxs4gz4zDsyH
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 14:49:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=j8yfEy8S; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id 38so123177uaj.3
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 20:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5v6ZZBkVLoLFkX1HcV0czUpOSZzH3SMl1mejvvvNwTs=;
 b=j8yfEy8SLwI3+6wIZ6Yp3Gk0YwFvbOus3FR1EufYNVsnevx/1qcpF1r4hDr2agf+Ct
 RDOzoCX1eUKhmV1dXIdaVV7usr2a0bZJW0L7T1QX7vqlvUkq37gA+EwQajiNx+HvsL+j
 yNjbx4Ad0O6s6jZreiM2hFcWDvC4lOQfR8FeRagHttuKUlFubuk4u+F52IK4WwLpRlR5
 Ml24HOnDD9y4RefaUQGbf9CCZu7KNtutiwjUwGdYNv5vl9wM/Ph1zD53KBy0izP/GJni
 aWZBYlBvrvi7yxPYMHufVULe73hSqT1JQH2ZnE79KL4T/ZAdQejGAf/EB9tanAyPAIDN
 0B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5v6ZZBkVLoLFkX1HcV0czUpOSZzH3SMl1mejvvvNwTs=;
 b=Dc+4PdD/J/+OnhLMTGAflfJ4OAx+AZqZe8QcCiFlOaaiP3+ckhUbzegGICyU8i9SnK
 zm7ekEA5h+ifc9YtB3VSHJiuweRyuTEBHnL4/OtRvgUxCNt2d4Bq/n40h+3GWV33sIsy
 ZKGpCoDo6tBL4SruG0xpE8PW+WsvpkHIAgnjYgBtWVu+2xacBIW75I3FPpqOyz8TQqH2
 SUcFTHoRiu3aK43p2K96QgNVQiqYuEgwb8TR/ZJKYNJRL+ht7HGKMP0fTOrVy8yMWoY7
 xOWmpm7e4c+jigFq6zefRMeWbhCUpn+zWNMX9JuVKH4gjFLPOY/L1mIl1NpP5jvR6OVK
 sgtA==
X-Gm-Message-State: AA6/9RkSKwBby4Gm7E7DiDeNtw8lb4XpcTq9rT60a62g+NTHIuyVk0ai+BMkQv3Oeq1kNJh56WqRu4JwhFxvtw==
X-Received: by 10.176.82.38 with SMTP id i35mr714618uaa.123.1476848975107;
 Tue, 18 Oct 2016 20:49:35 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Tue, 18 Oct 2016 20:49:14 -0700 (PDT)
In-Reply-To: <1476842308-142217-2-git-send-email-xow@google.com>
References: <1476842308-142217-1-git-send-email-xow@google.com>
 <1476842308-142217-2-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Oct 2016 14:19:14 +1030
X-Google-Sender-Auth: zLlC7IWWSbpuhRfGnVxv7YzA3zk
Message-ID: <CACPK8XdZY82jsdgghGXD-erP5OhwfSMZqx_aN7tySP7iHRpAMA@mail.gmail.com>
Subject: Re: [PATCH linux 2/2] phy/broadcom: Add support for BCM54612E
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Timothy Pearson <tpearson@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 19 Oct 2016 03:49:38 -0000

Hello Xo,

On Wed, Oct 19, 2016 at 12:28 PM, Xo Wang <xow@google.com> wrote:
> This PHY has internal delays enabled after reset. This clears the
> internal delay enables unless the interface specifically requests them.

This looks fine to me. We have a similar patch for adding the Broadcom
phy on some of our machines. I just noticed that isn't present in
dev-4.7, as we were sorting out an issue that required us to force the
PHY into 100MBit mode. Would the aneg change be related to that?

I suggest you submit these two one upstream. Use
scripts/get_maintainer.pl to work out what mailing list to send it to.
CC me so I can provide my ack.

If you need any help then please ping me on IRC.

Cheers,

Joel

>
> Signed-off-by: Xo Wang <xow@google.com>
> ---
>  drivers/net/phy/broadcom.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/brcmphy.h    |  1 +
>  2 files changed, 49 insertions(+)
>
> diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
> index 870327e..583ef8a 100644
> --- a/drivers/net/phy/broadcom.c
> +++ b/drivers/net/phy/broadcom.c
> @@ -337,6 +337,41 @@ static int bcm5481_config_aneg(struct phy_device *phydev)
>         return ret;
>  }
>
> +static int bcm54612e_config_aneg(struct phy_device *phydev)
> +{
> +       int ret;
> +
> +       /* First, auto-negotiate. */
> +       ret = genphy_config_aneg(phydev);
> +
> +       /* Clear TX internal delay unless requested. */
> +       if ((phydev->interface != PHY_INTERFACE_MODE_RGMII_ID) &&
> +           (phydev->interface != PHY_INTERFACE_MODE_RGMII_TXID)) {
> +               /* Disable TXD to GTXCLK clock delay (default set) */
> +               /* Bit 9 is the only field in shadow register 00011 */
> +               bcm_phy_write_shadow(phydev, 0x03, 0);
> +       }
> +
> +       /* Clear RX internal delay unless requested. */
> +       if ((phydev->interface != PHY_INTERFACE_MODE_RGMII_ID) &&
> +           (phydev->interface != PHY_INTERFACE_MODE_RGMII_RXID)) {
> +               u16 reg;
> +
> +               /* Errata: reads require filling in the write selector field */
> +               bcm54xx_auxctl_write(phydev, MII_BCM54XX_AUXCTL_SHDWSEL_MISC,
> +                                    MII_BCM54XX_AUXCTL_MISC_RDSEL_MISC);
> +               reg = phy_read(phydev, MII_BCM54XX_AUX_CTL);
> +               /* Disable RXD to RXC delay (default set) */
> +               reg &= ~MII_BCM54XX_AUXCTL_MISC_RXD_RXC_SKEW;
> +               /* Clear shadow selector field */
> +               reg &= ~MII_BCM54XX_AUXCTL_SHDWSEL_MASK;
> +               bcm54xx_auxctl_write(phydev, MII_BCM54XX_AUXCTL_SHDWSEL_MISC,
> +                                    MII_BCM54XX_AUXCTL_MISC_WREN | reg);
> +       }
> +
> +       return ret;
> +}
> +
>  static int brcm_phy_setbits(struct phy_device *phydev, int reg, int set)
>  {
>         int val;
> @@ -485,6 +520,18 @@ static struct phy_driver broadcom_drivers[] = {
>         .ack_interrupt  = bcm_phy_ack_intr,
>         .config_intr    = bcm_phy_config_intr,
>  }, {
> +       .phy_id         = PHY_ID_BCM54612E,
> +       .phy_id_mask    = 0xfffffff0,
> +       .name           = "Broadcom BCM54612E",
> +       .features       = PHY_GBIT_FEATURES |
> +                         SUPPORTED_Pause | SUPPORTED_Asym_Pause,
> +       .flags          = PHY_HAS_MAGICANEG | PHY_HAS_INTERRUPT,
> +       .config_init    = bcm54xx_config_init,
> +       .config_aneg    = bcm54612e_config_aneg,
> +       .read_status    = genphy_read_status,
> +       .ack_interrupt  = bcm_phy_ack_intr,
> +       .config_intr    = bcm_phy_config_intr,
> +}, {
>         .phy_id         = PHY_ID_BCM54616S,
>         .phy_id_mask    = 0xfffffff0,
>         .name           = "Broadcom BCM54616S",
> @@ -600,6 +647,7 @@ static struct mdio_device_id __maybe_unused broadcom_tbl[] = {
>         { PHY_ID_BCM5411, 0xfffffff0 },
>         { PHY_ID_BCM5421, 0xfffffff0 },
>         { PHY_ID_BCM5461, 0xfffffff0 },
> +       { PHY_ID_BCM54612E, 0xfffffff0 },
>         { PHY_ID_BCM54616S, 0xfffffff0 },
>         { PHY_ID_BCM5464, 0xfffffff0 },
>         { PHY_ID_BCM5481, 0xfffffff0 },
> diff --git a/include/linux/brcmphy.h b/include/linux/brcmphy.h
> index 22c4421..60def78 100644
> --- a/include/linux/brcmphy.h
> +++ b/include/linux/brcmphy.h
> @@ -18,6 +18,7 @@
>  #define PHY_ID_BCM5421                 0x002060e0
>  #define PHY_ID_BCM5464                 0x002060b0
>  #define PHY_ID_BCM5461                 0x002060c0
> +#define PHY_ID_BCM54612E               0x03625e60
>  #define PHY_ID_BCM54616S               0x03625d10
>  #define PHY_ID_BCM57780                        0x03625d90
>
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
