Return-Path: <openbmc+bounces-1856-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A834EFF8850
	for <openbmc@archiver.kernel.org>; Sun, 26 Apr 2026 23:32:08 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g3jds4yBGz2xSX;
	Mon, 27 Apr 2026 09:32:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=162.0.218.229
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1777246321;
	cv=none; b=JYL7bQV/jd0eBj0+zNo7SYk4+s7hS6hNkNplfsbUk90dbK4eQoYBsWScI6Uqf73z1nKBBdL6ouESa089iPgsWvdyiwDgNsE/FBnnQXoiffHua1zXjHhKBTUDl1qhFRMdnZ8E34GiEbj8Kv8y4uC1g9kvZsGOBrdluJnivYNbZEXquxgJrmsvjYFpvjG5I9Vd3rndd8fIhDsZx5KUXEmvlkOY2JG6RTVb7zb6fbYGragRlJrlqNgtvF1WSdlro950vFIUtIK07IchOkAa501IKwPeN54HGcUtKwnvyCvtZ/tOxqzxa/cyn6mBbDiSIcZyGp1nLb0wR9fK/+cZKeojhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1777246321; c=relaxed/relaxed;
	bh=l8ufHblVW5qmp2pzWovftNStEDW6HQEOOHQHZKz0Ddk=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=hgCH/cwePeh320mDfuhFu2SAHsiQ5+JMKUrC5RqQAKqHgkgTX7Eii1GChZuLzcr4zNimEUckjSdwfJk0Fmodsc6puiH/fGjFjA5y/A4iNbqlYXdnA/pneQ3adiXsxt0mcKRQj6wW779eOTJHOzZFKafO8YW4PjgZTCargeVoTwialbvnpiCymtn1xmRq45YEGs0JFQ59cuU18nfxrPcwmlxByTcamuCX80bNHcplECMmWnS+68FqvOFHNZj1q+bVeHu7Euszqjs/YcZGg12lxe8rCWZ0v95i8dB6la9uCFgAetCSDnV7k36IrDqAOuycskZ0ZVleiBwVdU6/OwSz7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gmills.xyz; dkim=pass (2048-bit key; unprotected) header.d=gmills.xyz header.i=@gmills.xyz header.a=rsa-sha256 header.s=default header.b=n/tX4AUn; dkim-atps=neutral; spf=pass (client-ip=162.0.218.229; helo=h6.fbrelay.privateemail.com; envelope-from=gunnar@gmills.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=gmills.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gmills.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmills.xyz header.i=@gmills.xyz header.a=rsa-sha256 header.s=default header.b=n/tX4AUn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmills.xyz (client-ip=162.0.218.229; helo=h6.fbrelay.privateemail.com; envelope-from=gunnar@gmills.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 702 seconds by postgrey-1.37 at boromir; Mon, 27 Apr 2026 09:32:00 AEST
Received: from h6.fbrelay.privateemail.com (h6.fbrelay.privateemail.com [162.0.218.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g3jdr1X08z2xMY
	for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2026 09:31:59 +1000 (AEST)
Received: from MTA-13-4.privateemail.com (mta-13-1.privateemail.com [198.54.122.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h5.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4g3jNF1vt6z2xQR
	for <openbmc@lists.ozlabs.org>; Sun, 26 Apr 2026 23:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=gmills.xyz; s=default;
	t=1777245608; bh=l8ufHblVW5qmp2pzWovftNStEDW6HQEOOHQHZKz0Ddk=;
	h=Date:From:To:Subject:From;
	b=n/tX4AUnXbjCHY+vmbaxCVzSR2PW8vp/v+FYMDAlhe+rn+Drh2KGyksxAoeodGfW8
	 4karyWXaTcRycmmdR8mMOhycCCqPi47aSMOnZ7h7MvuGa3DuiEm0Lu2ct4WCGQi78d
	 T2fjNuWeWL/VNGWVio3HKq8oQLt9jr8vBP24Kk5yimO6AV7XoXY3NGVQe+bFI5Q126
	 6A1BJc3YawWdLv+O0Xv+MeBTzZ3DOFaDICxzacQSZpNJcttELCMOFMA+hmS1Mf6v52
	 JxUpqmu8o57a4OrXJe0VCguqwsFkXdoSZeL3DENqgL8cBVYOo8M5NRYdem4ShZOO02
	 s5q+HwtGVm+FA==
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
	by mta-13.privateemail.com (Postfix) with ESMTP id 4g3jN802k3z3hhTL;
	Sun, 26 Apr 2026 19:20:08 -0400 (EDT)
Received: from APP-08 (unknown [10.50.14.158])
	by mta-13.privateemail.com (Postfix) with ESMTPA;
	Sun, 26 Apr 2026 19:20:06 -0400 (EDT)
Date: Sun, 26 Apr 2026 17:20:06 -0600 (MDT)
From: Gunnar M <gunnar@gmills.xyz>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <967616792.731299.1777245606898@privateemail.com>
Subject: [Security Advisory] bmcweb: 100-continue not enforcing max payload
 size
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev90
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
X-Rspamd-Queue-Id: 4g3jNF1vt6z2xQR

Hi all,

A new GitHub Security Advisory has been published for bmcweb:

GHSA-p3gc-68x5-g9w3: 100-continue not enforcing max payload size
https://github.com/openbmc/bmcweb/security/advisories/GHSA-p3gc-68x5-g9w3

Summary:
Affected versions of bmcweb do not correctly enforce the maximum payload size during the HTTP 100-continue handling path. A remote attacker can send a crafted HTTP request containing both Expect: 100-continue and a sufficiently large payload, causing bmcweb to crash.

Impact:
This is a denial-of-service vulnerability. No authentication is required.

Fix:
https://gerrit.openbmc.org/c/openbmc/bmcweb/+/87688

Severity:
High
CVSS v3.1: 7.5
Vector: CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H

Affected versions:
bmcweb 2.18.0 and earlier

Introduced in:
bmcweb commit 1d1d778

Patched versions:
bmcweb 3.0.0
https://gerrit.openbmc.org/c/openbmc/bmcweb/+/87688

Workarounds:
If upgrading immediately is not possible, restrict access to the BMC. BMCs should be placed behind management networks or firewalls.

CVE:
No CVE at this time.

For more information:
If you have any questions or comments about this advisory:

Email openbmc-security at lists.ozlabs.org

Thanks,
Gunnar

