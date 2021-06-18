Return-Path: <SRS0=u/Aq=LM=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9E1C2B9F4
	for <openbmc@archiver.kernel.org>; Fri, 18 Jun 2021 02:49:01 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 851FC610CD
	for <openbmc@archiver.kernel.org>; Fri, 18 Jun 2021 02:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 851FC610CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5jzw06Xzz3byf
	for <openbmc@archiver.kernel.org>; Fri, 18 Jun 2021 12:49:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ebuUmPo/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ebuUmPo/; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5jz05Zsgz304R
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jun 2021 12:48:12 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id q15so6540340pgg.12
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jun 2021 19:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J43ySVp80LALXvNjt8wktsjdaOK3qPz1jempH6uk6uY=;
 b=ebuUmPo/c6/sdsLAsRvStYp2csR4mM3d7TvkZGC7BINqrHO5wdpc+WNKKtnDmzBTs2
 i+E2jkX1BK3araxyZsMviJFdTMx3FfODL+9QvwWpRzh0E4y+bCYO2VWspHcAlYL4U0oY
 nZWCUPb4J9n1ts0VGHOgb/y2B/baInQgZebLVKpGWO0q6KM9jPq/ZkizZ/v7mwsI6lwN
 UhAxOUlsRW6RS8OYHEvxDzVWZT2Ja4U3tFXxNx8qzyIGyb2TfFl2idU1VFJfkEwaT/LM
 2wiDyWq3fAkyqVheLEPaqWwDWjcNrmf1A3Ary4Yl7Vz9aJ8NZElLwQiYhAZ9lJ18trL6
 dQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J43ySVp80LALXvNjt8wktsjdaOK3qPz1jempH6uk6uY=;
 b=dPfunu9HdrQuJgHVyK40B+93e+oNN7fmDuwBDCCz6kqLNBI65a2zFSv3YnckAqxDxs
 2drPmfVnYMbYljwYJwtDEyBJN/Hhsz/WlvMlBUdNNit5BhCyV+fAFox/WqU9Zz/P3Wd3
 CLjDryo8OO0FqG1N7uM/ZSxP+jslMprc2QhOTB6dVdl8jZtzkno5ZNmVIt0rMDnS+lwH
 2e8WL9nJtyn1gB9AWFvf3uT5RhM0VHRMpA5eUw7JuVLIOB8yy+Gyda1Qm4gofCrNHCvw
 lKQ3+ojI04Pykou7LjxzKbvppCU5f1Pugz706J+xES+xcPdSKJH8hf3iJriCpL77/TQK
 o4LA==
X-Gm-Message-State: AOAM531z88g3hrq+bnFl14f37xTRoXJddesPj4xZTlqri9u7aC2l8cTh
 i4vTvM0xjAWaX+Uc07c8ZBIuG9zBGTQ=
X-Google-Smtp-Source: ABdhPJwXFZvZT36/xkix/o5rwjiZA+1ZinEKOhxki6B849s1dc+728ca4aQXnzOBaarpqpd1Gd/ZNw==
X-Received: by 2002:a63:4c09:: with SMTP id z9mr7795827pga.283.1623984489303; 
 Thu, 17 Jun 2021 19:48:09 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id t62sm6425224pfc.189.2021.06.17.19.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 19:48:08 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/2] Makefile: Conditionally
 add defaultenv_h to envtools target
Date: Fri, 18 Jun 2021 12:17:57 +0930
Message-Id: <20210618024758.892642-2-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210618024758.892642-1-joel@jms.id.au>
References: <20210618024758.892642-1-joel@jms.id.au>
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

When building the envtools target with CONFIG_USE_DEFAULT_ENV_FILE=y,
the tools require generated/defaultenv_autogenerated.h.

 In file included from tools/env/fw_env.c:126:
 include/env_default.h:115:10: fatal error: generated/defaultenv_autogenerated.h: No such file or directory
   115 | #include "generated/defaultenv_autogenerated.h"
       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index be0d9ea5c5bc..e1fa881b2aa4 100644
--- a/Makefile
+++ b/Makefile
@@ -1581,6 +1581,8 @@ endif
 
 ifeq ($(CONFIG_USE_DEFAULT_ENV_FILE),y)
 prepare1: $(defaultenv_h)
+
+envtools: $(defaultenv_h)
 endif
 
 archprepare: prepare1 scripts_basic
-- 
2.32.0

