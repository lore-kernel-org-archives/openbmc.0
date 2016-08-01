Return-Path: <joel.stan@gmail.com>
Received: from mail-pa0-x242.google.com (mail-pa0-x242.google.com
 [IPv6:2607:f8b0:400e:c03::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s2sqQ0PTBzDqQ9
 for <openbmc@lists.ozlabs.org>; Mon,  1 Aug 2016 18:26:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=MBLMzA0g; 
 dkim-atps=neutral
Received: by mail-pa0-x242.google.com with SMTP id ez1so9501796pab.3
 for <openbmc@lists.ozlabs.org>; Mon, 01 Aug 2016 01:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LQPtqqALUvXa0b85fSZ67GfCjB1QzwRzryC+cvu7rTs=;
 b=MBLMzA0gjnjqG5RfKkGpnsGQWWZI9LLN5kuJs2OqB0Nlhvk8yoL1c2Zj6BA8jcFcye
 jXafrRX+YwHSDwHAxC0CEiaDdBvKg6nb/2jiWlo/v2UylxW/ROZSvKdUeTpwNJqzxj0s
 NhlQ6EhLT9SVC9ll33blTogfGl83jSb1115QaZgfpzlYeDVTi+Pu0p1e1gTPZhafWCoC
 Rlhn3Kp+Pxc8x/rSp2ARrRW/3mw0jBPNuLtAUfQiMM534Y2yaq7Y+vMlQIMIAagxFGiv
 ONYTK9SY8UoBqLV/cBBF0GXFAN70oguZK82cqH4vpB7qYRtBhAYebg4+yQAuNoxGr9/Y
 libw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LQPtqqALUvXa0b85fSZ67GfCjB1QzwRzryC+cvu7rTs=;
 b=XuuLOyABxcBvIwXzvAkc2f7ojVKgpIGDHmZx/vSEDE/0rfMIBf39GWWwOya0Pjdji7
 LfyApDo4UVqJLc6Y3oXP213I6AXo8IMLjFTVTXusKlfM0wV/HQCMb50E9319kIK/lgwA
 KsGjVvGZQUre2G1EZHLNpS8TkYsPzYTm0gmZD+OT2PVL/vlUwxpaGfcDZ2R9rqX2tKa4
 DWZveKjTMS1NXd3PUQRODx3wQPtciDh8+TD8LUNXJ2bVNW1f49xobNm0NMgNhTf5uO5J
 nL1I4Yqo1CHJImStLoU/+VfQKWLkYfHhPJfG7kmD2F3bCtjmn9b0WLJ+D/satebEAc5/
 76kA==
X-Gm-Message-State: AEkoouuSFzm+T8nRGgqf6Qq8LKVS1525mr7hAbp9bYFYDlCzqtVKjzEKbCsNvix/I2XOPQ==
X-Received: by 10.66.219.105 with SMTP id pn9mr93223896pac.25.1470039968145;
 Mon, 01 Aug 2016 01:26:08 -0700 (PDT)
Received: from aurora ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id 9sm43287772pfo.74.2016.08.01.01.26.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Aug 2016 01:26:07 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1470039961.16990.7.camel@jms.id.au>
Subject: Re: [PATCH dev-4.7 2/2] net/faraday: Clear stale interrupts
From: Joel Stanley <joel@jms.id.au>
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Date: Mon, 01 Aug 2016 17:56:01 +0930
In-Reply-To: <1469667862-12601-2-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1469667862-12601-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1469667862-12601-2-git-send-email-gwshan@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 01 Aug 2016 08:26:10 -0000

On Thu, 2016-07-28 at 11:04 +1000, Gavin Shan wrote:
> There is stale interrupt (PHYSTS_CHG in ISR, bit#6 in 0x0) from
> the bootloader (uboot) when enabling the MAC. The stale interrupts
> aren't part of kernel and should be cleared.
> 
> This clears the stale interrupts in ISR (0x0) when enabling the MAC.

Thanks Gavin. A question below.

> 
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> b/drivers/net/ethernet/faraday/ftgmac100.c
> index f00911a..fc2852f 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1119,6 +1119,7 @@ static int ftgmac100_open(struct net_device
> *netdev)
>  {
>  	struct ftgmac100 *priv = netdev_priv(netdev);
>  	struct phy_device *phydev = netdev->phydev;
> +	unsigned int status;
>  	int err;
>  
>  	err = ftgmac100_alloc_buffers(priv);
> @@ -1145,6 +1146,10 @@ static int ftgmac100_open(struct net_device
> *netdev)
>  	ftgmac100_init_hw(priv);
>  	ftgmac100_start_hw(priv, priv->use_ncsi ? 100 : 10);
>  
> +	/* Clear stale interrupts */
> +	status = ioread32(priv->base + FTGMAC100_OFFSET_ISR);
> +	iowrite32(status, priv->base + FTGMAC100_OFFSET_ISR);

By the time we get down here we've called ftgmac100_reset_hw. This has
the following:

/* NOTE: reset clears all registers */
iowrite32(FTGMAC100_MACCR_SW_RST, priv->base + FTGMAC100_OFFSET_MACCR); 

We are seeing that it does not actually clear all the registers?

Secondly, if we're seeing stale interrupts is there a risk that they
will fire again between now and the call below where we
set FTGMAC100_OFFSET_IER?

Should we be masking them all off, clearing the stale ones, and then
re-enabling them?

Cheers,

Joel


> +
>  	if (phydev)
>  		phy_start(phydev);
>  	else if (priv->use_ncsi)
