Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42BKvx2hdHzF2vj
 for <openbmc@lists.ozlabs.org>; Fri, 14 Sep 2018 12:58:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="fTvgaWSD"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 42BKvw6wySz9s3l;
 Fri, 14 Sep 2018 12:58:20 +1000 (AEST)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1536893901; bh=VBVFmGlCkm8M8JEAQR5knjYCyfN/ZXbv6Yo0P9EItaM=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=fTvgaWSD6UUN84WUCJpop6TkLul7q9jsg6iQX9oLrtIBgu3mhT2dkns9ncI+NqhMX
 DqbtW2EfnJM0O+ZAx7PrAXhv5TacXRMaQVJdc8inFavvzYwwzm/M1z+rFm4FObpWbB
 DJmwrtDPHOSvTLb8ecl5IODGxw/yOgvpKbRM8KXLF+7qKh/QMCPXYblZZ15ToKgCqF
 n9qnJ0m5Yx3RFOGzb/dYymqTpsAN7ainf1G1JBSqbgfetG9mN3tMO/8eewwpIOYucO
 4Z/7tcKdiLhv8wAE7RCodSdBuW7/FlFLRys6Rqc4RZTvBIsH15T+daDTMsArRjhZ/E
 k/+2HUKO7e7uw==
Subject: Re: SOL Logging
To: Ed Tanous <ed.tanous@intel.com>, openbmc@lists.ozlabs.org
References: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
 <8ec90e03-10ed-a052-7a0b-328d7c6cde64@yadro.com>
 <CABzWfrmvR=qHQBgi8m6m5Zp0wGDc2--AcY1ZTTp+WfiC8cFFKg@mail.gmail.com>
 <CAJoAoZnqL2yy3aYWqvL-FRxLtpcjuyAhFOER5ZSd=WAA9LmJfg@mail.gmail.com>
 <3d11886a-a3c7-37a0-f836-1f1eb64b1a46@intel.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <53e7ce4d-59b1-3817-89f8-857f389c0513@ozlabs.org>
Date: Fri, 14 Sep 2018 10:58:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3d11886a-a3c7-37a0-f836-1f1eb64b1a46@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 14 Sep 2018 02:58:22 -0000

Hi Ed,

> obmc-console already keeps a ring-buffer style log of all the previous 
> characters.  The easiest to implement answer, which is probably good 
> enough for most cases, would be to simply make obmc-console barf up the 
> saved console log ring buffer when any new client connects.

Yep, exactly. However, you're exactly right in that:

> I could also imagine a case where this isn't the desired behavior if 
> you're using automation to interact with SSH/SOL, so it might need to be 
> selectable by the client or have some kind of reasonable workaround.

This is definitely the main issue for me here (as well as the control 
characters). Having potentially days-old console data received on 
connect would be somewhat confusing for most users; automation or otherwise.

Cheers,


Jeremy
