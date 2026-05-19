Return-Path: <openbmc+bounces-1976-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01AECD4F54
	for <openbmc@archiver.kernel.org>; Tue, 19 May 2026 20:27:42 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKmSC33F4z3br3;
	Wed, 20 May 2026 06:27:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779176775;
	cv=none; b=CvFhbcq9lvTINOvmR0x2tOfmi/TfGWXVAlXxETTG/9ipyT1iTNDg5yBHMpKgVU2YDZHfdpM7qqqo9wqHHBv9JA68414oU3Bbps6H6ShjZHu9LKCrkrDqdYQfLmSWZ8CQAFcodufzKEDueqt5k33xPctItTPxtqBADtiBvD/ihf3IodkTOkq1MH0wdmQ5EPXafp+kxzHpltTzhsR2uCrVKyN9XlgwMEljFnwZH/hNfc0/p43PULRf2cZ3+dlkdbGpxC/J+0rjt5/fyvoRW7WFI2PYgrmA86Tj1x9BOzKjiFti7KEmbr7VPUYZQwgNkftqBLjjACWA+uSF42zX9sVvXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779176775; c=relaxed/relaxed;
	bh=7wSsGzWM8XoxkMxHwzQCuh6kJA+PuemQJ8KHJRG/GHc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ag7ySYhs24jZ9Cu4oihHw7+aXCz+xQ0hj0eQc2s34BOhGXvxdDWCXuYo9mI12QPgKRLzLSv+echtiPRS+KqUfP3/dqEtbfS9jxtMReQFMjAUnQ3CJiko6546sTuf52Yxbj6E4b4JLzvCIJGE15CL28DkZfi1QBvAyPVxEInjzHPqdVMNBKchD5AWcz5NXpTI+VZIvQE45JgpQIr9hiYa9rcVX8rTDx7X1+Tzlp1Yv068d10lBkVye+3E+2MAFYIcxnfUtXggftUvlTBSfgV+gsHMmO903s+wweTCWgLiY0mn5lRF3xvL3e7l59VuuYWR2Y8H0YNsQZKDxW/n4ZNzLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NM5CRN+6; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NM5CRN+6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gKRYy3wxkz2xwH
	for <openbmc@lists.ozlabs.org>; Tue, 19 May 2026 17:46:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB2F6601FD;
	Tue, 19 May 2026 07:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A07F8C2BCB3;
	Tue, 19 May 2026 07:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176771;
	bh=XMOB0cFD40jSUilaf/nyMrWOXkpV4oyN3ij3q2lnZRo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NM5CRN+6VkVJtpkDPg0LgVL7mqFVmU4dDzpnASZHGb0kMQo0nlNij3lwkJaxYD8Uf
	 PxXkRGSMJnVGRJby7sI09+yN3LUWFQ7jK+2PuDqGL9Y6egLlMdZzrd1KZ3rL57pbuh
	 nhUi0r85azgFznQMmFdDExl5+k2t7GZorOMcIzEATgtuOID/H6rYCCEVjKwkqjGKhT
	 fenLFELGYE0H+pkk14hxEAYPLtnuqsHX8eDPH0ZmHBTOmf7wJ6VFUgRRgx/NRbDht9
	 AQw0kMd8aBUFgcC8wGNHvSwjJvA1AbSSI6u3c4EuGtl7iw912L3zNCHMRQJhuUXcld
	 dsstnDyfXijeQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E3FCD4F5E;
	Tue, 19 May 2026 07:46:11 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Subject: [PATCH linux dev-6.18 0/2] Add Delta Q54SN120A1 Q54SW120A7 chip
Date: Tue, 19 May 2026 15:45:56 +0800
Message-Id: <20260519-dev-6-18-add-delta-q54sn120a1-q54sw120a7-v1-0-9b5eb2c0752e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIADUVDGoC/x2NQQ6CMBAAv9Ls2TW71SL4FcOh2kU3IVVbQRLC3
 629zVxmVsiSVDKczQpJZs36jEV4Z+D28PEuqKE4WLINOe4wyIwNcos+hCLjx+PbHXNkS54rfv9
 4QrI8dM7T9eAISu6VZNClri4wapwWU1t7bqHfth9/5w4BigAAAA==
X-Change-ID: 20260519-dev-6-18-add-delta-q54sn120a1-q54sw120a7-021f95a0b350
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779176768; l=707;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=XMOB0cFD40jSUilaf/nyMrWOXkpV4oyN3ij3q2lnZRo=;
 b=cWxi+LbdxzMXtiYNslQYIT9Vh6BZO6xLvoRW7LGZEy4Dv+yvzlNlLmumVY1FPZ5WTtL9bEFFm
 NY0iM2+mEmCDeCz8mI5FmLvPWxEEtkBsAxHEtv4cOMP3uERvBYorHjL
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

adds support for the Delta Q54SN120A1 and Q54SW120A7
1/4-brick DC/DC power modules with PMBus capability.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Colin Huang (2):
      dt-bindings: trivial-devices: Add Delta Q54SN120A1 and Q54SW120A7
      hwmon: (pmbus) Add Delta Q54SN120A1 Q54SW120A7 chip

 Documentation/devicetree/bindings/trivial-devices.yaml |  4 ++++
 drivers/hwmon/pmbus/q54sj108a2.c                       | 18 +++++++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)
---
base-commit: 6e22b9e818d68d7b8ce6680aede0c80a9355929a
change-id: 20260519-dev-6-18-add-delta-q54sn120a1-q54sw120a7-021f95a0b350

Best regards,
-- 
Colin Huang <u8813345@gmail.com>



