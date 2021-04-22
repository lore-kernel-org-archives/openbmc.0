Return-Path: <SRS0=FvJ2=JT=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3555C433ED
	for <openbmc@archiver.kernel.org>; Thu, 22 Apr 2021 01:55:20 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A22F61409
	for <openbmc@archiver.kernel.org>; Thu, 22 Apr 2021 01:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A22F61409
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQgVG1Nbqz3027
	for <openbmc@archiver.kernel.org>; Thu, 22 Apr 2021 11:55:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1642 seconds by postgrey-1.36 at boromir;
 Thu, 22 Apr 2021 11:54:58 AEST
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQgTt1CS3z2xy3
 for <openbmc@lists.ozlabs.org>; Thu, 22 Apr 2021 11:54:56 +1000 (AEST)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 13M1GeST030118
 for <openbmc@lists.ozlabs.org>; Thu, 22 Apr 2021 09:16:40 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 13M1FcYR030073;
 Thu, 22 Apr 2021 09:15:38 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 22 Apr
 2021 09:26:33 +0800
Date: Thu, 22 Apr 2021 01:26:28 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: u-boot update for ast2600
Message-ID: <20210422012628.GA1315@aspeedtech.com>
References: <CACPK8XcXTq1tzQ=aLa8pEKyt3WBWWfj18vhh9ks1DxDn+T+i7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACPK8XcXTq1tzQ=aLa8pEKyt3WBWWfj18vhh9ks1DxDn+T+i7g@mail.gmail.com>
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 13M1FcYR030073
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
Cc: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Joel,

The 04/22/2021 07:50, Joel Stanley wrote:
> Hello OpenBMCers who care about u-boot,
> 
> I've updated OpenBMC u-boot tree to use ASPEED's latest SDK,
> v00.03.03. I've also applied the series to support for FIT
> verification including use of the HACE to perform SHA hashing that
> I've been working on with Klaus. The bump is here:
> 
>  https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/42502
> 
> I've sent a set of fixes backported from mainline to ASPEED for
> merging in a future SDK release:
> 
>  https://github.com/AspeedTech-BMC/u-boot/pull/7
> 
> We still have a number of patches carried that are specific to
> OpenBMC, and of course the new FIT and HACE support.
> 
> My focus is on supporting u-boot on ast2600 with eMMC. I test this
> mostly in Qemu with Cédric's aspeed-6.0 branch:
> 
> https://github.com/shenki/qemu-boot-test/
> 
> I do  run u-boot from NOR on the ast2600a2 evb I have, but I would
> encourage testing from others if they care about this platform setup
> as it gets much less attention from me.
> 
> Cheers,
> 
> Joel

I have a ast2600a2 evb configured with boot from eMMC, so I could help to
verify it.  Could you provid me the image or the instructions to build
it?

Thanks,
Troy Lee
