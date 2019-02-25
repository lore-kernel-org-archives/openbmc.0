Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 447cfj2P1KzDqM1
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 09:53:00 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2019 14:52:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,413,1544515200"; d="scan'208";a="146484217"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2019 14:52:58 -0800
Subject: Re: DRAM usage on AST2500 with OpenBMC and Redfish
To: openbmc@lists.ozlabs.org
References: <CAFweeiT62MGOER0WMGMhvR5EX4t=7+pwp1p2BO7rYEq6e+qDdg@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <72974e00-6057-6d77-c915-7587115545f8@intel.com>
Date: Mon, 25 Feb 2019 14:52:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFweeiT62MGOER0WMGMhvR5EX4t=7+pwp1p2BO7rYEq6e+qDdg@mail.gmail.com>
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
X-List-Received-Date: Mon, 25 Feb 2019 22:53:02 -0000


On 2/22/19 1:14 PM, Keith Williamson wrote:
> 
> Is 512MB DRAM on the AST2500 more than enough for OpenBMC, Redfish, etc
> or is anyone in the community recommending 1GB DRAM?
> 
Relevant quote:
"640 K ought to be enough for anybody"

At this point in time, the systems I'm working on only support 512MB,
and I've never even thought about wanting more, except in maybe a debug
context for capturing logs to ram.  On the other end of the spectrum,
I've heard that the platforms that support 128MB have a tough time;  I
don't know of any in between data points.
