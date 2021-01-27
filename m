Return-Path: <SRS0=cMHj=G6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804C6C433DB
	for <openbmc@archiver.kernel.org>; Wed, 27 Jan 2021 22:08:18 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E80F64D9D
	for <openbmc@archiver.kernel.org>; Wed, 27 Jan 2021 22:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E80F64D9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQyR33X6nzDr3N
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 09:08:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DQqjS3z6HzDqcG
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 04:05:11 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C99FD1FB;
 Wed, 27 Jan 2021 09:05:07 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.42.54])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58F4E3F66E;
 Wed, 27 Jan 2021 09:05:06 -0800 (PST)
Date: Wed, 27 Jan 2021 17:05:03 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Bruce Mitchell <Bruce.Mitchell@ibm.com>
Subject: Re: SMP platform_can_cpu_hotplug() for the AST2600
Message-ID: <20210127170503.GB66953@C02TD0UTHF1T.local>
References: <OF6FAB2611.F453A139-ON0025866A.00599AC8-8825866A.005B7C0E@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OF6FAB2611.F453A139-ON0025866A.00599AC8-8825866A.005B7C0E@notes.na.collabserv.com>
X-Mailman-Approved-At: Thu, 28 Jan 2021 09:07:05 +1100
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
Cc: BMC-SW@aspeedtech.com, openbmc@lists.ozlabs.org, troy_lee@aspeedtech.com,
 ryan_chen@aspeedtech.com, chiawei_wang@aspeedtech.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hello,

On Wed, Jan 27, 2021 at 08:39:15AM -0800, Bruce Mitchell wrote:
> I have discussed this on Discord OpenBMC on kernel-and-uboot, but I do not
> believe everyone is using Discord so I am expanding to a larger audience.

If you're after upstream arm kernel folk, please Cc the linux-arm-kernel
mailing list (AKA LAKML):

  linux-arm-kernel@lists.infradead.org

... which should reach most people in that space.

You can subscribe to the list or view the archives at:

  https://lists.infradead.org/mailman/listinfo/linux-arm-kernel

> I am going to be implementing SMP hotplug for the AST2600.
> Looking to see if ASPEED has any preference or suggestions regarding cpu_kill
> and cpu_die for CONFIG_HOTPLUG_CPU
> that platform_can_cpu_hotplug() builds on so as to round out the SMP
> implementation.
>
> This is currently preventing kexec_load() from succeeding.

IIUC this is 32-bit arm, for which I'm not the best contact, but there
are a number of people subscribed to LAKML who should be able to help.

Thanks,
Mark.
