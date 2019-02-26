Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44867d5P62zDq7n
 for <openbmc@lists.ozlabs.org>; Wed, 27 Feb 2019 05:01:15 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2019 10:01:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,416,1544515200"; d="scan'208";a="141819138"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga001.jf.intel.com with ESMTP; 26 Feb 2019 10:01:12 -0800
Date: Tue, 26 Feb 2019 10:01:12 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: OpenBMC Development <openbmc@lists.ozlabs.org>
Subject: New IPMI architecture coming soon to an OpenBMC near you
Message-ID: <20190226180112.GC44612@mauery.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
X-List-Received-Date: Tue, 26 Feb 2019 18:01:19 -0000

Last March at OCP, a new IPMI architecture was discussed. Plans were 
made and a proposal was written up. I started writing up the 
implementation and pushed the first round of patches in June. I 
demonstrated and discussed the changes at the last hackathon and 
answered questions and concerns in person. The series included changes 
in both ipmid and netipmid. I have lost count of the number of patches 
and number of revisions pushed, but they are finally ready to be merged.

For anyone that is interested in looking at the code, here is a link to 
the first patch in the series for ipmid and netipmid:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/11273
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-net-ipmid/+/11707

The changes should start off with very little impact to existing code. 
All of the legacy interfaces have been carefully coded around so they 
can be maintained until the existing handlers and bridges can be 
rewritten using the new APIs.

But new IPMI handlers should be written using the new APIs. After the 
core gets merged, I will start submitting changes to some of the 
existing handlers that can be used as examples for new code and for 
rewriting any other handlers.

This is just the first step. Here is a list of future work if anyone 
wants to step up and lend a hand:
1) Rework existing IPMI handlers to use the new handler API. This 
   includes the automatic parameter extraction as well as the 
   availability of asynchronous/yielding D-Bus calls.
2) Change existing IPMI bridges to use the new D-Bus interface. See the 
   netipmid implementation and the soon-to-be-pushed ipmitool 
   implementation as examples.
3) Reviewing code. The changes above plus all the new changes that are 
   coming into the IPMI projects generate a lot of changes to review. 
   Please have your friends and colleagues review your code. Seeing a 
   +1 from someone else helps.

--Vernon
