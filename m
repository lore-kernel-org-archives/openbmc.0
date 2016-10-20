Return-Path: <xow@google.com>
Received: from mail-qt0-x22c.google.com (mail-qt0-x22c.google.com
 [IPv6:2607:f8b0:400d:c0d::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0L3R6ZxJzDvXx
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 07:28:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Ol6XZSNf; 
 dkim-atps=neutral
Received: by mail-qt0-x22c.google.com with SMTP id m5so68774569qtb.3
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 13:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Icvra8WprYSaHOIDJ70oK6G8vQsCuc3J8TVb1jqbUZE=;
 b=Ol6XZSNf6NU1N+rpXlJUUcsYV2HKkyiZ7+Ee3A7sFJGR1aCBGTNbNlJPLJGLQArEHF
 sNEOUIunx9n2EvP3xfMieA0FG6ifCsPPuav86l3r8WobuBlrI1W8VnFJxliodm8Cy/PC
 /9Cbvd/uiy7okbBgydHTpgz8NLR171bwQy1URndlmozQuilG3c03NVvUuzpD4baf921x
 q6gDSkTJfyWRJM/K9MZnVolEWFcpBxZ4SrXCEvrd1gdv2jsv+dQIcuIN3bztmVUXb3QQ
 LUNPvTYnFQA/ZVkU/pzJrvPh//A5vYAMs6LOW9x+TcxnlTPLsxO1NkKfsETe+ma7V3Pv
 pBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Icvra8WprYSaHOIDJ70oK6G8vQsCuc3J8TVb1jqbUZE=;
 b=Xd9hK65mg8zPfPN3AwX/zlDjYGo9eW7Ie+ZrLYbG3XC/oXE84z/KFg8VhD/61QsX2l
 bUbrFvsPDx3iVNvuM1vr/+a/AztI280TRsMEN6GCzG4WsdYQggFjtg21IvYSeQ+ZaLWG
 LNL1o17x5pqUJHEJvT7N4MHpCS7Hye1JcPfKvx38PmzZZbnk73oX9FlS+V0cInZn4C1m
 6MhDviPZmCjbEpdjSu7WEEHrB9Hbm9WzmAnCTtYKc/qAZSpKK04Wxi/sEWwLVyIS7ijB
 Z+xVTnGwZReuuUiRjpxd1ZFsL9EFktO8Y4vCiO5YQuw7dpWMovzFrAZoSztAzc8u4dCg
 lM/g==
X-Gm-Message-State: ABUngvd4WjWjN4I4F8E2c7pTBslgz0JP8EaOhq+/g8GR+VvLBEXRd/n+D06o8CLW11qe7O491etnLP2hw409cHun
X-Received: by 10.200.51.144 with SMTP id c16mr2408999qtb.74.1476995280756;
 Thu, 20 Oct 2016 13:28:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.58.194 with HTTP; Thu, 20 Oct 2016 13:28:00 -0700 (PDT)
In-Reply-To: <CACPK8XdZY82jsdgghGXD-erP5OhwfSMZqx_aN7tySP7iHRpAMA@mail.gmail.com>
References: <1476842308-142217-1-git-send-email-xow@google.com>
 <1476842308-142217-2-git-send-email-xow@google.com>
 <CACPK8XdZY82jsdgghGXD-erP5OhwfSMZqx_aN7tySP7iHRpAMA@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Thu, 20 Oct 2016 13:28:00 -0700
Message-ID: <CAPH-5w4Z4N+sm_Cy1g5N6pQWOsd5re_gvkvLCRhMsb8-tttUNQ@mail.gmail.com>
Subject: Re: [PATCH linux 2/2] phy/broadcom: Add support for BCM54612E
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Thu, 20 Oct 2016 20:28:04 -0000

Hi Joel,

On Tue, Oct 18, 2016 at 8:49 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hello Xo,
>
> On Wed, Oct 19, 2016 at 12:28 PM, Xo Wang <xow@google.com> wrote:
>> This PHY has internal delays enabled after reset. This clears the
>> internal delay enables unless the interface specifically requests them.
>
> This looks fine to me. We have a similar patch for adding the Broadcom
> phy on some of our machines. I just noticed that isn't present in
> dev-4.7, as we were sorting out an issue that required us to force the
> PHY into 100MBit mode. Would the aneg change be related to that?

Exactly, this is just for a different PHY. I'm not sure about the
BCM54210E part that Firestone uses. The Broadcom docs for our part's
internal delay says that it increases with decreasing link speed (1.9
ns, 4 ns, 50
ns for 1000 M, 100 M, 10 M, respectively) so it broke for me at all speeds.

>
> I suggest you submit these two one upstream. Use
> scripts/get_maintainer.pl to work out what mailing list to send it to.
> CC me so I can provide my ack.
>

Will do, thanks.

cheers
xo

> If you need any help then please ping me on IRC.
>
> Cheers,
>
> Joel
>
>>
>> Signed-off-by: Xo Wang <xow@google.com>
>> ---
>>  drivers/net/phy/broadcom.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/brcmphy.h    |  1 +
>>  2 files changed, 49 insertions(+)
>>
>> diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
>> index 870327e..583ef8a 100644
>> --- a/drivers/net/phy/broadcom.c
>> +++ b/drivers/net/phy/broadcom.c
>> @@ -337,6 +337,41 @@ static int bcm5481_config_aneg(struct phy_device *phydev)
>>         return ret;
>>  }
>>
>> +static int bcm54612e_config_aneg(struct phy_device *phydev)
>> +{
>> +       int ret;
>> +
>> +       /* First, auto-negotiate. */
>> +       ret = genphy_config_aneg(phydev);
>> +
>> +       /* Clear TX internal delay unless requested. */
>> +       if ((phydev->interface != PHY_INTERFACE_MODE_RGMII_ID) &&
>> +           (phydev->interface != PHY_INTERFACE_MODE_RGMII_TXID)) {
>> +               /* Disable TXD to GTXCLK clock delay (default set) */
>> +               /* Bit 9 is the only field in shadow register 00011 */
>> +               bcm_phy_write_shadow(phydev, 0x03, 0);
>> +       }
>> +
>> +       /* Clear RX internal delay unless requested. */
>> +       if ((phydev->interface != PHY_INTERFACE_MODE_RGMII_ID) &&
>> +           (phydev->interface != PHY_INTERFACE_MODE_RGMII_RXID)) {
>> +               u16 reg;
>> +
>> +               /* Errata: reads require filling in the write selector field */
>> +               bcm54xx_auxctl_write(phydev, MII_BCM54XX_AUXCTL_SHDWSEL_MISC,
>> +                                    MII_BCM54XX_AUXCTL_MISC_RDSEL_MISC);
>> +               reg = phy_read(phydev, MII_BCM54XX_AUX_CTL);
>> +               /* Disable RXD to RXC delay (default set) */
>> +               reg &= ~MII_BCM54XX_AUXCTL_MISC_RXD_RXC_SKEW;
>> +               /* Clear shadow selector field */
>> +               reg &= ~MII_BCM54XX_AUXCTL_SHDWSEL_MASK;
>> +               bcm54xx_auxctl_write(phydev, MII_BCM54XX_AUXCTL_SHDWSEL_MISC,
>> +                                    MII_BCM54XX_AUXCTL_MISC_WREN | reg);
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>>  static int brcm_phy_setbits(struct phy_device *phydev, int reg, int set)
>>  {
>>         int val;
>> @@ -485,6 +520,18 @@ static struct phy_driver broadcom_drivers[] = {
>>         .ack_interrupt  = bcm_phy_ack_intr,
>>         .config_intr    = bcm_phy_config_intr,
>>  }, {
>> +       .phy_id         = PHY_ID_BCM54612E,
>> +       .phy_id_mask    = 0xfffffff0,
>> +       .name           = "Broadcom BCM54612E",
>> +       .features       = PHY_GBIT_FEATURES |
>> +                         SUPPORTED_Pause | SUPPORTED_Asym_Pause,
>> +       .flags          = PHY_HAS_MAGICANEG | PHY_HAS_INTERRUPT,
>> +       .config_init    = bcm54xx_config_init,
>> +       .config_aneg    = bcm54612e_config_aneg,
>> +       .read_status    = genphy_read_status,
>> +       .ack_interrupt  = bcm_phy_ack_intr,
>> +       .config_intr    = bcm_phy_config_intr,
>> +}, {
>>         .phy_id         = PHY_ID_BCM54616S,
>>         .phy_id_mask    = 0xfffffff0,
>>         .name           = "Broadcom BCM54616S",
>> @@ -600,6 +647,7 @@ static struct mdio_device_id __maybe_unused broadcom_tbl[] = {
>>         { PHY_ID_BCM5411, 0xfffffff0 },
>>         { PHY_ID_BCM5421, 0xfffffff0 },
>>         { PHY_ID_BCM5461, 0xfffffff0 },
>> +       { PHY_ID_BCM54612E, 0xfffffff0 },
>>         { PHY_ID_BCM54616S, 0xfffffff0 },
>>         { PHY_ID_BCM5464, 0xfffffff0 },
>>         { PHY_ID_BCM5481, 0xfffffff0 },
>> diff --git a/include/linux/brcmphy.h b/include/linux/brcmphy.h
>> index 22c4421..60def78 100644
>> --- a/include/linux/brcmphy.h
>> +++ b/include/linux/brcmphy.h
>> @@ -18,6 +18,7 @@
>>  #define PHY_ID_BCM5421                 0x002060e0
>>  #define PHY_ID_BCM5464                 0x002060b0
>>  #define PHY_ID_BCM5461                 0x002060c0
>> +#define PHY_ID_BCM54612E               0x03625e60
>>  #define PHY_ID_BCM54616S               0x03625d10
>>  #define PHY_ID_BCM57780                        0x03625d90
>>
>> --
>> 2.8.0.rc3.226.g39d4020
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
