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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44q4zr0RqbzDqMr
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 02:10:47 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 24 Apr 2019 12:11:27 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, jk@ozlabs.org,
 joel@jms.id.au, andrew@aj.id.au
Subject: Re: inarp package
Message-ID: <20190424161127.bzi74nsp7kzotazm@thinkpad.dyn.fuzziesquirrel.com>
References: <CAO=notxPYxa8oxQXkSLKNhTy3mZV8TOWeYyX=8Cxecz8fpAQWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=notxPYxa8oxQXkSLKNhTy3mZV8TOWeYyX=8Cxecz8fpAQWg@mail.gmail.com>
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
X-List-Received-Date: Wed, 24 Apr 2019 16:10:48 -0000

On Sat, Apr 20, 2019 at 08:16:22AM -0700, Patrick Venture wrote:
>The inarp packages isn't picked up currently by any meta layer and
>doesn't build (it needs some gcc related updates missed by its
>non-inclusion).  Brad, I see you're the maintainer, should we archive
>this package or bring it up to date?
>
>Patrick

Hi Patrick

Thanks for noticing this.  I'm not the maintainer - what are you reading
that indicates this?  

Now that you've pointed it out, Lets wait a couple months to see if
anyone fixes the problems and if that doesn't happen I'll go ahead and
archive the repository and we can remove the recipe.  Sound OK?

thx - brad
