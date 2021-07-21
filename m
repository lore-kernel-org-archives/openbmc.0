Return-Path: <SRS0=JShZ=MN=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDB1C6377E
	for <openbmc@archiver.kernel.org>; Wed, 21 Jul 2021 23:29:12 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 927B36128E
	for <openbmc@archiver.kernel.org>; Wed, 21 Jul 2021 23:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 927B36128E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVWxf0NlVz30Mp
	for <openbmc@archiver.kernel.org>; Thu, 22 Jul 2021 09:29:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=FA5Ym+Gs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=jk@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=FA5Ym+Gs; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVWx23CdJz2yLK;
 Thu, 22 Jul 2021 09:28:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GVWwx0lfNz9sV8;
 Thu, 22 Jul 2021 09:28:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1626910114; bh=GoKHY31AUl/WmIbrWvstEpC6nwWnu/aYYQ5eVh88pmQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=FA5Ym+Gs70MifbuFfkuM8sCA6mPXNMq4AZgTsP743W2eJikolBaegABYpt7ziNCX0
 YpbZ741z/evpIlqL0SNxLPw0AS5PEC0fMzizB5sG4pk7CscPu4KzNFlHg1OHNrKZwo
 wkOPAxugW5aO8km38+a3cmYqrWg5x5Da6PW4D9IHTXK0qi46nu/zj+Eg6OtIo7yQeR
 hOB+s8+o5p9RGW7ebPM2LQ/Qt305lDSU6dZ4v5aV6gUSCyVklP9F+G9wHbnK+pD+x8
 oDIXfKB6LbMNExnTOnUJCeyIPs0tXjbw4k8UR1Jj7/LBdpIh+7w23MeXjc573Os2zg
 VNwEbve7Xomag==
Message-ID: <de6a55a881eae463014af0fe165b60a378773d1d.camel@ozlabs.org>
Subject: Re: [PATCH 3/3] fsi: occ: Add dynamic debug to dump command and
 response
From: Jeremy Kerr <jk@ozlabs.org>
To: Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org
Date: Thu, 22 Jul 2021 07:28:27 +0800
In-Reply-To: <20210716151850.28973-4-eajames@linux.ibm.com>
References: <20210716151850.28973-1-eajames@linux.ibm.com>
 <20210716151850.28973-4-eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, openbmc@lists.ozlabs.org,
 linux@roeck-us.net, linux-fsi@lists.ozlabs.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Eddie,

> Use the dynamic branching capability of the dynamic debug subsystem
> to dump the command and response with the correct OCC device name.

Would this be better done with a tracepoint? Given it's a fairly
well-defined pair of events, and there's data to dump in both cases.

We have a couple of existing tracepoionts in the core code if that
helps...

Cheers,


Jeremy

