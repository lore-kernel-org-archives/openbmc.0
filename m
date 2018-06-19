Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Bix3hOvA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SYqoqSLU"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418pHj20zfzDrcd
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 10:09:53 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 095982220A;
 Mon, 18 Jun 2018 20:09:51 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Mon, 18 Jun 2018 20:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=zMmTBGgCAwSLHkgsdM8nSb6gyoU8I
 Qu1SGLpYJX4xJQ=; b=Bix3hOvA4r7ZGP2MefgSmQ3TVEtQzRsMrycVce9YTcAg8
 EL6zSodLPKNjSPmoEO/ThH6Q9pdhePbohZrNd2JpVq3atl3NljayFgVumvlz12AT
 S+omQiX+4yQ5niGyE1qS4PUWv9YuQG5NdUryruGteiu+Rt8jZP/SJYr7LzfJWClE
 fgIdYmxpthWpx8NXNcleo8K6SYitUGJQiDKtRHZOG711+QY3nB3mxMQEazS6AXxD
 tiCfnFBFWTLCH8mFDR0O+5YX8/UWd8wnyx3zoFNxvTnLv80aPEx2G34FpTl87N2+
 yN8qXMoFxjZqHTVRL9dghi8x/+n1bTzmMnHoFRP8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zMmTBG
 gCAwSLHkgsdM8nSb6gyoU8IQu1SGLpYJX4xJQ=; b=SYqoqSLUUORGRes2NRj9Gy
 EHW0rF09YakjmplWVfDktaHMVpzGkqyc+9ncj2lKjCvNAx8tUDw46g6CHGYsXDsg
 NZAEC4gRR9cVedOD+f1xv9lOLZlHn4ArR/ViBlpwZ8VbsuleUJMZ8H+oQps3PXR+
 tUEmkXXdZaFweV+P7KjZ9HepMq5OGsWpOuwF4Pn/hkzNggSfy1YEytBvnXvoRiTo
 aGk/yIiysDWSl0fIL5m1wPUHEzHoWVrRaPqNgwPYSBKWhlWM7LhlI4VYzdmSCZIj
 05fLrhs45mMDBvxHbXJrq8Pqr82z1zQz+thw1/3mClycHyu4up0KtZfOScaiJ3XA
 ==
X-ME-Proxy: <xmx:zkkoW6XI71eMuGAM6FciWDENEQX-NvmvMYNdDRN7tTxtpVDS1kzNmQ>
 <xmx:zkkoW0a6mMbDxfKh6DLX8k172r1DTcOIJX8TG5Ya138Q5rIAW_J7DQ>
 <xmx:zkkoW41pK-C5JcYnweuLYPuFQoMjYA4TcQa48wO0gg8RZI_E3lkNwQ>
 <xmx:zkkoW-js4lU1a-jXm0QxQIv1uvBhjOZA5o21_NBOedY5djOSAXPyGA>
 <xmx:zkkoW0ZiQpDJZyBlHyZMm_Om8FFmiiljsGRsde-wWFR1gbDNPUI7bQ>
 <xmx:z0koW6R2lHgtF6sLm6_R7j3u-2tkJwEAV8bFQPqWyKUAJKnC2L65qw>
X-ME-Sender: <xms:zkkoW2Soc3LCb6lEwGNyeEyIaCVvVjxlJDu44sFNW0jecfzBp67p2w>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id D815FBA43D; Mon, 18 Jun 2018 20:09:50 -0400 (EDT)
Message-Id: <1529366990.3787335.1412480968.730F3C69@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: AKASH G J <akashgj91@gmail.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-498d70f2
Subject: Re: Kernel panic - not syncing: VFS: Unable to mount root fs
References: <CAE33tLHWM53+r8D8g+q3Kc1odXgu6K+koR=oYwCi16tYXokoMw@mail.gmail.com>
Date: Tue, 19 Jun 2018 09:39:50 +0930
In-Reply-To: <CAE33tLHWM53+r8D8g+q3Kc1odXgu6K+koR=oYwCi16tYXokoMw@mail.gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jun 2018 00:09:53 -0000

Hi Akash,

On Mon, 18 Jun 2018, at 14:52, AKASH G J wrote:
> Hi Team,
> 
> 
> I tried to boot the Linux image and root file system into a board
> containing BMC Aspeed ast-2500. The booting process failed with following
> errors.
> 
> 
> *[ 6.186180] No filesystem could mount root, tried: [ 6.186186] squashfs*
> *6.194822]* *Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(1,0)*
> 
> 
> I think the problem with *squashfs* root file system image. How can I
> create *cpio.lzma.u-boot* image for root file system using bitbake.

You can create a cpio.lzma.u-boot image using instructions in the commit message of this change:

https://gerrit.openbmc-project.xyz/#/c/1957/

Hope that helps. If you or your employer have signed the OpenBMC CLA, it might be worth contributing a patch to the docs repo outlining what's required - this is the second time the question has been asked recently.

Andrew
