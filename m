Return-Path: <SRS0=f1Ef=DF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6885DC2D0A8
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 19:02:50 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D85820809
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 19:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D85820809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0X2v0R5BzDqHR
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 05:02:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0X1M0xz5zDqQb
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 05:01:25 +1000 (AEST)
IronPort-SDR: whYO/94r7XcFN8WA/BsatXfAwz69bDSYMClbnprdh0Rtu6mYnlRsF/QWnaEhvf0Crg0WFeU1i6
 pG2G3pCab8Bg==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="226192784"
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="226192784"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 12:01:18 -0700
IronPort-SDR: d6hZ5KWr2U6CXJ1189MeMIszfAVarrdvmiINslfvdmTBuRx93RDcn+eWoBX5KDi0amdV5bKsUg
 DLk3HDo3xp2Q==
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="311895273"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.255.230.208])
 ([10.255.230.208])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 12:01:18 -0700
Subject: Re: [PATCH 0/2] PECI patchset tweaks
To: Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org
References: <20200926212734.23836-1-zev@bewilderbeest.net>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <4d313c8c-7f73-8e45-1480-9497be6df400@linux.intel.com>
Date: Mon, 28 Sep 2020 12:01:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200926212734.23836-1-zev@bewilderbeest.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Jason M Biils <jason.m.bills@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hello Zev,

On 9/26/2020 2:27 PM, Zev Weiss wrote:
> [Re-sending as I clumsily typoed the mailing list's address on the
> first attempt; apologies for the duplication.]
> 
> Hello,
> 
> These patches address a few small things I noticed with the PECI patch
> set currently in the OpenBMC kernel tree.  Assuming they're deemed
> acceptable, I'd of course hope they get folded in to the version of
> the PECI code that gets upstreamed into the mainline kernel.
> 
> (Please let me know if there's some other way I should send this -- I
> looked for but couldn't find a gerrit repo for the obmc kernel or any
> kernel-specific patch submission instructions in
> openbmc/docs/CONTRIBUTING.md, so 'git send-email' is my best guess.)

This mailing list would be a right place as long as the PECI patch set
is in OpenBMC kernel tree but in case if it is removed from the tree
later (probably from the 5.9 kernel), you may need to use pull request
through https://github.com/Intel-BMC/openbmc when it replaces the
kernel repo with forked kernel.

Thanks,
Jae

> 
> Thanks,
> Zev
> 
> 
