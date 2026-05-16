Return-Path: <openbmc+bounces-1942-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1214CD4F3C
	for <openbmc@archiver.kernel.org>; Sun, 17 May 2026 03:11:49 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gJ5Yz6dCfz2yFP;
	Sun, 17 May 2026 13:11:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778969772;
	cv=none; b=konzPtuHg2WdOrY7/wMw8yafGTr1iVIvHFHNN1PZsbo5CIEE7AngeqR/G0Y6HK+w3mPlxvowriQdX2MMWNvI33+TGMVOn9sMvInWP7piB3YvziQY7bV68oQi/IJwjWPXSriVFMIkB29f+gnhHohFnluFgf00BGkqUnFHPSvVUJULEiXV6GZvfFPJuFvnm+7gq4VLr8hoVywpW2BfPEwPqmlD1YXF33BKnYggq8okZIZirL7Gql92aV+eKg4HHWemMTnSJxXNCGOTPK9rgC/gYLnpl0020rgMDlWgm0weZ6UXxzTavFDnwR0tTgDIq9syhBOHUj/ProgTA6zcpjNwqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778969772; c=relaxed/relaxed;
	bh=65HFTt3mBp1NtGCq5iKKI+LYlmbhAW1WNa0HWEy5zqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/Q3kalQfhlp40eym8LT6eOpRjpZP2oUwl/HwP3PXHatn9JWDn5rj3JvFgV+YM4m5PcrKDHCYOjF1Ck8gr7RJDDSjs4J5jinB3LAsMbDzc/KSCuLe4XevpavTm/0VSDfsmLGmBKVVWPlyhVhoXcQXMvB+3O1jUKgq9o1YQAHLs9YxoUKCoqMzhPUgGq2nFTLpdrc+p0kF4S9+6zsGjHH41jQRhRbDOIUUdQWJZLtR3SmwKIMskdEECZfqFlSXdi2xqQAep9TMgF9V0ltuwZl4zTEuqD0NI2Z5ce9e1KXuKnLz9ETTtiye9TI6N/Nry8kUm4Wj4D6jemzxXg2HgpP8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QczwC8WV; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=gomba007@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QczwC8WV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=gomba007@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gHz166bpSz2xBb
	for <openbmc@lists.ozlabs.org>; Sun, 17 May 2026 08:16:09 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so6500525e9.2
        for <openbmc@lists.ozlabs.org>; Sat, 16 May 2026 15:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778969766; x=1779574566; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=65HFTt3mBp1NtGCq5iKKI+LYlmbhAW1WNa0HWEy5zqQ=;
        b=QczwC8WVqzJuzBQ5W8bLMC7yeXzathnX7sPdgWQCY211jsQmsNuaYgK5lzOTMkYtNp
         /ZocBjYgdFP1Kv/V6Frm75GIUHsd1FQsfNhnrybY1LfLbVwsXdIehnoiq677ZOIHMsKC
         iL3E/9VDMNJ6Cg2mQ3gUBszJvBxLXPNyuhSOX9go1PVBfnEWp2YflsReDOtisS6Nn4Yp
         f+ZaHSUz4ZDstU6xSyI7c60NPmjC50pEmEcXJG+Up0Kh+rFPa0xRFrlUQ5mEFfF+Xk2T
         v+Kyi+wZIvp7I7e90zAxnhCmPb3Nz4J/9MV13ueUQdNe8ryCgkeWXRUxryVyryxXT+nv
         r19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778969766; x=1779574566;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65HFTt3mBp1NtGCq5iKKI+LYlmbhAW1WNa0HWEy5zqQ=;
        b=WKBs/mD4FwgKtWQkRS0/5r/huawAGEkrd/G3vkr+4s0glpzHwe/TH6NOKHF8iJrpzL
         4TunuO0lzvRdxs7Ls8KVIICVLRSHzygAWAUYPpwhhWuzQdF/PQI8miVnOq6nVbIRtopd
         e9nkM96yhKfmhGEXwX/8FjiJhoNl6WzTqKQkVZt4/mA8Lji9GOYoDpCzWIvNvnifxIuR
         PcGeruWJMMWIvbkYeL7bgzHCEfgD7dPj2jDz2W9S3rSbSLpv7fsC5VnPSiEzKYMagoe5
         70tsbOsa+TCu5qZpiXf4jZIzLg0ScJl0pfHtPDd1yu7nuPAQbr7RyufHX5UdNh59Y3hI
         0kyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/izLB5jdwo1H8DPc798trn5vXAvENpCHF7nE0P41sG0GUQop2I2C2UZwFpC/+qYyFEA+1ybzWA@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzhSK32lK78xBzPwpzNulEQ1xjx2/W9kSZJ/DGtqYbUb8mRyM/J
	b5FhRAbVuPLpv4+kZBCnoIRMmgAzrtr/Or17I03G4WbJp06+HuP584uw
X-Gm-Gg: Acq92OFCem3g/Kp2ZsDaLBRhGnQjZb2OxqPWRkBwYN4duBL/cEWoGfHtM7nDDv85JS1
	TrLcqVf9O5UkEP7Pq6AlU3fbWCg9YT68JV2LWz36vNH4VK6Jo2Iw6J3ZiiI6jKQLkgrj3D4BZ/E
	DHwdsTu/LHCijo0oTOk84GoF5zw+I4DOHioGuVfc4Km1fFJhRh4e2EZ/KQ+2KdKjaA4GzC0WK10
	e+oATHJ+3kncElkGm5LcXbxb0QvdUx3FblfvtO/Rjhq7nrKzYNNrdqUDQTtsjOCZohnH9sFDcUe
	dvwnfWKgcRf6hGhQ9UsLDX3bND1p7yiyQVy0+UNG9Pbd7q8/ygCZ/Dto3pYaoiVMWJa2fyMpIrD
	2b1QnUqFiWjOfoidHQS3w8tCotHGZazSi3QCprXa6FSBqKUpTQEoULwzTI9hZlnLw9TZGnD/x4y
	s9SZQTBaOrV6Vr4yv7qT2KLdBqOy6NzAZ2OKAxj8OcbdlmTx7deZ5nI6xrYZ6tdbmYs8Y1Rrnv4
	f0tx3fX/l24KbjaGrAUjnrSWuJAiK0MXqbtpZhxi1w8xcq7jzoC72uyqI1jtNYZI5d7UEZKuteu
	pvp5
X-Received: by 2002:a05:600c:4455:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48fe60ea92dmr120229895e9.8.1778969766225;
        Sat, 16 May 2026 15:16:06 -0700 (PDT)
Received: from GMBS-DESKTOP.localdomain (20014C4C1D61E800CCC0A798ED610253.catv.pool.telekom.hu. [2001:4c4c:1d61:e800:ccc0:a798:ed61:253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19b1dsm24239272f8f.17.2026.05.16.15.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 15:16:05 -0700 (PDT)
Date: Sun, 17 May 2026 00:16:03 +0200
From: =?utf-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Dianlong Li <long17.cool@163.com>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1] rtc: Use named initializers for arrays of
 i2c_device_data
Message-ID: <20260516221603.p5xuz5qczonz3sbz@GMBS-DESKTOP.localdomain>
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

Reviewed-by: Tóth János <gomba007@gmail.com>


