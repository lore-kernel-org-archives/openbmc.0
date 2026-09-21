Return-Path: <openbmc+bounces-2630-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24178C982E6
	for <openbmc@archiver.kernel.org>; Mon, 21 Sep 2026 15:17:07 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hpRfN2f3pz2yft;
	Tue, 22 Sep 2026 01:17:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:3b::f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790003820;
	cv=none; b=BUB4IN+iVwQ862wgh7Qm988VggZR3klQu5xDcpcmA0suPcL7jcFXps3/zhfVCciPVaEiVuyEP1eKqsvgTRtOJEGabGYfc0WankLg0prYpdk+TqyvIligmM/94lklIFIcBpYol5mnqGW6WREzCeM6QoMv//ZjZi1LzMLrZzAUJi2TUilolbn/x89VoRtKgmtTkpEXtVMPOgxZTjCVKPpBH9QP5X/c36mWWDMSD7qcakZ516pBVl9BrqziNIkBz3bquWkdSK13welV9IPFCj+TUoUOBU8wbHi6lNubpdRau5kSlRKfkvA55e0Zr53jYWu6WJYt/JAQ2xNNvC9JpaWmog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790003820; c=relaxed/relaxed;
	bh=DrpGKqIUkLFawAwAJ6T5iyyW+Mbq35mI1r9oJC3ubjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhJ7g4nJ2ZTwH6XEIfKsnZSUS/i4wWGB7bYWWg5UKsCZlRuglZjUue9wg/rPyMYFBnc9GjOsJkDmXFvRpXc5F6aFHXdns+1hgofE2+HfoUySBIN05Ezaz2udyxWh5MZNyjq8jTLmWfGdYWQDPy1LBYWxZERgPiZeguxlF8foLnnJsI7aYC3VFqDFDMUdRfvuNhEA9UXedcLg8hGWG2qQbZXrOIZVoU35FPQOB2DMLFAXimFbDubEdVhNA7y7NEL4r4BmLF2FNTj/J0fHqtmDTSM7T6gfgg7I9vcpqxnJKDRhIlDoWQYy2SJzg9kiCZYfKo+mZNLZ1XulLZSjdOjNfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Myao64jK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:3b::f; helo=mail-pz2-x0f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Myao64jK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:3b::f; helo=mail-pz2-x0f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pz2-x0f.google.com (mail-pz2-x0f.google.com [IPv6:2607:f8b0:4864:3b::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hpRfM0nkfz2yVd
	for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2026 01:16:57 +1000 (AEST)
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469e211a0so3450122b3a.1
        for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2026 08:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003815; x=1790608615; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DrpGKqIUkLFawAwAJ6T5iyyW+Mbq35mI1r9oJC3ubjA=;
        b=Myao64jKbr+Bvo+tyqVHRn+KmtRbcRVE9mtiK7Df4yt16Bm0nTNMjX7oIgfm7/9E7T
         WRSuAX6zYfkrjzykShU5qeMdKYs4Q53xumcP6t2GOn0i4bwn7NwfsZF7zZCFAj/mUUIP
         BQTYWQAraSNLxLk8uu7HSrNf9evPf5TxGbumLpz2NIGyrxju4rK4znDQFKkhl0MZjYgx
         fgj36Lk4YabqNqMYb/6mKvcCIWClKVfAMy1JzdoS36uzIGq1UPhcPjRsP2h5qV4qusU1
         V3o75QCxMS+oioocO5b9x36O65CH7Y+PBPjgC9yALNWRqn6rXUH/vnlR9mrUeG5cq4Em
         G7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003815; x=1790608615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DrpGKqIUkLFawAwAJ6T5iyyW+Mbq35mI1r9oJC3ubjA=;
        b=w97ZvrILpoJOvNxQkeGoTS+kRB5fHNlLC8VgA71wkYCkF3xgTTaBhbx9BW4VRyIwXU
         5ADienSNDNKKXKk6tcexHmnit/F50f97a+oKAefdxok19Q5u+k5uv57sfin/MSHEYavX
         Mz4mZRyyt4o0ni83V5joI8DuLIj4ZMnZSn5jsv50m4v+PcsuGV8iGk4NZg5GRj0DYltJ
         xOdX5gXv36+rOHkP3UtMrjFDInPNgXWE3cdyqeQN1K51tLEPCQd20yj68U8HSiNFqPfk
         uqKNNfrEGlxZ9QjmTzoZT3P4OyGcR+KG6s6xPT92rADRmbi5BfEg289hsdypc+2eTu8D
         XZfw==
X-Forwarded-Encrypted: i=1; AKwUvBzI/owl++U0bV6Jf01an1Vh3mPr9GJW/+u2Y2TnSTRra0ElPIrxBdQxcTk6d9rpgqX60PUUk9Zy@lists.ozlabs.org
X-Gm-Message-State: AFuF++mZ3S7fOOln72yBgpR1mniwv2cmgybHxACkyXOHXPPB+U6KwT8h
	/ifDavTgtyeTzlMsZyzNEWC21HHt35r3R4Tjg63Ws5C48DEQ1SQDRZkz
X-Gm-Gg: AYBFou0400Ntrr+ucLFC/YsCUfugaK+cXKthAJR748JcaIThl8Um7qfVvuZl5oXPcRl
	QvVS40qRD/lxGdhOtGuMh7i2lvMD58l0090neTvmhrD/3FXiN9Fd7v2ebQ6AQfU13fiEKfWQBJ6
	k8ZesJtG0/D5abbZ63MbkPIcbjgi7WVeQn3zL5TbU52qxt05RpGNDd7i3oIHmC32yByYW39EiPM
	+OfPkGaHO26qgrluUD3+E677uM2ZqkUxBLhYxzgTNZIlOzcFxZPt25aJOydiCYufVoeadudz6O+
	y2sl7nLcSX/AOzEtGPbOgcxCvaCNbobbVe0M6LU8WmKyphReL1JwZz++rspLwcfr/AmwUBmabRO
	YcwkzUxmT2Xy5pr56U9hQ5urUi2nwBNhGX4K2/dYS3GzJeIJw2omdaGGLVX/1bP79KHhAcucJYo
	EZVJDnwfm5sU6L2HSmSTILVdSglSRKl2O/WPVraFd8J0fM7M62Q4QkjS6rZ8HDPhM/JYE4maTTx
	2s7BBmw6pUw
X-Received: by 2002:a05:6a00:ad08:b0:874:706d:857b with SMTP id d2e1a72fcca58-874de9fd734mr15109225b3a.35.1790003815225;
        Mon, 21 Sep 2026 08:16:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a95eceb2sm3431796b3a.24.2026.09.21.08.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:16:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 21 Sep 2026 08:16:53 -0700
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
	linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 2/2] hwmon: add Axiado AX3000 and AX3005 PWM fan
 controller driver
Message-ID: <d9dfa12a-0999-4425-ba83-aacd48eea1ea@roeck-us.net>
References: <20260921-axiado-ax3000-pwm-fan-v3-0-3def8b6ffec9@axiado.com>
 <20260921-axiado-ax3000-pwm-fan-v3-2-3def8b6ffec9@axiado.com>
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
In-Reply-To: <20260921-axiado-ax3000-pwm-fan-v3-2-3def8b6ffec9@axiado.com>

On Mon, Sep 21, 2026 at 12:23:56AM -0700, Petar Stepanovic wrote:
> Add support for the PWM fan controller found on the Axiado AX3000 and
> AX3005 SoCs.
> 
> The controller uses a hardware tachometer block and interrupt to measure
> fan speed. Fan speed is controlled through a PWM signal supplied by an
> external PWM controller.
> 
> Register the controller with the hwmon subsystem and expose the standard
> fan1_input and pwm1 attributes. The physical fan is represented by a fan
> child node containing the PWM specifier and the optional
> pulses-per-revolution property. If pulses-per-revolution is not specified,
> the driver uses two pulses per revolution.
> 
> The driver was tested on AX3000 and AX3005 boards.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Applied.

Thanks,
Guenter

