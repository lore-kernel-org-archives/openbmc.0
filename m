Return-Path: <SRS0=dV0T=OD=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070A3C433F5
	for <openbmc@archiver.kernel.org>; Mon, 13 Sep 2021 15:30:24 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D8DB61056
	for <openbmc@archiver.kernel.org>; Mon, 13 Sep 2021 15:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D8DB61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zankapfel.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7VmG1b38z2ymy
	for <openbmc@archiver.kernel.org>; Tue, 14 Sep 2021 01:30:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=zankapfel.net
 (client-ip=2a03:4000:6:113f:0:1ce:1ce:babe; helo=zankapfel.net;
 envelope-from=phil@zankapfel.net; receiver=<UNKNOWN>)
X-Greylist: delayed 417 seconds by postgrey-1.36 at boromir;
 Tue, 14 Sep 2021 01:29:56 AEST
Received: from zankapfel.net (zankapfel.net
 [IPv6:2a03:4000:6:113f:0:1ce:1ce:babe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7Vlm3tYqz2xfJ
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 01:29:56 +1000 (AEST)
Received: by zankapfel.net (Postfix, from userid 110)
 id 97D8E12173A; Mon, 13 Sep 2021 17:22:52 +0200 (CEST)
Received: from zankapfel.net (localhost [IPv6:::1])
 by zankapfel.net (Postfix) with ESMTP id 59240121736;
 Mon, 13 Sep 2021 17:22:50 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 13 Sep 2021 17:22:50 +0200
From: Phil Eichinger <phil@zankapfel.net>
To: Heyi Guo <guoheyi@linux.alibaba.com>
Subject: Re: [Question] How can we use underscore "_" in sensor name?
In-Reply-To: <3a702375-de87-985d-d096-7f187d293459@linux.alibaba.com>
References: <3a702375-de87-985d-d096-7f187d293459@linux.alibaba.com>
Message-ID: <1a17bc685cf90247a3feb5776f1b029b@zankapfel.net>
X-Sender: phil@zankapfel.net
User-Agent: Roundcube Webmail/1.3.16
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On 2021-09-13 12:49, Heyi Guo wrote:
> Hi all,
> 
> Can we use underscore "_" in IPMI sensor names? Now we see that "_" in
> sensor names will be replaced with space in the code, even if we
> really use "_" for sensor names in json configuration files.
> 
> The background is that we used underscore "_" in sensor names in
> legacy BMC, and all the OOB software uses such names to get sensor
> data. Therefore we want to make it compatible for switching to
> OpenBMC.
> 
> Is there any way to achieve this?

This works here, using phosphor-hwmon, it does not replace underscores 
in sensor names.
DBus should allow this: "Each element must only contain the ASCII 
characters "[A-Z][a-z][0-9]_"
phosphor-webui however does replace underscores with spaces.

Cheers
Phil
