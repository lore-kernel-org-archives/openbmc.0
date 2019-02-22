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
 by lists.ozlabs.org (Postfix) with ESMTPS id 445dKv36N6zDqDW
 for <openbmc@lists.ozlabs.org>; Sat, 23 Feb 2019 04:16:34 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2019 09:16:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,400,1544515200"; d="scan'208";a="146489008"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga004.fm.intel.com with ESMTP; 22 Feb 2019 09:16:32 -0800
Subject: Re: Redfish: Network test findings
To: openbmc@lists.ozlabs.org
References: <OF53FC2776.6CFC8561-ON002583A9.00391CD8-652583A9.003ABCA8@LocalDomain>
 <OF3C14C139.B5348C62-ON002583A9.00475679-652583A9.005AF2E2@notes.na.collabserv.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <f53bcaf6-bb52-963e-bb7c-eb58b1ac6561@intel.com>
Date: Fri, 22 Feb 2019 09:16:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <OF3C14C139.B5348C62-ON002583A9.00475679-652583A9.005AF2E2@notes.na.collabserv.com>
Content-Type: text/plain; charset=windows-1252
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
X-List-Received-Date: Fri, 22 Feb 2019 17:16:36 -0000



On 2/22/19 8:33 AM, Prashanth Katti1 wrote:
> Hi Ed Tanous,
> 
> Here are the finding on Network test for bmcweb.
> .
> Could you look into the following issues and let us know.
> 

I'm happy to review any patches that resolve some, or all of these.
Based on the titles, a lot of these look like enhancement requests for
parameters that aren't currently implemented, or misunderstandings about
how Redfish error codes work.

If you have some initial triage done to identify the failure modes on
these, that would help a lot to get them resolved quickly.  If you need
any specific background to help triage, I'm almost always on IRC (and
obviously this list).

-Ed
