Return-Path: <SRS0=iBVr=OO=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E55AC433EF
	for <openbmc@archiver.kernel.org>; Fri, 24 Sep 2021 02:46:23 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88B5F610C9
	for <openbmc@archiver.kernel.org>; Fri, 24 Sep 2021 02:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88B5F610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFxHc6NGVz304S
	for <openbmc@archiver.kernel.org>; Fri, 24 Sep 2021 12:46:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=matt@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFxH64d2Gz2yQ9
 for <openbmc@lists.ozlabs.org>; Fri, 24 Sep 2021 12:45:54 +1000 (AEST)
Received: from [192.168.12.102] (unknown [159.196.94.94])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 094022012C;
 Fri, 24 Sep 2021 10:45:50 +0800 (AWST)
Message-ID: <94429904ec0c9d75919cda42339a2fafcbc35fe4.camel@codeconstruct.com.au>
Subject: openssh-dev package and populate_sdk conflicts
From: Matt Johnston <matt@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2021 10:45:49 +0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0-1 
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi OE list,

Recently OpenBMC merged a change to install openssh-sftp-server package
alongside dropbear sshd [1]. That caused a conflict in "populate_sdk" which
installs all available -dev packages [2]. 'openssh-dev' pulls in an
'openssh' -> 'openssh-sshd' dependency which conflicts with 'dropbear' [3].

What would be the recommended way to handle that situation? For now OpenBMC
has merged a change to disable building openssh-dev (it's empty since
openssh doesn't have libraries) [4].

Should non-library packages handle -dev packages differently? The default 
-dev package comes from bitbake.conf .

Cheers,
Matt

[1]
https://github.com/openbmc/openbmc/commit/26dbcdbd917e4f22fb400153da0d3e7255c8e646
[2]
https://github.com/openbmc/openbmc/blob/49465582e16221caf74cbdea11c87600a02bf47b/poky/meta/classes/populate_sdk_base.bbclass#L5

[3] https://github.com/openbmc/openbmc/issues/3819
 *   - package openssh-8.7p1-r0.arm1176jzs conflicts with dropbear provided
by dropbear-2020.81-r0.arm1176jzs
 *   - package openssh-dev-8.7p1-r0.arm1176jzs requires openssh = 8.7p1-r0,
but none of the providers can be installed

[4] https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/47089

