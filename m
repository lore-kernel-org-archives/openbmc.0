Return-Path: <openbmc+bounces-2375-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A630C55822
	for <openbmc@archiver.kernel.org>; Wed,  5 Aug 2026 06:13:10 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hFKpS6Lllz2yYf;
	Wed, 05 Aug 2026 16:13:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1034"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785910384;
	cv=none; b=c7ZIh/P6Xnq4AIt13oH5gzNDxQ9u0QY9Sg4AWkPnIX7LJgNLKgZYVdcpIuspjWqy8rKsEWWUX3agWxKW90hmDiFBmkDvmMlWLSAQr+acWdpkQxGhmwqyRRbgBWG10eZyMZJTX5XQACmlX1wRjM+58lcY3D/Tpi9uYZCusVRIUPXcAzsLAx0+ywgV5GSOwo8SlTaHba/axR8w9ovSrraFUlHe+W1tZkwCgN8JSzauujmuXBTpTIpOmSL3IyRexO2edQypY1STlFpatsKoAPCe9iRIboVTiKZ+WA5eLShXHBIlKRa5enI1gTQatODW7z1QTeQZZidIwHbtn0O03g0XXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785910384; c=relaxed/relaxed;
	bh=HWNwEo6KNIFpGwBvm3kCYvOjhoGETwip9UbeceBY3ks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nm2715f/1gUKonCuBnYAW++2kiFMhunM1AjlH3QCQBFkV6sd2cAL0RnrUGRB72X1LRqcnAJg7/glb+o4003Az/4fLbqKjD2Wc5IMs7dNysByuaIGv7Iyf+wcNUs4P/oXl6iNoKvew179PP50zTrFo7f/DhSq3vFDr5O311Zeeu7nCQ2UlF1uk0zjN3uhqjFGI6fdQV0QQGN/uMeb0o2fCtQM5uCP4qVU4yG8UoNh5KJM7gsIZgeEBtzJpFuwG81pVHsZur+dXzIa5xzIzEaFtWgk7Jrf7PdexoDKbVye9BnmD2kFxn7jgfCixuAgl+jWcJoQWCvjIX405ed4TlDyXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=alUqTZ5v; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=alUqTZ5v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hFKpQ6Xvvz2xpn
	for <openbmc@lists.ozlabs.org>; Wed, 05 Aug 2026 16:13:02 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3900e39d935so571453a91.0
        for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2026 23:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785910379; x=1786515179; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWNwEo6KNIFpGwBvm3kCYvOjhoGETwip9UbeceBY3ks=;
        b=alUqTZ5vXB+kVrHvDzhkGMdKh9chv+W0UtIRe2xH7K6WoOuwVDP6pmywTs7KVz9Zhq
         6N3vY/FoyU1CrO3x5fGSjkfkcxpLxvrWHQ3oiTlHNJ28yrLxCnAnhzA+Cz6EmtARJsIv
         oER+DTuqAiMSUd44OSSBHrNCI4fa4UzsSpLR4Q2TZaHn3kXq06j9zgwiRUu05K0Y0xZt
         rmth9P582/JPE6oIR99oKNl7h35zKVge+jze5RXUhkLu9OU3mXW1KmLBGh/5NGOd0koW
         VgEjL6pm7ZSdtTe2zsPnikvOkw3HmgWZ9CdLrglFLcNBQQwzp/81Hjm5978MBWCvNUm+
         zJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785910379; x=1786515179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWNwEo6KNIFpGwBvm3kCYvOjhoGETwip9UbeceBY3ks=;
        b=PsTyzNqrUUyF4VyFHdDNESSmyUySSlnleSGXNgchok6kq1vXM6LxxZr+iZ9bsN/ndN
         kfPRtrFQZlTgeh1foUvmdVZdQC1Zw+ecMUlrKNqE414X5U2wSx9KSGxS07cj8OknxrLm
         XxiKSIYOtwKpu9NjBnjKy5YNGx7zfxqPRu+U7kLZRcP57BDmq5mStA8v3yPmHyRthGRL
         SaOs/mdw7ne3aC3HP2nmLV42mZ8JrLcBxw1EU6F6fl9osPqrVLizF4b91HyP7AbIKJQ8
         FbXO9HkZmb9gyDoMV+yrgu6rb7a3pzo+JbMpADAdzhVAW/U0niMZlS31mID+QntEz7n5
         4ySw==
X-Forwarded-Encrypted: i=1; AHgh+RpQ66HJ/qP5A6bpCvNXJokWM8fO+2BM50THDHmMxdoCeoSVN1itdLXqDqscFEJydXNguEPQXCxH@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwmiyGI4jfmbi+bVq58GErPurUBZB7HP4Ct8Qa/ZUhpBZPXfb6b
	FcLwU1o0T8qx8mdGcQEwD7S5uZh4NlSNEHLe/EDx5fv1rHaxo4Nv7RHU
X-Gm-Gg: AR+sD13hXcj7IqvouKdwCXYo+5ob8NDvCXM72wOc5nvicIJfnJYA02IqmmetNKIvwOj
	sJjW0pSrSjUxaqNfJQVLyraq2wsLG/FrmhNV/oS8n1xVAXjlQ84Sik/PS5O+sVLhi/ptaeFmaSB
	ho2VkpUE29Bor4H5O8SPwt+7adxUE+ZJMP677+s0VkvWi0nvzhEqZSUtlOOF3LQzzJkjTq+XxGQ
	PXd8vzOEWdC9jP+YCQKvvlL6rDnnWtD4yeJ4nMKneUbYW+1l8tb+KFdSItj1XoS4FFGwXwTXMjE
	CMTN9UD/+CBgncNrzwLkfwc/0TqcNU9fVCcLotUgFCqrIgycOY4DnTKO+8QxC5ki/4KJ3wbhL8b
	xB+lI/BwUPXHt/fvcQKX7tTIH3LGnN1LkE0aQPkMBX6SVp8pcUwb4BsyGU8WN+88luwCQoqDk94
	80bKlIXKJNhtz4tVke2X4E8coAu8vl3GtdpaZ1Hj2G8eevvSU5k9CEH1w+fIPy3F+m5gUyV8sFA
	xT6uwbKMNgELtIiRsNV+5UpjGL+MPcd27O76PFUoiO7DQ==
X-Received: by 2002:a17:90b:1843:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-3903c53639amr5365871a91.8.1785910379366;
        Tue, 04 Aug 2026 23:12:59 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903917ae54sm2009561a91.8.2026.08.04.23.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:12:58 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com
Subject: [PATCH linux dev-6.18 0/4] iio: adc: aspeed: Backport battery sensing patches
Date: Wed,  5 Aug 2026 14:13:05 +0800
Message-ID: <20260805061310.1740724-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Content-Transfer-Encoding: 8bit

Backport the ASPEED ADC battery sensing fix series to dev-6.18.

Billy Tsai (4):
  iio: adc: Add battery channel definition for ADC
  iio: adc: Enable multiple consecutive channels based on model data
  iio: adc: aspeed: Replace mdelay() with fsleep() for ADC stabilization
    delay
  iio: adc: aspeed: Reserve battery sensing channel for on-demand use

 drivers/iio/adc/aspeed_adc.c | 72 +++++++++++++++++++++++++++++-------
 1 file changed, 59 insertions(+), 13 deletions(-)

-- 
2.53.0


