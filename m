Return-Path: <openbmc+bounces-1954-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D235CD4F56
	for <openbmc@archiver.kernel.org>; Mon, 18 May 2026 23:52:05 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKF2L6Q0Yz3bqQ;
	Tue, 19 May 2026 09:51:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779091731;
	cv=none; b=aClNElPpvH5xvHMONa5uZcba9+9P1JIy2EwoR9PWYFnlN/Wgv3gKdKzQk204fKpTPvvYA8KcHgKUax+h0awg3CsBsX5VU+EO+rtUViM443B0JG/DpmrVvyXJqhiiOr+Vn1Oqj8sOFz8Q3HslQrNZ1fCBjjtUYbFMQPDHUANIXYCjBxXnDSRmUz2ZXR0FhgM1tQPQc13pzxfjVBX1k7hz7w0o2qcWNzNkBw5rN8jWTsUBOCc0i+kRxYz8r4JWMT8XbrjTnjvMt7hfgqF+NfCAj8/tODjg2Bz6DG6hVbnKHODDSXVdALjN344FDcNE03hhv2pynBIIhZ6c2G8FGRIUng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779091731; c=relaxed/relaxed;
	bh=VUy8qr9HOOvKvXQ7qs0c1En4EzJa2EN5MTBnhHSbHss=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bL0BkggqrX2wGRTaThZe3h5Apq/8rpWBoyFAoZrXiIrem5w/g6yAXiyj5jzbMi+e+BJXriQOMAQxmCKrSLhEMnY8H7S9SOuCXUTytCQE36gO1sIGNRmpXQVrFU0iWjiFwGVqWDye5ch9jFTSTNo0lqApXjRS1S5lC9NHnMIsEqa0Am3Eu2ER+Ut+kLaUjlCRmi0V6F2EvKrZ4bo5oRPHO1BW0h3j0G+1B3aMyHo0Yglw4G/3Je2F/HIPHtRGjgoAiRcO4hp2Pg+v6xau8dtIIdPwOt2/CAMzXsOkqpxvTHga2y22GCvu66L6bC2JvzwFT818wlWRFkEMNDjKmvpKbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e6+xN6ff; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e6+xN6ff;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJr6W0Wx8z2yF7
	for <openbmc@lists.ozlabs.org>; Mon, 18 May 2026 18:08:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AA0A43AB9;
	Mon, 18 May 2026 08:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C6DFC2BCC6;
	Mon, 18 May 2026 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779091728;
	bh=K+UP5PEN+H1H0lqNkNcT/iYlDTj5N2JoBMlSwfoLBvE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=e6+xN6ffN1rOEJk56RGNsV2nc4bVshq+xMz7afxSP4F5CSMAwmlCc38OmqTEXZrvi
	 qNcqY/jO/L5fkkODkWili2GeGa/5swDUvkZQCqOJ3MzXxL1vU0ebXNlpqbqbgFsmTR
	 yfeBgOALjECbT2EM3NjWFOQ+ZuxDlJGoh960k19QUSL4MIRg36hy5T/AUTGqRUfOB8
	 rtL0llKlBJEpCTYMtEA5bXBgX+CsOTrfmuLgkgxwXnNTMAkYoxAMKll8wltMHFm0wE
	 icY9AxYucBk9EzOSIay2oZ0KqhVrfs8BowDuSzS1wNejVQBDEdQVYSmPTlRQmYb9S4
	 wUmqlbRD7NrJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B10ACD4F49;
	Mon, 18 May 2026 08:08:48 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Subject: [PATCH linux dev-6.18 0/3] add support for Delta E50SN12051
Date: Mon, 18 May 2026 16:08:23 +0800
Message-Id: <20260518-dev-6-18-e50sn12051-driver-v1-0-238e4e08a759@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAPjICmoC/x2MQQoCMQxFr1KyNtJEOk69iriQNmpAqqRYBoa5u
 2F2/314b4UuptLhElYwGdr10xzoEKC87u0pqNUZOPIUE81YZeCEPiTF3oj9xGo6xPB0ppSFS+Z
 cwANfk4cue/wKb22/Jez2kWa4bdsfTtNnPXwAAAA=
X-Change-ID: 20260518-dev-6-18-e50sn12051-driver-37159e2c929c
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779091725; l=860;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=K+UP5PEN+H1H0lqNkNcT/iYlDTj5N2JoBMlSwfoLBvE=;
 b=/Xa2kgizeagRVudikLBUCJklAX26CX2n31yoEPkSKSytW04GYkvqzYcezW30k0XL0vzAXmvtR
 LREi6l0kKtpC3Z5Id5jl28+gpm14qdQ31r/jREYP5SPRJslw9FGtzzp
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
base-commit: 542ae849596e5471bf4d489d4613924d88385146
change-id: 20260518-dev-6-18-e50sn12051-driver-37159e2c929c

Best regards,
-- 
Colin Huang <u8813345@gmail.com>



