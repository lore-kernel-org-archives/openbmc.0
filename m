Return-Path: <herbert@gondor.apana.org.au>
X-Greylist: delayed 1834 seconds by postgrey-1.36 at bilbo;
 Thu, 06 Apr 2017 00:16:45 AEST
Received: from deadmen.hmeau.com (orcrist.hmeau.com [104.223.48.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vynvx5cd7zDqH6
 for <openbmc@lists.ozlabs.org>; Thu,  6 Apr 2017 00:16:45 +1000 (AEST)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtp (Exim 4.84_2 #2 (Debian))
 id 1cvkV2-0006Oh-0m; Wed, 05 Apr 2017 20:57:24 +0800
Received: from herbert by gondobar with local (Exim 4.84_2)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1cvkUv-0006zi-KR; Wed, 05 Apr 2017 20:57:17 +0800
Date: Wed, 5 Apr 2017 20:57:17 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Rick Altherr <raltherr@google.com>
Cc: alex@digriz.org.uk, openbmc@lists.ozlabs.org,
 Matt Mackall <mpm@selenic.com>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] hw_random: Fix timeriomem_rng for sub-jiffie update
 periods
Message-ID: <20170405125717.GB26558@gondor.apana.org.au>
References: <20170404214307.7748-1-raltherr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170404214307.7748-1-raltherr@google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Thu, 06 Apr 2017 09:25:23 +1000
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
X-List-Received-Date: Wed, 05 Apr 2017 14:16:46 -0000

On Tue, Apr 04, 2017 at 02:43:07PM -0700, Rick Altherr wrote:
> Some hardware RNGs provide a single register for obtaining random data.
> Instead of signaling when new data is available, the reader must wait a
> fixed amount of time between reads for new data to be generated.
> timeriomem_rng implements this scheme with the period specified in
> platform data or device tree.  While the period is specified in
> microseconds, the implementation used a standard timer which has a
> minimum delay of 1 jiffie and caused a significant bottleneck for
> devices that can update at 1us.  By switching to an hrtimer, 1us periods
> now only delay at most 2us per read.
> 
> Migrated to new hw_random API while I in this driver.
> 
> Signed-off-by: Rick Altherr <raltherr@google.com>

Thanks Rick.  Could you split this into two patches? One doing
the API conversion and the other one doing the substantive change
to the entropy gathering?

That way if there is a problem it'll be easier to track down.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
