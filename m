Return-Path: <tpearson@raptorengineering.com>
X-Greylist: delayed 353 seconds by postgrey-1.36 at bilbo;
 Tue, 28 Feb 2017 08:21:07 AEDT
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b="kBifz9Cz"; dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vXF4g4FhgzDqC0
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 08:21:07 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2B3046412B8;
 Mon, 27 Feb 2017 15:15:11 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WgTNA38H1VOb; Mon, 27 Feb 2017 15:15:10 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6D4D26412BD;
 Mon, 27 Feb 2017 15:15:10 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 6D4D26412BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1488230110; bh=g4TAnADEzW3xsqS20M8g1iX//wGr45RFjNpZDtFc9GM=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=kBifz9CzjIEO40NSv4WqJ242HWR4kLPfaZ4Is2Zw5Rl9Oa1gdQH7snSRafh+FIGlt
 68sbDb2g9qxXX8ikE3Dh+DILTkndBKklHRcDjsq9VjSNtDrK2fypsbBoYCugGxs+kO
 pWpovIF4j9DcgmUhgCxp988nZmvOKiTcodN+TgjE=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id YaykP7BzctP0; Mon, 27 Feb 2017 15:15:10 -0600 (CST)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id F42076412B8;
 Mon, 27 Feb 2017 15:15:09 -0600 (CST)
Message-ID: <58B496DD.7060207@raptorengineeringinc.com>
Date: Mon, 27 Feb 2017 15:15:09 -0600
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
In-Reply-To: <CAPLgG=k8neY9VbJW624zvQO1SzXWPjza+xbUHnhWo4V94QuQmg@mail.gmail.com>
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
X-List-Received-Date: Mon, 27 Feb 2017 21:21:08 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02/27/2017 03:01 PM, Rick Altherr wrote:
> I replied to Raptor's tweet asking why they preferred Facebook's OpenBMC
> over the IBM one. I find it odd that you are asking developers on the
> latter to fund development for the former.
> 
> Rick

Perhaps I should clarify a bit.

The KGPE-D16 uses an older ASpeed device not supported by either version
of OpenBMC.  This ASpeed device is not only limited in computational
power, but ASUS limited the device further in the board design to the
point where we are not sure that the IBM OpenBMC will actually fit or
work without hardware modifications (in fact, I am fairly certain
hardware modifications would be required).  Given our past experience
with crowdfunding efforts we prioritized the total project cost over the
more expansive feature set of IBM's OpenBMC in order to get something
functional into the community's hands.  We hope that once the larger
community has had a chance to experience software freedom on the BMC
level using lower-cost commercially available hardware that they will
support the manufacturers (such as IBM) that are selling hardware with
OpenBMC available.

We have also added a stretch goal to the project to initiate a port of
IBM's OpenBMC, built on the common code and reverse engineering efforts
from the base Facebook port.  This process is expected to involve
creating new hardware to replace the limited firmware module of the
KGPE-D16, as well as integrating new x86-specific drivers into the
upstream IBM OpenBMC tree.  Perhaps this stretch goal is more
interesting to the members on this list?

Thanks!

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJYtJbaAAoJEK+E3vEXDOFbRJoIALLUZzWr7zmZCKivjaS32BA4
nAPRVTfImuEuh1AD6zmFL6WlHjv3NNyMEuBdaZRv7xoizlhHL/ua0XeCFws8Qtyw
3VUHsRMB5THvzcie+ooDPv3GoBQPc4MW70ZuDs5VV0pzp2HcHSeoaiTgDpA6z0ga
GyP4cbFvBwgid7pvMAA4I+LujpgQLdui19o8QhO26GA13KUQhEDoSzKWg5C7xJFz
vgTCwrF1u1avuA5RIth9+aGzOOJxgeRwT8tDzEAuwS+cC7dZGP6KXGVGfPPb8Qir
b9ZRU/4Q0Ig7QnLaDp/zeua9MWXLyCaUMaaCAhmmbMFbCdzQ75e5Z2R7JFSDj9E=
=rGB+
-----END PGP SIGNATURE-----
