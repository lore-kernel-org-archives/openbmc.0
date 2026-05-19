Return-Path: <openbmc+bounces-1975-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC18CD4F5B
	for <openbmc@archiver.kernel.org>; Tue, 19 May 2026 20:27:29 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKmS501Hrz30GH;
	Wed, 20 May 2026 06:27:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779176775;
	cv=none; b=ej5DHl7vIOAdhfoigXl8PJEftiiDGeVoij5lOtT1PZyTPTbJx/cWz6wAIiR4Xc1ZP6lbPx5pq6y7xGRs7BObyOP+LTJyxfM1MKYxvrggMNAq8eTUhspd1ex7d6fcslJXIqLlRPMHKDxLt7rYLkcOEsRZrKrWEK6/CdX55J4hV4rset2F869PSgWM3xk/idIGHg/VkrqHzI0iO4OoYtn+SbQbc5s4jz0i9Uc147pkue8+Igfd/aZTerYmBKlSMmdvqGj2UJ8yHHlrKT2Pmy0Ge7frfE3rjShd1AdqF/i8EZEDepjF4ipgbG9rQR/OPO8ZIMqh499f5mXV3pq0WlLXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779176775; c=relaxed/relaxed;
	bh=Cu4/ksW4Qm0AsBSciyOPixePYA9py/TqodoKRQsXFUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XnDo/QlpdC3v8LGxzxZwI9uhotjgGXqBojuSard3nss6tDA37rnN0BkUyaqKzEXz5RY1/oaL2detx8wVIQyVJsMAFzbDgnEABAfii3R75gZVh3qr/Zv/YwpOPrMLBnNopEdsY/7XC8Z9RRyvnP98ImMQHmiRXMifKhaDf9ame/bETagjpzdo2jyP1Qk2Bs6TiK5Z4dugEg6U4968k33BswNpQslb/sEK4mmKk2avOmmFM2It55Jg4EzG66HJ+cJSoWlLrYbmc5j18S7kx8YkI3FqE2uDDI4nNTf855ZBRB6B351wGDtvvFhhU8c6u1BPCB7MbS+FN24ptB/7pQLvyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u0Gxkc+1; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u0Gxkc+1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gKRYy2SFtz2xSG
	for <openbmc@lists.ozlabs.org>; Tue, 19 May 2026 17:46:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB21743C99;
	Tue, 19 May 2026 07:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD7F7C2BCC9;
	Tue, 19 May 2026 07:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176771;
	bh=IINGug1g54nluUl/lXWxmO1M9m/CbLBfiBNZDkKom7s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u0Gxkc+1grehMYkB4P9zMzfH7w02Zi1OdFSObNA5b73RtLba2z4FUzec5i0K/IWbY
	 Av5GD4SY5xNQhny5IVP1ib0RhuS2TQKaZxVI5BJ2o66Uuzh0+VfpS/CWTozmpXMI6j
	 FvqBdccClWTx9qcEvc2BRNH13po0elIwAv+7XERY9Qak8PZ6WTI6n7eJ3RRwxl9RDM
	 u4xREFBJDskJWGSwQYkkzJd8P1K0Cwimx9vsFNKXa7UfmBLmb7/vGNn30Wv7xuxxqz
	 kiGoXPNKXeRYTQUjK91i5VK//PIuhe6lUu7KCWY49PVkb9wMYtLJtOcVE7ZKTeOpx5
	 xbH6LhV6oAdHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A87CD4851;
	Tue, 19 May 2026 07:46:11 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 19 May 2026 15:45:57 +0800
Subject: [PATCH linux dev-6.18 1/2] dt-bindings: trivial-devices: Add Delta
 Q54SN120A1 and Q54SW120A7
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
Message-Id: <20260519-dev-6-18-add-delta-q54sn120a1-q54sw120a7-v1-1-9b5eb2c0752e@gmail.com>
References: <20260519-dev-6-18-add-delta-q54sn120a1-q54sw120a7-v1-0-9b5eb2c0752e@gmail.com>
In-Reply-To: <20260519-dev-6-18-add-delta-q54sn120a1-q54sw120a7-v1-0-9b5eb2c0752e@gmail.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779176769; l=1256;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=K+IyVbY0YDaHf1Nno10Bh+6JniXhDUqanHMSQJiaYRo=;
 b=vc1fmn8JejcUhHd0AQo8cBYRp5H05esZop/A0ZMMMFVfm5dq3Qc/9ESB2ZNKRVbeiBeYHmW5X
 1ZwvKyL5h9lDFfVre2fKPilJYqDjWXf9VYhTjPHrqJRshwRzovkkwqw
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

Add two additional Delta 1/4-brick DC/DC power modules,
Q54SN120A1 and Q54SW120A7, to the trivial-devices list.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Colin Huang <u8813345@gmail.com>
Link: https://lore.kernel.org/r/20260316-add-q54sn120a1-q54q54sw120a7-v2-1-60e6182cc4a7@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index b20a57677224..dd5077ab3a20 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -91,6 +91,10 @@ properties:
           - delta,e50sn12051
             # 1/4 Brick DC/DC Regulated Power Module
           - delta,q54sj108a2
+            # 1300W 1/4 Brick DC/DC Regulated Power Module
+          - delta,q54sn120a1
+            # 2000W 1/4 Brick DC/DC Regulated Power Module
+          - delta,q54sw120a7
             # Devantech SRF02 ultrasonic ranger in I2C mode
           - devantech,srf02
             # Devantech SRF08 ultrasonic ranger

-- 
2.34.1



