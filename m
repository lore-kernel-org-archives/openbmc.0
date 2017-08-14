Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com
 [IPv6:2a00:1450:4010:c07::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xVzl039FmzDqkb
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 12:17:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D25z3tVY"; 
 dkim-atps=neutral
Received: by mail-lf0-x242.google.com with SMTP id x16so5717228lfb.4
 for <openbmc@lists.ozlabs.org>; Sun, 13 Aug 2017 19:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=HWN1NJVkzS3+/+b6i+3evJFnENut8OpSwl7a/SH8Jnw=;
 b=D25z3tVYHs5dYW7iqwBf8PV4D1Wj2kPby0QXf31/CuFSVgDRdSnGXMuczTbA5skam2
 qLqSJvOAh/jciZmA2RgbYA2XnC1+CeK8MCSyEm5jq2vY8heeYFHLnoabgbDtT29n9u/0
 XkStbMde9MfXCUqsmQC8k4BqljpchI4iXHtZ1GLIEVPE7S+ni/jj83teab+KT5pf6pGJ
 U8f2nukF6j8oy6j9GapHN4ERncAhsup4sjKK7jqC2yjOaDQoRImutjFD7PY5EoF1heVu
 Y4IOJlB7T+oaBPnid0zVza6mZM+B0l+GH8v7dJTrH5hsVpfXSQmu/JolcfJ2JXq+R70f
 e/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=HWN1NJVkzS3+/+b6i+3evJFnENut8OpSwl7a/SH8Jnw=;
 b=ACl8Q0eOqvM+IbJHHhwBE6Wuk8WgkfCFReyuUmfPThikabs4npZ1V1nvoFRBz8ZVO5
 6tvs+rqquTdj+GFV5tnnrUz1aj2sxmQ62+HxV8EBhTaixto7D4SgBVZZbkMKiHYHprmK
 evRRzd7yAkTLwGtT5yoob5/iTG2BClmv0UiTZEg89ue87OueMGX5bjOZe9kmvzJLx/DW
 ewY/qlMjDYVLlYJtB6VudZLJZRWflInPhbv3V7kNKT658bKV+S4BTXPFzTiZMSWp0Klb
 lPdNcdYCHQmL5objC/lbaxNaiQlGIcYW8dy4i48sEVGEUlYYdTfKsKvwVmB97i58iKhf
 YJNQ==
X-Gm-Message-State: AHYfb5hribSjJLm8uvfJBkg/E58QfOHAURE86bDevmJncAmg16Q3YrZT
 CNdriCI8CPchB1MycacRhhtrxw+juA==
X-Received: by 10.25.168.3 with SMTP id r3mr8069867lfe.111.1502677017486; Sun,
 13 Aug 2017 19:16:57 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Sun, 13 Aug 2017 19:16:36 -0700 (PDT)
In-Reply-To: <20170814012952.13740-4-sam@mendozajonas.com>
References: <20170814012952.13740-1-sam@mendozajonas.com>
 <20170814012952.13740-4-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Aug 2017 11:46:36 +0930
X-Google-Sender-Auth: 4WOZcCU2bnQhKH0JaMKQOmwte5I
Message-ID: <CACPK8XcsYOuKjN+DHzM=57Ln3DhLOGJPhkzaB6NnK0sc=Bj62Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/3] ftgmac100: Support NCSI VLAN filtering
 when available
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, 
 Ratan K Gupta <ratagupt@in.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 14 Aug 2017 02:17:01 -0000

On Mon, Aug 14, 2017 at 10:59 AM, Samuel Mendoza-Jonas
<sam@mendozajonas.com> wrote:
> Register the ndo_vlan_rx_{add,kill}_vid callbacks and set the
> NETIF_F_HW_VLAN_CTAG_FILTER if NCSI is available.
> This allows the VLAN core to notify the NCSI driver when changes occur
> so that the remote NCSI channel can be properly configured to filter on
> the set VLAN tags.
>
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

I'm not a vlan expert, so I asked why this was only being set when
doing NCSI. The answer was:

> There is no point setting it when not doing ncsi. The HW doesn't have a
> filter in that case (we do have HW vlan tag extraction and injection,
> which my driver supports, but that's different flags).

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
> v2: Moved ftgmac100 change into same patch and reordered
>
>  drivers/net/ethernet/faraday/ftgmac100.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 34dae51effd4..05fe7123d5ae 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1623,6 +1623,8 @@ static const struct net_device_ops ftgmac100_netdev_ops = {
>  #ifdef CONFIG_NET_POLL_CONTROLLER
>         .ndo_poll_controller    = ftgmac100_poll_controller,
>  #endif
> +       .ndo_vlan_rx_add_vid    = ncsi_vlan_rx_add_vid,
> +       .ndo_vlan_rx_kill_vid   = ncsi_vlan_rx_kill_vid,
>  };
>
>  static int ftgmac100_setup_mdio(struct net_device *netdev)
> @@ -1837,6 +1839,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
>                 NETIF_F_GRO | NETIF_F_SG | NETIF_F_HW_VLAN_CTAG_RX |
>                 NETIF_F_HW_VLAN_CTAG_TX;
>
> +       if (priv->use_ncsi)
> +               netdev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
> +
>         /* AST2400  doesn't have working HW checksum generation */
>         if (np && (of_device_is_compatible(np, "aspeed,ast2400-mac")))
>                 netdev->hw_features &= ~NETIF_F_HW_CSUM;
> --
> 2.14.0
>
