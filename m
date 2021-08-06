Return-Path: <SRS0=6yv1=M5=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E70BC4338F
	for <openbmc@archiver.kernel.org>; Fri,  6 Aug 2021 05:40:32 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3E6E6113B
	for <openbmc@archiver.kernel.org>; Fri,  6 Aug 2021 05:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3E6E6113B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgvT95RMRz3d79
	for <openbmc@archiver.kernel.org>; Fri,  6 Aug 2021 15:40:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgvSk39hXz30Hb
 for <openbmc@lists.ozlabs.org>; Fri,  6 Aug 2021 15:40:06 +1000 (AEST)
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7B3F92012D;
 Fri,  6 Aug 2021 13:40:03 +0800 (AWST)
Message-ID: <03e6283aa9701fddbb8ef7707accc82eacb5acb4.camel@codeconstruct.com.au>
Subject: Re: Question about NVMe MCTP in dbus-sensors
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Heyi Guo <guoheyi@linux.alibaba.com>, openbmc <openbmc@lists.ozlabs.org>
Date: Fri, 06 Aug 2021 13:40:01 +0800
In-Reply-To: <6fa87e93-863e-94a6-651f-8d6126557553@linux.alibaba.com>
References: <6fa87e93-863e-94a6-651f-8d6126557553@linux.alibaba.com>
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Iwona Winiarska <iwona.winiarska@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, Ed Tanous <ed@tanous.net>,
 Richard Thomaiyar <richard.marian.thomaiyar@linux.intel.com>,
 Sumanth Bhat <sumanth.bhat@linux.intel.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Heyi,

> We can see that NVMe sensors in dbus-sensors relies on MCTP to get 
> hardware information. It is using libmctp interfaces to initialize
> MCTP and SMBus. However I don't find the code or component who is
> responsible as a bus owner, to discover endpoints, manager EID and
> update routing table.

So we're working on this at the moment.

The new design is here:

  https://github.com/openbmc/docs/blob/master/designs/mctp/mctp-kernel.md

The MCTP core patches have been accepted to the upstream kernel, and
we're finishing up the i2c/SMBus binding driver at the moment:

 https://github.com/CodeConstruct/linux/tree/dev/mctp-i2c-mux

The prototype userspace support code is here:

  https://github.com/CodeConstruct/mctp

- which includes the control protocol implementation (mctpd) for
endpoint discovery, routing table updates, etc.

The switch over from the demux-based approach to the kernel sockets
interface should be fairly straightforward, but Intel are working on a
library to abstract that.

Cheers,


Jeremy


