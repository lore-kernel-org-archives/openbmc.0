Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgc591RMMzDsn9
 for <openbmc@lists.ozlabs.org>; Sat, 24 Sep 2016 01:01:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=ip5N3gav; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5781B641113;
 Fri, 23 Sep 2016 10:01:29 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id V6TOrZ9IXd7q; Fri, 23 Sep 2016 10:01:24 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C8BD3641128;
 Fri, 23 Sep 2016 10:01:24 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com C8BD3641128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474642884; bh=8DSz1D+BtLRwUGgLKQPqMqiLGMLotMf82Rom4RcMFmU=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=ip5N3gavyOBaY9g8gemgY1VrlvqrVijtoMhK2ZYitGGnCKi6rOrv662XTFzv2WK92
 W5H1WoV1m1Ve1SOADzZwgyzfHgXyTxrfeGRI7THHCGsHJKz+wFlXiJta+KY+Cl0Vjf
 H46KsviK7ePv9KkwyzklBCR/RbMF+B+NjGmWXkW8=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zME3UQ_AmsG4; Fri, 23 Sep 2016 10:01:24 -0500 (CDT)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 6657364101F;
 Fri, 23 Sep 2016 10:01:24 -0500 (CDT)
Message-ID: <57E543C4.8010806@raptorengineeringinc.com>
Date: Fri, 23 Sep 2016 10:01:24 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
 rv:1.9.2.9) Gecko/20100922 Thunderbird/3.1.4
MIME-Version: 1.0
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 04/17] Allow no-hw-checksum override in devicetree outside
 of NCSI mode.
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-5-git-send-email-tpearson@raptorengineering.com>
 <CACPK8XcGXcrZT1JYo5Y7LNwp07zm-i8TOH53TAWcdYN+B0u2GA@mail.gmail.com>
In-Reply-To: <CACPK8XcGXcrZT1JYo5Y7LNwp07zm-i8TOH53TAWcdYN+B0u2GA@mail.gmail.com>
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
X-List-Received-Date: Fri, 23 Sep 2016 15:01:34 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/23/2016 01:57 AM, Joel Stanley wrote:
> On Sat, Sep 17, 2016 at 6:05 AM, Timothy Pearson
> <tpearson@raptorengineering.com> wrote:
>> This is required for Firestone networking to function correctly.
>>

I did.  It did not work.  DHCP and ping worked but anything more complex
failed; SSH connections timed out, no HTTP access, etc.

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX5UPBAAoJEK+E3vEXDOFbRakH/3g6MII/5bEXjQJiBw9n8AiR
av3vtBecuhaF/hk/wJbxf8LkZKg6gdXTGxy57AY2om/lxv3J/3fYfYzDeV0Y5j8u
k6QTJxFea1XK7Pjj5YlqZ9/58wlN3BGef9X+eQXZOMMGbAYfyTJ5AAf69mOcML45
yazvdzu8+hmrKUX2HFrpzZQ2KCQ3TK9bthDLm3PXicE4f5BYjoOBGJu0Zm2+38Mt
1H8XkMNoJP8r2tcsrX01awR56AqDfctdp06oOhKrLpTsyizxNkTwnOqOO84B8eGA
a9axVamYiHQ+zGqAHtmrX2AWUr8yLK0Dl8YJC8zTNXz+vUPXstsE02ak24Jc7Ko=
=Hr8f
-----END PGP SIGNATURE-----
