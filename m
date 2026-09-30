Return-Path: <openbmc+bounces-2683-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09980CA5FB1
	for <openbmc@archiver.kernel.org>; Wed, 30 Sep 2026 07:12:32 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hvmT53jVgz30DH;
	Wed, 30 Sep 2026 17:12:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:3b::29"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790752345;
	cv=none; b=btrfzCM/Xyc2CMfo9Bod2eS5lOUaIGUPExOgJ8/dkA4KXGNKVmx3bHKFV+TnSn1I3lcCRODoswQLYQis0q8EKy+23SvqZ/QClCjmxHE8XN94rvEf1ZtjB04pMrsx9immz2ebAaBLkuiz7D1Z+xLLDbj/W9Doyfju/Qgl3fccqXwb+dYm0ya8r5moCuB0SVg/1+WtQ+W76TYAsLPWNsf0Ymjn0fwCffT82LTGww0Los8mKKkpKXWbt4wljKWzLVj7JsY+v81WAZWNNfhlHPiS10Cv/MROLS23nP1AuBIl1xSWF0yf1dkYYaJOcEiYB4gsvcFWEOw86YQPJlGvhGRIQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790752345; c=relaxed/relaxed;
	bh=JaghkIFVWn31nKC54QiQnI0K0HVCoZh74kyC+JV6pZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eej6dr4RpaP1PvKDxbOXmkP0s8cdCabxzmHOGhMnR7ANbtlkhzzTkWXQw/J0PtdQa2NKhG0ukHo2lEoWJReZHFX743h17PrtydYgtxiWGVXKSZkjwZ67kTIMVmdanOwaBHaSn5Z5z0RKbx4yvnYNc3Kxktnu2PR3Et3JUskaJ/zvVuVw9dRBbpb6D3Q3HblsaaE0Son8lK2WuGBVnibGRlC7s5O8Xhseg+P+zhVxWkSjxNyXT35RoPlGnNkEGDwrbLOCkNAngSgeOfXKKFRpK0awnAIAd96BV2VpXyzMETZKV74INr59quZKZKVZRJHRWkYK25xt4pH14eNW+yPVvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gRqw/qbz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:3b::29; helo=mail-pz2-x29.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gRqw/qbz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:3b::29; helo=mail-pz2-x29.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pz2-x29.google.com (mail-pz2-x29.google.com [IPv6:2607:f8b0:4864:3b::29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hvmT34XS6z308f
	for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 17:12:23 +1000 (AEST)
Received: by mail-pz2-x29.google.com with SMTP id 41be03b00d2f7-cc7d7111700so146277a12.1
        for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 00:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752341; x=1791357141; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JaghkIFVWn31nKC54QiQnI0K0HVCoZh74kyC+JV6pZ0=;
        b=gRqw/qbz9mEo1ClNQcNY6rrvSc0+TzFQcw5pFcCYYd7TY6PuJZcWP3RQyW3nzHUkZK
         mJdvSrCLl5mxUhYHavYtOCBnTC4/JiGpdv27f194KTac6Pucuh+Rjun/jeGK/DuXEnYL
         DxxjTR3e+CGOcPZ7j0Cl+1JYZgl9oLOLytSZ6r+mLrTdqNwlPJeEKJU9IA3RQgQjjjLg
         f3ULooE8yfBiM/jjxmoIZAk2L0CwsibxDu2kvkkWWWuiFdYQirCJkdhItoWmQQiDACwk
         /5OL4p14VO3my4IfR3y2g05Fp2wzf0wWvMo2o/DOiXPT9SauBbeuz6x0MJYtwbbeuttd
         pR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752341; x=1791357141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JaghkIFVWn31nKC54QiQnI0K0HVCoZh74kyC+JV6pZ0=;
        b=Z0c2wQzx3ZfVswB5lxdXWF6bCenYgM895EBvYNcM0N3CSTSadcHASCUn8WQ+BfaXt+
         +DsVaqxCqkWcKw6ZHJKjtHUL6w6D45rLEdjfUtx2iXLbiODk+AIZ6R2iECuuNaTEgL+X
         cJ1O+I6d5t1kp7SRAQOmPP9K/TC+hiAILlBVwpabhPLD2XvI+u6ANESe48TWaUD0SIm+
         N0mNfDUYoVLA852yAlEo+9xaYeLfS1inxqxxWI2iYYhYJuvfFUzOIbsDy7c3O+387IRp
         1+l5p5Qi6CWlGuX07ue0aL8qfQol8ZNFhWCc0WYatyjneBc2NzH6x3hcv8HSXMaH5sk6
         otpw==
X-Gm-Message-State: AFuF++muCGHYduykVYXjgQ82fzotVnM6GYkaPFPa14p/TffFfHhsOuP/
	paK8YkmYltFoBYqIT4/2yE1VvF5+922aLgXh3Z9VFoMUUFZ0GPbXMnO5oKd7bg==
X-Gm-Gg: AYBFou27R1YBcc6l6JlQPXXyVmQpXyf/Qfn1tDSEZbrDH8NF50PDT2/kFSv7Ndjfm8J
	L4acmZ77HTugODchjgUr4kROeJQ/R8qNd1oVRhgNQ4Xbs23YpeisNdfvr8r3nSnGFwc6G6iXgbt
	DSPjZLLJ3CCPrA9za/sXvXIj6WtaQlgcxy6FbgzUjiBL5IORLWw2Yn1sbvhDrMwgLCCKbeOUfxT
	dUhcKe8szH6Y+wYkPhgtFb2qKcxj2w1hTI8ybJdjxIyGa8lWK2camWm76Hv+7ZYf+AZr5X2BS9p
	TNQ5WTwOGWZBX9qfuat9dmUeiDBGAY0r/Iovx4oKLaK0l8dgLPhCmQrV//Hu0xqXtpSd0H1w3IA
	9gL8wY6ls9RkR7EtX5CvqUUIO06irGhIKJtT+X1RXY60qsE7JkM2QIuGEFiSWMj3/p9QiGRzHan
	qHYV9g3tGjv+8quvbw2tpqr9WJ0kmQmH+7g1AoyYohCCoJB5yTrLjuOtV7mI+2VnoCWb6/EILW6
	0bge8EO0BAMKkq6p9l3VdLK0d/T46t7/MX3ipM61/N9
X-Received: by 2002:a05:6a20:9392:b0:3cc:92d9:80cb with SMTP id adf61e73a8af0-3de9e6bb620mr570760637.12.1790752340604;
        Wed, 30 Sep 2026 00:12:20 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88725d63a9csm327622b3a.34.2026.09.30.00.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:12:20 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	tan.siewert@9elements.com
Cc: joel@jms.id.au,
	chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com
Subject: [PATCH linux dev-6.18 v2 0/4] iio: adc: aspeed: Backport battery sensing patches
Date: Wed, 30 Sep 2026 15:11:31 +0800
Message-ID: <20260930071135.19297-1-chou.cosmo@gmail.com>
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

Changes in v2:
- Add upstream commit references and DCO sign-off
- Link to v1: https://lore.kernel.org/all/20260805061310.1740724-1-chou.cosmo@gmail.com/

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


