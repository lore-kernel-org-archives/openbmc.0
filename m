Return-Path: <tcminyard@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::243; helo=mail-ot0-x243.google.com;
 envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JxnhuepC"; 
 dkim-atps=neutral
Received: from mail-ot0-x243.google.com (mail-ot0-x243.google.com
 [IPv6:2607:f8b0:4003:c0f::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40r4Wh4JN0zDqnw
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 04:52:13 +1000 (AEST)
Received: by mail-ot0-x243.google.com with SMTP id n3-v6so22214750ota.5
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 11:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:reply-to:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=490y/7a8dmSjxrJuLbN004ClM9+hV3x6PJwvLL4+xus=;
 b=JxnhuepCA8NNR4QKALnpBXketHr8DcMsQ4TNkN5+lBYa0gyaoRgrsuI5xv+WUBTO6k
 04ADKnBs4T9AdBu5KsGEJF7/xYET2ZOfCm7KYYuZi7Cbejyb2WZudI1+jIGYU9wX47fR
 zHUAqXA3/AV8j5YuGGmVmHvt6vC0S/mXIvTe7DYPwFKxR6+fLvoU6GLtiw9hz5ic2za2
 BYiE5n1vLbIPLbOSuZ1QetaXe2fwaK9/LEzvalFXcrp2JiZBHh+uoJY5P8c7bSDyKzLU
 oQOD9pZm3ybPDdlrPF5LO+xHQBy/5PT6/7y7lSSHJrt/ub1hVDKhKox4DGk4A5XEKkcV
 77GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=490y/7a8dmSjxrJuLbN004ClM9+hV3x6PJwvLL4+xus=;
 b=G8XgQSyW7g5H7oVKQ9qyMzPVAeNJDetycC7Sl9w90BmUSkfAY3k+sFUZAK+FxWR3or
 SY6KLRDPTGg/dGmUFeD5/GfZ7QCp+8ZwfM6+SBEqDVsdxa1Afbsk9XMd090Ojwh1iDAz
 vSGkIzVwjl6BMkCuLkIOzRoTkpH9xY+7apG+lQdaGmTPMUFROKmLMLH6z12f/ZfV2fXj
 GuzXvWeM3xA7zA6dMqFLDfJTIaocbbMHCasLyojWestYx2wQz+h0p9HR5cKEv++VZ2hN
 I6LfsLcH4oIACvwu/nwfBH/Zh1CpsRa0Qp1+TRSE3LOXs+TE3qawg/TrTsrndgV7hBZg
 OFiw==
X-Gm-Message-State: ALKqPwfIaUZ2id5Nl1A0MIOO6BLDCHOnp0rHgQbt3SJJ9j3Voq1JuI6d
 Qgj5s56c4k3CuSx3A1KK+Q==
X-Google-Smtp-Source: AB8JxZo1ZOVW0CNooZbc9N8YJolkWM1QrlXTKXq77NhlPFAQIerIN4HKqoM5lOYjnH17Ynq4BTsjYw==
X-Received: by 2002:a9d:59e3:: with SMTP id
 u35-v6mr18270834otg.287.1527015130499; 
 Tue, 22 May 2018 11:52:10 -0700 (PDT)
Received: from serve.minyard.net ([47.184.170.59])
 by smtp.gmail.com with ESMTPSA id h125-v6sm11530538oic.54.2018.05.22.11.52.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 May 2018 11:52:09 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from [192.168.27.3] (t430m.minyard.net [192.168.27.3])
 by serve.minyard.net (Postfix) with ESMTPSA id 86DED67A;
 Tue, 22 May 2018 13:52:08 -0500 (CDT)
Reply-To: minyard@acm.org
Subject: Re: [PATCH v2 1/1] ipmi: NPCM7xx KCS BMC: enable interrupt to the host
To: avifishman70@gmail.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 openipmi-developer@lists.sourceforge.net, joel@jms.id.au,
 openbmc@lists.ozlabs.org
Cc: haiyue.wang@linux.intel.com, tmaimon77@gmail.com, tali.perry1@gmail.com
References: <1526906399-30140-1-git-send-email-avifishman70@gmail.com>
 <1526906399-30140-2-git-send-email-avifishman70@gmail.com>
From: Corey Minyard <minyard@acm.org>
Message-ID: <3977bafa-3b0b-eb3c-7c20-57b333e8a2c8@acm.org>
Date: Tue, 22 May 2018 13:52:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1526906399-30140-2-git-send-email-avifishman70@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 22 May 2018 18:52:18 -0000

On 05/21/2018 07:39 AM, avifishman70@gmail.com wrote:
> From: Avi Fishman <AviFishman70@gmail.com>
>
> Original kcs_bmc_npcm7xx.c was missing enabling to send interrupt to the
> host on writes to output buffer.
> This patch fixes it by setting the bits that enables the generation of
> IRQn events by hardware control based on the status of the OBF flag.

This look ok, I've added it to my 4.19 queue.

-corey

> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
> Reviewed-by:   Haiyue Wang <haiyue.wang@linux.intel.com>
> ---
>   drivers/char/ipmi/kcs_bmc_npcm7xx.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> index 7bc898c5d372..722f7391fe1f 100644
> --- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> +++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> @@ -39,6 +39,12 @@
>   #define KCS3CTL		0x3C
>   #define    KCS_CTL_IBFIE	BIT(0)
>   
> +#define KCS1IE		0x1C
> +#define KCS2IE		0x2E
> +#define KCS3IE		0x40
> +#define    KCS_IE_IRQE          BIT(0)
> +#define    KCS_IE_HIRQE         BIT(3)
> +
>   /*
>    * 7.2.4 Core KCS Registers
>    * Registers in this module are 8 bits. An 8-bit register must be accessed
> @@ -48,12 +54,14 @@
>    * dob: KCS Channel n Data Out Buffer Register (KCSnDO).
>    * dib: KCS Channel n Data In Buffer Register (KCSnDI).
>    * ctl: KCS Channel n Control Register (KCSnCTL).
> + * ie : KCS Channel n  Interrupt Enable Register (KCSnIE).
>    */
>   struct npcm7xx_kcs_reg {
>   	u32 sts;
>   	u32 dob;
>   	u32 dib;
>   	u32 ctl;
> +	u32 ie;
>   };
>   
>   struct npcm7xx_kcs_bmc {
> @@ -63,9 +71,9 @@ struct npcm7xx_kcs_bmc {
>   };
>   
>   static const struct npcm7xx_kcs_reg npcm7xx_kcs_reg_tbl[KCS_CHANNEL_MAX] = {
> -	{ .sts = KCS1ST, .dob = KCS1DO, .dib = KCS1DI, .ctl = KCS1CTL },
> -	{ .sts = KCS2ST, .dob = KCS2DO, .dib = KCS2DI, .ctl = KCS2CTL },
> -	{ .sts = KCS3ST, .dob = KCS3DO, .dib = KCS3DI, .ctl = KCS3CTL },
> +	{ .sts = KCS1ST, .dob = KCS1DO, .dib = KCS1DI, .ctl = KCS1CTL, .ie = KCS1IE },
> +	{ .sts = KCS2ST, .dob = KCS2DO, .dib = KCS2DI, .ctl = KCS2CTL, .ie = KCS2IE },
> +	{ .sts = KCS3ST, .dob = KCS3DO, .dib = KCS3DI, .ctl = KCS3CTL, .ie = KCS3IE },
>   };
>   
>   static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
> @@ -95,6 +103,9 @@ static void npcm7xx_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enable)
>   
>   	regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_IBFIE,
>   			   enable ? KCS_CTL_IBFIE : 0);
> +
> +	regmap_update_bits(priv->map, priv->reg->ie, KCS_IE_IRQE | KCS_IE_HIRQE,
> +			   enable ? KCS_IE_IRQE | KCS_IE_HIRQE : 0);
>   }
>   
>   static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg)
