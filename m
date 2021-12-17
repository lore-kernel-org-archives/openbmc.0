Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9B7C433F5
	for <openbmc@archiver.kernel.org>; Fri, 17 Dec 2021 09:46:19 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFkdQ0XTjz3bsp
	for <openbmc@archiver.kernel.org>; Fri, 17 Dec 2021 20:46:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFkct6XJMz306j
 for <openbmc@lists.ozlabs.org>; Fri, 17 Dec 2021 20:45:50 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BAF5620181;
 Fri, 17 Dec 2021 17:45:46 +0800 (AWST)
Message-ID: <8857fb3c25b2e3918dcda00f04710b3e9f84f1d9.camel@codeconstruct.com.au>
Subject: Re: Virtual Media repository request
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: "Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>, Ed Tanous
 <ed@tanous.net>
Date: Fri, 17 Dec 2021 17:45:46 +0800
In-Reply-To: <d9ea11af-4b30-3424-5b1b-e0a51dde28f4@linux.intel.com>
References: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
 <YbDjsxZYYtnNPsCK@heinlein>
 <475ba120-3734-8bf1-868f-83f48f10ccac@linux.intel.com>
 <YbdwYODNRJPuRady@heinlein>
 <5c98b6d46d71907242f1d868cc3d918db99cea53.camel@codeconstruct.com.au>
 <CACWQX819tsUA6t190mVp8LrrHbteiP4w-35MEH9LG9mWTvYgxw@mail.gmail.com>
 <d9ea11af-4b30-3424-5b1b-e0a51dde28f4@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0-2 
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Przemyslaw,

> I am ok with that approach, but I just wanted to separate service code
> and JS nbd server, as they are quite distinct entities from my
> perspective.

The actual nbd server code is tiny; only around 260 lines of javascript.
I don't think it's worth keeping a whole repo for that, given we would
not be using the jsnbd/nbd-proxy code.

So, I'd suggest just including this with the new VM implementation, or
moving it alongside the rest of the web ui.

Cheers,


Jeremy
