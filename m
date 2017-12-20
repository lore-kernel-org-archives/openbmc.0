Return-Path: <david.j.cobbley@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=david.j.cobbley@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z1cYn40jSzDrd7
 for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2017 12:26:36 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2017 17:26:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,429,1508828400"; d="scan'208";a="13214377"
Received: from parzival.jf.intel.com (HELO [10.54.51.76]) ([10.54.51.76])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Dec 2017 17:26:31 -0800
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Dave Cobbley <david.j.cobbley@linux.intel.com>
Subject: Gerrit alternatives
Message-ID: <20912a5f-e956-13c3-3fd4-1ba1fe9f1759@linux.intel.com>
Date: Tue, 19 Dec 2017 17:26:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Dec 2017 01:26:38 -0000

Hey all,

I am curious to see peoples input on using github as a code review 
mechanism over gerrit. I see github/openbmc is already used quite well 
for sprint planning and issue tracking, I feel like it would make a lot 
of sense to use it for doing code reviews. As far as I understand it has 
a mechanism to reproduce a similar paradigm to what we currently use 
today - as far as Code-Review, Ok-To-Test, and Verified.

I can see github has made several improvements over the last few years 
that make it much more use-able to teams like us:

- The ability to have approved maintainers for each specific repository 
with https://github.com/blog/2392-introducing-code-owners

- It has the ability to do a rebase-merge, keeping the git tree nice and 
tidy.

- A strong API to tie in additional tools that we may need.


Additionally, it will reduce the point of failure from also hosting gerrit.

What are peoples thoughts on using this?

-Dave Cobbley
