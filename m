Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbHMp57vFzDsch
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 00:14:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=cJydyryc; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3050C640EB8;
 Fri, 16 Sep 2016 09:14:12 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id rbd0MN58FYT0; Fri, 16 Sep 2016 09:14:11 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E4D0D641019;
 Fri, 16 Sep 2016 09:14:10 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com E4D0D641019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474035250; bh=CHlMi1mV5n/zf62Gg3TQTIhENqtFeaw1lao1vd/trlw=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=cJydyrycHMUgp+wuo6ed2+j0bt93JtuY4y6wgKZoWu8C+460INOjXbkRFY11LcP3Y
 UabO/tottiFedLz5ODt4QSURLLz1YGCwEjCVpaG5GEE545QXV6WSqtiUJfQ7Wix3lA
 Tw4F2nk07Ew/vB15UspB8LyNr75ti5ghbXmuWB3U=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dQYLWbj0RCXV; Fri, 16 Sep 2016 09:14:10 -0500 (CDT)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 6E6D7641013;
 Fri, 16 Sep 2016 09:14:10 -0500 (CDT)
Message-ID: <57DBFE32.4030208@raptorengineeringinc.com>
Date: Fri, 16 Sep 2016 09:14:10 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
 rv:1.9.2.9) Gecko/20100922 Thunderbird/3.1.4
MIME-Version: 1.0
To: Andrew Jeffery <andrew@aj.id.au>
CC: openbmc@lists.ozlabs.org
Subject: Re: [PATCH 06/16] mach-aspeed: Add missing Firestone setup method and
References: <183575887.194626.1473971702437.JavaMail.zimbra@raptorengineeringinc.com>
 <1473988958.13249.29.camel@aj.id.au>
In-Reply-To: <1473988958.13249.29.camel@aj.id.au>
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
X-List-Received-Date: Fri, 16 Sep 2016 14:14:15 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/15/2016 08:22 PM, Andrew Jeffery wrote:
> Can you please document exactly what this is (de)configuring and why?
> That way when we come to remove the hack we have some context.
> 
> Better yet, according to `bitfield`:
> 
> $ bitfield SCU88 0xD7000000
> decoding as SCU Multi-function Pin Control #3
> 0xd7000000 [3607101440]
>                                     Enable MAC#1 MDIO1: 0x1
>                                      Enable MAC#1 MDC1: 0x1
>                                Enable NOR flash ROMA25: 0x0
>                                Enable NOR flash ROMA24: 0x1
>                                   Enable flash ROMCS4#: 0x0
>                                   Enable flash ROMCS3#: 0x1
>                                   Enable flash ROMCS2#: 0x1
>                                   Enable flash ROMCS1#: 0x1
>                                   ...
> 
> And as such each of these can be configured through the devicetree via
> pinmux functions MDIO1, ROM16, ROMCS[321]. However, looking at the
> pinmux driver, whilst ROMCS[321] are defined for the relevant pins they
> don't look to have been added to the list of exported functions in dev-
> 4.7. I'll have to dig further into that, but it's probably an oversight
> on my part.
> 
> Out of interest, what are you doing with ROMA24? Is that actually
> required, and if so, is it meant to be independent of ROMA25? I may
> have to rethink my approach there.

No, it's not required, at least on Firestone.  In fact none of the
ROMAnn pins are required; the entire NOR interface is either used for
pin straps or is disconnected.

I'm going to say this was bad copypasta from the other _setup functions
and delete the line entirely.  I'll re-submit this patch shortly.

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX2/4yAAoJEK+E3vEXDOFbhPMIAJTNTlysdb60wt5igVSyZtZr
0xGwbzmO2hQZsEMqiyNIqCBejGZDKbu6je/GoONqmXPYbKfD5+8b4lB4RQBO8SDj
p7DGhXAX9x/ggbcHSjIF+I+PW0YJRep4/vYS1mKWp7M0w3LCku1DaWO8EoLenMZx
uj85mFkx8kixZFz2Iskm35PEqr8DlS6paTdIHcTA00+i8WohY9xM0SU1Lp5SfxKd
/2+J2Fhpzsg9myyCG5X/4MB0l6I/4cEtXL9litZ9I5XRiB+TuK86fNoAzCuQbno2
gSLGJTRGTYrDlvt7LEqk0s0EeX76z67MQmPexp5oPGMb5Wxa2Nqmnnyo1j8SMQU=
=cenu
-----END PGP SIGNATURE-----
