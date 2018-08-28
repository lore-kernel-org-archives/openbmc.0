Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420GZq4Mq2zDrb6
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 03:53:38 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2018 10:53:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,300,1531810800"; d="scan'208";a="85229770"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2018 10:53:36 -0700
Subject: Re: Header inclusion ordering style addition
To: openbmc@lists.ozlabs.org
References: <CAO=notzut2sd4GZvA3gMzoB+J7g48nXnXKONhnwNfJC8jPWPAg@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <c3d8f4e3-86e2-8fae-5c6e-49632262b8a9@linux.intel.com>
Date: Tue, 28 Aug 2018 10:53:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAO=notzut2sd4GZvA3gMzoB+J7g48nXnXKONhnwNfJC8jPWPAg@mail.gmail.com>
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
X-List-Received-Date: Tue, 28 Aug 2018 17:53:40 -0000

On 08/28/2018 10:35 AM, Patrick Venture wrote:
> Each file in each daemon attempts to order the headers in a consistent
> way.  Typically, alphabetically.  However, I propose here a more
> explicit ordering:
> 
> https://gerrit.openbmc-project.xyz/12180
> 
> As an example of the ordering:
> 
> https://gerrit.openbmc-project.xyz/11421
> 

This can be enforced in clang-format with SortIncludes
https://clang.llvm.org/docs/ClangFormatStyleOptions.html and
IncludeCategories regex for specific ordering.

> I feel that having a consistent ordering that deals with the various
> types of header files included provides a couple benefits:
> * header files are included where you expect to find them
> * easily can see that there are c-headers included in a clean group
> * defines that the phosphor library headers are treated as normal cpp
> libraries and included in that grouping making the headers come across
> as system libraries and not something different.
> 
> Please take a look.
> 
> Patrick
> 
