Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Fgp95spkzDq5f
 for <openbmc@lists.ozlabs.org>; Fri,  8 Mar 2019 06:35:27 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2019 11:35:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,451,1544515200"; d="scan'208";a="123576164"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga008.jf.intel.com with ESMTP; 07 Mar 2019 11:35:25 -0800
Subject: Re: Initial MCTP design proposal
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
 <20190207155131.gzntyqoflqfw5vld@thinkpad>
 <2159944d88eadddab4e7dfa5b50c85a4fc0ca234.camel@ozlabs.org>
 <20190211185736.dafbfc74n76r33pu@thinkpad.dyn.fuzziesquirrel.com>
 <9c1410a1255d49735b7a9879750557bc92acaa47.camel@ozlabs.org>
 <ad89021d-57a9-980a-6034-8530b81b975c@intel.com>
 <76923984-3d27-581b-0541-ae571a441e2d@linux.vnet.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <3447b96c-2a52-660a-3015-22b559242c0d@intel.com>
Date: Thu, 7 Mar 2019 11:35:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <76923984-3d27-581b-0541-ae571a441e2d@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 07 Mar 2019 19:35:30 -0000



On 3/7/19 12:46 AM, Deepak Kodihalli wrote:
> 
> I agree to this as well. I've got two PLDM stacks on my laptop
> (requester and responder) talking to each other over libmctp (over the
> serial binding - making use of fifos instead of an actual serial
> connection). I'd like to push a couple small commits to libmctp as well
> (I made a PR for one of them at the moment).
This is one thing I've wondered before about the way PLDM is being built
out.  Testing the implementation against itself doesn't really test the
correctness of it, unless you're creating a bunch of asserts on data
structure elements, and even then, it just tests that you're giving what
you expect, not that you faithfully implemented the spec.

Do you plan to run this implementation against something other than
itself to test at some point?  If so, what device/implementation are you
planning to target?
