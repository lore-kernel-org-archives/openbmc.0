Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lGW249RwzDq5b
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 07:05:46 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2019 12:05:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,513,1539673200"; d="scan'208";a="314231954"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jan 2019 12:05:43 -0800
Subject: Re: Plan to unify REST authentication?
To: openbmc@lists.ozlabs.org
References: <25320ca6593fb75714e0930d64c85c4b@linux.vnet.ibm.com>
 <8d289e19-dcaa-e0d5-5729-8863e0527470@intel.com>
 <6d24a3285407c428ccd89fd7900875d2@linux.vnet.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <8e98d399-ebd6-5c5e-e13d-ab4c56ddea07@intel.com>
Date: Wed, 23 Jan 2019 12:08:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <6d24a3285407c428ccd89fd7900875d2@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 23 Jan 2019 20:05:51 -0000



On 1/23/19 11:29 AM, Matt Spinler wrote:
> There are 2 or so commits that still need to merge in either
> bmcweb or openbmc-test-automation, but that will happen imminently.
> 
I just merged both of your commits.  They should be included in an
autobump shortly.


In case it wasn't apparent, or needed to be said, merging this change to
master has my support.
