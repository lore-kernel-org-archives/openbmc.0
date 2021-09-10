Return-Path: <SRS0=LPz7=OA=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9466AC433EF
	for <openbmc@archiver.kernel.org>; Fri, 10 Sep 2021 07:59:43 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 075B9611C2
	for <openbmc@archiver.kernel.org>; Fri, 10 Sep 2021 07:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 075B9611C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5Svd34QTz2yQ5
	for <openbmc@archiver.kernel.org>; Fri, 10 Sep 2021 17:59:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5Sv61gdFz2xv0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Sep 2021 17:59:13 +1000 (AEST)
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BCA2120164;
 Fri, 10 Sep 2021 15:59:10 +0800 (AWST)
Message-ID: <857e71679c7d1a421f6cc50896ac7927fe49cd74.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC] Specifying default-disabled devices
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Zev Weiss <zweiss@equinix.com>
Date: Fri, 10 Sep 2021 15:59:10 +0800
In-Reply-To: <20210910052835.GF17315@packtop>
References: <20210910022433.GD17315@packtop>
 <71375410db4f03bd19c820f97f3a23418b56ecc0.camel@codeconstruct.com.au>
 <20210910034958.GE17315@packtop>
 <1df72fd584f9c54544f9d5fafcd6232e3079ee49.camel@codeconstruct.com.au>
 <20210910052835.GF17315@packtop>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Zev,

> From some grepping around it looks like the only check is for
> "okay"/"ok", and nothing actually checks for "disabled", so I'd think
> any non-OK string (including "reserved") would end up being
> equivalent
> to "disabled", and hence result in the device node not being
> instantiated at all.  (A quick test appears to confirm; with status =
> "reserved", an attempt to bind via sysfs fails with ENODEV.)

Ah, so you still want the device created, but not bound?

That might not work for status = "reserved" then, and I'm not sure we
want to change the semantics for that.

Just so I'm following along correctly: you still need this described in
the DT (rather than instantiating entirely from userspace), because you
need additional platform data for the new device, is that correct?

Cheers,


Jeremy

