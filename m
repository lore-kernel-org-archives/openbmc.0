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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46J5V94sVdzDqw9
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 10:00:32 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <68bddbec8c08cbd9d31f561222bb3afde814a94b.camel@fuzziesquirrel.com>
Subject: Re: [yocto] Build break in the latest openbmc tree.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: akuster808 <akuster808@gmail.com>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>
Cc: yocto@yoctoproject.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 James Feist <james.feist@linux.intel.com>
Date: Tue, 27 Aug 2019 20:00:56 -0400
In-Reply-To: <fbcfc988-687f-55ad-1ca9-ace092f09a99@gmail.com>
References: <038f49d9-099e-dabd-2957-d31e7b8bbf41@linux.intel.com>
 <628d5b4c-63d4-78b6-83d8-1781cbc86e0f@linux.intel.com>
 <7694CCA3-89BD-44FE-90D1-99569476E980@fuzziesquirrel.com>
 <fbcfc988-687f-55ad-1ca9-ace092f09a99@gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 28 Aug 2019 00:00:34 -0000

On Sun, 2019-08-25 at 10:49 -0700, akuster808 wrote:
> the meta-security layer should be fix now.
> 
> please update and let me know if not.

Thanks Armin!

Jae, I've pulled this into OpenBMC.  Can you give it a try?

-brad
