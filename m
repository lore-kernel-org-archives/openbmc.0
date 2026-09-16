Return-Path: <openbmc+bounces-2596-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EE3C88E77
	for <openbmc@archiver.kernel.org>; Wed, 16 Sep 2026 09:36:42 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hlDKw3G1Rz30M6;
	Wed, 16 Sep 2026 19:36:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:34::f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789551396;
	cv=none; b=SuslcWBC7k4IY0pCp4qg6DcHDc9/X3Q6147mIvzX9LiIjzBjX6GXxevQi5GL1vcCPQjD+eoYVr/CQyoKwjt1MjdPobd6BKVpqOFqGvITWHRAbDfmDOIc1X/2EmhH4v7bZusBdr8psoHiP29hdRDoYMY/q8+WGgo+pTbKfBzH2f6HFcYTImMa0nhY8xSQAOkCVXaX99m/US3gNUi2Q7WN+YiFe2oPaUzV8emsW8Er+pUCJWBEac0XNcc63lCZVo/mEaSD9vmn290LO1tUAtnbMvjJtR/bdzonUADQkLiZLSSJWbLMaRAd0UJyDAyhEkqzZoKdKs0+Owk+g0Goy2pz6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789551396; c=relaxed/relaxed;
	bh=UyqoI7OUXMV0gzWxYvhqs1J+F2uf2jvpxSV5CWtZFJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AkiFitgeX2m6KrZ1kqsnKlbo4ZkDmaX7hghCZa+TQOBfbIJNBQvn+8qJ8x5Mg0kTvrQYatNVVD8v64i/WbkLHkO9pxJ/3P/sAQeaFaKjxSLjLOEhPxxQvD+f94xQPgCC2AWz0Btl8pbmfK5wL/MnP9Wibyf0dD75OZnTjmYRDeuEPxTrkHs5JbU/P++pE4Li0QTnjffrNN7GZYzv5NYRxcfpGz2zqUEWgZlIuKo4abrEmgA64j74NoLLiiF+nO/MBuUh/9hyrTgDc7nXdt/YkKep9udLF8rS6p1BoWBZnpgHtjKINmWquRbX9QQc4RJng8pFmJpinDr2y/TqPSMWfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=WwqjDO8P; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:34::f; helo=mail-ej2-x0f.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=WwqjDO8P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:34::f; helo=mail-ej2-x0f.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-ej2-x0f.google.com (mail-ej2-x0f.google.com [IPv6:2a00:1450:4864:34::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hlDKv18t9z2yGT
	for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2026 19:36:34 +1000 (AEST)
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c254f56039dso103683966b.3
        for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2026 02:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1789551392; x=1790156192; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UyqoI7OUXMV0gzWxYvhqs1J+F2uf2jvpxSV5CWtZFJk=;
        b=WwqjDO8PVBKL0vX1yplwDklBo4Q/lEQE1MknrXMSQWUlw8p5KLvB/+11nVAJwn4Ddz
         l7+ICmncxrAWvzFwF+9QAR5+wKDHtUrTS/nlLHSWqdBAjqrcCJbZWa01lGxdwI1bfNkx
         Wi4ZjkPaQ3FitvJ88YJZiZ0X1R3SJkZRw464l/OhDY6blfl8erpCv8bgZOMCjzEnTnwX
         tJwQVF2HYPleEMH/R4j80Sn+WLb0eg2iG+7ldnZHbaORr2rCwezss/ht5pUSY1qq6YL+
         cgmH5MlB+IpJKbCMHpgWeyPyfVrZJcEoXViRdX5Us/i+kxHlhDW1CqqDzKEPtOj9qZAL
         d4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789551392; x=1790156192;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyqoI7OUXMV0gzWxYvhqs1J+F2uf2jvpxSV5CWtZFJk=;
        b=hJSqPH7ZRNG4yGHYUe5vxPdCsMNlfS+VD4uL28DhhQkLxzPZZSaxS+BY1zGOZq42Cm
         QFGtaUwxufBB7geO7I6RTzFo0stUp6H3LdgZRNNzTP1fr7omrUZC4FN8rVTBMadloGbB
         M1wXl5oarcCro1MU0QdBHPRnKZF4O6bthgw5wRvFlMR4r6UEBdBmN62ljgye54tSerlk
         o6h0KLxSuJOBi1N7QqBM0xNFCVaaCOA9q2CNymy7ma7+YyPu0NA3yCzZKDq45K4yyfD8
         5KH0ypA+KfUhn6+WZrJSXnLQ8OodqvGvUP22gw28OYuPrsvRQd2+NHSPOGv+8AMN3RIO
         kmIw==
X-Forwarded-Encrypted: i=1; AKwUvBy1YEqEtfn3DsYuluOGfMSgMCwYNUgENwBxapO4xcbrutLJ/B5XB7DZ4LdW8YfuA1BT06yzkH5W@lists.ozlabs.org
X-Gm-Message-State: AFuF++k0/6BpbbkoTvETV49FLgOYAYpKEdLJG5LQysfFbNOT1Zbry7co
	4v5MkabETnY3+SoPqrxqpYqqwFvjHUJBBQQu+HTIJVbprmz3bmq6N3aN89dDJ9GYLljtLkTcZXt
	u/8e/mNA=
X-Gm-Gg: AYBFou1dKJLuF6RK9/6S2xPEEVp9aW0H6rprKL8vKYTGuTKlFjsKrncBN3qc/jifQh2
	m3VzluUULHU1wLUbS90C71RRYK9PFBPpwjoyWMwOYtocG31fKlQHdJtMtMerDC8yorxmhH+HQhz
	jU8iapMlLM02t6q+Tka+Dc43n4MY0zpCMXm/7OmRQ5dRem91x0Bf+lFY2e6T+l7JfTnt1sDbIsX
	HDNlj4Hod3eVxWiaZni/GaYBJmiqvDChdYA/4g2HwsvYUo8bAhw1A177H6xvu2vywwnJFkU8Oyk
	Twnf52B5M6PVFlH02xalyCZWWyISAIjYu2OqT2F4d+hqWoEWOe4dI2kjDD2kJpHb2qrMHIH2p0w
	cwdtKqJErfE05u/1vmtNBFxGARQgTloffTZXBy+utOBSSsSaERQ/M3PRv0UXPGam6OSfMOfKK1Z
	gIgVyVzB7c8dMhzoN/BkidJcNxicgzHGCJyVOJ64Qv7kU/XGvuB3SnDnCVEbnkP45iZCQ00lY9G
	OsKySSQig==
X-Received: by 2002:a17:906:7944:b0:c29:4d53:787f with SMTP id a640c23a62f3a-c29e532ccedmr125910166b.41.1789551391758;
        Wed, 16 Sep 2026 02:36:31 -0700 (PDT)
Received: from [10.27.65.31] ([195.169.148.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm95827266b.42.2026.09.16.02.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:36:31 -0700 (PDT)
Message-ID: <71a7cf57-0c5a-453a-bfed-c01d3f43ed86@9elements.com>
Date: Wed, 16 Sep 2026 11:36:30 +0200
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
Subject: Re: [PATCH linux dev-6.18 0/4] hwmon: (kb9002) backport Kandou KB9002
 retimer support
To: Andy.Chung@amd.com, openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au
References: <20260730-kb9002-backport-v1-0-41f472e52215@amd.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20260730-kb9002-backport-v1-0-41f472e52215@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/26 11:07 AM, Andy Chung via B4 Relay wrote:
> The upstream series was applied to hwmon-next on 2026-07-27.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

All commits are missing the `cherry-pick` reference and have no DCO 
sign-off. Please see [0] for more.

For this series:

NACKed-by: Tan Siewert <tan.siewert@9elements.com>

Tan

[0] 
https://github.com/openbmc/docs/blob/f5a34e78837e099e539c9ff5d020fd2d1db513bb/kernel-development.md#tldr

