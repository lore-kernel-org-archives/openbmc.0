Return-Path: <openbmc+bounces-2555-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C72C79F80
	for <openbmc@archiver.kernel.org>; Fri,  4 Sep 2026 06:16:32 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hbmSV2cjZz2yr2;
	Fri, 04 Sep 2026 16:16:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=54.240.8.70
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788501611;
	cv=none; b=VblGHa98UHdGhqp0BJqmI2OZiHRNyxuyiE96k3YqUQ1fmbfwz3x2F0lmvr6gpJlJb4DcNp+eSLFZYdEu0DPTgzHvRX0Q/01N9kLbaYaMLhOT/eqBqwNsg7fC5dOwP6O7/PRGDywlo3v9IXlW9lgWnxBwH280cUfHnXkkuc8zetDshzhjU1ZpN9grnFQ8m3pEeNW7HtedHo51pkNQ3S2GIlyzWbMBrl2nLY/rwdMyPNcvHiLLhiWHl6RphVR9iS+Cub628aJOc17p/LjllYTjby2+tfpfiJj6yO9Obl8AX01Snbukk+up4mJAMQyThhuRkgfazbj0z0V8hQ9M5b3HBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788501611; c=relaxed/relaxed;
	bh=FsbUJGj2HTWpYOMUBReQxMW6JOe5JsEJi3/x6WKXcBA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lDmwdGT0vrAmzEFNT8yg5qoT2VPrJuc4JLZHgW9FMIVZwH2zyQKmFyta1VzxJa/OjHtcGhw9OwVZj+ge5gUdRHHDVLudnOf5GTeKd6C1fgBgSQnUlEYakTlAhsy5fBWIcMzd/8e2an9kgib3aV2yTGVwrE/wsYXCJHRHYd+q1zqoU8vcuOEteHzd1V17hJSfvF/zh+4a/tQEWNynneCT5ENYqKqcbJt7HaTpZclqpRa4MohyR4TE5kuv3ZXiE6XB6OvanW2N/Ct50gVPTUNTPzJRQf228HeNUsSLcmUoIJd0NikUqQ2Rhe/65NMM/xba1BmpEvD7WJHVnyjf1nL8YA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ericandbrianne.com; dkim=pass (1024-bit key; unprotected) header.d=ericandbrianne.com header.i=@ericandbrianne.com header.a=rsa-sha256 header.s=lqq4mffiqgrpprowoodjt6ft56ibgrfb header.b=QQdMCp1i; dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=r38MLNfz; dkim=fail header.d=ericandbrianne.com header.i=@ericandbrianne.com header.a=rsa-sha256 header.s=dkim header.b=mdisSLm1 reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=54.240.8.70; helo=a8-70.smtp-out.amazonses.com; envelope-from=010001a06b00bc9d-be45382e-2678-44f5-8c3b-d0aa4116af80-000000@bounces.ericandbrianne.com; receiver=lists.ozlabs.org) smtp.mailfrom=bounces.ericandbrianne.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ericandbrianne.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ericandbrianne.com header.i=@ericandbrianne.com header.a=rsa-sha256 header.s=lqq4mffiqgrpprowoodjt6ft56ibgrfb header.b=QQdMCp1i;
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=r38MLNfz;
	dkim=fail reason="key not found in DNS" header.d=ericandbrianne.com header.i=@ericandbrianne.com header.a=rsa-sha256 header.s=dkim header.b=mdisSLm1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bounces.ericandbrianne.com (client-ip=54.240.8.70; helo=a8-70.smtp-out.amazonses.com; envelope-from=010001a06b00bc9d-be45382e-2678-44f5-8c3b-d0aa4116af80-000000@bounces.ericandbrianne.com; receiver=lists.ozlabs.org)
