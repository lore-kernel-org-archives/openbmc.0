Return-Path: <SRS0=03jC=HU=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2049DC433DB
	for <openbmc@archiver.kernel.org>; Thu, 18 Feb 2021 13:00:03 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E0FB64ECC
	for <openbmc@archiver.kernel.org>; Thu, 18 Feb 2021 13:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E0FB64ECC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhFDG3ls4z30MV
	for <openbmc@archiver.kernel.org>; Thu, 18 Feb 2021 23:59:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
X-Greylist: delayed 716 seconds by postgrey-1.36 at boromir;
 Thu, 18 Feb 2021 23:59:42 AEDT
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhFCy0Shsz30Kw
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 23:59:41 +1100 (AEDT)
Received: from [192.168.0.6] (ip5f5aecdc.dynamic.kabel-deutschland.de
 [95.90.236.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id B4DDE20645D7E;
 Thu, 18 Feb 2021 13:47:40 +0100 (CET)
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout
To: "Anton D. Kachalov\"" <gmouse@google.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Rob Herring <robh+dt@kernel.org>
References: <20210218122546.3546582-1-gmouse@google.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <665439b1-f5b7-bcc9-22dd-134f4ce09f01@molgen.mpg.de>
Date: Thu, 18 Feb 2021 13:47:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210218122546.3546582-1-gmouse@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Dear Anton,


Thank you for your patch.


Am 18.02.21 um 13:25 schrieb gmouse@google.com:
> From: "Anton D. Kachalov" <gmouse@google.com>
> 
> This change satisfy OpenBMC requirements for flash layout.

Can you please list these requirements in the commit message? Maybe, 
also add OpenBMC to the commit message summary.

> Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> ---
>   arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
>   1 file changed, 8 insertions(+), 20 deletions(-)

[…]


Kind regards,

Paul
