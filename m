Return-Path: <openbmc+bounces-2128-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E68CD4F26
	for <openbmc@archiver.kernel.org>; Tue, 23 Jun 2026 06:46:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gkwZQ0F2dz2ySV;
	Tue, 23 Jun 2026 16:46:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1035"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782193658;
	cv=none; b=Sh1ddbFlKSQiXGIfZ/Y0PPxwQ7SG4D4yhbLbBnwvGr0p3+a6QuF4psrDavo2o2VVtP5HdMdMSUXzj/kFJCOmiNprfLWNnpKQ0N/0D2AbPeFgpXuPNF7LHLhpZL4Dl+Z4Q0KtB+1zFnMMCEpJSugclPaQ57m2ra9mC19t7PNGbg1FQ+UYL/iEWs0cqQpeMhGAbsQP/+LbW9avYiMdGBLWEJjNBV6oMR/OvKLhsOt+hzt7J9+LGdMaRVQCcrdAQsNzTpF2j3c5hXu69UsPeoZvdiuQ+IpkN1kPwTN+Rfb9DFHq3KZCXv4jFDWAyH5YUzHUUPdNVsXD30Mp8asww/LZDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782193658; c=relaxed/relaxed;
	bh=qHZPqZ3RqRQO0OE16/UixYRdvhqayKPw9JQ+fgUzrdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KGGGTc2fA5W89uMM2rLBe36gLqsX9e71j9pPpUwS5WLbWROYwMCjs+h1IS3IEm0NIw5swY/KSLX9xG+JjSKqhC3l1IQDnJ8sLk2ZoFsy9gmRteu+yQWwuIuNfIuhrSrTbfxaRIGdP18sRB/WGAH+C+j8eWynqPtytdS5eF0XEf/qqHkI35xFHaFE2D1EdxWmB4zQXHbJaxz2OHA3GKeFTONqfRRz1O+f2AOhKzZMAxS1o5Sbz3dhAcAj8hBf2ls4yN5oKD4zeA6GjPyDnpIuKuc6QsPCu3dUwuq1w45q/FaqeaEstYoZjbeZfIMq1QS2sbY1+PVKWBqqCQ6LRmx5LA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PkvQb1TB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PkvQb1TB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gkvGw2gpnz2xwL
	for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2026 15:47:35 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-37d7c265ca5so1982913a91.2
        for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2026 22:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782193653; x=1782798453; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qHZPqZ3RqRQO0OE16/UixYRdvhqayKPw9JQ+fgUzrdQ=;
        b=PkvQb1TBP4DBzJ2JWgaljWS9rdeWZpGsBXycmN0ZnqWOP4/Ax1aCLVY5J7twl4jgv6
         poaxdwfajbqajRkd1Xmt405FxToFkDc4GnfWNvlyen6T59AzKWw84ndOvTEY2k6ukDtd
         EDHOwP2TAEgRtji3FHntPOz5HeE+qw8eTBDjAICysTJN+/oc1plU6oWvRtosVAFOX0ZL
         hu3Cx6be1sSEcyzSeNZVPhcjbHvQFxLoxiqkI3NzEGsUuN1olHqbVn9znpFkAUytNkXt
         XqAwTUPvV8f0v2PTOBV133CU3JWkdp9JUBAcni1q38MjY8JsijoiZUu5SXosORHj3i34
         FMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782193653; x=1782798453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHZPqZ3RqRQO0OE16/UixYRdvhqayKPw9JQ+fgUzrdQ=;
        b=me6U1xmcfHMjVZBrD6Hh1lN4qs96KxoFuUiC8nN7MkszDYABqaH8oV7+7MZQpASjVA
         PGO9SwLO+z/17dQkOK0nvSxriOvJuIqZpCnLdejb2tPbSklwxvSj6KXyAFtLgrci7SpN
         vNAmyDlIZN1s3RR9PdsUzSjDPuA5IYVNOOecSpN6m/yE2C2z4hrZk8CDC38ovnjhKiRu
         Bt9HpLpxg8A/qtKTcigUWY4CGHTF8bBumeTgzs1VZeSSU9/gqIPvwbzTz8IaE+8gRPUE
         akPQp0fc75I/acHctKP4oInupQlKyAUravOafNI7ryv+/s6zRMXqHXlm5xLm2PQwtbH4
         zsyg==
X-Gm-Message-State: AOJu0YzsOU1SpuG0Z+8P4qIEjr1SLm8lBP6v6TR1al5OuWNkQuX8kwix
	fpJByF+Em4Lj6iVV/x2PTaoBlhyHn8oweTXTCNw1mNW7S2iPhZ7w4xSQ
X-Gm-Gg: AfdE7cnsKq5fVAC7aOLES80HqE0wXOKbZz/dYdcM4HQ8iLrXI1VnoH0uin96xfYnVw6
	NMaZGXX/+pT1prYZ5FRrXdtHlHG/12Y5LLwKxFFkDigsSFrlXvDMmHoQ5X1pnz0jPs4yzo14NCo
	4zZ2m+0jRloka95bv026xhsMnrV/HSruubL3R8albmJHYB68njRVmQkHSuzDXDjwPfprampAaTB
	eYdDTwEv4Z2lfjC6FVl/HrfizYxOLA+gQnL0ajm4picCfDeBLKNTIEZgb7KLY0EnncEzBcBBkwL
	OLqw+cSgQH9YeDkazcIrApfnxYP2EK2iaz0h7UJ3/xfCbf+OYy+Ea1FL6UMF/9dTAhW/uE4+4/k
	CeJRRKhuMYH6nGWb0NJQTMHWOogQqEZI9bhuNzmTNexy2XAKtsfP9WIrNNchCH300qfIJ1YPM46
	BLorzGh0itXXBl+ue5JIgXEff+fpZPIJwaZuvzbpQnZJRVzxTGUiYN
X-Received: by 2002:a17:90a:d610:b0:36b:9c4a:e05d with SMTP id 98e67ed59e1d1-37d160b500dmr18300016a91.17.1782193653403;
        Mon, 22 Jun 2026 22:47:33 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm11506913a91.16.2026.06.22.22.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 22:47:32 -0700 (PDT)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kwliu@nuvoton.com,
	kfting@nuvoton.com,
	kcfeng0@nuvoton.com
Subject: [PATCH v1 0/1] i2c: npcm: unexpected SLVRSTR IRQ in master mode
Date: Tue, 23 Jun 2026 13:46:34 +0800
Message-Id: <20260623054635.1214525-1-kcfeng0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
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

From: Ban Feng <kcfeng0@nuvoton.com>

SLVRSTR IRQ occurs even when BMC acts as master role only.
This case was not handled in the master IRQ handler,
resulting in IRQ storming.
Handle this condition to prevent the spurious interrupt.

Ban Feng (1):
  i2c: npcm: unexpected SLVRSTR IRQ in master mode

 drivers/i2c/busses/i2c-npcm7xx.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

-- 
2.34.1


