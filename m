Return-Path: <SRS0=b6CT=GW=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CD9C433DB
	for <openbmc@archiver.kernel.org>; Tue, 19 Jan 2021 14:24:32 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A3A5205ED
	for <openbmc@archiver.kernel.org>; Tue, 19 Jan 2021 14:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A3A5205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKrWc59JbzDr1G
	for <openbmc@archiver.kernel.org>; Wed, 20 Jan 2021 01:24:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jozef.wludzik@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKrTx4fj8zDqWd
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 01:22:53 +1100 (AEDT)
IronPort-SDR: 6BAb0zR2362TZUte0euUT2/i0U4/691YLo3oR3strVbb0qiwoHYtL1Cyp+QRJa5fisURnXtcDa
 MJRTPM3F4BCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="158112633"
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; d="scan'208";a="158112633"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 06:22:48 -0800
IronPort-SDR: tz+BoYez9tz7y52upVq1LzyUFBtPs91/rLEBRiEyNRtSqjNrPtDqH2oVhRUhya+S7h8N3IwDUO
 peYrjdzchmiw==
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; d="scan'208";a="426485636"
Received: from jwludzik-mobl.ger.corp.intel.com (HELO [10.213.19.222])
 ([10.213.19.222])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 06:22:48 -0800
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: "Wludzik, Jozef" <jozef.wludzik@linux.intel.com>
Subject: Discrete Sensors in OpenBMC
Message-ID: <9d53ed62-7d4f-6c0a-a52d-34ae690d84e8@linux.intel.com>
Date: Tue, 19 Jan 2021 15:22:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Does anyone use or implement discrete sensor in OpenBMC? Redfish defines 
discrete triggers that use discrete values to detect that threshold is 
crossed and trigger action should be commited. Redfish does not mention 
about discrete sensor/values in other topics/schemes than Telemetry 
(e.g. MetricDefinition, MetricReportDefinition and MetricReport). I am 
asking about it because we are trying to find an example of discrete 
sensor to proceed with DiscreteTriggers implementation (aka Discrete 
thresholds) from Triggers scheme.

Ref.:

Redfish Telemetry White Paper - 
https://www.dmtf.org/sites/default/files/standards/documents/DSP2051_1.0.0.pdf

Thanks,
Jozef

