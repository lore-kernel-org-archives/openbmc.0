Return-Path: <herbert@gondor.apana.org.au>
Received: from deadmen.hmeau.com (orcrist.hmeau.com [104.223.48.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w1nqB5TXJzDq7Z
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 21:23:02 +1000 (AEST)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtp (Exim 4.84_2 #2 (Debian))
 id 1cxXPI-0005Nm-KS; Mon, 10 Apr 2017 19:22:52 +0800
Received: from herbert by gondobar with local (Exim 4.84_2)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1cxXPE-0002KB-Me; Mon, 10 Apr 2017 19:22:48 +0800
Date: Mon, 10 Apr 2017 19:22:48 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Rick Altherr <raltherr@google.com>
Cc: alex@digriz.org.uk, openbmc@lists.ozlabs.org,
 Matt Mackall <mpm@selenic.com>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] hw_random: timeriomem_rng: Migrate to new API and
 improve performance
Message-ID: <20170410112248.GB8800@gondor.apana.org.au>
References: <20170405232100.2023-1-raltherr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170405232100.2023-1-raltherr@google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Apr 2017 11:23:03 -0000

On Wed, Apr 05, 2017 at 04:20:57PM -0700, Rick Altherr wrote:
> AST2400 can generate 32-bits of random data every 1us.  Original driver
> was limited to one 32-bit read every jiffie due to deprecated API and use
> of timers.  Migrating to new hwrng API and switching to hrtimers
> improves read performance of /dev/hwrng to 13Mb/s.
> 
> Changes in v2:
> - Split API migration into separate patch
> - Split type and variable renames into separate patch
> - Split performance improvements into separate patch

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
