Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44nsT739SdzDq6y
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 02:28:26 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Apr 2019 09:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,382,1549958400"; d="scan'208";a="142651068"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga008.fm.intel.com with ESMTP; 22 Apr 2019 09:28:23 -0700
Subject: Re: Redfish OEM commands in OpenBMC
To: openbmc@lists.ozlabs.org
References: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
 <643f8054-6232-4857-b06a-fbb04fdfb8ad@www.fastmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <befb7c7d-ec0d-436e-318b-e49b01627cdb@intel.com>
Date: Mon, 22 Apr 2019 09:28:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <643f8054-6232-4857-b06a-fbb04fdfb8ad@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Mon, 22 Apr 2019 16:28:28 -0000

On 4/17/19 10:26 PM, Andrew Jeffery wrote:
> 
> 
> On Wed, 17 Apr 2019, at 04:33, Andrew Geissler wrote:
> 
> I'd be more cautious here - breaking the OpenBMC kernel ABI due to carrying
> patches that are not yet upstreamed isn't great, but we can adapt userspace
> without breaking the external interface to OpenBMC. Breaking the external
> interface to OpenBMC is much worse from a user perspective. Essentially, you
> need to be prepared to support the OEM extensions well beyond standardisation
> of the non-OEM equivalent.

YES! exactly this.

> 
> RFC6648[1] seems informative here:
> 
> Deprecating the "X-" Prefix and Similar Constructs in Application Protocols
> 

I never thought of that as similar, but that's almost exactly the same
idea.  I had no idea that document even existed.
