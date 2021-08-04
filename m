Return-Path: <SRS0=F+05=M3=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7715DC4338F
	for <openbmc@archiver.kernel.org>; Wed,  4 Aug 2021 19:43:48 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C545960F58
	for <openbmc@archiver.kernel.org>; Wed,  4 Aug 2021 19:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C545960F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg2H565R3z3cRy
	for <openbmc@archiver.kernel.org>; Thu,  5 Aug 2021 05:43:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg2Gh5hfYz3bnJ
 for <openbmc@lists.ozlabs.org>; Thu,  5 Aug 2021 05:43:23 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="277755405"
X-IronPort-AV: E=Sophos;i="5.84,295,1620716400"; d="scan'208";a="277755405"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2021 12:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,295,1620716400"; d="scan'208";a="668208530"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 04 Aug 2021 12:42:18 -0700
Received: from [10.209.9.147] (jmbills-MOBL.amr.corp.intel.com [10.209.9.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id DA6C75808EF;
 Wed,  4 Aug 2021 12:42:17 -0700 (PDT)
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 bradleyb@fuzziesquirrel.com
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Requesting maintainer privilege on smbios-mdr repo
Message-ID: <59d36746-4a19-025b-1a43-9ec2bde0307c@linux.intel.com>
Date: Wed, 4 Aug 2021 13:42:17 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
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

Hi Brad,

We have lost a couple of the maintainers for the smbios-mdr repo 
(https://github.com/openbmc/smbios-mdr), so we are trying to add a new one.

If I understand the process, we just need to add them to this list: 
https://github.com/orgs/openbmc/teams/smbios-mdr-maintainers/members. 
However, it looks like the "maintainer" of the list is one of the people 
who left, so nobody on our side has permission to add new members to 
that list anymore.

Do you have permissions to add me to the list, so I can update it with 
the new maintainers from Intel?

Thanks!
-Jason
