Return-Path: <SRS0=cbAk=GR=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5893C433E0
	for <openbmc@archiver.kernel.org>; Thu, 14 Jan 2021 19:23:01 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3247023B1A
	for <openbmc@archiver.kernel.org>; Thu, 14 Jan 2021 19:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3247023B1A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGvNL60vFzDrj8
	for <openbmc@archiver.kernel.org>; Fri, 15 Jan 2021 06:22:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGvLT70ndzDrg8
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 06:21:18 +1100 (AEDT)
IronPort-SDR: BuCiHzjdmCjlsS9Yuc3NxDaK7++OnViy+ymHoyX7qQWBBrCQ5ex74O/Ig1Qmc8yEMa6JVDTK2L
 gd6+Z6ubf4kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="175830990"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="175830990"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 09:39:03 -0800
IronPort-SDR: P1cnScJjSSfvphmcCHExB5/Yt63wJOXHEqPAjBo506ErRdWqGXjZMPNXL6r0NDkN/DQBwdsrz0
 zb5CXEJ4SeWA==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="400982412"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 09:39:03 -0800
Date: Thu, 14 Jan 2021 09:39:01 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Call for volunteers
Message-ID: <20210114173901.GC45289@mauery.jf.intel.com>
References: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On 11-Jan-2021 04:09 PM, Brad Bishop wrote:
>Hello OpenBMC-ers!
>
>Your TSC has been aware of the problem of fragmentation in our project for some
>time.  Fragmentation is a loose term - for the purposes of this note consider
>it to be any time contributor efforts in the community are duplicated without
>thought given to maintenance and/or compatibility.
>
>To begin to address this issue the TSC is looking for volunteers to serve on a
>"repository review forum" to which the TSC will initially delegate its
>authority in the areas of:
>- new repository creation
>- placement of contributed new function into existing repositories
>
>The TSC fully expects the scope of this forum to quickly grow into the role of
>a traditional TSC providing frequent, technical oversight to project
>contributors.  The current TSC will continue to serve the project in terms of
>governance, advocacy and industry exposure - and likely get a rename (OpenBMC
>Board? or OpenBMC Steering Committee?) in the process.
>
>The new forum would meet periodically or at the demand of other forum members
>to:
>- raise the forums combined awareness of new function under development
>  (information exchange)
>- build a consensus within the forum on where the function should exist
>- inform the function contributor and the rest of the community of the decision
>
>A successful forum would be a forum that can simultaneously encourage the
>contribution of new and innovative solutions to existing problems without
>introducing complexity to the project as a whole.
>
>A successful forum member will have previously demonstrated a breadth of
>understanding of the upstream OpenBMC codebase through:
>- frequent participation in peer review, the mailing list, IRC, and Discord.
>- submission of high quality designs and code to upstream OpenBMC
>  (github.com/openbmc)
>- a history of working with and guiding less experienced OpenBMC developers
>  in a timely manner, enabling them to come up to speed quickly.
>
>If you are interested in serving the project in this manner, please reply to
>submit yourself as a candidate.

I will volunteer as well.

--Vernon
