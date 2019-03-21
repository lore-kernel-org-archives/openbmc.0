Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QHPr16y0zDqSC
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 06:47:42 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Mar 2019 12:47:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,253,1549958400"; d="scan'208";a="216325805"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga001.jf.intel.com with ESMTP; 21 Mar 2019 12:47:38 -0700
Date: Thu, 21 Mar 2019 12:47:38 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: IPMID crashing
Message-ID: <20190321194738.GF44612@mauery.jf.intel.com>
References: <581CE770-69F0-404F-9D87-8378753457C6@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <581CE770-69F0-404F-9D87-8378753457C6@fb.com>
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
X-List-Received-Date: Thu, 21 Mar 2019 19:47:45 -0000

On 21-Mar-2019 07:38 PM, Vijay Khemka wrote:
>Anyone is seeing ipmid crashing. I have checkedout openbmc today and seeing ipmid is crashing with following message
>
>realloc(): invalid next size

What was it doing? What IPMI command was running when it crashed? What 
provider libraries do you have it loading?

--Vernon
