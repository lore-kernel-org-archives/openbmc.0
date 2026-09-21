Return-Path: <openbmc+bounces-2629-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742F9C982ED
	for <openbmc@archiver.kernel.org>; Mon, 21 Sep 2026 15:02:40 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hpRKj0Cj3z2yft;
	Tue, 22 Sep 2026 01:02:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:3b::e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790002952;
	cv=none; b=eF7UPSpRp87LAvFwQF7qvGfxN5fYIyVAzRAYrIHxgm+yXvvlwrVZXh+1kHuL5o0H26M7uuGPTDtKDIg8ftbGE/H8nLZemISgYxf+GGMCWehAIOc/AQy57URJzTr+DkymkCCQkaefzPoJAaIyP7uGzMhRpznzwgOgYBBm4uXe301kcGhTNno4SGwF7w3LdpcG/uFLuVH8Ytf0Vjt0oeZiz9I15GKL5QY/fBsMEwRW++Qjno4FB2EiKW/mgWks6xy5bH1vgAB6ONTvmjvggU+QMq0iPgxhFqlCMoze13rFiu2XlsphqDGiJlbLUSmiwDa1qb+jcrBU4Ow9H/S/w1BJ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790002952; c=relaxed/relaxed;
	bh=scSu49n0yZs/NkIL79oefwB1Fce7usaOArd+rmA6NfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gejDXTuDWpCiPqobfBFo2a/KZ4XmExsOziNySbkXw/EA308YoxHHiPfsQWZ6aj7mj7X+9UbfO7eKL1pj45FIW6tmjU5De3PkfoBAzi9vZT6BT9AYOflO9VDpKCvk78L0AadwkaXiV3ExQArlWA8jgPUfoCTeon9asVRnLZ2MBQl7RqXBhAM4B9IozLw0vLlO4MVh5gj+HxsFl/bsUYqolIwcYlNSlAUszJSJ0fGP2eNSP0xoxXPBxHut7lJctRM45Y1utuV/Xo7kksrWaOhMvZOEYH4NhMbZlCFdQq5O4YIoiDpV8uKOX2j1+lY7A3qfROZ4giH4qgUT4kQCNC7GHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QBlNclo1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:3b::e; helo=mail-pz2-x0e.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QBlNclo1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:3b::e; helo=mail-pz2-x0e.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pz2-x0e.google.com (mail-pz2-x0e.google.com [IPv6:2607:f8b0:4864:3b::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hpRKf4TFsz2yVd
	for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2026 01:02:29 +1000 (AEST)
Received: by mail-pz2-x0e.google.com with SMTP id d2e1a72fcca58-86e6d007703so2593256b3a.0
        for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2026 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790002946; x=1790607746; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=scSu49n0yZs/NkIL79oefwB1Fce7usaOArd+rmA6NfU=;
        b=QBlNclo1kziSBX6tmL6hTKg05US/plb+04hIyh4xnSLBKC0HGlU1r4UaCKkTF7VnmD
         p3E7rm3THbv3ReF5fS1Ln4dGsEK+f6tciLxYno6ntNbwBDajmKozJF73wROsllXovPiM
         OeBedDrAimQ12G2s+Zcf9ZZYdbV94SmXhqQ6zM7G2ZVfhgPNW7HF7VOKeCaHuaqdXSkM
         8X1rdGdOyvJfh0Vo3VR3ITNgIOQ1k2NnUHKYMzoR0wi46knCdvshykmPShUCbTDEaAoS
         qS+tO3f3gXtLX3xFFVBji0b8YTTd8vdznExlddXxTeKbMA7PuUlN+oMdw6hW+zx5Tp8Z
         Eb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002946; x=1790607746;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scSu49n0yZs/NkIL79oefwB1Fce7usaOArd+rmA6NfU=;
        b=05vEDjri1lFXYJQ9ChCJwPtwhu18sb1fV2djVoelVINp9rIF2vW2bpcAVp0ihRk49X
         DGBMVz3u1rjCrAniiVS8ProZsmedNeSKt6fBE1kVSuzNJs3bw1lW+BjGBGyeyVfLfEph
         stuknBn8Sr8ZuIoIIZ+mLs8fHE16+S9M+cj/CKT/1y3sug2u+p3ZfgQ2dGWRP8zYwv2c
         1xv8FBsEaTzumyBiELzbImbawLwomx2J4ikcaXZMgfMrOeGfoMDZ+V3YA/bREUTal6XZ
         vWZJ180L0uYpLRe6tyYgN6dfsuWxRMRb/0ZUXqcD/KFU+LFgbE4XnAFme0guQcIsNsMJ
         ZLjw==
X-Forwarded-Encrypted: i=1; AKwUvBz9rBUs8F2Ug+uKiktI2bztVic5SutdjYbT7grb2hT1vSHHDLTEgXqZxFc2/ZCBEZ2BzNmSgUl3@lists.ozlabs.org
X-Gm-Message-State: AFuF++ndpfmUE4R8COH8pkNRHB0v92BlD+R+C2IPD6EDhvh5mkZzXKCv
	rZvGknsfGt/IhhAUD6b7CU0m3Pm2Y+MXLZiukgvcTEqtjZ3ORwEdwmNp
X-Gm-Gg: AYBFou3/w8A50IHOjrnORo6nU4k79Gp37keyW1BV7+4ViWKw6bNXHVpHEQObgSpNkXF
	Aq/n9x8LW1OZWoFdMbX43RMPooaljlf8YgoL+MV3GdN7I5y65wpUAr4uP4JJaS5TwvxXxXY/taA
	gx70tyHaTBYmeKaiGtkRdmcQ7i1UFQ4lu46utDvVSTBAv7JCCft/SieVFFN5E/zp+Ag3jHLT8IQ
	0eyHI0cnTxFd8u7OAPFSPiDuUFcmI5eoWh0aIWZm33xLFbVfAyqNHQN6jz1OkXcr7x8OMWxMlSb
	9ykyPw1z5FRFpJA56YIgogv63MBPd06JO7Vv8ignPTFlASIwH9tbhRTOUgYGIvAPVsCEBd0Bxal
	gCxIO/7wHU4daTw+P4IX4awtBZfT3x449M05l094Wg5haJ6cquF/7+flPK7VqD6hSAC2jwpfyoe
	T2KAaDgmRpnXQHeGKC8vwbYOIsoecOe6m+VDhnZHPq5P6hoTnhmS+CYIUvj/hx6vYVm0zxsM3SW
	65bgPywWTDV
X-Received: by 2002:aa7:88d0:0:b0:878:3538:8f80 with SMTP id d2e1a72fcca58-87835389b2bmr7554907b3a.46.1790002946544;
        Mon, 21 Sep 2026 08:02:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a95eceb2sm3411465b3a.24.2026.09.21.08.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:02:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 21 Sep 2026 08:02:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: add Axiado AX3000 and AX3005
 PWM fan controller
Message-ID: <01278847-ebeb-45af-b520-765fa6ae3477@roeck-us.net>
References: <20260921-axiado-ax3000-pwm-fan-v3-0-3def8b6ffec9@axiado.com>
 <20260921-axiado-ax3000-pwm-fan-v3-1-3def8b6ffec9@axiado.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-axiado-ax3000-pwm-fan-v3-1-3def8b6ffec9@axiado.com>

On Mon, Sep 21, 2026 at 12:23:55AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the PWM fan controller found on the
> Axiado AX3000 and AX3005 SoCs.
> 
> The controller measures fan speed using a hardware tachometer block.
> Fan speed is controlled through a PWM signal supplied by an external
> PWM controller.
> 
> Add a MAINTAINERS entry for the binding.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Applied.

Thanks,
Guenter

