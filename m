Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fGLn3RWFzDqJS
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 03:41:19 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2019 08:41:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,481,1539673200"; d="scan'208";a="267334659"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga004.jf.intel.com with ESMTP; 15 Jan 2019 08:41:17 -0800
Subject: Re: archiving ipmitool fork
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <3BDB2E0E-E60B-4228-A522-5D5F9CE6D8FD@fuzziesquirrel.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <82170eaa-90f7-7fd0-2d3a-d15e8cb14515@intel.com>
Date: Tue, 15 Jan 2019 08:43:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <3BDB2E0E-E60B-4228-A522-5D5F9CE6D8FD@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Tue, 15 Jan 2019 16:41:23 -0000

On 1/15/19 8:02 AM, Brad Bishop wrote:
> Hi Ed
>
> I’m looking at https://gerrit.openbmc-project.xyz/17307
>
> Does this mean we can archive our ipmitool fork on GitHub?
That was the hope, but I don't want to force it if JK had plans to work
on that repo some more.  At the very least this patch gets us up to the
current release of ipmitool, gets us building against 2.6, and drops an
OpenBMC specific recipe.
