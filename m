Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vXFL843dgzDqC0
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 08:32:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b="TmLMpkwF"; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2B64F641020;
 Mon, 27 Feb 2017 15:32:46 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ggv046wgjbl9; Mon, 27 Feb 2017 15:32:45 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5B45C641282;
 Mon, 27 Feb 2017 15:32:45 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 5B45C641282
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1488231165; bh=d5RWG+kukR35tNJaIkOAfskPpqiuTAiTSgRbcLTxxIk=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=TmLMpkwFSzyaZnC+2vuG1RCdXZCWiUIDtQKBcf15Ju/a51QkhKMxon+bPzgl70JQW
 NDnUsnLnFG7nSx7CYBg9fa2aJ7EChiwiXaYYiHLKjOCvxSnUk79gCF9zyQVXuZIB+2
 8+VFsWiLnd+a1ZdntD6soMUpPZXgsJ3KZOQJnHsk=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id buCuBsAYfxbL; Mon, 27 Feb 2017 15:32:45 -0600 (CST)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 00A56641020;
 Mon, 27 Feb 2017 15:32:44 -0600 (CST)
Message-ID: <58B49AF9.7090708@raptorengineeringinc.com>
Date: Mon, 27 Feb 2017 15:32:41 -0600
From: Timothy Pearson <tpearson@raptorengineering.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
 rv:1.9.2.9) Gecko/20100922 Thunderbird/3.1.4
MIME-Version: 1.0
To: Rick Altherr <raltherr@google.com>
CC: Paul Menzel <paulepanter@users.sourceforge.net>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Martin Roth <gaumless@gmail.com>
Subject: Re: OT: Crowdfunding to port OpenBMC to Asus KGPE-D16
References: <1488134962.2850.11.camel@users.sourceforge.net>
 <CAPLgG=k8neY9VbJW624zvQO1SzXWPjza+xbUHnhWo4V94QuQmg@mail.gmail.com>
 <58B496DD.7060207@raptorengineeringinc.com>
 <CAPLgG=k7ZW-vOKfE1JQxvzmzM=1__yPiY6kpL5TxET7fHV+uHg@mail.gmail.com>
In-Reply-To: <CAPLgG=k7ZW-vOKfE1JQxvzmzM=1__yPiY6kpL5TxET7fHV+uHg@mail.gmail.com>
X-Enigmail-Version: 1.1.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 27 Feb 2017 21:32:49 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02/27/2017 03:24 PM, Rick Altherr wrote:
> I'm assuming the core work of booting u-boot and linux on the BMC used
> on KGPE-D16 (AST2300?) is usable by both projects.

Exactly.

I'll gladly support
> bringup on a new SoC as long as the patches are headed to mainline linux
> and u-boot.

This would be part of the third stretch goal (IBM OpenBMC support).  Any
of the stretch goals can be funded in any order, and you can also
earmark a contribution specifically for any of the stretch goal(s) you
may be interested in.

To keep the overall costs reasonable and to allow adapting to the needs
of the community, the base goal consists of a port of the Facebook
OpenBMC system, released as a buildable source tree, and includes
creation and upstreaming of the necessary changes to coreboot and
flashrom.  More advanced features are then implemented as stretch goals,
including the work of trying to upstream the drivers into Linux and u-boot.

> AFAIK, the only limit on whether IBM OpenBMC can be used is the amount
> of RAM and flash available.  My work on a Quanta Q71L has it booting on
> an AST2400 with 128MB of RAM and 32MB of flash.

The KGPE-D16 is even more limited than that.  Even making Facebook's
OpenBMC function on an unmodified KGPE-D16 will be an interesting challenge.

> My concerns with contributing to the campaign are that I don't
> understand what work is planned and where those changes will end up.

I hope this has helped clarify some.  If you have any other questions
please feel free to ask!

Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJYtJr2AAoJEK+E3vEXDOFbbdwH/3lLbyA5NsZ1iGvej9+Vkvaj
JOjfqyxZ4+2OJgiq3laLSSNOefGn6CDOXub+TTFKv+Cb/02zqVb1NUcUauK1QCGK
IlMkQxG5o+kxA7vJ+7p3UTbpeZGPRdDVf008IBneWEmsOcI8lYnSFh7VyCvJb9eR
dE4HltGIr5z9zKaOWO8IMYQIjUcbnOucpaA2xbjGxPpwDtebwetqgY7wQ+dR6qyc
VNg6jOESZY3AsQB+AIEEwP8bGx+i7rLkNMYCnHdem837mUXrQ3M5aFpT2McoNV3a
Ut3sTUH1A9sE99qEx8Ka113CWI/myco53YyVe4xtQbXC/m+ttMhX+8+QcesXqEQ=
=rI1I
-----END PGP SIGNATURE-----
