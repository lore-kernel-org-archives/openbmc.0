Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NFF66cYVzDqHV
 for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2019 23:03:04 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 18 Mar 2019 08:03:36 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Venture <venture@google.com>
Cc: zshelle <zshelle@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: requirements for new repos
Message-ID: <20190318120336.pbbpwqygfo26u6i7@thinkpad>
References: <c07297eeb5a0a7415a250a1a9e77e5e2@linux.vnet.ibm.com>
 <CAO=notyvofZyhDJ-uZ1euNL=tXNHckNjNPtfVQuq5GR6WgEfKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=notyvofZyhDJ-uZ1euNL=tXNHckNjNPtfVQuq5GR6WgEfKA@mail.gmail.com>
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
X-List-Received-Date: Mon, 18 Mar 2019 12:03:08 -0000

On Thu, Mar 07, 2019 at 11:24:34AM -0800, Patrick Venture wrote:
>On Thu, Mar 7, 2019 at 8:43 AM zshelle <zshelle@linux.vnet.ibm.com> wrote:
>>
>> Besides the license and maintainers files, are there any other general
>> requirements for each repo?
>
>You'll want a bootstrap.sh script for the CI to hit.  This'll run our
>normal validation.  

William added support to CI for Meson - I'd suggest having a look at
that in place of autotools.  Here is a sample openbmc project using
Meson:

https://gerrit.openbmc-project.xyz/#/c/openbmc/stdplus/+/17853/
