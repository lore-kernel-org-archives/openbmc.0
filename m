Return-Path: <openbmc+bounces-2583-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63591C88E59
	for <openbmc@archiver.kernel.org>; Sat, 12 Sep 2026 14:58:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hhvg25S33z2yqX;
	Sun, 13 Sep 2026 00:58:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:39::10"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789225102;
	cv=none; b=Vpvr4BdURGkXU+PQ5tJvRNKKDSz0JvhoGMq4yPJiKv9aa44/e2ul14iK+y66f1aw18SgX10f6oJvqp+V4K0ubbB/cK0ul1D+jFyX/NPdZL6II9nW3Vthcj4UtdwcFid2ZSDwy2b8aPDL+jgz1hUbfjYg9o3sqFY+3lSH4AM4g52A4PY3J1zfjxJGZyBkVqjNEICz9CDCiNUOilq//uCh79ElCutRY3drgq4F7cy5Gb58kkwxmtIJi8fF8hVWRZWtLqsyz7jqrn7/U0JS4/O3Kv1JoNQYmlTA3k++rudIJtpSTMnbt9Xxcog5nV6Bwa7MtjM4M+SIj/qxmOQzgleacA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789225102; c=relaxed/relaxed;
	bh=eg+Cx2mHq8xuMsQFumf2bryL3EVhVNeWJmOvxvc1Pb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KCb1X3ELdXMS605ov9F8JBBjWokOWQqhUHWUR0OiGZay5DKRvsqjHr3b1TJxOi104lltGB1cxdqljuxkP8ZETBb6o5f1PvC8UnXq7/4v1QU7jCQBeiryZtq/cw5GARZxqe0LuENksPQOV98F77orksFrM12DQ0fJtT2G+v1D//EXCzgMaiHuze5OJxhwAmU7f4KdMMNe4hHJWqOvVHKHDtr0aAwkOkjmF33USEM/cau2g5F0quSevkq8l65giv77sa8nCtjsq6pcguucR88f7L2vBZo0MZlj5RAe8+H7k4L7QcnWBh6Askw0kZDWdlPM6V+GLce/3uSq5C37eMdSPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X1Kh87e7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:39::10; helo=mail-pj2-x10.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X1Kh87e7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:39::10; helo=mail-pj2-x10.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj2-x10.google.com (mail-pj2-x10.google.com [IPv6:2607:f8b0:4864:39::10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hhvg03Cp0z2xbQ
	for <openbmc@lists.ozlabs.org>; Sun, 13 Sep 2026 00:58:18 +1000 (AEST)
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso308859a91.2
        for <openbmc@lists.ozlabs.org>; Sat, 12 Sep 2026 07:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789225095; x=1789829895; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eg+Cx2mHq8xuMsQFumf2bryL3EVhVNeWJmOvxvc1Pb8=;
        b=X1Kh87e7VLZC7V0s3owiU4mcgs2THdm3GeDFvO2Iw39ZHc5RAj7OZBV/K6vp86OIZ+
         bC/1LX/7PVNhPSr1rQtjWSIr3cMoW6MV76/0kcD/xyvnOgWIAlWeey1gpVIGcTCuYjkr
         Ls2ivqrBZaw8HoiSCPSVQRO736GdsBp+yqtRMzhJCyubu/F6ScHNAyU0giPB4YCCQrE9
         z2zGAdAQjVIILx6VKoW6wRn9Cj3B0EjFD30+G0Ih8jS3y9aD7NLD4tkqXp9i5nfhnNPy
         skKIULSmM9kn1HV5awqs+gy2ZjE0MX0gca1gjx7mKbb3UQKiqHWr9Bf0z3rtqwzdA9Xq
         6MoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789225095; x=1789829895;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eg+Cx2mHq8xuMsQFumf2bryL3EVhVNeWJmOvxvc1Pb8=;
        b=O94th/cYxOoJX38tUCduOQhm2iuZ6IP3df3XORrX+oCjSP0lyhNi7UiT4UKp06sljg
         ZZSOfAGmt5+WQ/IcPpieBrJcOBOIPMFJywMpg+HVmPfSGpG6aGG9mwL9RXM1OFIlEy5L
         2OW2OojuQbD7rR2zfDvaBsawIGKPEWGEiaAbUhqA2b9knPMjN+FhWQMuVLH3lcUx/I9q
         GThEOAmOaMGvWW2+xYpVQFmOVLypIoLJAStAQGbtzJx3mv4MTAtxjuCulrzzY2bZIf9X
         XStg/bWCJgTRL3BbJ81l/fJpLi+vJTLdnAjwRbZ6PQOPfqYHV6Hdn3/oL1IyBvTHrWwd
         BqWQ==
X-Gm-Message-State: AFuF++mT7LxnC3ueQN5H5WMI3F0wZpVeKdRLsdHRJU0lmZhG7oFe3V7c
	ySDY/yfrN7ZyR0ddS9SR3/wVCAYvxCeB/Rik+yru09Ncja607pOrZxEt
X-Gm-Gg: AYBFou1cUTl7q4syGFuBwXXlxOTSaPtULc2tj4RiHdczY/tJ1cLbvpuR6jrhvki3MVu
	f1mPvI4oi+brZPlip/gZGwt/OBkY3V2cjQTTkYPrfLUS4JDxEL3lclxJyUwyPFsOZMuwiCFSOCH
	biJMvF2rJdk1Bl8CvWYSzFf2/+sy057zhw7NJlKrHCllxiGKn5G+IXOo0o3nxqdwrOTDe8i+VIN
	Tsez/H2cPq1lBpTWlaM02xQ29I93oKpIfcT+tX5OJalM13yVNQrePy0n2JNAuXZF2SMaiEZ082c
	txKTt+RyqH2VFMjeO3Hm7H6GF10A44QUHrQDwuVlI3JilCjlZX0EdMLYQuSGw8nTkpGRpXgeOS0
	Radd8IelLk6BhgHQftcItPCHpX9EIf/m+eQzJNEqC+a+xMMM+wBiNU6IOlgUqSYxIVohqbYXS3y
	4mFJ6+Nmf1agD4T/IrHwfB71HQe8lqbtPA15doP2sVKeInnwA1EzHp9HfgebJEHUyseHBolo1i/
	ermHCfKyUygI2IKiho1rHSl3Hp2xSFL/6CF3ObP9wCZc42B
X-Received: by 2002:a17:90b:53cf:b0:380:540:d499 with SMTP id 98e67ed59e1d1-39dbbeb3c67mr5634290a91.6.1789225095539;
        Sat, 12 Sep 2026 07:58:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9d554220sm3250791a91.2.2026.09.12.07.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 07:58:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <33b90bab-8562-4638-a981-70f11459d380@roeck-us.net>
Date: Sat, 12 Sep 2026 07:58:13 -0700
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
> Define new cpu_info structure for GNR with minimum PECI revision 0x40 and
> the thermal margin conversion function dts_ten_dot_six_to_millidegree().
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

The series does not suggest how it should be applied. Technically I could
apply this and the subsequent patch. However, it depends on the use of "gnr"
for Granite Rapids which is introduced with earlier patches of the series,
so it will have to wait or be applied together with the rest of the patches.

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter
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


