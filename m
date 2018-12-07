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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43BK324SZjzDrgB
 for <openbmc@lists.ozlabs.org>; Sat,  8 Dec 2018 04:19:41 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Dec 2018 09:19:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,326,1539673200"; d="scan'208";a="105727915"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga007.fm.intel.com with ESMTP; 07 Dec 2018 09:19:37 -0800
Subject: Re: Split and join. The preferred way.
To: Alexander Amelkin <a.amelkin@yadro.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <e39c8977-b81b-d9ce-96c4-14dcd17bb508@yadro.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <c92717f4-0e52-9615-0e3d-34210a688fc3@intel.com>
Date: Fri, 7 Dec 2018 09:21:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <e39c8977-b81b-d9ce-96c4-14dcd17bb508@yadro.com>
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
X-List-Received-Date: Fri, 07 Dec 2018 17:19:43 -0000

The current disposition on boost is documented here:

https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.md#boost

In short, so long as we're not compromising the project longevity by
increasing the binary sizes, and using well known, tested libraries,
boost functions are perfectly acceptable to use.  There are several
daemons that use a number of string operations from boost today, so
there are several examples that you could follow.  boost::asio is used
in the new webserver implementation, and there are asio extensions for
sdbusplus.

One thing that's recommended is to at a minimum set
BOOST_SYSTEM_NO_DEPRECATED in your compiler flags, to ensure you're not
linking against a static library for boost::system.

-Ed
