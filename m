Return-Path: <SRS0=MZIg=MU=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554C8C4338F
	for <openbmc@archiver.kernel.org>; Wed, 28 Jul 2021 23:15:34 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38DB460F9B
	for <openbmc@archiver.kernel.org>; Wed, 28 Jul 2021 23:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38DB460F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZqJg4G0zz3bWY
	for <openbmc@archiver.kernel.org>; Thu, 29 Jul 2021 09:15:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XrVW7J1c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XrVW7J1c; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZqJ46VlWz308Q
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jul 2021 09:14:59 +1000 (AEST)
Received: by mail-qt1-x833.google.com with SMTP id h27so2611055qtu.9
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jul 2021 16:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ND6P2qhhxVzhXD27q/VZREJKfmBf1qojaMwKs8f07mY=;
 b=XrVW7J1cTd9w1mlMMY0ZbiDmfgJPrbRoiE5iN0tvZifsBRQoPA9by/jMhpCCik3TYr
 xa3fRxfMPqrcQ3aAepboMRM79Nu64PNMUvxFQICiSsCknyoZwRVdxbT3avV093nctP90
 RhAaT1C09DbBZ65GUtThHuhlwA3lGjMfZeracGWwuqsxx/qCyE58mlDFTQHYGgxQhISH
 KCD3fG/ZwDD5E/HUm1is++QZqhwPKao0+CbZAR1T1ErQ0ngntBoOl9SdCd1EmFWqEcPU
 bEhGWd24erECabie5RS/YrqFLs+38zxQPitLpYibuFCRWqiP9jfp4oRWvMODK1qbTc+X
 3wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ND6P2qhhxVzhXD27q/VZREJKfmBf1qojaMwKs8f07mY=;
 b=FZSAG1V63AXzWSuHQx/TjZk8N1tzPqy/gC3dNmEJ+MocwEx8PXGsjp7seC+UN/7lz+
 ZGgvhi/p+rkCw0qBKnux3ZXBci7gPabYBETAbufNJGOZrD9+YbaiLGTIevEn86I+U2Hr
 2uN7yPi5wsaw5Jt9GWMPXp3SgulXRp4WBPpeg1pzdzuOSM0ykqiAeKyGs3j+C4Z3jNFk
 NCLmgno0l6mAAUUxsKUGir+GUhJzDVVZsta6fRbQx0yiUSmXOwn8bsHy5M2WL8WylwXP
 GOgS51UrIaM27TJEgUrJ8V7mv1EN6jiOWiItsbKolTdugfaeonJC/5Ij9OEnXBdr4YaL
 Zv5g==
X-Gm-Message-State: AOAM532mfWzhEJirkTTTchw5ZzlEGV9BOmeM7r5VVSM/LyTuShmk/1rb
 6IKUNEA8LuGTurZDK9ltqlo=
X-Google-Smtp-Source: ABdhPJyo/28Q4MOpP2UJ3HddkSLkEDjlP/piWCl1SaA7cTIgZlN/rTxKx4Pf/otDtkSxYIZR9xEbIA==
X-Received: by 2002:a05:622a:283:: with SMTP id
 z3mr1855229qtw.312.1627514094886; 
 Wed, 28 Jul 2021 16:14:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a5sm764298qkf.88.2021.07.28.16.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 16:14:54 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (pmbus/ibm-cffps) Fix write bits for LED control
To: Brandon Wyman <bjwyman@gmail.com>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie James <eajames@linux.ibm.com>
References: <20210728224140.3672294-1-bjwyman@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <2517b3a8-6549-3ee6-76d3-6545a38cf6ea@roeck-us.net>
Date: Wed, 28 Jul 2021 16:14:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728224140.3672294-1-bjwyman@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On 7/28/21 3:41 PM, Brandon Wyman wrote:
> From: "B. J. Wyman" <bjwyman@gmail.com>
> 
> When doing a PMBus write for the LED control on the IBM Common Form
> Factor Power Supplies (ibm-cffps), the DAh command requires that bit 7
> be low and bit 6 be high in order to indicate that you are truly
> attempting to do a write.
> 
> Signed-off-by: B. J. Wyman <bjwyman@gmail.com>

Please be consistent and use "Brandon Wyman".

Guenter

> ---
>   drivers/hwmon/pmbus/ibm-cffps.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index 5668d8305b78..df712ce4b164 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -50,9 +50,9 @@
>   #define CFFPS_MFR_VAUX_FAULT			BIT(6)
>   #define CFFPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
>   
> -#define CFFPS_LED_BLINK				BIT(0)
> -#define CFFPS_LED_ON				BIT(1)
> -#define CFFPS_LED_OFF				BIT(2)
> +#define CFFPS_LED_BLINK				(BIT(0) | BIT(6))
> +#define CFFPS_LED_ON				(BIT(1) | BIT(6))
> +#define CFFPS_LED_OFF				(BIT(2) | BIT(6))
>   #define CFFPS_BLINK_RATE_MS			250
>   
>   enum {
> 

