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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44q4nG237wzDq9m
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 02:01:37 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 24 Apr 2019 12:02:16 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: tightly coupled fan-presence bump
Message-ID: <20190424160215.aenlfpdk6v4fqs63@thinkpad.dyn.fuzziesquirrel.com>
References: <CAO=notxquVk+kOqYax7RqHrXpr4T0Ws4TZs7L=5kqzzKbGDg1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=notxquVk+kOqYax7RqHrXpr4T0Ws4TZs7L=5kqzzKbGDg1Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 24 Apr 2019 16:01:39 -0000

On Tue, Apr 16, 2019 at 12:06:11PM -0700, Patrick Venture wrote:
>there's a patchset in meta-ibm that is tightly coupled with one in
>meta-phosphor such that neither will pass the CI real hardware test
>without the other:
>
>https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/19882
>https://gerrit.openbmc-project.xyz/c/openbmc/meta-ibm/+/19933
>
>Is there a special process to get these tested together?
>
>Patrick

Hi Patrick

This was merged this morning.  Thanks for providing the summary and
making it easy for me!

-brad
