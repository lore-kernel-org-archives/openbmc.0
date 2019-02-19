Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 443Pt26LvrzDqGB
 for <openbmc@lists.ozlabs.org>; Tue, 19 Feb 2019 13:33:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="p//MIDrs"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 443Pt170Cmz9sDn;
 Tue, 19 Feb 2019 13:33:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1550543594; bh=sWVV0kbEdIne+Kh6LclOuoDbBzWl1MtMi/52cO/Ox0g=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=p//MIDrs3QFUKWyBlFwmewmvCTz2brnRpywYjCwkZU2W/mZSrHvhBpHlLrGyh6Q0j
 lSMHNTnJlxSv4l+cRffKXvBvD52jtkt/pzqoJ/ggKyyfuUk8finWM9mYKwpHM8ZM2f
 hmyHeeAvsVAsP2xPoQjuvxUDCPAfHu3DjbVeSLSxgxdgj5Q09HVO83FcUfN12/CKL3
 GPbRX6IXNFAhJGoxv/JrWGZgoh3eWxVtgjrsEPyMduH2RwGNHib+x97UWAaXd/6dFE
 1/DfBoJlX5dcezYVfaE9avbbcRbU7AeJbv9+rTYi3nThGHtCttpn2h3+f4D0yxZoVi
 coWwm5xXtJNwQ==
Message-ID: <ce7c63195c576fcb4abacf044103e642b7380673.camel@ozlabs.org>
Subject: Re: libMCTP
From: Jeremy Kerr <jk@ozlabs.org>
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: openbmc <openbmc@lists.ozlabs.org>, Emily Shaffer
 <emilyshaffer@google.com>,  Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Tue, 19 Feb 2019 10:33:11 +0800
In-Reply-To: <7E9441B1E5EFFD4681F54958E8216993459F4C7B@ORSMSX114.amr.corp.intel.com>
References: <7E9441B1E5EFFD4681F54958E8216993459F28DB@ORSMSX114.amr.corp.intel.com>
 <5b8fc35e971dd654b81843d9df82037bb1c9c2c9.camel@ozlabs.org>
 <7E9441B1E5EFFD4681F54958E8216993459F4C7B@ORSMSX114.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1 
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
X-List-Received-Date: Tue, 19 Feb 2019 02:33:16 -0000

Hi Ed,

[+Brad, Emily, Deepak - there are a couple of areas below that could
benefit from your input]

> I'm a lot less worried about the formatting.  Whatever everyone else
> wants is fine.  Clang-format is really useful, so it's not great to
> lose, it for this repo, but there isn't that much code there, so it's
> not a big concern for me.

... I've also realised that we're applying the C++ coding standards to C
code here, which OpenBMC is defined to use kernel-style
(https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#c).

So, I'll drop this patch as it is. However, as you mention, using clang-
format is a good idea, so I'll add a .clang-format definition for C
here.

If (or when) when we implement the C++ interface, we can add a separate
clang-format definition for that.

> Let me get some of the commits cleaned up, and I'll send out pull
> requests.  We could ask Ronnie if he's ok with a relicense, but it's
> not that difficult to just rebuild it.  95% of that is an auto
> generated file. I just the first implementation I found, mostly as
> part of trying to verify the multi-packet stuff was working
> correctly.  It needs cleaned up a bit.

OK, I'll leave that to you. Let me know when you're OK to get it merged.

At the moment, we're definitely at proof-of-concept stage, so aren't
doing formal reviews, using gerrit etc. When we reach a point where the
proof-of-concept changes into something we're sure we'll end up using,
I'll get the process started to properly integrate into OpenBMC. I'm
after your thoughts on when that should happen. Brad & Emily, yours too.

> > The NVME & smbus backends look good - let me know when you think
> > they're OK for merging to master and I will do so.
> 
> This was something I wasn't sure about;  Does it make sense to have
> nvme-mi in libmctp, or should we be creating libnvme?  I'm kinda
> thinking one library would be nice, I'm not aware of any other
> transports that NVME-mi can use, and it doesn't end up being a lot
> more code.

I think a libnvme would be best, but that does raise a good design
decision.

Previous discussions have tended towards in-process MCTP handlers,
rather than an MCTP daemon that forwards reassembled messages to dbus
(for other processes to handle). This would mean that the MCTP daemon,
for current functionality, would have both handlers for PLDM and NVME-mi 
message types. While the code there could be separated on whatever
scheme we like (say, libmctp + libpldm + libnvme + a main loop), does it
still make sense to have all of that in one process?

I can see the preference for efficiency having the one process, but it
would also be nice to keep things modular (eg, for systems with no NVME
stack, or no PLDM handlers). Deepak, any thoughts?

Cheers,


Jeremy