Received: from a8-70.smtp-out.amazonses.com (a8-70.smtp-out.amazonses.com [54.240.8.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hbm5j2qCKz2xfj
	for <openbmc@lists.ozlabs.org>; Fri, 04 Sep 2026 16:00:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lqq4mffiqgrpprowoodjt6ft56ibgrfb; d=ericandbrianne.com;
	t=1788501605;
	h=From:To:Subject:Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=6Y6oNpVfwbfHZiyBshuM1W/6EJiuesWG/wSdRvAv1OM=;
	b=QQdMCp1ioGmYSnNHDjbfW3an9BT1SvpViFGobxYD5qM2XztnC4OmoQpn5fz687Os
	1nm8JbDVNnFaagoH0bg+1qjJKiZ/oxWO5rj0w7B+LT9SbrFMHYxybN1sPsQyLYUEnjn
	HC0hstXx/yZdAyVePQGXZcvPJRAGi4If4zbyPM3I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1788501605;
	h=From:To:Subject:Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:Feedback-ID;
	bh=6Y6oNpVfwbfHZiyBshuM1W/6EJiuesWG/wSdRvAv1OM=;
	b=r38MLNfz7h/HI+ctljmWtz7gQ4I87hVDbjQuQvLv537vSWO0UCLYFM2QdFG2Hpjt
	3DIF37BRJyD56gTMSqAhC9WWymDfZZqRQ2iffkomsdqhXS0xh1a+7X9Yy6IlT/7UFhx
	M0Lm4aOLMN8jTs9becyDDi+Yj4gZHi1u7o0ehtPk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericandbrianne.com;
	s=dkim; t=1788501604; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding; bh=FsbUJGj2HTWpYOMUBReQxMW6JOe5JsEJi3/x6WKXcBA=;
	b=mdisSLm1aRfBH1OWU77ULTTMSr6J5HmJJKpHBN7wTl9bSnAtBCyoWXlIFNFGWuJWRcFXOV
	3+st0tSqT8G+j5L5kWP5Bqq5pP6Vra1PfOUmiNwvNX0liggzCPXdWjTfOHaKv5q3ERr1d0
	NHrk+HH9lSONmv3XGeAagD0AkqJnhePCuxdNuN2j9L0vtsOWPj2aV+3C4n9H7dOsMfhjFl
	ihoP++UgKc3+wcaa13g6lr+3QEKe2ZkGoJuZFmfMRWBnlg4kF5467xhuPu7CkBvCcal5jN
	NNKA5C1ntPIJyPeIxlLQtpoLvvLvVsOpC5fLBzgvBAHXWbunADPWazcbAZZ9SA==
From: "Eric L. Parent" <eparent@ericandbrianne.com>
To: openbmc@lists.ozlabs.org
Subject: Cabled DC-SCI on an HPM with no board-mounted SCM site =?utf-8?q??=
 =?utf-8?b?4oCU?= what is conventional?
Date: Fri, 4 Sep 2026 06:00:05 +0000
Message-ID: <010001a06b00bc9d-be45382e-2678-44f5-8c3b-d0aa4116af80-000000@email.amazonses.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
X-Last-TLS-Session-Version: TLSv1.3
Feedback-ID: ::1.us-east-1.fR+KYxXczG90S4f/T6apAPAXomdl9SmoLjmZDV4wCfg=:AmazonSES
X-SES-Outgoing: 2026.09.04-54.240.8.70

I'm looking at a datacentre carrier board that appears to be an OCP HPM:
CPU and memory complex, what I take to be the HPM FPGA, and no BMC, no
RTC battery, and no DC-SCM slot anywhere on it. Connector inventory is
roughly six MCIO/SlimSAS, two large power connectors, an ATX-style aux
power connector, and a 2x5 JTAG header. Nothing that looks like DC-SCI.

On a higher-density board from the same design family, the management
link is visibly cabled: shielded bundles from the mainboard to a small
daughtercard riser at the board edge, with the cable labels naming a
management interface and a connector designator rather than anything
resembling a DC-SCI part.

Four questions:

1. Where the SCM isn't board-mounted, is the cabled link conventionally
   still DC-SCI in a cabled form factor, or is this where implementations
   tend to go vendor-specific?

2. Is there a conventional connector family or pin assignment for cabled
   DC-SCI? M-PIC permits BMC USB 2.0 over M-XIO on x8-and-wider cables and
   M-PESTI overloads PRSNT# on both I/O and power connectors =E2=80=94 is LTV=
DS/LTPI
   ever tunnelled the same way, or does the signalling rule that out?

3. With no SCM present, do HPM FPGA designs typically support a standalone
   or debug power-sequencing mode, or does the HPM stay in reset?

4. Where does the host UEFI flash actually sit in practice =E2=80=94 on the H=
PM
   behind a root of trust, or on the SCM via the optional SPI-boot path? I
   know both are permitted; I'm after what implementers do.

If anyone has dumped SPI flash on an HPM of this generation and looked
for an EDK2 firmware volume, I'd be glad to hear it either way.

I'm also considering Antmicro's open-source DC-SCM 2.1 design as the
basis for a compatible module, so any interop gotchas would be welcome.

Thanks,
Eric

