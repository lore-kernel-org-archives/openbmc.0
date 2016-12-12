Return-Path: <tpearson@raptorengineering.com>
X-Greylist: delayed 366 seconds by postgrey-1.36 at bilbo;
 Tue, 13 Dec 2016 03:39:13 AEDT
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b="fqnCpZuj"; dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tcpSx4LCFzDvkP
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 03:39:13 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A377C641036;
 Mon, 12 Dec 2016 10:33:00 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8qPrTMs8PBvS; Mon, 12 Dec 2016 10:33:00 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1787664110D;
 Mon, 12 Dec 2016 10:33:00 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 1787664110D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1481560380; bh=fb9p9bxSjB1c/Sxe1xCUwwgC6F2Nt9wzPyqCpaCI0e0=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=fqnCpZujSC4lxRjglNkddW7a57Krf7WVYwJaLWCbCf10I6CReX0GinBlAbc3OM4QO
 S5C2cuS8ER295FOupjqrmstVK8AfPSJKsTXWmt9gUlFLFlHSy0NHXYDOKnGXdAgIZ+
 6ds2ctiNb87k0z15XBXvvh2UGvSR2pkWrdnF/wgk=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1xYaaOR1A968; Mon, 12 Dec 2016 10:32:59 -0600 (CST)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id B6544641036;
 Mon, 12 Dec 2016 10:32:59 -0600 (CST)
Message-ID: <584ED13B.8050206@raptorengineeringinc.com>
Date: Mon, 12 Dec 2016 10:32:59 -0600
From: Timothy Pearson <tpearson@raptorengineering.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
 rv:1.9.2.9) Gecko/20100922 Thunderbird/3.1.4
MIME-Version: 1.0
To: Joel Stanley <joel@jms.id.au>
CC: Matt Spinler <mspinler@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan controller
References: <1474336344-1821-1-git-send-email-tpearson@raptorengineering.com>
 <1474336344-1821-2-git-send-email-tpearson@raptorengineering.com>
 <CACPK8Xf+m04SOBSV8EJ_xYR3qONU5ydbmA-3LPabZVqE2kvuYw@mail.gmail.com>
 <57E54486.6020304@raptorengineeringinc.com>
 <de14e2a8-06f3-19f9-c783-3d05e6856993@linux.vnet.ibm.com>
 <CACPK8XfZ=yHgx75xBgy8kyQqxpCLwW406hyKvQYfiBpnC6Hvqw@mail.gmail.com>
In-Reply-To: <CACPK8XfZ=yHgx75xBgy8kyQqxpCLwW406hyKvQYfiBpnC6Hvqw@mail.gmail.com>
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
X-List-Received-Date: Mon, 12 Dec 2016 16:39:15 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/11/2016 05:36 PM, Joel Stanley wrote:
> Hi Matt,
> 
> On Sat, Dec 10, 2016 at 2:55 AM, Matt Spinler
> <mspinler@linux.vnet.ibm.com> wrote:
>> Hi,
>>
>> We're getting closer to needing the hwmon driver for this.  Has anyone heard
>> an outlook?

There is a functional driver merged into the OpenBMC kernel tree.
Upstream is still working on a replacement driver as far as I know; they
just wanted a different internal implementation of the driver versus the
one in the OpenBMC kernel tree.

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJYTtE7AAoJEK+E3vEXDOFbI/IIAJ7ZnMhqd3EyhBLrFXSBA18c
2z5tAH8iLVYns0/CL9p5vyqs6k5emc5EBAxwfw3NxE+nlXHB2khcZBJgWWA9+ZdR
pbV8ChnmPgyphHg8P2t3UEvEkqwL1hOQHEx7V8pdvC/9JRbWBDgaIsdLJViZL1gQ
AibLhFb0QflLLVKR3txvZadF66w6SyOCN6parT0u/6c/VanxranuQVFOqIn3MVSn
DOpf7fX0MLe3ripJCXe2nZ+OdvjFxlNHfs2rUKl7JVDJzJU36i2PD9xMvkGzadBd
+USdbrD9j6D5QuSHXOyIc6ij2kMVCjNuzW083l0BxUeXZkyolBh3uYu7/S7qf9E=
=k1Ld
-----END PGP SIGNATURE-----
