Return-Path: <openbmc+bounces-1960-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF03CD4F56
	for <openbmc@archiver.kernel.org>; Mon, 18 May 2026 23:53:18 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKF2R5zhXz2yF7;
	Tue, 19 May 2026 09:51:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779091731;
	cv=none; b=HLP9J3zqeJs49MvBPG3s48THBBPyC8YYYtXV4I7z1+uzm9h5q21dt4h5fVHTwVZ8CUNGnQbVg3lJd8710/xr68tGHloIpfyB+qqurP8yqiDxaQ8h89o5ZkCcx+H4i8aPSkUK6GVvZntUIKXuucdtWtzcDaGB48P20K2L4ohfXTEljTzvp+DkNoUFFC0v78zC3KVzCzauhV5T3nnPrua4RlTwaj5l7ZgOa1dU3Y7i7KGCll5kPPh8B5I0pae6MRGFyZTod9T5YwBMdyBuc18pSgM2xM86RTFYqwYtNyJLSiYMQONlDJUjvf+fqEQvVelIAciK4h+O9ijTj7Ck5ndhxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779091731; c=relaxed/relaxed;
	bh=/bwl1+B4JYV5882tR73HE26bK+mFSsWbKSZ8jMnn0N0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A95IUKiD9fJTrvfsv6PoaIpuxOhcjCGnfJDspMTU2xKwI8GShlZWan53UQMDlyt8eKF9aut9uC06PHK1lLN7wVmiZd/chwNQ67AbAiP04QuPEGMopzU1+c54qqhTrjZSoDbZ5AhNvk6glSR39t/5nnGC/u83nNdv3RycMZfmqGlaQmmpNK4xRWQidyu8tokQwvp3LI4joNyM4bk05NzPDOvvkz5N7PXcUKwhzXAccd9FZe96Z+uhlcVJGbsElh3RfRWML6+k6bYDckbGEEks7WnZ2cbvGD0ASUWCO98OIo8l1Ev60hNydb950BCV3au38rKfGr+Nj5jICRDwuo25Bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mkwU4nkp; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mkwU4nkp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJr6W0cDbz3bqq
	for <openbmc@lists.ozlabs.org>; Mon, 18 May 2026 18:08:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 864994440F;
	Mon, 18 May 2026 08:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C412C2BCB7;
	Mon, 18 May 2026 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779091728;
	bh=ZPRq/BlWiuA+e8cnXdKXhIerk1VLGuEQJwIjW2ubJHk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mkwU4nkpwM5b5NmdeHA7w2h5RMMgv2XhHV/TlT0ii83B+5wOBrDaBzkqK3m61+Bfh
	 kPyW1ZngKrN8ooxUscT4RmVem8FOiQhjxiS4mbmFYHtIEUSFGmha21NkfZfgpzgCmg
	 oL2BS4q6xpS7DTn1mNSbfl4t20lVBYzWAEFlRSRbZAeph7pC6icnHj+WK1pDexKlTH
	 wIXCeb7EVAuyp9RkgShKHfTHcCseuva6Hrs37E/SXCmYp2RFdywGRDxnFf8nk0R9OY
	 Ab6QY4j62aWLGI6+jLpQffeB73PlV/dHR0IfTwIr3vGtfCh4Mv+NfdewlxXcfCLgQR
	 Dt7DzEhMA3wmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B812CD4F3C;
	Mon, 18 May 2026 08:08:48 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Mon, 18 May 2026 16:08:24 +0800
Subject: [PATCH linux dev-6.18 1/3] dt-bindings: trivial-devices: Add Delta
 E50SN12051
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-dev-6-18-e50sn12051-driver-v1-1-238e4e08a759@gmail.com>
References: <20260518-dev-6-18-e50sn12051-driver-v1-0-238e4e08a759@gmail.com>
In-Reply-To: <20260518-dev-6-18-e50sn12051-driver-v1-0-238e4e08a759@gmail.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779091725; l=1160;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=RUgFRQQCivFTF+LsByd0V2f57fG71fH4rPqZKs3N56w=;
 b=NDDFTRsahFZuSIwcZYKPQzH6cofM3Ez2toEIPDPRFul/sClESKnIkdGO3eQcYaRyhH2uiZM97
 YB9d3ctuvGbCmRctYq7K95rZVe1cKCNT4SL16AHaaQqAwxfwz2GCfmF
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

Add 600W Non-isolated 1/8th Brick DC/DC Power Modules, E50SN12051.

Signed-off-by: Colin Huang <u8813345@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/r/20260508-add-e50sn12051-v5-1-abebdcc29665@gmail.com
[groeck: Swapped comment and definition]
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 223d12dc02c8..b20a57677224 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -87,6 +87,8 @@ properties:
           - delta,dps650ab
             # Delta Electronics DPS920AB 920W 54V Power Supply
           - delta,dps920ab
+            # 600W Non-isolated 1/8th Brick DC/DC Power Modules
+          - delta,e50sn12051
             # 1/4 Brick DC/DC Regulated Power Module
           - delta,q54sj108a2
             # Devantech SRF02 ultrasonic ranger in I2C mode

-- 
2.34.1



