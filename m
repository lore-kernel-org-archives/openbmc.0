Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E5DC4332F
	for <openbmc@archiver.kernel.org>; Wed, 28 Dec 2022 10:32:21 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nhnrz64gkz3bh4
	for <openbmc@archiver.kernel.org>; Wed, 28 Dec 2022 21:32:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NhnrH4M3Gz3bVs
	for <openbmc@lists.ozlabs.org>; Wed, 28 Dec 2022 21:31:42 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aeff1.dynamic.kabel-deutschland.de [95.90.239.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 701C260293A85;
	Wed, 28 Dec 2022 11:31:37 +0100 (CET)
Message-ID: <f985177b-6ff5-a38c-8bd4-287ea75694f1@molgen.mpg.de>
Date: Wed, 28 Dec 2022 11:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] Add Supermicro X13DEM BMC machine
To: Ryan Sie <lesly895@gmail.com>
References: <20221228062007.1989410-1-ryans@supermicro.com.tw>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20221228062007.1989410-1-ryans@supermicro.com.tw>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Ryan Sie <ryans@supermicro.com.tw>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Dear Ryan,


Thank you for the patch. (Just as a heads-up, the “same” one 
(Message-Id: <20221228062232.2003139-1-ryans@supermicro.com.tw>) was 
sent two minutes later.)

Am 28.12.22 um 07:20 schrieb Ryan Sie:
> Signed-off-by: Ryan Sie <ryans@supermicro.com.tw>

The address used here is different from the author address. I thought, 
`git send-email` would take care of that, but Google Mail, used by 
Supermicro(?), seems to modify something:

     X-Google-Original-From: Ryan Sie <ryans@supermicro.com.tw>

Maybe the `git send-email`’s switch `--from` helps.

Additionally, please amend the commit message, with more details about 
the BMC, and note the datasheet name and revision you used.

> ---
>   arch/arm/boot/dts/Makefile                    |   1 +
>   .../boot/dts/aspeed-bmc-supermicro-x13dem.dts | 476 ++++++++++++++++++
>   2 files changed, 477 insertions(+)
>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts

[…]


Kind regards,

Paul
