Return-Path: <joel.stan@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rg9kh2DMWzDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 17:13:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=wGU39cVR; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id av7so6443787pac.3
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 00:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MmjAKTshi5WQZXgDtYMMJTw6eDxzcCjGu9jOWDuUPGs=;
 b=wGU39cVRHaED5JeDO56lGcevcMJD5zIAz/pUotVLyq9luKltmx8lSqPQLJFkWH5+Eo
 JnxIVpifc+S2fsGyfhF7UPUPIL3bKqvS1F9fgjMeLhXW+K0Q3r+NglRaqRlruS0Ms68r
 tvi8u8pMijnZedHAKwkf02f928AWSUGm/uM59+CV10fz8L2u5zmkp9wCwDyH4FGKmSTM
 5MM+2rrl8foUKQH7IT9Qd/zVzPi82+nngenA9FfqAJuzxmyHEOX9Yemsu9y0Jai94jo7
 wBZ2CdLTo+H5PUFRWGZlLUNy7y97N8jpSMlnedT+pQRTL/ND/voRxBj7rmic3lZ70fJm
 gsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MmjAKTshi5WQZXgDtYMMJTw6eDxzcCjGu9jOWDuUPGs=;
 b=Nqmc3OFnb77H+Zi2pYTqI9SjRbaNqjKR+o7ytKSmaOb10daXwVlKTDto3IkjH4Xm26
 flr0p8H7mhUJdzgauXohRZ9ReQ1glMFJSvZlWQnH/WFtDZKyGZ8rJP2coeECPzbYuvmy
 wJEcLF67AYfdCd6K8fWY4Eef5t0iY95IGGCkcp8hWDMObw1Wtn+YCcywER799A+veQcs
 yHEUzuxxc5+Y2015spxdR1NRuzw2HHoijv0AWenC7Jq9UVh1J4fDR1Wf86Tw1Ai323S4
 excclscl1XpZu4QPT5l0yBulVFp38kHC4FaY6rI8MYxNf0gnztbBG1tlztEnjrUUx41G
 xjZQ==
X-Gm-Message-State: ALyK8tJAlqvCTmio/k4Uu9tDvwfuG+9JcttLLJctR43KOAhTOux6OzqZ7neagAc+R+P83w==
X-Received: by 10.66.26.36 with SMTP id i4mr18535771pag.3.1467270826328;
 Thu, 30 Jun 2016 00:13:46 -0700 (PDT)
Received: from aurora ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id s65sm2718835pfd.23.2016.06.30.00.13.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jun 2016 00:13:45 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1467270821.6386.31.camel@jms.id.au>
Subject: Re: [PATCH uboot v2016.05-aspeed-openbmc 4/9] net/aspeednic: start
 mac after ring buffers are initialized
From: Joel Stanley <joel@jms.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Thu, 30 Jun 2016 16:43:41 +0930
In-Reply-To: <1467216591-8616-5-git-send-email-clg@kaod.org>
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
 <1467216591-8616-5-git-send-email-clg@kaod.org>
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
X-List-Received-Date: Thu, 30 Jun 2016 07:13:48 -0000

On Wed, 2016-06-29 at 18:09 +0200, Cédric Le Goater wrote:
> The set_mac_control_register() routine enables MAC reception and DMAs
> before the initialization of the ring buffers.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/net/aspeednic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
> index 3f79b949194a..8b85893a4f74 100644
> --- a/drivers/net/aspeednic.c
> +++ b/drivers/net/aspeednic.c
> @@ -1140,7 +1140,6 @@ static int aspeednic_init(struct eth_device*
> dev, bd_t* bis)
>  	aspeednic_probe_phy(dev);
>  
>  	aspeednic_write_hwaddr(dev);
> -	set_mac_control_register(dev);
>  
>  	for (i = 0; i < NUM_RX_DESC; i++) {
>  		rx_ring[i].status = cpu_to_le32(RXPKT_RDY);
> @@ -1165,6 +1164,7 @@ static int aspeednic_init(struct eth_device*
> dev, bd_t* bis)
>  	OUTL(dev, ((u32) &rx_ring), RXR_BADR_REG);
>  	OUTL(dev, RX_BUFF_SZ, RBSR_REG);
>  
> +	set_mac_control_register(dev);
>  	START_MAC(dev);
>  
>  	tx_new = 0;
