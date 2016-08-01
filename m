Return-Path: <joel.stan@gmail.com>
Received: from mail-pa0-x243.google.com (mail-pa0-x243.google.com
 [IPv6:2607:f8b0:400e:c03::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s2srY6S7GzDqQ9
 for <openbmc@lists.ozlabs.org>; Mon,  1 Aug 2016 18:27:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=S8dDrkv8; 
 dkim-atps=neutral
Received: by mail-pa0-x243.google.com with SMTP id q2so9524165pap.0
 for <openbmc@lists.ozlabs.org>; Mon, 01 Aug 2016 01:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RHW60pq8EAmLM/4Y1fZr9ngOovgcSTQ4Ij9k+RF591Y=;
 b=S8dDrkv8Ni1IP77mVSqWzPpiowLip+ixRz5l9T66cTfqIyHkajgXu6m1PORBhGNdAp
 KjAL3xSkTY8WRTdoGm9S3CHmX+8Pl1l48wEwW4wPWt1pdo5o4Ags5Bk0jfjv+GicrLPN
 1z61CB/Qp7ZrUXXoyb/t0zIhvj+XyUOtAbhFvARZDGaGyZSyE9o6OIdK5jLSzUUKjGzj
 Rp3tOHuGUATOTddl2BJx+NBFxTAJ+I+q9bhlL3JEcnL63WUSBAqlJxvf3krnU8b9RFXf
 GbMv4nGxiJh8VGgQQFR1Js9aurgnbvA+l7AGwz2JKB6Z8NMZder371hOgfqlrLeG4olJ
 Ro8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RHW60pq8EAmLM/4Y1fZr9ngOovgcSTQ4Ij9k+RF591Y=;
 b=LRq/n6d7o2Yj8OFSUcuY9kvBky/bEhRm8FyaKvrR1IxpccrGVWuCfcJMO4DSmJOo77
 sYYsbTblKUUB1XhlOOBCHJ167O8ttnb21b5PGlkyQP50eEUmcIUH3idFZ+m6rMP4FtDW
 2ZUJWHrb2gl+/jmQgUGBezlB/81XEflHyqqUWte7Gtuumc6EZEodrRCukRichOTSl14E
 JRiCsPGLNTgFEuOX1RxDkeAE/+wGP4F7olldhcD7bDHxxKuD3IcIeHB6mxOw5nBp0kOo
 isU7nQuR6B/q4pmYzFQqN3vC6Ig5UU7tXiRfGB0975cAxmn+LcZ+/mVbJ+0ZnZnoVIP0
 LR4w==
X-Gm-Message-State: AEkoouvzQuwW8oXzBPE82q9C92PrBnNXrr92adjCoviHCbaJWQCqQVLvAFh5zrCYyTa3tA==
X-Received: by 10.66.123.105 with SMTP id lz9mr53894366pab.56.1470040027647;
 Mon, 01 Aug 2016 01:27:07 -0700 (PDT)
Received: from aurora ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id l191sm43298427pfc.91.2016.08.01.01.27.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Aug 2016 01:27:06 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1470040022.16990.8.camel@jms.id.au>
Subject: Re: [PATCH dev-4.7 1/2] net/faraday: Avoid PHYSTS_CHG interrupt
From: Joel Stanley <joel@jms.id.au>
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Date: Mon, 01 Aug 2016 17:57:02 +0930
In-Reply-To: <1469667862-12601-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1469667862-12601-1-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 01 Aug 2016 08:27:10 -0000

On Thu, 2016-07-28 at 11:04 +1000, Gavin Shan wrote:
> Bit#11 in MACCR (0x50) designates the signal level for PHY link
> status change. It's cleared, meaning high level enabled, by default.
> However, we can see continuous interrupt (bit#6) in ISR (0x0) for it
> and it's obviously a false alarm. The side effect is CPU cycles
> wasted
> to process the false alarm.
> 
> This sets bit#11 in MACCR (0x50) to avoid the bogus interrupt.

Thanks.

I assume you're seeing this with the hardware in NCSI mode?

Is the patch okay for other use cases?

Cheers,

Joel

> 
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 1 +
>  drivers/net/ethernet/faraday/ftgmac100.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> b/drivers/net/ethernet/faraday/ftgmac100.c
> index e805c4d..f00911a 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -224,6 +224,7 @@ static void ftgmac100_init_hw(struct ftgmac100
> *priv)
>  				 FTGMAC100_MACCR_RXMAC_EN	| \
>  				 FTGMAC100_MACCR_FULLDUP	| \
>  				 FTGMAC100_MACCR_CRC_APD	| \
> +				 FTGMAC100_MACCR_PHY_LINK_LEVEL | \
>  				 FTGMAC100_MACCR_RX_RUNT	| \
>  				 FTGMAC100_MACCR_RX_BROADPKT)
>  
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.h
> b/drivers/net/ethernet/faraday/ftgmac100.h
> index c258586..d07b6ea 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.h
> +++ b/drivers/net/ethernet/faraday/ftgmac100.h
> @@ -152,6 +152,7 @@
>  #define FTGMAC100_MACCR_FULLDUP		(1 << 8)
>  #define FTGMAC100_MACCR_GIGA_MODE	(1 << 9)
>  #define FTGMAC100_MACCR_CRC_APD		(1 << 10)
> +#define FTGMAC100_MACCR_PHY_LINK_LEVEL	(1 << 11)
>  #define FTGMAC100_MACCR_RX_RUNT		(1 << 12)
>  #define FTGMAC100_MACCR_JUMBO_LF	(1 << 13)
>  #define FTGMAC100_MACCR_RX_ALL		(1 << 14)
