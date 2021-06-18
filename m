Return-Path: <SRS0=u/Aq=LM=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E964C2B9F4
	for <openbmc@archiver.kernel.org>; Fri, 18 Jun 2021 02:48:40 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 709BE610CD
	for <openbmc@archiver.kernel.org>; Fri, 18 Jun 2021 02:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 709BE610CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5jzV3VNXz3bxP
	for <openbmc@archiver.kernel.org>; Fri, 18 Jun 2021 12:48:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LjpFp3oM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LjpFp3oM; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5jyy556Dz304R
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jun 2021 12:48:09 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id h12so6576350pfe.2
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jun 2021 19:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yNYmF7PqO31q32/niUOwyYFP21tAwYfkbKqtJbmz7Y8=;
 b=LjpFp3oMIZQ9bEMonQjO/TMZD7XrLoGGHe8qtIghQ6iKWAujjNvF21EoBcwn3ZfPni
 WANpF4EWtDoHkmQ/SUsPZLOYsObAiNKRc0sLzrihYSRYI2wdUDfHRZJFfNJDFK7TfJ/X
 fVdc29LTVQP+BZOSRSIVqhAdbhAghXP9G31nR/JmWrnZzngDIqw6W/QIuHfxRribOfd5
 P6EHJyN3d/TgdwDHLFwxO2g/BigrsaXjprP2HlbB3v+rzLoqOGJhcUHia2SApA+E4vtz
 O6rANB71rCsj9UuEik9MWYFRQBKKfA2Z78Nzsx5mYMOwYz6q7W3oGxu+1HzlACKaUAj0
 IBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=yNYmF7PqO31q32/niUOwyYFP21tAwYfkbKqtJbmz7Y8=;
 b=twbG1hCv6jmP1aJ+fwNXgMFtw+iRZcQyGOWCyPkU+5bH5+PUatecHHoNOfQve8MFdd
 lXHEHIFnQZMNVOO3F8iTmUxI+oQNrWmUNUR7vmV+JRThuCkl0CEGAn2ZSiIlpjkDUzRJ
 /TMnLJgDsIqVe2co/4tr+42pt7XFkFeKNO3orwD65UUS4dTwcCmvcUdhXpYJg8YI3WMZ
 fOT0r1tJ3wA9oEWbvjprEAe7B+7aoS+DtLtpPLDJi0h7WbijO9+n4jzZt19Fd7lFKsAi
 vKKTGQ9ZLZ3n7bypq7QmkiP0yXUUATfcFvcHrSb+5kBUB9W5j8sLgPI9w5SEO0wBCR+e
 LmgA==
X-Gm-Message-State: AOAM5337TYzopKlBBVV2nx/Xo6kGcZ7Fk89oai+++KBInTS/dO/kTcWN
 dipLDzIayiH1rfamhskL0Jsj2Ab8fSI=
X-Google-Smtp-Source: ABdhPJxwGTH6bdUHPxXJ4chdKud+WrcyKG88bl2lJoMzEMQBBHp73khwkJ7xmt/7XF149SwUyj0tyQ==
X-Received: by 2002:a62:7e8a:0:b029:2f8:183:8aa2 with SMTP id
 z132-20020a627e8a0000b02902f801838aa2mr2798394pfc.58.1623984486300; 
 Thu, 17 Jun 2021 19:48:06 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id t62sm6425224pfc.189.2021.06.17.19.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 19:48:05 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 0/2] Store default u-boot env in
Date: Fri, 18 Jun 2021 12:17:56 +0930
Message-Id: <20210618024758.892642-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

This patch adds the u-boot environment to the u-boot binary, and a build
fix for the new configuration that I have also sent upstream.

We currently rely on the default environment being populated in the
image. This has the downside that if something corrupts the environment,
the system won't know how to boot itself.

The ast2600_openbmc_mmc.txt is copied from
meta-aspeed/recipes-bsp/u-boot/files/u-boot-env-ast2600.txt.

The downside of this approach is we would need to keep the files in
sync, or change the yocto tooling so the in-flash environment is
generated from this copy.

Please respond with your thoughts on this approach.

Joel Stanley (2):
  Makefile: Conditionally add defaultenv_h to envtools target
  ast2600: Add environment for booting from mmc

 Makefile                                   | 2 ++
 board/aspeed/ast2600_openbmc_mmc.txt       | 9 +++++++++
 configs/ast2600_openbmc_spl_emmc_defconfig | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 board/aspeed/ast2600_openbmc_mmc.txt

-- 
2.32.0

