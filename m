Return-Path: <openbmc+bounces-2614-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D10C982D0
	for <openbmc@archiver.kernel.org>; Thu, 17 Sep 2026 23:58:50 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hmCPW1PRVz30Nl;
	Fri, 18 Sep 2026 09:58:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789638576;
	cv=none; b=fwc8YVN80TyGbbxiErL9WMKKE8QCyGbX1I/aMYu/ZTWSKKybzco0zN+w6vokTTYm1EdIJsj5jh5Pni1eGdK/5trLQL+FxdcuJFKVo71YzgJvRXsI/iq5lFaTo4Ebsj1obJP8snLE8AR4WQmMup8CaJ4baEOFDImYA4iGOcsK6hkmCawTDXBYA+riSqcWygAuC9zarciOJoOuEtNm+7JEgDkXeP3oD0OLhzXh3usfHNo0AumClHxyOalTYRtWjfmwchlV/zA3bFw5KFcPflr1Z7h1oO+ZbqYpRYGDLyGwthV6RqXBJV6Y0+pZhXpmRvZ8to+L3LPnoWYk2sW7EAfxxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789638576; c=relaxed/relaxed;
	bh=l19nX7QYh3R8DGhpDpOy1JhWqjB31ZEdAsmk+utdtZw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JMFvUrJSPmViwIYaszPBFrOd2emF4bYKAV4BlHL5Eny1fPPF9MlOncga/SKxcGt/Ywnml6GQcqfvhx4iuPzV7ef0AUdjNsG5hiV3cws6giLaAbcyoXil8vDxDpzvLSWRXX9ECiEekP9dscWb4C3L9onOCnE/LAQhoOeXpdF9VQsWO1iLIwMVezrkKpFHDfWWHQgN8UB7cFqdt/n2zpztCLgZIutykRxle652FxT+BdP59tvhm8ynKOeEkKnrkxLtyOZRiBziveAFrFedQgVOKxN0x/GXSuYk15/IxXZEqyhoFhudwN1h9r6cEFHgT1/wdgTN47gHFB3cwroy4Zs31w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J0LaEjYY; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+andy.chung.amd.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J0LaEjYY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+andy.chung.amd.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hlrZQ6PPrz2y7Y
	for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2026 19:49:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98769416DA;
	Thu, 17 Sep 2026 09:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 794C2C2BCB3;
	Thu, 17 Sep 2026 09:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789638572;
	bh=WvLlG+9TFFpIHe3V0qHRidaA1MY9dLqUJ8V5UcdplsQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=J0LaEjYY3lLGoU5QQLFIx4nivhlkVHzHnSHEk1Ggo1slnkNknYF6u6v0bFClUJZT+
	 9IAargYzyqBHcLiWfLV4RcMdWOEh2CN4tL0NCBgpRm/KHn2OfxAyrKZQxH4v17YUpD
	 C+d9LKSB5PaGmMQh0cCdFGHf0NFNTTtZFLus0Imp8vq+hNtM+dcoj1wDmz7BbrsCQW
	 DFHN8SFJF1WI1g+waXVMdX1KBvoY366CdUQFEbKABxxCdruwHKJ3PAJ/WJ8kQTTqrC
	 XzYH1iexUq9RY/bguMyNLmmwDy9+aJOCUWbkckWqK3ux47c9+T/PJlS/jsQQ404jnR
	 85ge+ARabsL8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513A9C982D2;
	Thu, 17 Sep 2026 09:49:32 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Subject: [PATCH linux dev-6.18 v2 0/4] hwmon: (kb9002) backport Kandou
 KB9002 retimer support
Date: Thu, 17 Sep 2026 17:49:20 +0800
Message-Id: <20260917-kb9002-backport-v2-0-71d46021f051@amd.com>
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
X-B4-Tracking: v=1; b=H4sIAKC3q2oC/3WOyw6CMBREf4XctSW95VFx5X8YFoVepCKUtNBgC
 P8u4NrlZHLOzAqenCEPt2gFR8F4Y4c9iEsEdauGJzGj9wyCi5zLhLOuKjgXrFJ1N1o3sYQnBZJ
 CiVrCTo2OGrOcxge8zTAvkabA8hivUP56P1cvqqdDexCt8ZN1n/NCwJP7uxaQcZZik0pBmRCY3
 VWv49r2UG7b9gXdx51gzgAAAA==
X-Change-ID: 20260730-kb9002-backport-30391ea171d7
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, 
 tan.siewert@9elements.com
Cc: joel@jms.id.au
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789638570; l=1522;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=WvLlG+9TFFpIHe3V0qHRidaA1MY9dLqUJ8V5UcdplsQ=;
 b=oOwSzvyaOyoXVgrcNYOq8XDEf2Krx+JPiSS/cX4SaZF+1IoT4pmhQb2RSoGl04RmLXrXHLWS3
 1skF9YDu4OFBLKy7U74PPIcNnq9t5zEqMKCy635fI/FxAKISdY/uUwy
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com

The upstream series is in mainline as of v7.3-rc1.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
Changes in v2:
- Redo the backport with "git cherry-pick -x -s" so every commit carries the
  upstream cherry-pick reference and a sign-off, as required by
  openbmc/docs kernel-development.md.
- Record in patch 3/4 that guard(hwmon_lock) was converted to the
  hwmon_lock()/hwmon_unlock() pair, which is the only form dev-6.18 has.
  The code itself is unchanged from v1.
- Link to v1: https://patch.msgid.link/20260730-kb9002-backport-v1-0-41f472e52215@amd.com

---
Andy Chung (4):
      dt-bindings: Add vendor prefix for Kandou
      dt-bindings: trivial-devices: Add Kandou KB9002
      hwmon: (kb9002) Add driver for Kandou KB9002 retimer
      hwmon: (kb9002) Add documentation

 .../devicetree/bindings/trivial-devices.yaml       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/kb9002.rst                     |  64 +++
 MAINTAINERS                                        |   7 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/kb9002.c                             | 459 +++++++++++++++++++++
 8 files changed, 547 insertions(+)
---
base-commit: c2b9fc3f7091157518a3ac2282a0a8bc797c227a
change-id: 20260730-kb9002-backport-30391ea171d7

Best regards,
--  
Andy Chung <Andy.Chung@amd.com>



