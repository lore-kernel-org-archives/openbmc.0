Return-Path: <joel.stan@gmail.com>
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgLtR6j6xzDqn0
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 00:06:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=fwC7Z1TQ; 
 dkim-atps=neutral
Received: by mail-qt0-x243.google.com with SMTP id m2so5062699qtd.1
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 07:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=SWcltiFmA7SXH247P1910aV75EOprl9ueKZL2lKZ9u0=;
 b=fwC7Z1TQ0OSmTDpy7gb66b16kthRdBN1ORUNLbkSBkpj/DZFIb7Mv0/AVsresLejJm
 p7YfbIk+NQpjzap9Zjo5vhYQZBdXpLjKyg0YPu/V6RJ/fNx6xRnMWz2kGZzQbFFrOw/c
 ZQBe+yVya/RxZ9RSzEze4penPtwbKG2R0F6rmvhy5gHHHhzdXaowUta4gsDbEe4zG7vH
 6jAmmYnVOmvtYPTgoS8FUgvO/Ab95TZqIcbQ0axGVVz65wT5hoaEbGnBde47cjPDjFem
 PIQLhDkDgC/Gtv208FSnFBJ8Tl+MlvQWgnXlj+oThGpqv/xDa9I6VEAi1LK0RLWizFIH
 sMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=SWcltiFmA7SXH247P1910aV75EOprl9ueKZL2lKZ9u0=;
 b=VqJDwpdKPtRVSEZ50KJWjlKggw1yUkjsXr5OBFmYwe5ZyHJcvxFs0w8+24AKoxvnB3
 XY0U3yPRJshVxCtFDIj18EIBadtjqk+57kQym/fu4LtVz/N/hKcVDFt1QihEZ+Yib6o9
 KnM9Dq8Iy5olbacXNe2qFTWtaLN8SF6A7T6kwiYuwj9asispL1HtPtRm/ggJNc0P+3SV
 cFt8r62mfJemFZZ5xRz7Lhd8jg1CcpeQPu4gC62ptsBgRcmORkrPRTbwPT58C902M16C
 NCVnNbDVBdtvbYu240dvHLMxTBvEtXbEavqL/T6Ce4GNG0mAqwswMcZqIiIJKCNt6Sov
 5Pbg==
X-Gm-Message-State: ALyK8tKxnLsb7Yh4gUdvPhufVKGRndnkd5LpjN4sL2QQPmWCpy/VENEmb2WX83UHNAP9K+69QlKiNpVOpbCaLA==
X-Received: by 10.237.37.8 with SMTP id v8mr23843123qtc.28.1467295565728; Thu,
 30 Jun 2016 07:06:05 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 30 Jun 2016 07:05:46 -0700 (PDT)
In-Reply-To: <1467282471-16560-8-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1467282471-16560-8-git-send-email-gwshan@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 Jun 2016 23:35:46 +0930
X-Google-Sender-Auth: Z12h6042l6hbR5JwVRdJUE5_1uk
Message-ID: <CACPK8XemtUzUMZXFjZSe9aQixcgiQnZimxMA7aMrts-1Yoya1Q@mail.gmail.com>
Subject: Re: [PATCH 07/10] net/farady: Read MAC address from chip
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
X-List-Received-Date: Thu, 30 Jun 2016 14:06:08 -0000

On Thu, Jun 30, 2016 at 7:57 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> The device is assigned with random MAC address. It isn't reasonable.
> An valid MAC address might have been in the chip. It's reasonable
> to use it to maintain consistency.
>
> This uses the MAC address in the chip if it's valid. Otherwise, a
> random MAC address is given as before.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 60 ++++++++++++++++++++++++++++----
>  1 file changed, 53 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 2c22f74..120993e 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -141,6 +141,55 @@ static void ftgmac100_set_mac(struct ftgmac100 *priv, const unsigned char *mac)
>         iowrite32(laddr, priv->base + FTGMAC100_OFFSET_MAC_LADR);
>  }
>
> +static void ftgmac100_setup_mac(struct ftgmac100 *priv)
> +{
> +       unsigned char mac[6];
> +       unsigned int m;
> +       unsigned int l;
> +
> +       m = ioread32(priv->base + FTGMAC100_OFFSET_MAC_MADR);
> +       l = ioread32(priv->base + FTGMAC100_OFFSET_MAC_LADR);
> +
> +       mac[0] = (m >> 8) & 0xff;
> +       mac[1] = m & 0xff;
> +       mac[2] = (l >> 24) & 0xff;
> +       mac[3] = (l >> 16) & 0xff;
> +       mac[4] = (l >> 8) & 0xff;
> +       mac[5] = l & 0xff;
> +
> +       if (!is_valid_ether_addr(mac)) {
> +               mac[5] = (m >> 8) & 0xff;
> +               mac[4] = m & 0xff;
> +               mac[3] = (l >> 24) & 0xff;
> +               mac[2] = (l >> 16) & 0xff;
> +               mac[1] = (l >>  8) & 0xff;
> +               mac[0] = l & 0xff;
> +       }
> +
> +       if (!is_valid_ether_addr(mac)) {
> +               eth_hw_addr_random(priv->netdev);
> +               dev_info(priv->dev, "Generated random MAC address %pM\n",
> +                        priv->netdev->dev_addr);
> +       } else {
> +               memcpy(priv->netdev->dev_addr, mac, 6);
> +               dev_info(priv->dev, "Read MAC address from chip %pM\n", mac);
> +       }
> +}
> +
> +static int ftgmac100_set_mac_addr(struct net_device *dev, void *p)
> +{
> +       int ret;
> +
> +       ret = eth_prepare_mac_addr_change(dev, p);
> +       if (ret < 0)
> +               return ret;
> +
> +       eth_commit_mac_addr_change(dev, p);
> +       ftgmac100_set_mac(netdev_priv(dev), dev->dev_addr);
> +
> +       return 0;
> +}
> +
>  static void ftgmac100_init_hw(struct ftgmac100 *priv)
>  {
>         /* setup ring buffer base registers */
> @@ -1141,7 +1190,7 @@ static const struct net_device_ops ftgmac100_netdev_ops = {
>         .ndo_open               = ftgmac100_open,
>         .ndo_stop               = ftgmac100_stop,
>         .ndo_start_xmit         = ftgmac100_hard_start_xmit,
> -       .ndo_set_mac_address    = eth_mac_addr,
> +       .ndo_set_mac_address    = ftgmac100_set_mac_addr,
>         .ndo_validate_addr      = eth_validate_addr,
>         .ndo_do_ioctl           = ftgmac100_do_ioctl,
>  };
> @@ -1263,6 +1312,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
>
>         priv->irq = irq;
>
> +       /* MAC address from chip or random one */
> +       ftgmac100_setup_mac(priv);
> +
>         err = ftgmac100_setup_mdio(netdev);
>         if (err)
>                 goto err_setup_mdio;
> @@ -1276,12 +1328,6 @@ static int ftgmac100_probe(struct platform_device *pdev)
>
>         netdev_info(netdev, "irq %d, mapped at %p\n", priv->irq, priv->base);
>
> -       if (!is_valid_ether_addr(netdev->dev_addr)) {
> -               eth_hw_addr_random(netdev);
> -               netdev_info(netdev, "generated random MAC address %pM\n",
> -                           netdev->dev_addr);
> -       }
> -
>         return 0;
>
>  err_register_netdev:
> --
> 2.1.0
>
