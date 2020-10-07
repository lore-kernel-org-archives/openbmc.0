Return-Path: <SRS0=jtpY=DO=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4CAC4363C
	for <openbmc@archiver.kernel.org>; Wed,  7 Oct 2020 19:50:14 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5472206F4
	for <openbmc@archiver.kernel.org>; Wed,  7 Oct 2020 19:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5472206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C64gQ3NzQzDqNQ
	for <openbmc@archiver.kernel.org>; Thu,  8 Oct 2020 06:50:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C64ds3ysczDqNF
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 06:48:48 +1100 (AEDT)
IronPort-SDR: NEoQ76kN/0UHwoRY3b9W5w8IYnzkZ0ul9h3+zWDwDy75xwOKB/j35Abo7LCDsBZjMmj0fpcBcs
 PENQg+WQopYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="165183602"
X-IronPort-AV: E=Sophos;i="5.77,348,1596524400"; d="scan'208";a="165183602"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2020 11:21:43 -0700
IronPort-SDR: uAQh6IP4JctfNxI1ZBb+5GYxJl+IJjD6HTAkZZU8mG+wNYbnBLoXJzFdQ17ZPlQwucL2oLX4TX
 0ij89HjO90xg==
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; d="scan'208";a="311857802"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.69.69])
 ([10.209.69.69])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2020 11:21:39 -0700
From: James Feist <james.feist@linux.intel.com>
Subject: Heading out
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <9ca9dd09-b381-d0e9-bd63-9a23496c97e1@linux.intel.com>
Date: Wed, 7 Oct 2020 11:21:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi everyone,

This will be my last week on the OpenBMC project. I'll be moving on to 
something unrelated to OpenBMC. It's been great working with you all. 
All the repos I maintain have additional maintainers who will continue 
to maintain those projects. I'll begin removing myself from the 
maintainers lists shortly.

Best of luck with the project,

-James

feistjj@gmail.com
