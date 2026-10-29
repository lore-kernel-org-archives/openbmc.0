Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632D6606A31C
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 23:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UE5XkuJw
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jG0RH4xrRz30V6;
	Fri, 30 Oct 2026 10:14:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793315643;
	cv=none; b=N3YM4Ytt8b0a+oWdzsVhy27F3RvnO3TIDjqxOpTQhNh/djAozKFhAq8DGrp+X6ZVdaxpZm3H4VJpmb1THB+x0FTpBK8hN6Vftso7o7d2shpYFG7qoVcQICrD4vKVppskbZEfRUUt8rilI488WjLkD6Ug924GDgXRUz+jGVpXuY0K4IJGb+W40AcCTAkVUkNALER7VvKnGQui/Mqj7k/1KqEDRnpeVPKpWrVlFRJ0e062iE36tVavUbK6Q4pkuEFgR+8rNttGkQtQCjO8A52XqytcBZEwD+yLVyaAL3RoAQRwdxb3LPAYWch5FJbDajRIHiNtQqfLaEu+Q9XFvYVwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793315643; c=relaxed/relaxed;
	bh=g63FfAzTLK8IBBMlj2c2vg7SELBaIEsEoos/xU6UVh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1GBs7W4zL4Xah8diTIN7exa+5blfW6eou9wAH/rlCDrwYXzRhFmRtgmunEvvsPmVDmQpS1+DbXT3kcasHnv1Sqjim6As504co/ehe4DGgYpTvnDvcD/8KxYl4o4DjNln2oP5H9tGDIA3j3irjQGUyHw65slpZcwReRU3x3S3Q7X+js+nE/tP9VoCTa7C0EiWzYtDc009m4oOipVbVR57gvOKFR1nIQOZUkIC5O7mgK5r6HW7DFwH1/DDWjvAj7uugE+OIqBkQ/W5LYFvN8QjKkPk+dwZqQlrcKSBO86h25RJN8actQdu3baZg/Wc4UwTf7N4jDtjdQ4HXNNm3UZeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UE5XkuJw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1333; helo=mail-dy1-x1333.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UE5XkuJw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1333; helo=mail-dy1-x1333.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x1333.google.com (mail-dy1-x1333.google.com [IPv6:2607:f8b0:4864:20::1333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jG0RG3vKWz2yql
	for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2026 10:14:02 +1100 (AEDT)
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so289806eec.1
        for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 16:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315640; x=1793920440; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g63FfAzTLK8IBBMlj2c2vg7SELBaIEsEoos/xU6UVh8=;
        b=UE5XkuJwZ0V27PZ9S5ADdWnN2eDJyrUq+A8PdsKCT6QYTYZIr1q89SVONtUQfygNY9
         +tgERYCwUC6PUGCzKaIAYfwWwDDbk4nz7wIQa4TdfvIQT29QCn6oT+wNqVL/rJtNB+1Z
         gOKswbTz1DL5dGPjzPRWBKET2+HU2I/cQ02Rl7/Kk+xziENZGPAH4poHxAHudrGuarlH
         U6ttFjgdJKrNcyRJKD6q/Zb/DJcAm6Wzsbxyi1suMQtYpo7idBK9A7YvQwA5XfeBLQVN
         gJbidNyPOk99opAY3mYZvJCubF7K5ru6JwrvPH8YF+cv35qnJLmQhYvvEAE4Dk0V5r4q
         grVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315640; x=1793920440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g63FfAzTLK8IBBMlj2c2vg7SELBaIEsEoos/xU6UVh8=;
        b=qgYy4DFo9EoMIXvkj9RsSM+mUQzzy8oAqtQarUWIoaEdZwlt8lDBXmB+zSdn36cN5j
         sv9rRcBZinkNFinW8XmEF1Ai2fMkNaPstRgmcJsMxOf2DXoAiKlQsAUEJMxFQESDmTz4
         6nMtnGn4iar9Hfygh7lTxYJ56k4munL5Bev2msf0R8Z7k3LrmSPLhuwGkNKReBQXnM8a
         rhIw6DsCijRkm+oTGfrFQpinESE1+KqHF877hcobMW/dq6kcBi8ovOKde4raS8qqaIdp
         2T6eTO3R0XR97/s44yQSINJV9dF1bzVvRVjCD9WOjVSr1j9VXDcTW1QkM8fQOmoX4iRh
         lLQA==
X-Forwarded-Encrypted: i=1; AKwUvBxGEPA2QfYEZ1zklWU+WDRsASN91LxZw2HFKcAlxRxwN4ktCxRGOelGElkM6aNPZZtlbv4mGPSf@lists.ozlabs.org
X-Gm-Message-State: AFq9FYIn43OhpvpH4NvuunY8yHjnhJ3yxjikchmjPRVvQyf7v6iYsk1M
	wL03vsCQwxe3/uC+VAolOxU8GB85YuCzbZsvORKkhDq41N5PzFuIN+Q4
X-Gm-Gg: AYBFou3KjO+dvQxxREr9pj6+Hzg2I6XQh3qHwwEJNIJFfDYUWSSizMBGy1291GrRtNC
	k8tET4lJ6W7ma4e6vLQ+ILnEESQjyiDyYOdnzV0qXY0978POc45FXmzWyiS5gnJiwKzhxIJ18cU
	oOBuO8UISfME/TB9aXa1s/5im545nUrGgOrLfdmDjcyY2K+j8h7h8eLmZ0M5srC9NhUDz5bUwc2
	hAkDnirM2V2/xjMp+TYyX799Ag/WYcCU8jnk9DhHKXSoTZwNGxE6P5tKAOQBvSsiFwzIAu0BvLl
	XrlwzfOxyumGsD+ZgPBfFZRWVpq8R9UcuKvXDRXE2VhKMOm9N0G4vpIY4nDoWPHAPFM5uBqyqvF
	suqlHWHbJ9SjK2XE9BVKfY/4OUshcnkB5j7U8WBfy3rupgpbRp0xCgRQOp9M80RwfbXXYuZ0v4O
	l1s/1ofxK927n/F49JjJaPxo2SzjvF974/qI28SBEN9BRDbPtbK007sEMcYClrm4ry8wt+ehMcF
	H07dVQCD1OBenHNW3MgmcmAsHxy4IMrW+jHWREsDlPz+fnAqfx2wujxKJ0Vl+KInuyjHsmwP+PS
	h7mqo5cH8Uxq4xR91FAJ/P9UFp1OX1ElkWHu/WhAQFS7nkTsXtahCc366HFWrM14NA==
X-Received: by 2002:a05:7301:4246:b0:368:7c2d:a612 with SMTP id 5a478bee46e88-36a42345878mr1118524eec.10.1793315640398;
        Thu, 29 Oct 2026 16:14:00 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm1662742eec.7.2026.10.29.16.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:14:00 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Fri, 30 Oct 2026 04:43:38 +0530
Message-ID: <20261029231339.9497-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029231339.9497-1-prasanth.padarthi10@gmail.com>
References: <20261029231339.9497-1-prasanth.padarthi10@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
Changes in v10:
- Restore the original Acked-by and the alphabetical compatible position.
- Revisions v7/v8 already carried both; their loss in v9 was accidental.
Previous series and full history: see the cover letter.
Prior binding review:
https://lore.kernel.org/all/20260518-rustling-watchful-viper-b9c4b4@quoll/

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b7e70868e..c2275d7f4 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
-- 
2.47.3


