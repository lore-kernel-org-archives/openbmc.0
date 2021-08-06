Return-Path: <SRS0=6yv1=M5=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79732C4338F
	for <openbmc@archiver.kernel.org>; Fri,  6 Aug 2021 09:47:07 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2E9E6103B
	for <openbmc@archiver.kernel.org>; Fri,  6 Aug 2021 09:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2E9E6103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh0xj1dFkz3cV1
	for <openbmc@archiver.kernel.org>; Fri,  6 Aug 2021 19:47:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh0xK3GXXz3bY0
 for <openbmc@lists.ozlabs.org>; Fri,  6 Aug 2021 19:46:45 +1000 (AEST)
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 018232012D;
 Fri,  6 Aug 2021 17:46:41 +0800 (AWST)
Message-ID: <556ea2925e85d84f296211cce9ef3572647e9e80.camel@codeconstruct.com.au>
Subject: Re: Question about NVMe MCTP in dbus-sensors
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Heyi Guo <guoheyi@linux.alibaba.com>, Andrew Jeffery <andrew@aj.id.au>, 
 openbmc <openbmc@lists.ozlabs.org>
Date: Fri, 06 Aug 2021 17:46:40 +0800
In-Reply-To: <30416e46-2e6d-c878-4c7d-943aa1119c0e@linux.alibaba.com>
References: <6fa87e93-863e-94a6-651f-8d6126557553@linux.alibaba.com>
 <863f7fca-7088-450e-a855-92261ba56b9d@www.fastmail.com>
 <30416e46-2e6d-c878-4c7d-943aa1119c0e@linux.alibaba.com>
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
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, Ed Tanous <ed@tanous.net>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>


Hi Heyi,

> BTW, when will MCTP be ready in openbmc mainline, including SMBus 
> binding and PCIe binding? Do you have any plan in the future openbmc 
> release?

We're mostly working on the generic infrastructure components at the
moment; those are based on their relevant upstream projects rather than
as parts of OpenBMC specifically. However, the upstream work is going
well, and the OpenBMC integration shouldn't be too difficult there;
we'll get that done as necessary.

As for interfaces: I currently have i2c and serial transports working,
but have no specific plans for PCIe - no hardware to test on. If this
is something you'd be interested in working on yourself, I can provide
some pointers.

Regards,


Jeremy

