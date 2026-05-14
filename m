Return-Path: <openbmc+bounces-1928-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3849CD4F25
	for <openbmc@archiver.kernel.org>; Thu, 14 May 2026 23:44:20 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gGn3d2n3yz2yDs;
	Fri, 15 May 2026 09:44:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778755791;
	cv=none; b=oTfABrCNYUrzG1aw7EC/1SNiKxqr96i0wWyNBOsGtmofsSGb7k8EHDNxUkV5kyuDkndZrP2kgfGHLBYlBehLqHq9HKvjKB2GayKMj2hGYtQiHTeZQ9COXa5FFBJ4H/kFQaVV2OiUc3e8FXc62TATgQ9A7xwvKD+gFrrA6sN/ff8OJ2WzjAWrzl3VbWWu+NjhjhYmzUSEmvXSrThf3Kj9up4611fNmmTbis1IXwQ0kKkUiv8SHQZ62xGQ1RMMtw/7NJq1ylGwXn+l6UAZuBbWvjQQAM1gDQl+fmSHM234bGLzE/ArD5qU3fUVSVMZGuaGyoOAxcy5ZL/hbd9V35bIbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778755791; c=relaxed/relaxed;
	bh=sW8JyemlxT37Imo/eM50NdNvNd0/V9v9kqYUelRAXxk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jTlvBV9I8cpMSN/JJekdeQBPt/606zuGJElSNhRE8u3SAlXY2cDJO3Xo8zNx92NVlSiDey621FGX7FEY1cyOeqx22RRSQQNwJJzgXqieUbNayt9ozJXI2r9g9EaaX/eP5JW7QFHj0X8h1BhHhfdgJcxf2FbrntPy26t5eUP6A82k+Uh0MeKh0l4w0jgMcdhs0+EFpopkctbl6Gv3ZPtcGu5DWo6KDTDwHhLJXLiqEdcfRXKTn3wt0/MPoZwwlOG9mziCceyBSw0dk8wTF92ZGwkcJ7FWG3Sy73SqtrXV19CeWHy+Wtb7GsihxK1gY0eL3laD+1A8FGMCs3jPijo7KQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lY66FHWD; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lY66FHWD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gGRt664Q2z2xy8
	for <openbmc@lists.ozlabs.org>; Thu, 14 May 2026 20:49:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CA99434B4;
	Thu, 14 May 2026 10:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D8A6C2BCB3;
	Thu, 14 May 2026 10:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778755788;
	bh=mV96jkCInMcJlapCpMzF/AaUl98egkYPeqsOYfjbenU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lY66FHWDrBP52MaToDZ/MvS59bIIEdKV4UpFvA7UMsCK6Z1bhTJSl+HvKtk1P8zET
	 53Nf2gyDdLs2QOMlTZoJVP/Wo8EybBCM/cB9SPdOQS1DfEWFKsspcgATDv6CLtgK4b
	 LyD++RWXGBt4OCwqYjmOXQIp3Bo+LJT+bn3E8HtQhHiQLxTea5IIXvyfOYKSXrRbrM
	 Y0bLgLf3pyEqvf1/G/QYAvgS0anwIxnUnFDQW8Eas+u1V9v3DhfzoGWYqQNnJ6Qhu9
	 sP70SHPO5DfRrEJs24vAni+3VhWGFavgagkobVjPbXjfiHn7nmV9gb66h3EIfNeCuA
	 RVDuNktZBmg3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1D8CD4F39;
	Thu, 14 May 2026 10:49:48 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Subject: [PATCH linux dev-6.6 0/3] add support for Delta E50SN12051
Date: Thu, 14 May 2026 18:49:40 +0800
Message-Id: <20260514-backport-dev-6-6-e50sn12051-driver-v1-0-44d2ef6c18dd@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAMWoBWoC/x2NwQrCMBBEfyXs2ZUkbXLwV8RDmqx1UdKy0VAo/
 XeXMqfH8GZ2aCRMDW5mB6HOjZeq4C4G8ivVmZCLMnjrow1uxCnl97rIFwt1jBoKtlXntcQi3En
 QpRCo5DwMUwQdWoWevJ0nd/hw/W3mlK8RHsfxBzA3DSyDAAAA
X-Change-ID: 20260514-backport-dev-6-6-e50sn12051-driver-1a55edcc33b6
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778755785; l=868;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=mV96jkCInMcJlapCpMzF/AaUl98egkYPeqsOYfjbenU=;
 b=ofc6r3neO6bv4jVclSqiWnA/JX1TkqbpJ8ysforIVHfV4uI65FQqEc7tqKPXAXuZBNQ+gjB6O
 dtXbXd/XdsAATO4f76Z+AhaGC6985SkfM40zwad9c/8WyuIEHhTgMAd
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
change-id: 20260514-backport-dev-6-6-e50sn12051-driver-1a55edcc33b6

Best regards,
-- 
Colin Huang <u8813345@gmail.com>



