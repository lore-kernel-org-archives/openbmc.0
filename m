Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtG2r25p9zDqGp
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 16:07:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UjaVxh0z"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id p77so516630ywg.0
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 22:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=hIsP9dC4Uz+LKAItcUSSzxdb6WfqH5riUYIC8FEfa+o=;
 b=UjaVxh0zvTuTrq1ggIInvnlQmdgt97lmNd9ocgmkUDzI+mwo6I9f1l5x3Gunmcg8Xe
 bUwdPWn3R65vk1cxtnh6pF5vV6MjrGVRlLP/rYpwLI21lIm+jMGo+ydK6rs1dk6uH8zE
 Zfrzg95OWlJs4XfV4sufdUHRQpR0/MBTZK8YElEIZscHEd0obhlhE/gDpi+SO9CD8CmQ
 ceCi6fgN7YxpOy3ytAu3L/u4UJrnrRoWYO5PdgOK34+nF3hxH//JuMbDc2sd8+CQcFkQ
 5VjzudcOtJ/7LzEVMcy620qq0ls3txxrFyiVTIekOMSB7BFrJgVvnQktqSGbLTdttPeZ
 SHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=hIsP9dC4Uz+LKAItcUSSzxdb6WfqH5riUYIC8FEfa+o=;
 b=Jy/bSiJkkCKaZIsQ6vObUV40GifYkgKmGBtd3Wrcer0rXbfeuii0kA+w9I9ZlPppNu
 rRfAw3EyLzRLrNc/Li1vjbEcL2wR5H1SLAuftX2MDg6vuQDPJcuyz18ZqsTx1rgpeIP0
 J4TNMK6hMSVxLXbtVVyFLxzLyoPIevtZGNodbwdBx8Hk+SBfZ/3PMIvPCnRCUWfJnLPQ
 HOhCBsy4pIrv+6z48oYdz2SPe3O52BiY5CL1zoloxGSQG2sAfvR8d1UDbSJ4olhhMW9U
 OkOfu+AjWSCuvvz4z86nZepEeTwp6lTQO1/vomYNblDqBL/pe8/L+YqKe7d1CD985XYC
 OXOA==
X-Gm-Message-State: AFeK/H2p+VCGBvJOhFu/ZJFSArTWD2ay4d//lW95zJAyzhA81EIwjNKnGQGzj2aYq5LJfAE1Zuw7mSwqG50KiQ==
X-Received: by 10.129.116.214 with SMTP id p205mr26810048ywc.268.1490764017536; 
 Tue, 28 Mar 2017 22:06:57 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Tue, 28 Mar 2017 22:06:37 -0700 (PDT)
In-Reply-To: <1490759331.3177.161.camel@kernel.crashing.org>
References: <1490759331.3177.161.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Mar 2017 15:36:37 +1030
X-Google-Sender-Auth: urux8Gcm5NJbrEBwc55E--ixaeU
Message-ID: <CACPK8Xehr+6=RRkMqSqpnrw8m01POG=zMUDAChhQJypPu9zmCw@mail.gmail.com>
Subject: Re: [PATCH] net/ftgmac100: Expose pause frames support and add
 comment about RGMII
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
X-List-Received-Date: Wed, 29 Mar 2017 05:07:01 -0000

On Wed, Mar 29, 2017 at 2:18 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> Expose to the phydev that we support Pause frame and add a comment
> mentioning how we handle RGMII clock delays via u-boot.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

I made a small fix to the comment about phy.txt and applied to dev-4.10.

Cheers,

Joel

> ---
>
> This is the diff between v3 that was merged and v4 that I posted
> shortly afterward.
>
>  drivers/net/ethernet/faraday/ftgmac100.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index d42489c..5fe2827 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -111,8 +111,8 @@ struct ftgmac100 {
>         bool rx_pause;
>         bool aneg_pause;
>
> -       uint32_t rxdes0_edorr_mask;
> -       uint32_t txdes0_edotr_mask;
> +       u32 rxdes0_edorr_mask;
> +       u32 txdes0_edotr_mask;
>  };
>
>  static int ftgmac100_alloc_rx_buf(struct ftgmac100 *priv,
> @@ -1390,6 +1390,12 @@ static int ftgmac100_mii_probe(struct ftgmac100 *priv, phy_interface_t intf)
>                 return PTR_ERR(phydev);
>         }
>
> +       /*
> +        * Indicate that we support PAUSE frames (see comment in
> +        * Documentation/networking/phy.txt as of v4.10
> +        */
> +       phydev->supported |= SUPPORTED_Pause | SUPPORTED_Asym_Pause;
> +
>         phydev->advertising = phydev->supported;
>         phy_attached_info(phydev);
>
> @@ -1490,6 +1496,21 @@ static int ftgmac100_setup_mdio(struct net_device *ndev)
>                 iowrite32(reg, priv->base + FTGMAC100_OFFSET_REVR);
>         }
>
> +       /*
> +        * Note: When using RGMII mode, we simply pass "RGMII" to the
> +        *       PHY and assume that u-boot will have configured the
> +        *       clock delays appropriately for the system.
> +        *
> +        *       The implementation of the MAC in the Aspeed chips
> +        *       supports sub-ns programable delays that need to be
> +        *       configured in the SCU while the MAC IP block is in
> +        *       reset.
> +        *
> +        *       If needed in the future, we can support configuring this
> +        *       here based on device-tree properties but unless absolutely
> +        *       needed I'd rather avoid poking at the SCU registers from
> +        *       this driver.
> +        */
>         if (np)
>                 intf_prop = of_get_property(np, "phy-interface", NULL);
>         if (intf_prop) {
> --
> 2.9.
>
