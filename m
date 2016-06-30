Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgLts1wLrzDqmH
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 00:06:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=OTvsCOip; 
 dkim-atps=neutral
Received: by mail-qk0-x242.google.com with SMTP id j2so16780503qkf.1
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=kU4w0KKIjq4jNpcLJk7Wx/dZF2fN8bEvNFzBDiwazcU=;
 b=OTvsCOipU0s82wII+UebeyeMyjhLnBsJqO9U9ZFd6n7G64FDkDyzLswXRRwMDLbcJn
 fMnrHyVTZfph8JgCyu7EShCZX1rImBburjmn1douHwrMDMADpvSyetJTu/nSupHgY7zC
 QBn1bIKYJEgfVsQQ975x/4Mnzp4sdFOK/Nx40D5HzItAEtnXfQurv3vDcfXtaZ1VBwkL
 EQ1voENi51BJXsVp5yT7sZcTkqUCLn7MCeHESRWRQR2GcM/EiOqq9ewLR/tVy9RvgLxX
 6kTVfY95ovN3wySuIT/HCnRYctLg7+vY5EBuYqejAmVWbXX03pxsn1eWXFKX7FfxcWvs
 TYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=kU4w0KKIjq4jNpcLJk7Wx/dZF2fN8bEvNFzBDiwazcU=;
 b=OtNC4479pxSggDmom6GUbdKb2jVhJ24hPN2UyelBczmzZtVaqSeVL7uCykNngESdsx
 FSUOd0TH8cdGx1h5H+ftp177p12Qblk+7Zv8A57vjbEJ69fLa313hdhAOE3UgmZ/4YTZ
 gsE1u0472Wwaw15H2JbczvqOrf85i4eQ0QtNalWegBRQsDrVd0WOqhxa1fnFQMVduRNQ
 5ZHftlQhY5hrb85G8Nu7L1+W7nWu61KqLDSodW5YmECSYA9il/piLFW/f2EKIjlawju+
 DksLQgkvHUrxrSZYN4AFsl69S8Tt63tTy0YFcATdB1Hru9b5CjyVsV/79OQWCq1AeJgB
 AukA==
X-Gm-Message-State: ALyK8tLy7YMSv2b/zQf7st6vsT8bpZhmHX1jbyw+QumEuiwvFy8+VC5gwmmmtOH2sEdLR/YT/i6drx9r8rE16g==
X-Received: by 10.55.107.6 with SMTP id g6mr18482341qkc.166.1467295587301;
 Thu, 30 Jun 2016 07:06:27 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 30 Jun 2016 07:06:07 -0700 (PDT)
In-Reply-To: <1467282471-16560-11-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1467282471-16560-11-git-send-email-gwshan@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 Jun 2016 23:36:07 +0930
X-Google-Sender-Auth: Gc7KLJH2P3077FbH3_7DpRNaNII
Message-ID: <CACPK8XfGFZ-1NjOvvEgoFx3Aox+W6EiHWoLf50j++vD4q99EHQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] net/farady: Mask PHY interrupt with NCSI mode
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
X-List-Received-Date: Thu, 30 Jun 2016 14:06:29 -0000

