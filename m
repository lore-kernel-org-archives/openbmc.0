Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zNRFJ5vCgzF108
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jan 2018 03:32:35 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jan 2018 08:32:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,381,1511856000"; d="scan'208";a="11545803"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by fmsmga007.fm.intel.com with ESMTP; 19 Jan 2018 08:32:32 -0800
Resent-From: Vernon Mauery <vernon.mauery@linux.intel.com>
Resent-Date: Fri, 19 Jan 2018 08:32:32 -0800
Resent-Message-ID: <20180119163232.GY113334@mauery>
Resent-To: openbmc@lists.ozlabs.org
Date: Fri, 19 Jan 2018 08:30:28 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: OpenBMC Development <openbmc@list.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Technical Debt vs. Precedence vs. Velocity
Message-ID: <20180119163028.GX113334@mauery>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Jan 2018 16:32:37 -0000

Overall, the openbmc project has done a great job of keeping common 
things in common repositories and machine or OEM specific things in 
separate repositories. But there are a few (because it happens) places 
where technical debt has accrued. I want to support getting this sort of 
stuff fixed so we can have a shiny project, but at what expense? 
Velocity. Reality calls and I was not scoped to fix old code, only to 
write a new feature. I am not the only one running into this issue, so I 
thought it best to start a discussion.

Things like:
1) Incorrect coding style (whitespace, braces, upper/lower/snake/camel)
2) Use of sdbus instead of sdbusplus
3) OEM code in common libraries
4) Lack of proper error handling
5) Use of insecure functions without proper range checking (memcpy, 
strcpy, etc.)
6) Use of printf/fprintf instead of log<>

I am sure there are many other classes of technical debt that I did not 
list here. But the point is that the code base does have places where 
this sort of stuff exists and has not yet been fixed. What should the 
official stance be? To me, mixing coding styles in a single file is 
worse than having the same wrong coding style in a file. But the best is 
if the whole project matches.

If someone contributes and claims that their newly added technical debt 
is okay because of precedence, we don't really have a way to hold them 
to coming back and fixing the problem.

One way to fix this is to have contributors that want to claim 
precedence go and clean up the file FIRST and then come back with a new 
clean commit. But that does make for a higher bar for entry in some 
cases and possibly slows down velocity.

What say the community members on this?

--Vernon
