Return-Path: <openbmc+bounces-2612-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609DFC982D0
	for <openbmc@archiver.kernel.org>; Thu, 17 Sep 2026 23:58:24 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hmCPK6qH8z2ynZ;
	Fri, 18 Sep 2026 09:57:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789638576;
	cv=none; b=XwmqEZZSS++FehGt5J+dSW644gsYMNLKKgfAaipsRk2zgWAijvZQEvzBqU+ZAld6M3Yfu6ZACPaYMlwD2SQAOq9YyOE9tcOdxjerafp8ZQwtxRKS0NV6eKLzlu6ADNyKhmRLIjxbqGU9raGSq7F5fAl44WnLR+cLM+ltKVtCQKvVQQZvooWAHWoeu0TM7iK2HuZZW8JZU2O+TLBR7Un0k0WEt++Lzvg4nYyL0mt1RRNVCMtr5oMm7XTKZusUxteJJtetGfgp4NFAiMI1Fx96zfmLXdu0tdPAI6wqt9A9HpAmS4cqOE1c2JqiHcpDmS76zeko9chTHDXoS/rf4F/fig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789638576; c=relaxed/relaxed;
	bh=I/xxoW5IoIb1eBXLwP6BjbZ1u9vDQWF6hX0eLP6TOzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N2lZVUG/6gZ+hZ/NzT8mRpkgOmWCsnf9EhWzMqDB+7Sl6Tke6Z7+3UVxTzHghc2N28dmZ+rxCvZfDAYE9AMOlCOa5qHhYOW4z1fFBwqspoaz28TiL9IN/9aqE2+eMz9kfsd4loFz2w59Y1Z7iJsK9IKrxhmRb8PsQKMtOH1Xb7EqmFG0RMUG1NyMGIO4NnCr7eUNOw6l0fUiq/jbuIUIxKHyteYiLe1v0+bJ8keW8qhihdkrgFBzPURkfCwT8+RwDL/ipzrx9WPM6eeWgl5LcNbcb3YJ5G4ayQiYG1fbFkEGttaXyZKwyC6vO1HUAKH8U1w/HQC28lSW9RGzCpbHGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WIIZ35Wk; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+andy.chung.amd.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WIIZ35Wk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+andy.chung.amd.com@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hlrZR26nzz2yD3
	for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2026 19:49:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E62BE600D4;
	Thu, 17 Sep 2026 09:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AC12C2BCB9;
	Thu, 17 Sep 2026 09:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789638572;
	bh=f5rk4dLM5dtAPNtTBvWkNdxrFrwAMIPa6eDI93LEpRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WIIZ35WkhY8T4DrlHORPieatYZA0rL1TDbIhYQEZA+ZsedyH+Rs75Tdr1/+nYbvnC
	 HcEWKnNK1D0UefMr0aSSOhnaU+l0o7lP7Uit1AGXUr7lEXmWIZY/dJA2Ge6JYyy3fK
	 oc8dVpWWnJ0GPLA7dDXh08XST4EVi6bGCB01o9ETvPX3LyaKs762RZE0E7XJ1JQsYt
	 0f4dbnuZhgjYC1APcLoR+/mLPpTUlvHIrFZJFb70hEBh8uKQ5kIdM4RDfPdZTKLnI1
	 I2rmnjVNV/sKJh/aSUQ8zYv/BKKWY5PIN1H3M27RGEgiB7qMo5oCh85ecWfdWGaN/6
	 jl4qScyezmIwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC33C88E72;
	Thu, 17 Sep 2026 09:49:32 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Thu, 17 Sep 2026 17:49:22 +0800
Subject: [PATCH linux dev-6.18 v2 2/4] dt-bindings: trivial-devices: Add
 Kandou KB9002
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
Message-Id: <20260917-kb9002-backport-v2-2-71d46021f051@amd.com>
References: <20260917-kb9002-backport-v2-0-71d46021f051@amd.com>
In-Reply-To: <20260917-kb9002-backport-v2-0-71d46021f051@amd.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, 
 tan.siewert@9elements.com
Cc: joel@jms.id.au
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789638570; l=1379;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=5mwrbcfnWsAfbYe3ByQPrSR2y9UiG5SCnrvvrZ3Sw3Y=;
 b=ccO/IApfr1plxiYi0cVdGNRjzNr9/PFlrxsDv/DznJy9myi6FCE+pIWrgyhlQIKF+6pauQJtn
 mSOriw/s6cAAVmOnqeRuwbnC4rKcLTdls+/MzCgep4UnzsuvptrgPqD
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com

From: Andy Chung <Andy.Chung@amd.com>

The Kandou KB9002 is an 8-lane PCIe 5.0 retimer exposing an SMBus target
that reports an aggregated die temperature. It needs no device-specific
device tree properties beyond its address, so add it to trivial-devices.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260724-kb9002-upstream-v5-2-9523c3ffe83a@amd.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 495e5dead2cce443c43f55c09d5f5e42392d3dbc)
Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index dd5077ab3a20..677c0088ddad 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -177,6 +177,8 @@ properties:
           - isil,isl69260
             # JEDEC JESD300 (SPD5118) Hub and Serial Presence Detect
           - jedec,spd5118
+            # Kandou KB9002 PCIe 5.0 retimer
+          - kandou,kb9002
             # Linear Technology LTC2488
           - lineartechnology,ltc2488
             # 5 Bit Programmable, Pulse-Width Modulator

-- 
2.34.1



