Return-Path: <openbmc+bounces-2613-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA63C88E72
	for <openbmc@archiver.kernel.org>; Thu, 17 Sep 2026 23:58:37 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hmCPQ2KfQz2yqs;
	Fri, 18 Sep 2026 09:58:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789638576;
	cv=none; b=ZHOBy/LMGMc0C6OAdFCPAUqb1qbsjNeJJV6odkyFOjmSsN4S2ii8VK12LekbWWkCPVXvS062Z54vsdqm8L7WJKj45FdxUO7MdnGNySgfzff3Id3CVzpcVZ3s5ACy6ZzvYiIU7NclXf5Z2anAa/+iJQOsv3GY+0hX9sikUtKNAXUOyaCo9fuCui02ZkBpHLXNmTbDWXDMvXyq5mj6XbVeS5+td+enmx1fwNQ54fE7reArQ8+HEQClM1SZiPF/jO5082fb6dM1CnJdyuqsUIrcXvgYAROnPhJYNqexsZoXGjGlxppuwVEsMZRl6Z8UisbVNaGVU9wCmo8SgmTYylUTTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789638576; c=relaxed/relaxed;
	bh=X57yM0Y83O16ms1K29yo0aCiA07XEoUwsOXmkVi08xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e2mUW3WPH6qMgvCJLu0c74f13ddHDwdk45ZZvNksJQjN840Kl4NVALA4b928l6ZOuL94Y3dM8NgaIfHpty+T+XvkR1ijyR3qcP0U/XqaGt+61EzPTNIdrGCBSbACAadoFD2Qa1HRmYjBiZYmTH8P9r0NE7pv1L5gxvOWrUbGSDhRq2/wvyHw1v4nQsPYVJOTDMIHKnaY5RI1kyfoilKn41KWSntOXBrTsquTi0HIrVsTNJGqJxopxFzME8A/D2EP4xpzOidLoxvQaM3dsWHbFrS1TUem/fGKwKUyyfndIBTnEcRP5R4+eMV+pbAEMZkvAHbv8oMJWKX/e/VgNsmoUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bKUzzhM8; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+andy.chung.amd.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bKUzzhM8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+andy.chung.amd.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hlrZQ6wSDz2yCr
	for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2026 19:49:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A908A42A26;
	Thu, 17 Sep 2026 09:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AFC4C2BCF7;
	Thu, 17 Sep 2026 09:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789638572;
	bh=s3rbmOisOUrYkBZFbshit4QC02mgeHHXKWgVqrLiDsg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bKUzzhM8KRq9GsT8ENQKP/OjwJlEBIoWxv+BlVCyJ5WlFdNOuLvkYB643mVjarfP/
	 275gayP5gLs/2OTtm2fPl8uqi1ge1hpE+eEDyvwERbQqkcoF0ApRd+q3+g/rn0c0D4
	 X0WKkA/xJzeKxKl+AuB7bTqwD4qK0+pbIcK6kAxH9YSI8UvZ6d5lIstW9GSxzWlUi5
	 I7aX4INczisFq5Zi0+xOPc4EomTg+x9l/HvFg5dF+a7tRTKti2k2RThBquE9FzxiTj
	 c6wdotevxhH5vLmmT/GglAkS+2aldVGYrxZ2OyRpbDFYfq/s1cUhoe5UWME1ITLS/a
	 qrEEBiDgLjXAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69413C982D0;
	Thu, 17 Sep 2026 09:49:32 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Thu, 17 Sep 2026 17:49:21 +0800
Subject: [PATCH linux dev-6.18 v2 1/4] dt-bindings: Add vendor prefix for
 Kandou
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
Message-Id: <20260917-kb9002-backport-v2-1-71d46021f051@amd.com>
References: <20260917-kb9002-backport-v2-0-71d46021f051@amd.com>
In-Reply-To: <20260917-kb9002-backport-v2-0-71d46021f051@amd.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, 
 tan.siewert@9elements.com
Cc: joel@jms.id.au
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789638570; l=1073;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=qUQrv9Vi48+dBm8YOvp+wO0b7eEAtNZSoMhDKTzaVWQ=;
 b=G3DYEULriRNF63QKB+Zrp1vUKPCXBfzmNCYSQ03cPKK3gehH81yh1QpAMvz3zcCpiSR2I2o5j
 sBodIz1fgtRDw1Jq8gMUdLasyLZtX2k20WJNkj0PyHR2L8YlwgEhkGQ
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com

From: Andy Chung <Andy.Chung@amd.com>

Kandou AI is the vendor of the KB9002 PCIe retimer.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260724-kb9002-upstream-v5-1-9523c3ffe83a@amd.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 1d687d863c43ca60564136b34cbf4632f89b8aeb)
Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a9cf85fd6fbe..4e1fa0104f5d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -839,6 +839,8 @@ patternProperties:
     description: JTY
   "^kam,.*":
     description: Kamstrup A/S
+  "^kandou,.*":
+    description: Kandou AI
   "^karo,.*":
     description: Ka-Ro electronics GmbH
   "^keithkoep,.*":

-- 
2.34.1



