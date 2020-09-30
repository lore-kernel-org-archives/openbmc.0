Return-Path: <SRS0=bToe=DH=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13364C47426
	for <openbmc@archiver.kernel.org>; Wed, 30 Sep 2020 15:30:24 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19FB820759
	for <openbmc@archiver.kernel.org>; Wed, 30 Sep 2020 15:30:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JYB+Ou6L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19FB820759
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1gDq71XYzDqV7
	for <openbmc@archiver.kernel.org>; Thu,  1 Oct 2020 01:30:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=suichen@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=JYB+Ou6L; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1gBZ212PzDqQl
 for <openbmc@lists.ozlabs.org>; Thu,  1 Oct 2020 01:28:14 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id z17so2638339lfi.12
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 08:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jeJhH3ShJO8UTXzfIaDU5LrldrlmiNxBdYg0EP+53iA=;
 b=JYB+Ou6L2m00nmCn4hC9MOjkx6eTQ2XZL2+7TLAffuEuPlyyFvp1+srbg6nbdlNzsK
 r2Y362yuULAoGjOZuvQU+n3zYoE1Z7qzqqdUdEW2pILxnw+zFzY2mhIB9mRXZjcxwRLX
 7/AiLr71HfGKu+5dsrhI7WF0t/U2NyTC0XgtPUIiyVmIe85gItDZLIt4qp1PgwjH0Rpj
 zsS66wXv/MH7XdfQYVE0oHbHywK4kvDDqhS4vlbrOeBMJ1zUwDjVFPmAsfLHToaIDg4h
 yIjiYjo71x1kx5/hcrOce+f5nniWfvqvS4ZDOD5YN7jc6/9SZRaRa2pFrShyjiTqDwsZ
 vsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jeJhH3ShJO8UTXzfIaDU5LrldrlmiNxBdYg0EP+53iA=;
 b=OlkgOQphJk3BlMrnL4CQ2HrpCO5nOwpHiZMWMhsVAc70HZR7T74XBL5aGlclGa7IDy
 r35StQWvQ19l9LlGD+A0mqZO9AsBXAijWZTkKwezdhAoW30ZKQhzTfgktTgBJHzKOGlF
 aRKd/s6fBUa2FHkmgMehk7cswlP292nlTy8cbyeIvuVLA1t6Lo3wAS3z4Nb0pQBSspGC
 RYBcd6t9Js+i/84Dg293ooPQHjrKftLA2AHwGkJl9etjqeR6mdAST3dp2Wbxe9B3jA0o
 lB+D21KsJGi526hOEPghvmNPRhI7QikJL9qMSQG8XB31q13huRDpOP9KEfF67avGBS/S
 fY8A==
X-Gm-Message-State: AOAM531S8GOfRf3L+nKoNIF1xiac/7Qt2CamELIHOoYrOW8GuDfje40/
 E5T0IFTADUkSvNbJSbss0q9LNOGoYDMkmYZ2b/H9onGP2vHhrw==
X-Google-Smtp-Source: ABdhPJzvl2Fxj7xSB6nHzQf/4Uuos9cZhCd1nuJ9mQiaKiIe+M17mrOAOREbZyK9QUcKNiPU/cgIYMdo56uXFX7HbEQ=
X-Received: by 2002:ac2:4e96:: with SMTP id o22mr979306lfr.485.1601479689669; 
 Wed, 30 Sep 2020 08:28:09 -0700 (PDT)
MIME-Version: 1.0
From: Sui Chen <suichen@google.com>
Date: Wed, 30 Sep 2020 08:27:58 -0700
Message-ID: <CAJOps0sd-YFr5P+_N0i78pd9akBJS6DP99wugKvUDOGpXw2pcA@mail.gmail.com>
Subject: Request to create repository google-ipmi-bmc-health
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hello OpenBMC community,

We are working on an IPMI blob-based implementation of BMC health
monitoring. We currently have an internal working prototype version
and would like to upload it to this newly proposed repository,
openbmc/google-ipmi-bmc-health .

We are aware of existing BMC health monitoring designs such as:
1. https://github.com/openbmc/phosphor-health-monitor and its
documentation https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31957
2. https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/34766

Main differences between this implementation and existing ones are:
- google-ipmi-bmc-health is implemented with the IPMI blob handler
framework and exists as an IPMI blob handler, while
phosphor-health-monitor runs as a daemon and exposes BMC health
metrics on DBus in the same manner sensors are exposed.
- This implementation does not check health metric values against
thresholds or perform actions when thresholds are crossed.
- This implementation currently reports uptime, memory usage, free
disk space, CPU time consumed by processes, and file descriptor stats.
- This implementation does not read a configuration file yet. It
always reads the hard-coded set of health metrics listed above.
- This implementation does not post-process sensor readings such as
compute the average CPU usage over a certain time window.

As such, this implementation differs enough from existing ones such
that we believe we have enough reasons to have a separate repository
for it.

Thanks!
