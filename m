Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
 [209.85.213.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZyZg5KHpzDsZP
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 11:37:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=XofdQf07; 
 dkim-atps=neutral
Received: by mail-vk0-f65.google.com with SMTP id 192so239079vkl.0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 18:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Svb5uiziWwUSdYG5GQzsyvzWO9NLfI0ePLjmqRJs6JE=;
 b=XofdQf07X0lUeX34GNWHesHwLquIscTcwTeUaoQbLmMutr/ll0Udm5oBgyLAPnJuK2
 XlK+CiwZ7KWV7V59BWClIvKtdKiPpP5NgT2y8cVV3h82pkmwIG1hBo7CtpqeJhZ85HSS
 LwVzszrk/JubZKX/6ruQx4u7VMdbsFHjufOL8W+laDjlNiu3wPhuqs4me+phzkggk/Ir
 V1LheBI6voYTDkzewm/4B8yzhfR5eqpf1bR6O0+0NlvRfmGW/j+xZzhRtujbEc3/BZDu
 sCTapR2RoypQjdnlZ0D5uz4s1aB87nTr4ldCPRc8IA5prKgW2hV8zmbPteUwdMWBPKzV
 7Zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Svb5uiziWwUSdYG5GQzsyvzWO9NLfI0ePLjmqRJs6JE=;
 b=TfbGSGxYBHgC0a6aI7zRAi6fTwPvFa4OTgdWDLMuqUN4uBxhJasGCFh6+WnZUqHsZn
 pwXSrAmO9anTWbqO/25iAbTKZbJCf7A4ufLuKLntJGTx7Ez/VOe1XI+YUMaaJuvqeGt5
 H8QhAU65Kti2++Kxg4DGumcVDLs49bTRvLNHBwvgwVKOf0GLuE3Catqu4utfCql+8b8u
 8DIeIlywNtsJ7vfpRuVBXlhLyAAv7Nn48kx7pQNNtznwgkCC1zHjeKLYqNh984IGwX2X
 AFRK+PLzdY+f+6ul511FdXWmhtxzttqvLZOgmthkH0TJS07UnNE1iSwiG0JWc4l48mQB
 0N7w==
X-Gm-Message-State: AE9vXwOYK9XdGAoM2H/m3WxUzi4ckT4VDSeSJLLpWZ5bGYY5RH5uTGzxoXjO1S/8qTmtjv9aBVaaDJPsBkrDtQ==
X-Received: by 10.31.54.11 with SMTP id d11mr852428vka.149.1473989788625; Thu,
 15 Sep 2016 18:36:28 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.80.221 with HTTP; Thu, 15 Sep 2016 18:36:08 -0700 (PDT)
In-Reply-To: <1494847539.194617.1473971583386.JavaMail.zimbra@raptorengineeringinc.com>
References: <1494847539.194617.1473971583386.JavaMail.zimbra@raptorengineeringinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Sep 2016 11:06:08 +0930
X-Google-Sender-Auth: kQLRWKjuBuCNje1Fx4egVH7hhpY
Message-ID: <CACPK8XcGEsqscPuEFdB++6RO5RL-6StDs7f3WkzsE00gZO_zuQ@mail.gmail.com>
Subject: Re: [PATCH 01/16] phy/broadcom: Add support for the BCM54210E
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 16 Sep 2016 01:37:32 -0000

On Fri, Sep 16, 2016 at 6:03 AM, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
>  drivers/net/phy/broadcom.c |   13 +++++++++++++
>  include/linux/brcmphy.h    |    2 ++
>  2 files changed, 15 insertions(+)
>
> diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
> index 870327e..2d5ba6a 100644
> --- a/drivers/net/phy/broadcom.c
> +++ b/drivers/net/phy/broadcom.c
> @@ -592,6 +592,18 @@ static struct phy_driver broadcom_drivers[] = {
>         .read_status    = genphy_read_status,
>         .ack_interrupt  = brcm_fet_ack_interrupt,
>         .config_intr    = brcm_fet_config_intr,
> +}, {
> +       .phy_id         = PHY_ID_BCM54210E,
> +       .phy_id_mask    = 0xfffffff0,
> +       .name           = "Broadcom BCM54210E",
> +       .features       = PHY_GBIT_FEATURES |
> +                               SUPPORTED_Pause | SUPPORTED_Asym_Pause,
> +       .flags          = PHY_HAS_MAGICANEG | PHY_HAS_INTERRUPT,
> +       .config_init    = bcm54xx_config_init,
> +       .config_aneg    = genphy_config_aneg,
> +       .read_status    = genphy_read_status,
> +       .ack_interrupt  = bcm_phy_ack_intr,
> +       .config_intr    = bcm_phy_config_intr,
>  } };

Is this the patch that I authored? If you have confirmed that it
works, I will send it upstream.


>
>  module_phy_driver(broadcom_drivers);
> @@ -609,6 +621,7 @@ static struct mdio_device_id __maybe_unused broadcom_tbl[] = {
>         { PHY_ID_BCM57780, 0xfffffff0 },
>         { PHY_ID_BCMAC131, 0xfffffff0 },
>         { PHY_ID_BCM5241, 0xfffffff0 },
> +       { PHY_ID_BCM54210E, 0xfffffff0},
>         { }
>  };
>
> diff --git a/include/linux/brcmphy.h b/include/linux/brcmphy.h
> index e3354b7..f26fc51 100644
> --- a/include/linux/brcmphy.h
> +++ b/include/linux/brcmphy.h
> @@ -35,6 +35,8 @@
>
>  #define PHY_ID_BCM_CYGNUS              0xae025200
>
> +#define PHY_ID_BCM54210E               0x600d84a0
> +
>  #define PHY_BCM_OUI_MASK               0xfffffc00
>  #define PHY_BCM_OUI_1                  0x00206000
>  #define PHY_BCM_OUI_2                  0x0143bc00
> --
> 1.7.9.5
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
