Return-Path: <SRS0=uxIs=K4=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FCFC47083
	for <openbmc@archiver.kernel.org>; Wed,  2 Jun 2021 17:01:31 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA0561C83
	for <openbmc@archiver.kernel.org>; Wed,  2 Jun 2021 17:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AA0561C83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwFfx3dV1z301t
	for <openbmc@archiver.kernel.org>; Thu,  3 Jun 2021 03:01:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwFfW0hYwz2ym5
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jun 2021 03:01:05 +1000 (AEST)
IronPort-SDR: p4V6wD2MCJ5jnZh2CfMOSFH4EZavZ4Prap8jV+VX+PXFJUMasbS7/wehpjvf6jOxzFRnW1L/Yb
 vwHRuBZmz38A==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="289468076"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="289468076"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 09:59:57 -0700
IronPort-SDR: GWgs9zmeVD60vW41nhq/WL90hH8+I1eOe0uo9PyZSAuuiNcwMFLDxqO0E5qSfkj93lNTZzAmEx
 ch71F0aBqNWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="549512326"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 02 Jun 2021 09:59:56 -0700
Received: from [10.212.203.88] (jmbills-MOBL.amr.corp.intel.com
 [10.212.203.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3C71D5807D4
 for <openbmc@lists.ozlabs.org>; Wed,  2 Jun 2021 09:59:56 -0700 (PDT)
Subject: Re: SEL Event logs in Redfish
To: openbmc@lists.ozlabs.org
References: <SG2PR04MB30931F4EAC5DC1D4E968631EE1229@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <85157600-4832-42bd-8f4d-87757153b732@linux.intel.com>
 <CAGm54UFm59ApCAV7DKdgfUGfjdok8dVs8ng6Brj0VXxMsrj=AQ@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <e37ada9e-3a83-dff8-06d5-6013d5572415@linux.intel.com>
Date: Wed, 2 Jun 2021 09:59:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAGm54UFm59ApCAV7DKdgfUGfjdok8dVs8ng6Brj0VXxMsrj=AQ@mail.gmail.com>
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



On 6/1/2021 7:32 PM, Lei Yu wrote:
> On Wed, Jun 2, 2021 at 3:05 AM Bills, Jason M
> <jason.m.bills@linux.intel.com> wrote:
>>
>>
>>
>> On 5/28/2021 1:58 AM, Jayashree D wrote:
>>> Classification: Public
>>>
>>> Hi Jason,
>>>
>>> In journalctl log, I found that the sensor value is crossed the threshold value.
>>> But when I tried in Redfish API, I am not able to see any logs, whether anything I am missing here ?
>>> Could you please provide suggestions on this .
>> Unfortunately, we ran into trouble trying to persist the journal to
>> flash, so we have one additional layer where rsyslog watches for any
>> journal entries that have a "REDFISH_MESSAGE_ID" metadata and logs them
>> to '/var/log/redfish' where bmcweb pulls them for the Redfish EventLog.
>>
>> https://github.com/openbmc/openbmc/blob/master/meta-intel-openbmc/meta-common/recipes-extended/rsyslog/rsyslog/rsyslog.conf#L66
>>
>> If you have the journal event, I'd check if you have 'var/log/redfish'
>> populated with that event.  If not, you may need to add the above config
>> to rsyslog to create it and that will hopefully fix the event in Redfish.
> 
> There is a limitation about the way to log SEL event to
> /var/log/redfish, that it only appears in redfish event logs, but not
> in ipmi sel.
When using journal-based logging, the IPMI sel events are in 
'/var/log/ipmi_sel'.
> 
> On g220a it still uses the logging service to represent the event log
> (see [1]), and ipmid is updated to consume the logging entries to get
> the SEL entries.
I would expect that the same logging approach would be used for both 
IPMI SEL and Redfish.  So, either both will use journal-based logging or 
both will use D-Bus logging. I don't know if it would work to mix them.

> The missing part is in bmcweb that it does not support the event log
> entries from DBus. We could probably add some new code to make it
> support consuming data from logging service, and it could be
> implemented under a config, so that the user could config which data
> source to get event log at compile time.
I believe that bmcweb supports Redfish event logs from D-Bus log entries 
with this option: 
https://github.com/openbmc/bmcweb/blob/master/meson_options.txt#L21.

> 
> [1]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Logging/SEL.metadata.yaml
> 
