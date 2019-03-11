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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44J59b3nbFzDqDX
 for <openbmc@lists.ozlabs.org>; Tue, 12 Mar 2019 04:45:32 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2019 10:45:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,468,1544515200"; d="scan'208";a="203501915"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga001.jf.intel.com with ESMTP; 11 Mar 2019 10:45:28 -0700
Subject: Re: How to upload proposal and code for specifying and customizing
 projects?
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <86e053918f1541f3a7b8f9264355080f@quantatw.com>
 <20190307041941.22vujoizv5prib57@thinkpad>
 <417a986a10d340148fdc010a703ded2e@quantatw.com>
 <f6916b49-6af2-e78b-9e1a-918aaf8f5d61@intel.com>
 <9466e8868c7d4e58a3dc943728979bf9@quantatw.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <ebc783f3-6d59-d6ff-f743-2b12f8772905@intel.com>
Date: Mon, 11 Mar 2019 10:45:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <9466e8868c7d4e58a3dc943728979bf9@quantatw.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 11 Mar 2019 17:45:40 -0000

On 3/9/19 12:11 AM, Tony Lee (李文富) wrote:
> Here is the proposal. https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/19061/
I've pushed comments to that review.  Lets continue this discussion there.

Thanks for pushing this!

-Ed
