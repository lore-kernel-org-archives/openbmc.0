Return-Path: <openbmc+bounces-2335-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6C1C55165
	for <openbmc@archiver.kernel.org>; Thu, 30 Jul 2026 23:59:51 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hB5lk1SQsz2ygg;
	Fri, 31 Jul 2026 09:59:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785402511;
	cv=none; b=Gg/QLI6+ug7+TlOS5HxVcTa66qRgbbeZa/rjylFhpO2CtrP1UwfxpCJdhupdBHO2LkZ1nu3HwwnLDxP+K5XARrLIjuKiuOprw7MxRFCGv6Cy2DHYEBZXiKJXHWOEBhKvZwUFJoh/UYOTKUKGCDWpejpNDbZ+bLamSWW4NYrCminA8zZ0QkGVZNIupHo7d9jA8wugfRpxR1bhHoFlgAang0i7I82h12KNbgMx+4Tk7+RtPhF8p0BwtWQrsEX+PxR130CvIHUWbIPjxcX+cy9yTdE7xAUzUCoN+RayzuFwEo/6d8o1dU5NvrcTilkUQauSI5olSL8b7UYSoFBon4Tnjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785402511; c=relaxed/relaxed;
	bh=7BEX+i1jwbDjp0yQfhE7D9I3GKlc5+TT/mNxvEp+rL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ILOrs4/7TjYcquOD5FhySdIAgTvYs5S+qOo5zn+gPHprcucbeCvyqMghs4L50NKqPAqM689yC6cS4asoniSGARD7UbaF+D+/hcBnf0SowjafojYiadStSp3dcpJhTD5qzOLKN9tOD8rAjIJ4ntOtHPug+C/izYm2XZclisI/I3ATyVbnS5xA/4K59MwkNWAQWd23EWMjOtoKWU5kU5Mb+HVT8LWCFYF/xe8LYc/DYS1JU0p64JXui0cl9cLHlUezLpaOqh89+uuLNiTzGWZuCUc5aUFzqmlhRTKvDlLIyit+58tP70lpZK5/HPITYfV8bGOOoCUiyA3HbVxQ7xcKBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q/ihtmVm; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+andy.chung.amd.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q/ihtmVm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+andy.chung.amd.com@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h9jzf2KXdz2yjs
	for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2026 19:08:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 029AE600B1;
	Thu, 30 Jul 2026 09:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC689C2BCB3;
	Thu, 30 Jul 2026 09:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785402506;
	bh=5kQPTryfWHP134MZpfA0u0aU/jQHtrv6X18btCqvLDg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q/ihtmVmkUuK4903hToKoTP99jtAqE1GgQGaQAVD/bED/lKvLxOoHRAingdX+oval
	 Jfzc5ZVNQn9O9xHlUsvOECN4GN0DgoAfFI+4ut272B7hHVreuEQy+nEx0PSTqHIXvc
	 WdueLH0xuPoT0HwL3qh6wnb2RLwqpJkiquk06IfFqwro4atdA5ha+j7lWRVjUEeV1K
	 Q3TNgSIJ9Brp8A3JAxb7Nhfb4Sh5FJj6mcIHCFVKBgalUnQ23Egz6qAoStJ4FAoj0c
	 4Wi6+XkWY1tQXqAGQKKxdRkxjVqTBBgdkSxtwBDsVZcFasa94vmIkUwhVlZaZsmhU2
	 N6GaeZhjIpocA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEC5C54FDF;
	Thu, 30 Jul 2026 09:08:26 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Thu, 30 Jul 2026 17:07:56 +0800
Subject: [PATCH linux dev-6.18 1/4] dt-bindings: Add vendor prefix for
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
Message-Id: <20260730-kb9002-backport-v1-1-41f472e52215@amd.com>
References: <20260730-kb9002-backport-v1-0-41f472e52215@amd.com>
In-Reply-To: <20260730-kb9002-backport-v1-0-41f472e52215@amd.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785402478; l=955;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=Vip+y4zyOOeo3fWhSWkyV8pwofoZryEMIXrs0tGBVZg=;
 b=x4Gtydnffs9wctOQ8ycmZzPolmLhKwVH0hvPH04jA1UuM8nSyvMkd6KihqevVToFf04wCwHyQ
 uAzPcybyHwLAs0YWz5EqdllQ44aPeQD7DaDv4FkYrSxM5UtfLHrLOOv
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