On Thu, Jun 30, 2016 at 7:57 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> Bogus PHY interrupts are observed. This masks the PHY interrupt
> when the interface works in NCSI mode as there is no attached
> PHY under the circumstance.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 23e27f1..6642071 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -74,6 +74,7 @@ struct ftgmac100 {
>
>         struct mii_bus *mii_bus;
>         int old_speed;
> +       int int_mask_all;
>         bool use_ncsi;
>         bool enabled;
>  };
> @@ -84,14 +85,6 @@ static int ftgmac100_alloc_rx_page(struct ftgmac100 *priv,
>  /******************************************************************************
>   * internal functions (hardware register access)
>   *****************************************************************************/
> -#define INT_MASK_ALL_ENABLED   (FTGMAC100_INT_RPKT_LOST        | \
> -                                FTGMAC100_INT_XPKT_ETH         | \
> -                                FTGMAC100_INT_XPKT_LOST        | \
> -                                FTGMAC100_INT_AHB_ERR          | \
> -                                FTGMAC100_INT_PHYSTS_CHG       | \
> -                                FTGMAC100_INT_RPKT_BUF         | \
> -                                FTGMAC100_INT_NO_RXBUF)
> -
>  static void ftgmac100_set_rx_ring_base(struct ftgmac100 *priv, dma_addr_t addr)
>  {
>         iowrite32(addr, priv->base + FTGMAC100_OFFSET_RXR_BADR);
> @@ -1061,8 +1054,9 @@ static int ftgmac100_poll(struct napi_struct *napi, int budget)
>                 ftgmac100_tx_complete(priv);
>         }
>
> -       if (status & (FTGMAC100_INT_NO_RXBUF | FTGMAC100_INT_RPKT_LOST |
> -                     FTGMAC100_INT_AHB_ERR | FTGMAC100_INT_PHYSTS_CHG)) {
> +       if (status & priv->int_mask_all & (FTGMAC100_INT_NO_RXBUF |
> +                       FTGMAC100_INT_RPKT_LOST | FTGMAC100_INT_AHB_ERR |
> +                       FTGMAC100_INT_PHYSTS_CHG)) {
>                 if (net_ratelimit())
>                         netdev_info(netdev, "[ISR] = 0x%x: %s%s%s%s\n", status,
>                                     status & FTGMAC100_INT_NO_RXBUF ? "NO_RXBUF " : "",
> @@ -1085,7 +1079,7 @@ static int ftgmac100_poll(struct napi_struct *napi, int budget)
>                 napi_complete(napi);
>
>                 /* enable all interrupts */
> -               iowrite32(INT_MASK_ALL_ENABLED, priv->base + FTGMAC100_OFFSET_IER);
> +               iowrite32(priv->int_mask_all, priv->base + FTGMAC100_OFFSET_IER);
>         }
>
>         return rx;
> @@ -1131,7 +1125,7 @@ static int ftgmac100_open(struct net_device *netdev)
>         netif_start_queue(netdev);
>
>         /* enable all interrupts */
> -       iowrite32(INT_MASK_ALL_ENABLED, priv->base + FTGMAC100_OFFSET_IER);
> +       iowrite32(priv->int_mask_all, priv->base + FTGMAC100_OFFSET_IER);
>
>         /* Start the NCSI device */
>         if (priv->use_ncsi) {
> @@ -1363,10 +1357,19 @@ static int ftgmac100_probe(struct platform_device *pdev)
>         /* MAC address from chip or random one */
>         ftgmac100_setup_mac(priv);
>
> +       priv->int_mask_all = (FTGMAC100_INT_RPKT_LOST |
> +                             FTGMAC100_INT_XPKT_ETH |
> +                             FTGMAC100_INT_XPKT_LOST |
> +                             FTGMAC100_INT_AHB_ERR |
> +                             FTGMAC100_INT_PHYSTS_CHG |
> +                             FTGMAC100_INT_RPKT_BUF |
> +                             FTGMAC100_INT_NO_RXBUF);
>         if (pdev->dev.of_node &&
>             (of_get_property(pdev->dev.of_node, "use-nc-si", NULL) ||
>             of_get_property(pdev->dev.of_node, "use-ncsi", NULL))) {

As before, lets pick single a property and stick with it.

>                 dev_info(&pdev->dev, "Using NCSI interface\n");
> +
> +               priv->int_mask_all &= ~FTGMAC100_INT_PHYSTS_CHG;
>                 priv->use_ncsi = true;
>                 priv->ndev = ncsi_register_dev(netdev, ftgmac100_ncsi_handler);
>                 if (!priv->ndev)
> --
> 2.1.0
>
