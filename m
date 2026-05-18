Return-Path: <openbmc+bounces-1953-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE00CD4F56
	for <openbmc@archiver.kernel.org>; Mon, 18 May 2026 23:51:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKF2H6sfnz2yRC;
	Tue, 19 May 2026 09:51:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779091832;
	cv=none; b=L3Dn4RxMXYbCAjmeV7jgFReEWjBcXhbdykXZjB35Qs7k+OlMypZk1omukxdX4i6kAESeizbRF+K9O0E+T/s7n74bnKmqvwQRKLhTDWHN5yhntnGHm/5nAQWedS9yBt+55DxJi8ZAOhNhuko7WCNOVI6X7A6WInvZB3eisP+J05Y5A0cHgaEEdGyB2qpnyw7DcO2X8HAsknG9n3E4pXoWmgjk9y84tpLtIHkKkbAEBxGjeJFRiZuwX4twCcDwb47vsKMKslHdhRsxQHg4qQVJU6UTcizlOpnID5nkGgiTzjSc9UUon3RpFYdGsBXt9WpoxEeUY/KDVlSLCZchb2MyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779091832; c=relaxed/relaxed;
	bh=bd5h5fScqYpseuVzfbFvAm1hR9E1kG203Z/+Hb0rlBQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cHxE9Ma2wiiFm+DL0ZnT/eMJhtsR4wTEHYktlxHWeh4PhD9KCZg+Hs6faCUkamK2zmJW6JRbrAB0jJ3HtBGDgCocbkem4pDhmbzfddRH54fyjmAG5k6xxkDaiB+6JpCTYcCd0vhBsZ3kSnY0J67VaeKGWi1OeS79AKkSKhLzFw9Qe1QId7S0h3DqHv8rqRlaIUh0PcK9Ks23CsZNK56w1mH8Yiy5G6ciZDspxksvdQTViSS1kyBOL6KB0NbVkL9aofA6yXJzXDJt181y4mThgtrV5XEYbjj0oG/+cYCGlmrwI7cMFRzrclFQUADBS1EH4TLpg1EuQTm5fS5pPIJFEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O+lcE0No; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O+lcE0No;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJr8S08Pgz3bqq
	for <openbmc@lists.ozlabs.org>; Mon, 18 May 2026 18:10:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5942640142;
	Mon, 18 May 2026 08:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3AD98C2BCC6;
	Mon, 18 May 2026 08:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779091830;
	bh=cPO+2Z78cAr68BCxS8UwzG/BZ4oa8eNTgVIcbGKSBQc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=O+lcE0NoYImxMrDDs76jEN/nWYUDURvwR97FquI7SL8K6ZHPGYmJR5ld+BnC044UT
	 JP+sGw6mOSSBlJgey7JNljmYyFnxarTVtJdBtvP6tLHYwtIXHOIj5nIWdUzwAbD+c9
	 TM15sHk7LQq6fGUDu+Ip8kc4/jLloZCx+tXWGtUbr7wZgTwHgkvmkK8yG+d7BkQ15O
	 KD42NRmZ87uYeuayAo9ybrgvxndFicj96M9U/E2otDZBlrOLTu8gvcW3sVlUXpmbqy
	 y1Q84Gebk1m0yFllOnyHzBNZpA7FWaTd7HuLPKhSTFT6SvaE2WaDQ7CwqNnA1O9Rmy
	 UfSJZPlsVrM4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFEBCD4F52;
	Mon, 18 May 2026 08:10:30 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Subject: [PATCH linux dev-6.6 0/3] add support for Delta E50SN12051
Date: Mon, 18 May 2026 16:10:16 +0800
Message-Id: <20260518-dev-6-6-e50sn12051-driver-v1-0-8025fb61706e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAGnJCmoC/x2MwQqDMBBEfyXsuSlJwDT0V6QHSUZdKGnZYBDEf
 3eROb0Z3hzUIIxGb3OQoHPjX1XwD0N5neoCy0WZggvRDT7Zgm6jBoNr1QftbBHuEF1eGTmF5KZ
 E6v8FM+/390hfrttubvkZ6XOeF1uuKOR6AAAA
X-Change-ID: 20260518-dev-6-6-e50sn12051-driver-de7cec8280a8
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779091827; l=859;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=cPO+2Z78cAr68BCxS8UwzG/BZ4oa8eNTgVIcbGKSBQc=;
 b=SatA+iDWZIJssVMDEvg1QfFWXoawK5C9Ugje34VIENe19p/iZr/sXlfAVGLmaCBl30v1yauv1
 Wl+cPO8Ou6RBBNPKc20XfcXPUntkfvtecCgeg5imtqpm4yLZ4e3uMoz
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Colin Huang (3):
      dt-bindings: trivial-devices: Add Delta E50SN12051
      Documentation/hwmon: add Delta E50SN12051 documentation
      hwmon: (pmbus) add support for Delta E50SN12051

 .../devicetree/bindings/trivial-devices.yaml       |  2 +
 Documentation/hwmon/e50sn12051.rst                 | 81 ++++++++++++++++++++++
 Documentation/hwmon/index.rst                      |  1 +
 drivers/hwmon/pmbus/Kconfig                        |  9 +++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/e50sn12051.c                   | 52 ++++++++++++++
 6 files changed, 146 insertions(+)
---
base-commit: e11fa6b1ff6c27c808d17e479bd7d5582e772062
change-id: 20260518-dev-6-6-e50sn12051-driver-de7cec8280a8

Best regards,
-- 
Colin Huang <u8813345@gmail.com>



