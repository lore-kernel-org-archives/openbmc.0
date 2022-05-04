Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA683C433F5
	for <openbmc@archiver.kernel.org>; Wed,  4 May 2022 07:22:40 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtSvz3Hgkz3bZ4
	for <openbmc@archiver.kernel.org>; Wed,  4 May 2022 17:22:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=X62oo+L0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=X62oo+L0; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtSvJ4cqWz2xCB
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 17:22:04 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 8481127B;
 Wed,  4 May 2022 00:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651648922;
 bh=sx0SctmyG9TOtwIaQSFtf68ixGOt40YgbnYjWyRrhuw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X62oo+L0uURQ4J/bspzv5N4OBv2LTgvA7vp+/L4Q792w4u6UA9edJNL4d6wepuPBf
 cehTyrf783Yc9C7Dd8OuCxFepA8OxH/spZpUO/F5v27jFRznhUZeDig9NB0e8cCAL0
 sNxi1LV9gVYX14co9uNTu+HVwP49DesxBlGMZZSU=
Date: Wed, 4 May 2022 00:22:01 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH 0/6] regulator: core: Add support for external outputs
Message-ID: <YnIpmdoQTm1gb4fp@hatter.bewilderbeest.net>
References: <20220504065041.6718-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220504065041.6718-1-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, May 03, 2022 at 11:50:35PM PDT, Zev Weiss wrote:
>Hello,
>
>This patch series is a new approach at implementing some functionality
>I previously attempted as a separate driver in drivers/misc [0], but I
>think (as suggested by Greg in that thread) ultimately makes more
>sense being built into the regulator subsystem.
>

<snip>

Sorry for the broken threading here (missed a comma in the CC list on 
patch 1 that 'git send-email --dry-run' didn't catch, then forgot to add 
the necessary flags on the second attempt to tack it onto this cover 
letter from the first).

In case it's not obvious, the patches corresponding to this are here: 
https://lore.kernel.org/openbmc/20220504065252.6955-1-zev@bewilderbeest.net/T/


Zev

