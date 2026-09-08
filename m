Return-Path: <openbmc+bounces-2575-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47AEC79F9E
	for <openbmc@archiver.kernel.org>; Tue,  8 Sep 2026 16:13:05 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hfTVz5yRNz2yqT;
	Wed, 09 Sep 2026 02:12:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1034"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788883979;
	cv=none; b=VoJNrNuOnXnJc+q81OjTifSHavTZ+PSvDnU0H6THjqDxSd/7RI5ChvuSPhmlycr9LmzwcXmmf3oL0uguJJ6oVvN6GXAW9WAna62lpJWHW6YEv3JXVcBlaZUAOHKxaVnAacmrH4IQ2xMqPt2520pvAnMDhwB3stkRtqc2ZM35wecqEYn1nrvoX8pKFT1nZdtUXmtTtRa/7e58gRnnsbDqI2VR63s5nKCE50Pmfu4lw14eUjODcCYFCUREIWsRQkOtqDvzviaV+ZRlu+kkqFV7rJGETAVD44fQermI2Mg/6jvFuqI3RzMf5Qtbnilba/PwsFZCxFungRWBVbkF38502w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788883979; c=relaxed/relaxed;
	bh=G0ot632abDXUhRdAYyei8Pmi85X+F5W6JzkBTKWHobg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icRfWfr5ly9LaCWs6mZu8INMxJ2Qdr8YOJl6JmfOPvrZtFYmIgnqqC0vKnfGCQxz5V3f6gjDs6GFJpv6D8XPjQDOFAZlbhQzfe9Kl8KqlCoja/iV+n9omE9hgr9hNyODBdpdFInCC44Iji63xV/8W6JPPvE0k7If3saOGn/l+5hlcZ9MXHTIktaJsGQ+fNHxd6EoKyev11NI0IKRkhLtySu3E3edKAldmhvo65wn9m16eWhfzLbVnm6l3BrslGThHhWFKK/74IM8KF8fST7saHlSE6NbtLJuy+myyURa2TgS19cD5p/1AJmV+1VMtB5qEfZQitJAyb7KhIy06YdoTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aMgsSer0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aMgsSer0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hfTVy62znz2yps
	for <openbmc@lists.ozlabs.org>; Wed, 09 Sep 2026 02:12:58 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso3571312a91.1
        for <openbmc@lists.ozlabs.org>; Tue, 08 Sep 2026 09:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883977; x=1789488777; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G0ot632abDXUhRdAYyei8Pmi85X+F5W6JzkBTKWHobg=;
        b=aMgsSer0ZK5S1SZXSVVZyL5yQPLN49SXhckbWPSP7BqV1PlHxRZKV+EE0iqon8e2jS
         zBoaHgN6tMXDOKvvz9orimZ+ExXIU3DrmO3g1D/Erh3rL0IP4CzF2I/zrvxGIwDpdfGu
         vpKQEHDcBMLELZgVlx7qHH9MJ/TF7Iiw6Y2oGiESkCNGtt6faCTpKqBGMTigL+0YtDTC
         +G/EAzLfoLChfqQuOGnoyRRJhAk1gUOAy4pVxG11k9thwGDzjP1Gr4IHbfZ2kiI7n00F
         reWHhVH7K5ZIMDTTUjuOAoOU5vLb7bVhHuBeyGN0fOyGxX4rGPFKDnM59WQhHKCrakBX
         kMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883977; x=1789488777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0ot632abDXUhRdAYyei8Pmi85X+F5W6JzkBTKWHobg=;
        b=ktGO+J6G93KpAqUjhEU8dKd9HBEJEOP3oyk83WtluTNYDWVbNrUqByq1AwUs26PtaO
         ww15DG1jEFeSHABda6HaqSaIaOIrKk3RQyydpVmtah6Q7MYdqvT7vvfxQELRfXosSATc
         c4qtjUHMFRTHAhkeX+KkytyPEuNyvAeO0sgMY0U0YFHRDPcFdhi6QguVm0l3Qqklu73N
         jbrLlbjAc+R9SpW1bAIJSw7mQeOOV7Wywv9uHD6D/DrgihIXN90iAlp3aKtJqUj6GuIE
         jjh65e5NsYF3+bsZdSk5knEh/XLSTVGGCWc69KJcErTTiDu1jPtpJg+A44gBzHlcfRTX
         9YHA==
X-Forwarded-Encrypted: i=1; AKwUvBwFe5uETQy5xUyOHlDU7F80aUDFzZcVoMAcGTm43v159JDcVJJUNCRjlIx6DEv/QOJ22YaFqyJ5@lists.ozlabs.org
X-Gm-Message-State: AFuF++lZNEJTJv8n/h/6d3BgXQl7k7cjksU/GopmJNkP62t83DNXd5s4
	Tx/IRDvqBuG2XRrTxOv1FfzAZXY32JO6mVdmer3v5v5pHAL6GLJgfjQt
X-Gm-Gg: AYBFou1cBUNOkEkIM9Dw7WSXsk+71OX1DpePJVRRiF/Cv5OfsPsG+QxJMoPyPboPL08
	J1carWxfl0SVJMHXxqHwJwE8LO0TiVoOFjeDckmlBd2rwM92eCRMZSnxuyXIamE82Jjcb74uIQw
	xmQkKH4HE/Xz0tmrjCzU9KEOe1lUm53VtoIaOyXwQgunhy3i9FI+9Zmt9g2r6ztydO+46St5682
	b6adKXQlwVJrZHo437ZyPhThXVJc1jb2C+lP01yeyOSOREiX5BxBEWnYbRG3wt3qP7I82f3ONzO
	vILJ/LwKmFaUwlUgMLjP5LWF5Xv+31gxwlVIt3Gb8pbWs0gMsW2oqNkXNmSIjuEJ9cpu4FniLif
	jG46YCzlMNaJREfQ7rwqlFolTBy26KsnSp+Pb5ETx06pZLyrhzhr9/CHkuDoplCcY+DXGufcIAd
	/i1ACsFzfwI6ssZc6UXfYJzXunPKsIbr8Bnl/EfN7ru2EebU946MyYNLB8sOZLfn3AQMkdvXgqm
	A==
X-Received: by 2002:a17:90b:4b0c:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39b26121f6cmr45189132a91.2.1788883972013;
        Tue, 08 Sep 2026 09:12:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm26901209a91.10.2026.09.08.09.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:12:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:12:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 2/2] hwmon: axiado-tsadc: Add AX3000/AX3005 TSADC support
Message-ID: <5f01098a-9d83-4f4a-957f-835d63196a98@roeck-us.net>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
 <20260903-axiado-ax3000-tsadc-v1-2-a8a0f3b251f5@axiado.com>
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
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-2-a8a0f3b251f5@axiado.com>

On Thu, Sep 03, 2026 at 12:09:48AM -0700, Petar Stepanovic wrote:
> Add a hwmon driver for the temperature sensor ADC (TSADC) controller
> found on Axiado AX3000 and AX3005 SoCs. The controller measures
> temperature at locations within the SoC silicon die.
> 
> Each TSADC controller is registered as a separate hwmon device and
> exposes one read-only temperature channel. The sensor is configured for
> continuous conversion during probe.
> 
> The current TSADC hardware does not support threshold or alarm reporting.
> All TSADC interrupt sources are masked during initialization, and only
> the current temperature is exposed through temp1_input.
> 
> The averaged 12-bit ADC code is converted to millidegrees Celsius using
> a lookup table with linear interpolation between adjacent entries. Raw
> values outside the characterized lookup-table range are clamped to the
> nearest supported temperature.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Applied.

Thanks,
Guenter

