Return-Path: <SRS0=fhgC=HN=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1E7C433E0
	for <openbmc@archiver.kernel.org>; Thu, 11 Feb 2021 09:36:48 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FFAE64E87
	for <openbmc@archiver.kernel.org>; Thu, 11 Feb 2021 09:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FFAE64E87
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dbs314mspzDwm2
	for <openbmc@archiver.kernel.org>; Thu, 11 Feb 2021 20:36:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=103.231.89.101;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
X-Greylist: delayed 472 seconds by postgrey-1.36 at bilbo;
 Thu, 11 Feb 2021 20:35:06 AEDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [103.231.89.101])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dbs1671VDzDwlk
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 20:35:06 +1100 (AEDT)
Received: from pecola.lan (180-150-121-66.b49679.per.nbn.aussiebb.net
 [180.150.121.66])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2B1A6406B8;
 Thu, 11 Feb 2021 04:27:10 -0500 (EST)
Message-ID: <54692726b8192f2533b9d6073575610486f0b277.camel@codeconstruct.com.au>
Subject: Design for in-kernel MCTP in openbmc/docs review
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Thu, 11 Feb 2021 17:27:10 +0800
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Rui Zhang <ruizhan@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi OpenBMCers,

I've just pushed a changeset for an in-kernel MCTP implementation for
public review on gerrit:

  https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/40514/1

We've had the intention of implementing a kernel-based MCTP stack for a
while - indeed, the current libmctp/userspace approach is intended to
be reasonably compatible with a future sockets-based interface, which
is what we're proposing here. This design provides the outline for
that, and specifies the base components of the upcoming kernel changes.

The aim here is to shape the general structure of the MCTP
implementation to our primary consumers: OpenBMC. Given this is a
kernel implementation, I'll carry this design (plus code) forward to
the kernel community for upstream review too.

This work - including future changes for the implementation - is made
possible through funding from Google Inc., with Nancy Yuen (of OpenBMC
TSC fame) coordinating.

Comments, feedback and queries on the design would be best submitted
through gerrit, but I'm happy to take any general queries/comments here
too.

Happy MCTPing!

Cheers,


Jeremy


