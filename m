Return-Path: <SRS0=mhbt=K5=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27088C47082
	for <openbmc@archiver.kernel.org>; Thu,  3 Jun 2021 07:34:45 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F488611C9
	for <openbmc@archiver.kernel.org>; Thu,  3 Jun 2021 07:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F488611C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fwd2V6JJHz3046
	for <openbmc@archiver.kernel.org>; Thu,  3 Jun 2021 17:34:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
X-Greylist: delayed 540 seconds by postgrey-1.36 at boromir;
 Thu, 03 Jun 2021 17:34:25 AEST
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fwd291GLlz2yYh
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jun 2021 17:34:25 +1000 (AEST)
Received: from [172.16.64.134] (unknown [49.255.141.98])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2475721943;
 Thu,  3 Jun 2021 15:25:22 +0800 (AWST)
Message-ID: <f4f5fa66542401e8d5e78c1fb30153195d384b62.camel@codeconstruct.com.au>
Subject: Kernel MCTP patches posted to netdev
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: openbmc <openbmc@lists.ozlabs.org>
Date: Thu, 03 Jun 2021 15:25:21 +0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi OpenBMCers,

Just letting you know I've sent the first RFC of the in-kernel MCTP
patches to the netdev mailing list:

 https://lore.kernel.org/netdev/20210603065218.570867-1-jk@codeconstruct.com.au/T/#t

Since I suspect there'll be a bit of kernel-specific discussion there,
I have not CCed this (openbmc) list.

If you're interested in reviewing, or checking out the tree in general,
I'd encourage you to keep an eye on that discussion. If you'd rather
not subscribe to netdev, the lore.kernel.org page above has a download
link for the mbox file (mbox.gz), which you can load into your
favourite mail program. Alternatively, you can check out the patches on
github, in my 'mctp' branch:

 https://github.com/jk-ozlabs/linux/tree/mctp

- but note that I'll be updating/rebasing that branch as reviews come
in.

I'll update this list with progress of the upstream submission too.

Cheers,


Jeremy


