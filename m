Return-Path: <joel.stan@gmail.com>
Received: from mail-ig0-x233.google.com (mail-ig0-x233.google.com
 [IPv6:2607:f8b0:4001:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5C7FE1A0B50
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 10:39:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=BsR49tZt; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=cs05ghPU; 
 dkim-atps=neutral
Received: by mail-ig0-x233.google.com with SMTP id mv3so840271igc.0
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 15:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=XztSLA9VzAsjuDfeLjN/vWHRjUFNBg8RxKgXO0HOOkM=;
 b=BsR49tZtYqG3SAURbAAZTNeCsuedVAXZO/9CmhAALU1MCkfFgUomeRBQBolKbyrgXs
 tbFefpuD1vlsaIWtcG448z5rquw8T5xkctaAw+VuHb0HqmuBeePk5Uk3IDJADgigqE2o
 C2BrNzsJK5K5+ixKPP8oXektFFUluF6kkGK9+szdlUw2PjzQn0Y0Svt3706FcwMbvjJ7
 WDYdzAY2W9qIS49y3jR/RSyqOHFg8z/nOcScSvXcgJpxQ3JHVIJKeoiU6P4raMXItjo+
 Qe3gTXo7CM72JI3O0TGiw0y6WEK87LCrVupRZZhH/OxfMfxSyVlDMghdsgFJq6PwShoq
 bkwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=XztSLA9VzAsjuDfeLjN/vWHRjUFNBg8RxKgXO0HOOkM=;
 b=cs05ghPUz2Xcrn5IYjZED/YSLpRlibweuEBM6PtNZyqvSp3AcKV4J+4zm5vguKh77d
 cbqRU5KZQUBKxH1E5FlWBfEeF9n5gTF7HSihRs8Djhy/8i2Q/aZJlHNBs2COdhBbROWj
 CjMIzRU61Wa6ACQw0ld/wIBxqI5ZaKsMkcwmg=
X-Received: by 10.107.166.82 with SMTP id p79mr42973467ioe.187.1450309141708; 
 Wed, 16 Dec 2015 15:39:01 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.79.83.67 with HTTP; Wed, 16 Dec 2015 15:38:42 -0800 (PST)
In-Reply-To: <1450308034-19042-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450308034-19042-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450308034-19042-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Dec 2015 10:08:42 +1030
X-Google-Sender-Auth: UJoygn0NTFWBZ-6YdEG0VacPho0
Message-ID: <CACPK8Xd7occj+rK2EZ0TmDUZcn0i-PMA8Ey-+kyCYAEuApG+sA@mail.gmail.com>
Subject: Re: [PATCH u-boot 1/2] drivers/net/aspeednic: Fix RX buffer size
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Cyril Bur <cyril.bur@au1.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Dec 2015 23:39:05 -0000

On Thu, Dec 17, 2015 at 9:50 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Cyril Bur <cyril.bur@au1.ibm.com>
>
> The hardware defaults to 1600 bytes of RX buffer size, currently we
> allocate a little less and there is a chance that the hardware might DMA
> more than we've allocated.
>
> In the process of writing this patch, it was discovered that the driver
> was incorrectly informing the hardware of its RX buffer size, addressed
> that problem too.

Thanks Cyril, great work.

> Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/net/aspeednic.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
> index d75ef67..e7b0b95 100644
> --- a/drivers/net/aspeednic.c
> +++ b/drivers/net/aspeednic.c
> @@ -227,7 +227,7 @@ static u8 g_phy_addr = 0;
>
>  #define NUM_RX_DESC PKTBUFSRX
>  #define NUM_TX_DESC 1     /* Number of TX descriptors   */
> -#define RX_BUFF_SZ  PKTSIZE_ALIGN
> +#define RX_BUFF_SZ  1600 /* Hardware defaults to this */
>  #define TX_BUFF_SZ  1514
>
>  #define TOUT_LOOP   1000000
> @@ -1161,7 +1161,7 @@ static int aspeednic_init(struct eth_device* dev, bd_t* bis)
>    set_mac_control_register (dev);
>
>    for (i = 0; i < NUM_RX_DESC; i++) {
> -    rx_ring[i].status = cpu_to_le32(RXPKT_RDY + RX_BUFF_SZ);
> +    rx_ring[i].status = cpu_to_le32(RXPKT_RDY);
>      rx_ring[i].buf = (u32)(&rx_buffer[i]);
>      rx_ring[i].reserved = 0;
>    }
> @@ -1181,6 +1181,7 @@ static int aspeednic_init(struct eth_device* dev, bd_t* bis)
>
>    OUTL(dev, ((u32) &tx_ring), TXR_BADR_REG);
>    OUTL(dev, ((u32) &rx_ring), RXR_BADR_REG);
> +  OUTL(dev, RX_BUFF_SZ, RBSR_REG);
>
>    START_MAC(dev);
>
> --
> 2.6.3
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
