Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD86606A31A
	for <openbmc@archiver.kernel.org>; Tue, 27 Oct 2026 03:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nqQNAX7J
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jDGhY1R4Sz2yVL;
	Tue, 27 Oct 2026 14:49:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793072972;
	cv=none; b=h7SDTuaZjSHwowwaHJXfayR8whJP2A1EjQZAg5mnKQkmtJRK0LouvTiOsVZJJ8dT8gwFAcDqNdk/SC+1QyYB/OTZJlB++qCv6dE+7oklfmcfiwIOWzwL5mlcPczgkTObuwtaR3h6069HWSH9gLXxGTsS2kN7W2Xo5woDN4t+a8M0nHrRsELwcq40ucZ5Z7n8tGkO+AVbvXX5iC6jSS3BnjXXMq2cm6ZliREz6XD262RgxpjCmAMRvxKnYjtRiq080w5bqTKCqe0dzU9e/Jgyuqkmi4vLj45cYwC+JzqChR5C+kzot4iGIjLdxNtemP1Zlu1DH2z9pI359I1h2UjXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793072972; c=relaxed/relaxed;
	bh=bVKdd+rg0dOMU+J41LGwwuebdjS7SkBQhNfNvVlqcdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMH2iqC8JvfsFH+wm21mXN60e7YngDAsgHJitTgwdmqrE4R0DkdaVgZwKm9lucSVOGvKbm4fcnwVOetbo4PO0Qz1JxGmPHvJfyJQ1+afo8rOBFiqZ5d6Cbyv/DJ0sSmUQ1F4nlDhoPdynl9tqkZxlp8UDNQPkLlK1B/VUmFGxn6PdGqeE++PL0TKGAWaIMz85v1TNFTXiw7HHzoMA1jel2oKLK8VkDjJ3Qjv4VATfGRz2L4/1HtJfXCLs3xdK2SQu3usQ9adTnU5m4TZQ0LM5Afz3eK1A89joyhU6+CFMnIM/owgm5LsDDOVnwHjkOzgTSwhsAtH4vtlnyADEx6z8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nqQNAX7J; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1330; helo=mail-dy1-x1330.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nqQNAX7J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1330; helo=mail-dy1-x1330.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x1330.google.com (mail-dy1-x1330.google.com [IPv6:2607:f8b0:4864:20::1330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jDGhX0tg5z2xjQ
	for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2026 14:49:32 +1100 (AEDT)
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-35d0be18c71so700796eec.1
        for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2026 20:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793072970; x=1793677770; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bVKdd+rg0dOMU+J41LGwwuebdjS7SkBQhNfNvVlqcdA=;
        b=nqQNAX7Jotwnb7EWnDgeXu2Vxn4JQ8BoQ6C3EKYC1VKFzb6oZCvxZEMFVk3eql7XBM
         nm8uYD0AFRmy0D+FstW219esd1sHACgs4CDgHuL2H3XkZbD1FnfcRXhWh04h+1Ug/wm5
         k0qM4Q0vBC5YC+qbg32hQGy3sObB8vSqByLj4Zo6aWzs3Y9ib6CjOnDuIq52u5CHY2PH
         d6IswfBxUlOv6B9jkfwmzppAUsRW10WGP+8ECBXJrE7RX9I8TVhYH2ypTTm2uzPdlu7k
         rKAcvfYfH1WkCYMp25orMVADaIYJGEI4TTQ3qdRsB2pU9A8sTpfOHoHihIoI5lvLRGlM
         kVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072970; x=1793677770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bVKdd+rg0dOMU+J41LGwwuebdjS7SkBQhNfNvVlqcdA=;
        b=xoJIYX8qkrURohgoxO9DFu4xUuQaw5UhGj4aJ7WfG1uYnPXpaFXreBtrr59nCXI1uC
         lExrWTMy0oEkRExP4yNJ4xkfwCCGL4MUvSEWHeYQUE1K0pc9M99tPv9k/Rjg+Z/vOk1y
         lrYCvHo/d2WP87ZubDL/AJHYk6RUV2Wgm9Sb6ACkSuURUQIQDbLEnnRMEuT6W35Of2eY
         HZ5hU40WADHmBsUVI43QF1mvf6iipuOgSnsx5wnHofFeWEtVbtWImAFtCCnYPgUaRc/T
         cS+CK0KYUSDYRDXpLNdsC5xLAwlG0jvUHUPMvHhlA+0fxlZgQiEie2w/G4/RgPPKknsr
         Q7tA==
X-Forwarded-Encrypted: i=1; AKwUvByZgWDS3iSM3f2D8NT1IefWSy7ipYstCT2TK660EJgMTbamrNvbeqlu7l05uiFmnV7SSivmC88c@lists.ozlabs.org
X-Gm-Message-State: AFq9FYL3dSaNjWTOqa/FKm+C+VhczOzsbahzJjd2co/oc76Kijytp6DQ
	hZnRHE0tGUtGXfXoyV51S+S1fIoDIbOwQcpG3B4w+L95xvlKD//zGOk4
X-Gm-Gg: AYBFou0WuMVi4dMdbpYoVA4islUp8EKvzGOCyRbeH1yL9fd+hdh82VQUe3KGEPxq1Cw
	EfsXiP5EPYRxb+jrPcckJZfV2XwynjjJCBJmrEEgX67pQ+xRAjCCW8GT61keYrUWui3q5fAViW5
	wRPhu7y+Aee49cXpZ249IuJ5ujpU9yx/iCPazWL5bnS5yhX/YKUp3D8xB69Yd8gMkHb4j36/PHH
	53tjrR5iuIJBM7SZODJppsNsGBKuB3LRSQ9WSqxryYAfmN87TelVdy1bjQuijQcJDIGb4YEFuxE
	sHPRTo0kRxcYl1sZbk0/qcJ1ctarxRlrgrBCa9nhhR5xbQJJyOnD0Ty9B7tjYmUAnRHGGglRoGo
	fHfsaTwEQgAwdVuzsSar4hPoKGVmiLv1jDm6HDkjYkfHHcGEMbkJsGXjWIythULTBDYAvAt/jp4
	XAHFzI4iA3HDYEUBCLxSuKhf0VfQAfcqkVRlQqoXcsVXXhUUpgMp3hpYtraon9qglWxxmmoQfd/
	249R5EhLZ4egECLQ6bHzYY7LBnie0cm3MgfuPKIduc4F+PGk4Qf5mDw4Hjh2KV5sNG49IE=
X-Received: by 2002:a05:7022:47:b0:14e:5e6b:e6e2 with SMTP id a92af1059eb24-1a3c904cc2fmr2284657c88.18.1793072970015;
        Mon, 26 Oct 2026 20:49:30 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm26430012c88.19.2026.10.26.20.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:49:29 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v9 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Tue, 27 Oct 2026 09:19:10 +0530
Message-ID: <20261027034911.99482-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
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

Document the ASRock Rack B650D4U BMC, which uses an ASPEED AST2600.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b7e70868e..3e6133e2b 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
           - enum:
               - ampere,mtjefferson-bmc
               - ampere,mtmitchell-bmc
+              - asrock,b650d4u-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
               - asus,ast2600-kommando-ipmi-card
-- 
2.47.3


