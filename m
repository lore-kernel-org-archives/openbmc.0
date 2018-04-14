Return-Path: <tpearson@raptorengineering.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=raptorengineering.com (client-ip=192.119.205.245;
 helo=mail.rptsys.com; envelope-from=tpearson@raptorengineering.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b="QhcYY9ck"; dkim-atps=neutral
X-Greylist: delayed 331 seconds by postgrey-1.36 at bilbo;
 Sat, 14 Apr 2018 10:53:25 AEST
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40NGNP1WqpzF1Sb
 for <openbmc@lists.ozlabs.org>; Sat, 14 Apr 2018 10:53:25 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2B9CF6427B2;
 Fri, 13 Apr 2018 19:47:46 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id oQFMTKWn2wYm; Fri, 13 Apr 2018 19:47:44 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 68EE26427E0;
 Fri, 13 Apr 2018 19:47:44 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 68EE26427E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1523666864; bh=/AJ3WyjKnoR722QH+FNrl7NQTAmoB8AsC6msesAHlAo=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=QhcYY9cki/WGFyF9yH6sdB10bFats1dlIWA0JQ62r2tf5EO4gZxI0LQCvzO9h8FHq
 Fm8gqqPSvVkxcP4kRViDBLkys+A5T3VK68LTnIBIikghIiOVjLWcalhYZbX70ENWBd
 g4LoU5nc+7h2szTzrQcsZRW5Jw89nd1qyHJXyHpk=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id B3_XpDp25JbN; Fri, 13 Apr 2018 19:47:44 -0500 (CDT)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 0A4DB6427DF;
 Fri, 13 Apr 2018 19:47:43 -0500 (CDT)
Message-ID: <5AD14FAF.90109@raptorengineering.com>
Date: Fri, 13 Apr 2018 19:47:43 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
Organization: Raptor Engineering, LLC
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
 rv:1.9.2.9) Gecko/20100922 Thunderbird/3.1.4
MIME-Version: 1.0
To: Patrick Venture <venture@google.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Exposing POST codes
References: <CAO=notzv-4wn7J+uAzPYw1uWzTiN5jOGqHNEDUAzAGS+j5wivQ@mail.gmail.com>
In-Reply-To: <CAO=notzv-4wn7J+uAzPYw1uWzTiN5jOGqHNEDUAzAGS+j5wivQ@mail.gmail.com>
X-Enigmail-Version: 1.1.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Apr 2018 00:53:26 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Sounds like multiple folks have been working on similar code.  Here's ours:

https://git.raptorcs.com/git/talos-skeleton/log/pyiplobserver?h=04-13-2018

The current version just parses the hostboot codes from the serial
console, it used to use pdbg but over time it was found that using pdbg,
even with the BMC kernel driver, destabilizes the IPL process at key
points.  It does however also include state monitoring via BMC mailbox
bits for skiboot and skiroot, allowing the BMC to know when the full IPL
process is complete.

I like the approach of hostboot sending data over LPC, and we're willing
to rework the observer daemon to use that approach.  Is there any way to
send status codes over LPC from the SBE?

Thanks!

On 02/28/2018 12:56 PM, Patrick Venture wrote:
> I talked to Nancy and I think it's time to revisit previous conversations
> about POST codes.  We have a simple daemon that exposes the information
> over Dbus associated with https://gerrit.openbmc-project.xyz/#/c/5006
> 
> If there's interest, I can stage it against skeleton for review and comment.
> 
> We have a patch to the kernel character device for the aspeed-lpc-snoop
> that is required and enables reading the post codes.
> 
> Patrick


- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJa0U+sAAoJEK+E3vEXDOFbOM4H/3WJK9SbA6ly4Q/CioC9Yz9L
dzwsKSClKkK1pHru86wPYHadAmatn/ksA5dl4pEzQlfh5RKGBAaoFdVdVG/BdbVA
upKn9WBudQyLCHFWtD3xg4vzX3cCsi3hFgvgGIKkdrxj4uMv+56Fp5Fwh2eWuun8
ITadBt1LVdZlZT7z56zi2gt0eC4QSaAIBjBXq4KYIhXdc/xX9suw7pLKHAfxpb3v
ygSlE+SGeD1jZQfA5y2CxhOYyl+ac3AmCHXlDe70WQgbyPHU6aohuJaoh1+AtJeo
ys2mULcL9Sz2y8YTBXbEQ2QVMCJHw2BpKBmy6gxuDKChUNndqNJBselSVu7jrXU=
=OWnM
-----END PGP SIGNATURE-----
