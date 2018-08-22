Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wgKP6xgNzDqC8
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 07:14:32 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2018 14:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,275,1531810800"; d="scan'208";a="65267231"
Received: from hades.jf.intel.com (HELO [10.54.51.77]) ([10.54.51.77])
 by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2018 14:14:30 -0700
Subject: Re: ipmbd
To: openbmc@lists.ozlabs.org
References: <920CDBC9D1D84B45ABBD357C997AC084E7AAC885@jtjnmailbox07.home.langchao.com>
 <915AC3F3-FEFC-45B6-B4BB-FD45C4DAF09F@stwcx.xyz>
 <CAJoAoZ=WgWozfohVf1YfEAHVsLjC_9-NkgK5jjKa_wXH4AWPQw@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <30c692a1-c4ab-4e66-4a01-4a21d2e7da7a@intel.com>
Date: Wed, 22 Aug 2018 14:16:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJoAoZ=WgWozfohVf1YfEAHVsLjC_9-NkgK5jjKa_wXH4AWPQw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2018 21:14:34 -0000

The IPMB Bridge implementation has been under review here for a couple 
months.

https://gerrit.openbmc-project.xyz/#/c/openbmc/ipmbbridge/+/11130/

We didn't get a lot of comments on it initially, so we had delayed 
merging it.  There were a couple known race conditions in it that 
required some extensive rework, so the intention was to replace the 
patchset with a "better" one.  If there's interest in merging it sooner, 
a code review on the patchset would go a long ways.

-Ed
