Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C07CC433F5
	for <openbmc@archiver.kernel.org>; Tue, 14 Dec 2021 02:11:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JChhL64QSz3c6D
	for <openbmc@archiver.kernel.org>; Tue, 14 Dec 2021 13:11:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JChgt6BJJz2yPM
 for <openbmc@lists.ozlabs.org>; Tue, 14 Dec 2021 13:11:22 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0886D2012C;
 Tue, 14 Dec 2021 10:11:18 +0800 (AWST)
Message-ID: <5c98b6d46d71907242f1d868cc3d918db99cea53.camel@codeconstruct.com.au>
Subject: Re: Virtual Media repository request
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>, "Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>
Date: Tue, 14 Dec 2021 10:11:17 +0800
In-Reply-To: <YbdwYODNRJPuRady@heinlein>
References: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
 <YbDjsxZYYtnNPsCK@heinlein>
 <475ba120-3734-8bf1-868f-83f48f10ccac@linux.intel.com>
 <YbdwYODNRJPuRady@heinlein>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0-2 
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

Hi all,

> Maybe Ed's proposal of using an existing repository solves that.  We
> would need to make sure the current maintainer is accepting of
> whatever design direction you've decided to go though.

I'm fine with replacing the jsnbd code with a newer implementation,
provided there's general community acceptance for doing so. If that's
the case, I'm happy to use the existing repo, or replacing openbmc/jsnbd
entirely - whatever suits best.

[Perhaps in your design document, you can expand the Alternatives
Considered section, to provide some motivation to change over]

However, I'm *not* OK with just introducing a completely alternate VM
implementation and leaving jsnbd as-is, where some platforms use one,
and some the other. We have way too many instances where there are two
separate implementations and/or repos that deliver the same
functionality. I would like to avoid making that problem worse.

So, either:

 - submit these as updates to jsnbd, which implement the new structure as
   you like. I'd be happy to hand over the repo to the new maintainers.

 or

 - provide the new VM implementation as a new repo, propose to change
   platforms to use the new implementation, and we can delete jsnbd.

Cheers,


Jeremy
