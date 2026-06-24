Return-Path: <openbmc+bounces-2134-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68CDCDE000
	for <openbmc@archiver.kernel.org>; Wed, 24 Jun 2026 21:24:15 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4glw151BFvz2xwL;
	Thu, 25 Jun 2026 07:24:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782336248;
	cv=none; b=SyvQbCxigvw+XTVws7cc3XWhx++YPEEYzBmo7LJexKYZy2dhFEF+R6b9OI9un5jrRRsz5P6fUNGaidCj5dP72ukAhImPjnGRSeRYrip9Gu/6UQSCJrkye4WVFPRqEWJzEZgRNlxUQgeiSldeAa2TCVsmzL5nLeoZGyvkzSnfi5AXweEwVCorTeOnWNsG3ytFk4xQ+mdSikglLlb9Vj3UjRcEZlRAxAPx9FoBlGucrMH5UBB8Qc8qblJtREi0vF74fH83TqGlR5dw1n7Fig0vz3rUbexorBz5QPIG/QD5/BqOHsWkpyHftskA2lgzjU5xaTG1tNbxNQFbQ1KhRKmv1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782336248; c=relaxed/relaxed;
	bh=nkAQuOljHOlOW1xu2RCl/yHIoYiGq9+rhAXaUe531Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUcvQuA+x0txrzf8ReqDGjFBa+nsNDpfFPoolKTl3lU9Xzt4dmPkU/NB/E0srM9BcxF6ZFBpcZ1REZhz82m3tmT5GGEbonjEbqqh1fLszAKJwfLvxF+meUneysJ8qykZqOZTg6I2yWTPITpdTCov9Lshds9pHFMH+6oo5C3k2cWxvmZx3vwoPONyQ5mW56xC11fCC52NirmBORGWi48cR7vkrkm7m+H5BfXy8UPDNpIOg0E2hZZXHN24Q/qJgpP4kjvf7pDllvdByZFBHpifshVS+m9+IKBaG9h7/Imp27ztTz/Zdcv3UmGWKEmQhGB9X/cT029b8DX3DLhuerLVnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jQ1q0EtQ; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jQ1q0EtQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 427 seconds by postgrey-1.37 at boromir; Thu, 25 Jun 2026 07:24:07 AEST
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4glw136V8Zz2xLk
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2026 07:24:07 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A7CEF1A094C;
	Wed, 24 Jun 2026 21:16:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73B48601C5;
	Wed, 24 Jun 2026 21:16:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64A32106C846B;
	Wed, 24 Jun 2026 23:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782335815; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nkAQuOljHOlOW1xu2RCl/yHIoYiGq9+rhAXaUe531Ak=;
	b=jQ1q0EtQN+4mhEg8krXlW+VqTsQS/E6oyHvUv0Pl4xM64uF9yLJmYXeuCDLABWA/zUPC7g
	FCMoXLULjcaDSkbNAy4Q51rrIMaIUMMQJx8x2HGj74af5qYm5DZv1O3KOCP2n9Hzlus5Is
	i8pUnlaIn5VaV3oqYq78n5o5hu/o3wBdSTh/MVADZd/lpSqJkzruy4B0n14kUDbkobuC6N
	Z0ODxj7211KYvxjD1pRrNjAJzC8rPAe75fP6uLz7/YaCnCNVlRlLA8AeHQAscFqoLYDmQ8
	ISzBdzppoa8jDhZJyyrz9cxUQOpYtVETFkQpuCKORkCv+kD/rkhUu7reOPJ9CQ==
Date: Wed, 24 Jun 2026 23:16:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	=?iso-8859-1?Q?T=F3th_J=E1nos?= <gomba007@gmail.com>,
	Dianlong Li <long17.cool@163.com>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1] rtc: Use named initializers for arrays of
 i2c_device_data
Message-ID: <178233558801.1517260.6314981975455292147.b4-ty@b4>
References: <20260515154720.406128-2-u.kleine-koenig@baylibre.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515154720.406128-2-u.kleine-koenig@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 15 May 2026 17:47:20 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
> 
> [...]

Applied, thanks!

[1/1] rtc: Use named initializers for arrays of i2c_device_data
      https://git.kernel.org/abelloni/c/3eebec1cb5dc

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

