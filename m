Return-Path: <SRS0=jVBI=O3=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C51C433EF
	for <openbmc@archiver.kernel.org>; Thu,  7 Oct 2021 06:03:50 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA4C96105A
	for <openbmc@archiver.kernel.org>; Thu,  7 Oct 2021 06:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA4C96105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ13S0wncz302W
	for <openbmc@archiver.kernel.org>; Thu,  7 Oct 2021 17:03:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Wy70ZNaE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=Wy70ZNaE; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ12k5PRhz2yHt
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 17:03:10 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id E2CE252;
 Wed,  6 Oct 2021 23:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1633586589;
 bh=BMDC3Op7w/U0rIg38TVt+UVWdc8mvdr7eIpHHCG/AdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wy70ZNaE+bRqJ+L8pts4q6urOnfg6qnsoWv2oYdXjwlnW6h7wT29/4rfHkq8hVVm6
 C1v5YmX6sEpnVEa0YBd9BL7ywbB98xJwyWCG4zEmlPV67NjzOZoONdsSnBI0uws8z0
 X9uzLIyHHpQU+SOYPpXUCHg9L2LnAmuHWjK/Y/4M=
Date: Wed, 6 Oct 2021 23:03:07 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 8/9] dt-bindings: document new 'dynamic' common property
Message-ID: <YV6Nm9jVeZ5Adte5@hatter.bewilderbeest.net>
References: <20211007000954.30621-1-zev@bewilderbeest.net>
 <20211007000954.30621-9-zev@bewilderbeest.net>
 <YV6FEisHXqdBuduZ@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YV6FEisHXqdBuduZ@kroah.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, Oct 06, 2021 at 10:26:42PM PDT, Greg Kroah-Hartman wrote:
>On Wed, Oct 06, 2021 at 05:09:53PM -0700, Zev Weiss wrote:
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>
>I know I can not take patches without any changelog text.  Maybe other
>maintainers are more "lax" :(
>

Okay -- for this one I wasn't sure what to put in the body that wasn't 
basically just duplicating the subject line or the content of the patch, 
but I'll make sure to put something there in the future.


Zev

