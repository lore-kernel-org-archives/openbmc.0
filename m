Return-Path: <openbmc+bounces-2340-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C110BC55167
	for <openbmc@archiver.kernel.org>; Fri, 31 Jul 2026 00:02:39 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hB5p85lrVz2ynH;
	Fri, 31 Jul 2026 10:01:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785402510;
	cv=none; b=YO+JUkQ51m5ryEZApYzZCcD6Lp6aSNhaMpgFa/RBtazMy3EwmcrbGWBZb6RWbfFSZAFJkqRoWnJRySqSSKkbXiHOYVWpBdSkKsJ1PHm4vIksBT2/aFpTh+x+AzpoYem1Ahne0a6fif3QSPUTbhtw1lkWdAo+FItN28Ccl0mG+85hh24RPq3oxzM6v2apxnzayj1fC/rwM2HTbrpWps62sJvlKKpHvvk8bHLfTYgR+Fvd35jkw2yQ3GOcwFbT1k+Pxfd+OqXg0VH1wW4+iyrY04gsCeqVP9ZmPPuEVO4+zhmR/Z9PqCUU19WZeFkpkmiq8cBGCj8AkrC79tWAf5sgYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785402510; c=relaxed/relaxed;
	bh=LU+XY2SUA+3nOf6GmtC8D/q5xWgJVOIGzsmNh4lhJqw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dyw5wuZ4VBPePIwj+JR5o9O5iivDCwyXPuUFYOYeW6Kl2HFvnLiBuHynr77F7xocQlnKVBwW5/PPtPQES4DFblT9G8z1EcF3vLrbyo7+1qtaVHnTyVE+G0rtX/BuXUrUykRjFBik3vtL6l5LQUB657VhTzPEs6nonloweOjnsFzgfnLMruf/Uveb6eUo6lmF6YW3iXmu4v+org03kOTxd1Xdr0YjQScpr4S0hNqIdRFmlEQfjavxTDV6px20nCz5AooxwyVWYBpbtalT8AJStOqX03f4hwb6G+jQif/4oL4CeCcLuYlw6thzOMzPcWnkQAw4kA8O/ewPkGmgiiE1Fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D7Pq3pzF; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+andy.chung.amd.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D7Pq3pzF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+andy.chung.amd.com@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h9jzf0w2Jz2yjR
	for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2026 19:08:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ECB71600B0;
	Thu, 30 Jul 2026 09:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2234C19425;
	Thu, 30 Jul 2026 09:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785402506;
	bh=AETcoSpMJMkjMqd07nfckU1ICPSkADFXdUOJKb6ueBg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=D7Pq3pzFN+vN/SscTvJmHLe2xFI9x9Cv7fj+k6R4IxPP4u+T/zoAetz20OCExEAWj
	 6XVj9T/OI+gXSjmQFLh4wHW1qeBkCsnRtpCK/dhYyZAD0RyN8VqgEQDMmGRDsGl5SR
	 yMbtKtQMnwNkzr1XkZf5BKu7nCDVgjWxhKJlvnS+38xvfJUL38aQMdMmovDd7U3siq
	 8+xKlcUF+RR8puk3qDXh4IY1Y246/tpYCpaYIKTNriddx8q/kvf3psIl6UU3h3/c62
	 FEZEt24y0JQZLytAbgaRnCBZ8xMjI8hHvbTCEwY+2kUivTtKxclUQYRioTfa9Eo4rs
	 0Fswu0nejjTGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FC8C531D0;
	Thu, 30 Jul 2026 09:08:26 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Subject: [PATCH linux dev-6.18 0/4] hwmon: (kb9002) backport Kandou KB9002
 retimer support
Date: Thu, 30 Jul 2026 17:07:55 +0800
Message-Id: <20260730-kb9002-backport-v1-0-41f472e52215@amd.com>
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
X-B4-Tracking: v=1; b=H4sIAGsUa2oC/yWMywqDMBAAfyXsuSmbBEztrxQPeax2a4mSqAjiv
 zdtj8Mwc0ChzFTgLg7ItHHhKVVQFwHh6dJAkmNl0KgbtAbl6FtELb0L4zzlRRo0rSKnrIoWajV
 n6nn/HR/w5rTuItImm6u6Qff3ZfUvCst3C+f5AbHBdHeDAAAA
X-Change-ID: 20260730-kb9002-backport-30391ea171d7
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785402478; l=1054;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=AETcoSpMJMkjMqd07nfckU1ICPSkADFXdUOJKb6ueBg=;
 b=RCEkeKZUxKOlK2MQm/FOBnwIDwpTBfwiJJpadeUyRqZ0qSZks9ejjcslyJuYv74Pjix6sM8L2
 bwB5fqwm25IClK4Am46qTAVY5SwI+nJ71aTcvljhMPqqnwSqLPSlzCK
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com

The upstream series was applied to hwmon-next on 2026-07-27.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
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



