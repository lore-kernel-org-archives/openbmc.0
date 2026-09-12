Return-Path: <openbmc+bounces-2585-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61979C88E59
	for <openbmc@archiver.kernel.org>; Sat, 12 Sep 2026 15:13:59 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hhw0x2Wptz2yqX;
	Sun, 13 Sep 2026 01:13:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:3b::10"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789226033;
	cv=none; b=BfaUqV2Bi7shJU0zB+piFY/HBTHK1MaRPPAjWRC8RsQo1+tAOxnZw+smEkWMXE0CWpwBbEDwQv+Pmp5XMgv5IpXq7Ppn8WoyyrWwPShWs7PWe3Jiu3i1VSgPnCcxuHuTvoEogdHLZcTjECFZ94kzQ0SnUfJnB4lAzj+qpnohcCJeL6nX3cBE8L4TRxc264tfKCx4famq27urD6JTbUwoNyALQ/9+taVZfc7L7G9qWpvdPExjjCuJidjS8riFa0ZcMh/FsSh3c91MNHbssFaW4Y03ENEYj8RB49cATqckF5uGDbLHBvrAIgGjMED2DQkbNoUOlOCgwAh61qXGpsTn0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789226033; c=relaxed/relaxed;
	bh=NZJ+Pa3NsYZTQTTHYy8H/tv0MO/NVxIE9LyyFhhiPi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0spaWXodEZN/IS1OSbvN/ZlPiI2tTTBsIV0opajip3HpOWzHrPSn09v4E7yC7K5lyY+rf2mHDT0xKtUz6R63zxzWscrFCCkEk7DHwaCVujoMzAeaN646EhiXaOrHPEYUwaWGfD91kokZaCniI6Kuis0oMmqXk4feXjIM7gfDoPld+aF2zYX135Cv4LDJgKwRCKzXihiXTs4Z7kkqM7buRRIFJgWHM1rUCskWfevMNcFuVkmvggeRPaUNp0gaAEko7tyugurhV8SAS5tMke1rZT4HxSdzjffuGAYEt2osAiYf8Up/h+PIvqMaps3odVt5IM0ZNehb9MBWtBux3oRIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V0WrUq4y; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:3b::10; helo=mail-pz2-x10.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V0WrUq4y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:3b::10; helo=mail-pz2-x10.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pz2-x10.google.com (mail-pz2-x10.google.com [IPv6:2607:f8b0:4864:3b::10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hhw0w0kcpz2xnn
	for <openbmc@lists.ozlabs.org>; Sun, 13 Sep 2026 01:13:51 +1000 (AEST)
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso913881a12.0
        for <openbmc@lists.ozlabs.org>; Sat, 12 Sep 2026 08:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789226029; x=1789830829; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZJ+Pa3NsYZTQTTHYy8H/tv0MO/NVxIE9LyyFhhiPi8=;
        b=V0WrUq4yl/G9gdZFU2dCH6WedAV+183DJyNlQxGOwTsyg/J2y1lY6rVB5au7jNaPf+
         LiRdAwvBB3GrFc9QQsOkjr+5qON+xiZ68tO7eAe2i/43RhnZp6OSlTw+XZUuWDsblVYq
         eMt9vuUi/eb5kKrAfHAMP4TeOABKbwziR2TUmt67WCMpZfQCRDwCPXdKDSPGDtZI+ZYN
         zl+h8NsquFZXUvrFCWgvgGZwkQTixTCRhUYCaoMB/Dk/bWeVr/Nc8ZUO3i7fZ4zSJKGR
         fUroVm2L3w4fy+MUORny9LssbZrV5pYKgiykHy+VJ7mOz6GtedgWw4emr3Swtn4UtebD
         7xzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789226029; x=1789830829;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NZJ+Pa3NsYZTQTTHYy8H/tv0MO/NVxIE9LyyFhhiPi8=;
        b=QOM+l5O6IYZuakGmrRIdOceZFxR93Lg8WL9dSpKZ7DppTPedYwzKrPkvH7tQmgIui7
         Yj1ndrWpBNtRs2ckxD/ItnLouNJVbl6j21W3doMazB4ZnsrZgd7plAGyKaXQbd4S0aoV
         devfxEdHdq31VOffOFHXOXtjmpQfkoOLVcEjSXeVUYJ3U2GNh0w9R+pMgd9yh9l85vKJ
         xPCmqHpuT12a8576Zu27gZEqA+ocTNEPpHGIqYwgJIrCH//XURXyX1XiF9g6EEJaogrP
         Bbu8FfkkQjUUZbXISE1r6YwJ/Wy5DHUMcV5vZ9CHSjqy5DQ73U7kjwE5Ih4xO5OYeW2U
         Jn0w==
X-Gm-Message-State: AFuF++kUPUIxsbuVcpuuWBHBz8q6QJxZ3kmduwwLCiqExmN7NdJbFv+j
	vwjdx9oc6kDVHiVhZ9UB5UJ/YNkavI4CfN75Gi/0ujjKN7L/WKze5YMO
X-Gm-Gg: AYBFou0L5lsIw9SHiiT/v4LHo7rdbJDqpvvjzQxnO4SzAHBgNp6FapPBnHqEjTcx9fO
	yY5xUoZkgTwKwgYPAyl+vLBSkfN9GDXEiPHkUe6HTiXSAJAqTGtUTZagTg6ZfHBCbAYWP2FNrlP
	2b8NxvA2e2smBIe2qjXf8ju4JWxBLk83T6xm/53K4HSIBu2ONRh2zVaDEFXf783juSmoWohvi4S
	03sLRz1lZUwAIVXutlM2/AehrRn6FdL+Z6FNT5doqhjuuyWWAq6vN4hcW6mNg3FZPQsDamcHT9a
	iYh+NVLKeeooUy3+EfJZawRdYFCIxbifNEItc2BLkuOPMV3xE1N2ennkbF/HVIDDjMk8ixoah61
	w7WUu37moii5JnbVkjKzSgNAbQFltHOxSeGZdaBaKZpAoDRhVdg1hxgaOVTxC7DLW0bS7M947/X
	3QdGe3kGbuqhbk8ivat0gmoBcrKZEhdTpoEbFPMcU4frFqswXPAbJBhU0DIo7PFrEl/clqq1Q/7
	AnoDU3DZnmtFqyJdFU7G96mGJ74Sa2ypcJG8lVKd4dci+E8tyw0BfEMsl0=
X-Received: by 2002:a17:90b:3147:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39d9bee5d69mr16001778a91.10.1789226029163;
        Sat, 12 Sep 2026 08:13:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db41a7adfsm5718476a91.1.2026.09.12.08.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 08:13:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b47789a3-731e-44c4-a954-e9352529cdf5@roeck-us.net>
Date: Sat, 12 Sep 2026 08:13:47 -0700
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Iwona Winiarska <iwona.winiarska@intel.com>
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
 <20260903133408.110847-6-changhuang.liang@starfivetech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260903133408.110847-6-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 06:34, Changhuang Liang wrote:
> Add Granite Rapids (GNR) CPU support to the PECI cputemp driver. The GNR
> platform does not support the core mask scan via PCI local read, so
> handle this case explicitly by returning -EPERM and skipping the core
> mask initialization.
> 

After reading the next patch of the series: Are you sure that this is
the case, or is it possible that Granite Rapids just uses a different
access mechanism to provide the information ?

Thanks,
Guenter

> Define new cpu_info structure for GNR with minimum PECI revision 0x40 and
> the thermal margin conversion function dts_ten_dot_six_to_millidegree().
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>   drivers/hwmon/peci/cputemp.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
> index 457089c561b4..43e52a6db79b 100644
> --- a/drivers/hwmon/peci/cputemp.c
> +++ b/drivers/hwmon/peci/cputemp.c
> @@ -339,6 +339,17 @@ static int init_core_mask(struct peci_cputemp *priv)
>   	u32 data;
>   	int ret;
>   
> +	/*
> +	 * Some platforms (e.g. Granite Rapids) do not expose the RESOLVED_CORES
> +	 * register over PECI - per-core temperatures are simply not available.
> +	 */
> +	if (!reg) {
> +		dev_dbg(priv->dev,
> +			"resolved cores scan is not supported on vendor-family-model 0x%x\n",
> +			peci_dev->info.x86_vfm);
> +		return -EOPNOTSUPP;
> +	}
> +
>   	/* Get the RESOLVED_CORES register value */
>   	switch (peci_dev->info.x86_vfm) {
>   	case INTEL_ICELAKE_X:
> @@ -543,6 +554,11 @@ static const struct cpu_info cpu_emr = {
>   	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
>   };
>   
> +static const struct cpu_info cpu_gnr = {
> +	.min_peci_revision = 0x40,
> +	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
> +};
> +
>   static const struct auxiliary_device_id peci_cputemp_ids[] = {
>   	{
>   		.name = "peci_cpu.cputemp.hsx",
> @@ -576,6 +592,10 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
>   		.name = "peci_cpu.cputemp.emr",
>   		.driver_data = (kernel_ulong_t)&cpu_emr,
>   	},
> +	{
> +		.name = "peci_cpu.cputemp.gnr",
> +		.driver_data = (kernel_ulong_t)&cpu_gnr,
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);


