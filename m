Return-Path: <SRS0=kqm8=GB=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DFCC433E0
	for <openbmc@archiver.kernel.org>; Tue, 29 Dec 2020 14:55:20 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF851207CF
	for <openbmc@archiver.kernel.org>; Tue, 29 Dec 2020 14:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF851207CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D4yBs1vYWzDqGQ
	for <openbmc@archiver.kernel.org>; Wed, 30 Dec 2020 01:55:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D4y9D0z4TzDqGS;
 Wed, 30 Dec 2020 01:53:50 +1100 (AEDT)
IronPort-SDR: uZLQGffoOcVv+kxoyaZC6sc4i1NU/r+/2S+ubmGNtLr8ziRzJIkoKkzEJIjhYqe0gicXchtR5s
 R3CtFotVZgiA==
X-IronPort-AV: E=McAfee;i="6000,8403,9849"; a="156286674"
X-IronPort-AV: E=Sophos;i="5.78,458,1599548400"; d="scan'208";a="156286674"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2020 06:53:46 -0800
IronPort-SDR: naMXQxSTKeZ8d9ibYInaBR39K4Kl+cvc/FcMS3Zhbo88T5DLOPx+6kXEki6cXBSP6KYI/JOoMF
 EstTeOFCOc3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,458,1599548400"; d="scan'208";a="347412123"
Received: from shwdenpg096.ccr.corp.intel.com (HELO [10.67.104.88])
 ([10.67.104.88])
 by fmsmga008.fm.intel.com with ESMTP; 29 Dec 2020 06:53:42 -0800
Subject: Re: [PATCH v4 3/5] ipmi: kcs: aspeed: Adapt to new LPC DTS layout
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>, robh+dt@kernel.org,
 lee.jones@linaro.org, joel@jms.id.au, andrew@aj.id.au,
 linus.walleij@linaro.org, minyard@acm.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20201229063157.3587-1-chiawei_wang@aspeedtech.com>
 <20201229063157.3587-4-chiawei_wang@aspeedtech.com>
From: Haiyue Wang <haiyue.wang@linux.intel.com>
Message-ID: <d436cf38-7ce2-3bea-4d0e-03003e36af42@linux.intel.com>
Date: Tue, 29 Dec 2020 22:53:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201229063157.3587-4-chiawei_wang@aspeedtech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: BMC-SW@aspeedtech.com, cyrilbur@gmail.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On 12/29/2020 14:31, Chia-Wei, Wang wrote:
> Add check against LPC device v2 compatible string to
> ensure that the fixed device tree layout is adopted.
> The LPC register offsets are also fixed accordingly.
>
> Signed-off-by: Chia-Wei, Wang<chiawei_wang@aspeedtech.com>
> ---
>   drivers/char/ipmi/kcs_bmc_aspeed.c | 27 ++++++++++++++++-----------
>   1 file changed, 16 insertions(+), 11 deletions(-)

Acked-by: Haiyue Wang <haiyue.wang@linux.intel.com>



