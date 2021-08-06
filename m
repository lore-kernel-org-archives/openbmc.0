Return-Path: <SRS0=6yv1=M5=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5690C4338F
	for <openbmc@archiver.kernel.org>; Fri,  6 Aug 2021 05:18:35 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0AB960F21
	for <openbmc@archiver.kernel.org>; Fri,  6 Aug 2021 05:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0AB960F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ggtzr5P7sz3cWV
	for <openbmc@archiver.kernel.org>; Fri,  6 Aug 2021 15:18:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=47.88.44.36;
 helo=out4436.biz.mail.alibaba.com; envelope-from=guoheyi@linux.alibaba.com;
 receiver=<UNKNOWN>)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgtzQ4v0Lz30C7
 for <openbmc@lists.ozlabs.org>; Fri,  6 Aug 2021 15:18:09 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=10; SR=0; TI=SMTPD_---0Ui6.hXm_1628227062; 
Received: from B-G4TALVDL-1650.local(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0Ui6.hXm_1628227062) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 06 Aug 2021 13:17:43 +0800
To: openbmc <openbmc@lists.ozlabs.org>
From: Heyi Guo <guoheyi@linux.alibaba.com>
Subject: Question about NVMe MCTP in dbus-sensors
Message-ID: <6fa87e93-863e-94a6-651f-8d6126557553@linux.alibaba.com>
Date: Fri, 6 Aug 2021 13:17:42 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Iwona Winiarska <iwona.winiarska@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, Ed Tanous <ed@tanous.net>,
 Richard Thomaiyar <richard.marian.thomaiyar@linux.intel.com>,
 Sumanth Bhat <sumanth.bhat@linux.intel.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi,

We can see that NVMe sensors in dbus-sensors relies on MCTP to get 
hardware information. It is using libmctp interfaces to initialize MCTP 
and SMBus. However I don't find the code or component who is responsible 
as a bus owner, to discover endpoints, manager EID and update routing 
table. Isn't necessary for a central component to do such things? Will 
there be access conflict if non-NVMe devices (MCTP capable) are also 
connected to the same SMBus？

We also found another implementation from Intel: 
https://github.com/Intel-BMC/pmci. It implements mctpd to provide MCTP 
message transfer interfaces on D-Bus, while PLDM, NVME-MI and others can 
rely on the D-Bus interfaces instead of libmctp. In my opinion it seems 
to be a more mature solution for MCTP and higher PCMI management models. 
Is there any plan to accept such implementations into the mainline?

Thanks,

Heyi

