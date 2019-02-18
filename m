Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 442zkX439kzDqBY
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 20:55:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="emnenYBi"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 442zkX0Nnkz9s3x;
 Mon, 18 Feb 2019 20:55:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1550483716; bh=8qvwXmsdoclkMeWrLUwMBlUnKqOFsI+ha5kZEx2cEUo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=emnenYBixmimKmQEqxfB0BAH5UzBYktXzM8ZP1HjRqlnOLcpQOwGSBFQ0rpxiiH4j
 FXmm6qXB+v20iljOtGsEkAhn8Q4p6hhdFQug7LAS+ABXkgmrCcYn+uwvIKt9cRn+mx
 CtchvgYAjUFIfbiO2DUN3b0XUQvQne1fwyjviq/+lcv71aBg9ipXunCX01omDbC5/0
 D/1rpnmPAVuApDgD5r687xyK4wxUz/YgsdwV9OTOtZR0bJgCBr8IIItlcw9V4cM4ZN
 rIHgYqUo55L8gY6+opGtXrXRTwB+3+D6fwCjLImv1d+6nIEnACLfNKHi3MfQKYirP7
 ya8soUXTM4xcg==
Message-ID: <5b8fc35e971dd654b81843d9df82037bb1c9c2c9.camel@ozlabs.org>
Subject: Re: libMCTP
From: Jeremy Kerr <jk@ozlabs.org>
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Date: Mon, 18 Feb 2019 17:55:14 +0800
In-Reply-To: <7E9441B1E5EFFD4681F54958E8216993459F28DB@ORSMSX114.amr.corp.intel.com>
References: <7E9441B1E5EFFD4681F54958E8216993459F28DB@ORSMSX114.amr.corp.intel.com>
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
X-List-Received-Date: Mon, 18 Feb 2019 09:55:17 -0000

Hi Ed,

[adding openbmc list]

> At this point, I have a basic NVME-MI transactions working, and CRCs
> passing on single packet and multi-packet payloads against a real NVMe
> drive target.
>  
> https://github.com/edtanous/libmctp

OK, I've had a look through the branch now, and have merged a couple of
the changes, but a few notes:

Coming from a kernel background, I was afraid of a coding style rework!
However, I figure that it'll mostly be OpenBMC folks who work on this,
so have applied the clang formatting, with one minor change: to keep the
alignment of #defines and structure members. I think this makes it a lot
more readable, and isn't against any of the OpenBMC coding style
prescriptions.

However, it does make reformatting a little tricky, as clang-format
doesn't handle that. I don't want to bikeshed this too much, but is that
OK with you?

I've put the proposed changes up in a 'format' branch:

  https://github.com/jk-ozlabs/libmctp/commits/format

If that's all OK then I'll fast-forward master to there.

I can't merge your NVME change as it is at the moment, as the crc32 file
is licenced as LGPLv2+. While I am working with our folks to get
approval for my work libmctp to be licenced as dual GPL+Apache-2, this
still wouldn't cover including crc32.c there. Ronnie might be fine to
relicense it though - do you want me to ask him?

The NVME & smbus backends look good - let me know when you think they're
OK for merging to master and I will do so.

Thanks for the input!

Cheers,


Jeremy
