Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbHG240L0zDscK
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 00:09:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=KsC/Rx5T; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3F7296403CC;
 Fri, 16 Sep 2016 09:09:12 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id k4igduXZdhvx; Fri, 16 Sep 2016 09:09:07 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D59E7640FFD;
 Fri, 16 Sep 2016 09:09:07 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com D59E7640FFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474034947; bh=kN/zTuXJK1kipEcTxp/8OChaLdTmtsXVQ5O9eSLVh6s=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=KsC/Rx5T2t29ciaPqw/Il9q2lle/rWq57piPIx6nitd+MBcQ1JIFXHKUHl/y8eEBw
 rUWX3tpaUx5Ko3JZ7Wm/wkkTYG+UaKDKQEJm9giZ8F81bVTG6OkvKPNhrjoUaLNRZ9
 k1izqUyopAEZM7iaxiSwUPDYJYIfKP8EBcKT6psk=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SeO6nsQinMeJ; Fri, 16 Sep 2016 09:09:07 -0500 (CDT)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 455F7640ED6;
 Fri, 16 Sep 2016 09:09:07 -0500 (CDT)
Message-ID: <57DBFD03.2050609@raptorengineeringinc.com>
Date: Fri, 16 Sep 2016 09:09:07 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
 rv:1.9.2.9) Gecko/20100922 Thunderbird/3.1.4
MIME-Version: 1.0
To: Andrew Jeffery <andrew@aj.id.au>
CC: openbmc@lists.ozlabs.org
Subject: Re: [PATCH 07/16] pinctrl-aspeed-g4: Add definition for GPIO pins
 J2 and
References: <1740217293.194628.1473971738317.JavaMail.zimbra@raptorengineeringinc.com>
 <1473992113.13249.36.camel@aj.id.au>
In-Reply-To: <1473992113.13249.36.camel@aj.id.au>
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
X-List-Received-Date: Fri, 16 Sep 2016 14:09:14 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/15/2016 09:15 PM, Andrew Jeffery wrote:
> On Thu, 2016-09-15 at 15:35 -0500, Timothy Pearson wrote:
>>  O2
>>
>> This is required for Firestone to boot.
> 
> Just for future reference, on Firestone:
> 
> GPIOJ1 is BMC_CFAM_RESET_N
> GPIOO2 is BMC_CP0_RESET_N
> 
> This looks good to me.
> 
> However, I was intending to implement all outstanding pins for the 2400
> and 2500 today now that the Aspeed pinctrl core has been accepted
> upstream. If you don't mind I'll just merge what you have done here
> into those patches.

I don't mind; go right ahead.

Thanks!

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX2/z/AAoJEK+E3vEXDOFb4QwH/30PiMIZ1PVefw4EoCK5JSW9
uygn2Z1UYpiC2c6EpO47v57GJjUJQ6W4fUE6IdjbUFhBLZ1xPNrPZex6THsWnAcP
Yur7yuT7EmASEHorebaQ6oqnOmptOajGjLlXUVlHG4AMygVt9a9PHcB008qXbXI+
mpojEkNnIfvbqFw3jIj/q7hO37F6O56KkrL5T3jM9RhHLJyiKwp5qJMMktk3udxo
Td5sHMaC0xgx27LaaM9hE3uGkUQQdQD3MRpJ4j0Qa2iaWaC+YM6/kXr5YcYpFHuT
oJ6JainkZSxiWlGjDsb6xQIyVO2yPWadzfR1xQ7B62WSgLFsjvxjn3FA5zu56P0=
=DKJd
-----END PGP SIGNATURE-----
