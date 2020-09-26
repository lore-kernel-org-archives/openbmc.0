Return-Path: <SRS0=cZyQ=DD=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86229C2D0A8
	for <openbmc@archiver.kernel.org>; Sat, 26 Sep 2020 21:31:55 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EE0323719
	for <openbmc@archiver.kernel.org>; Sat, 26 Sep 2020 21:31:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b="N+cGeohS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EE0323719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzMRr3tWQzDqRG
	for <openbmc@archiver.kernel.org>; Sun, 27 Sep 2020 07:31:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bewilderbeest.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=N+cGeohS; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BzMMM6qpwzDqR5
 for <openbmc@lists.ozlabs.org>; Sun, 27 Sep 2020 07:27:58 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 4E163806F7;
 Sat, 26 Sep 2020 14:27:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 4E163806F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1601155672;
 bh=8vHvgIv5by9AG9T1vfxuVVmsKVK95LqhtvoPFNY8wWU=;
 h=From:To:Cc:Subject:Date:From;
 b=N+cGeohS4N4nzfkHk31U25PjzGC6YV2AeOExLBA2KZLNtH3RxUNQOVnI0d/x/YBTU
 ZPSVw18/XUKGiv+w4QpLqbK00zjygBX+SW7bcL57L77/aFcoMFKPI5JUmpAGcDRzkO
 PW5fUu6AuXN1vtdBtf/ekzYWaoOE1FhJPB4NaPVs=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] PECI patchset tweaks
Date: Sat, 26 Sep 2020 16:27:32 -0500
Message-Id: <20200926212734.23836-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Jason M Biils <jason.m.bills@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

[Re-sending as I clumsily typoed the mailing list's address on the
first attempt; apologies for the duplication.]

Hello,

These patches address a few small things I noticed with the PECI patch
set currently in the OpenBMC kernel tree.  Assuming they're deemed
acceptable, I'd of course hope they get folded in to the version of
the PECI code that gets upstreamed into the mainline kernel.

(Please let me know if there's some other way I should send this -- I
looked for but couldn't find a gerrit repo for the obmc kernel or any
kernel-specific patch submission instructions in
openbmc/docs/CONTRIBUTING.md, so 'git send-email' is my best guess.)


Thanks,
Zev


