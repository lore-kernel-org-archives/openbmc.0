Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgc8r2C2czDsnM
 for <openbmc@lists.ozlabs.org>; Sat, 24 Sep 2016 01:04:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=uzWHLEUQ; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 146926410C3;
 Fri, 23 Sep 2016 10:04:42 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id TbGxBJs7QYyD; Fri, 23 Sep 2016 10:04:39 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0861A641128;
 Fri, 23 Sep 2016 10:04:39 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 0861A641128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474643079; bh=p3lXmw49BFRg0xD4kCIB9cU7YG9DW5sGHI82Rr3C7k0=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=uzWHLEUQtghWxy+rzlweQeOYx28I9dkb0lWPs4nvFAmUIb3EvDVqjGmQJA+i1qdyN
 fs9KcjYZvSuz2HukpKCQXq3w89DFUTTeZgOtFj5A4qkpmImRf/KycETMQ1GhHKdF5R
 d3EtzZLY2J1LrtTgC6Of8v7T8aRDCGMTrJB+d65A=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4Iu6WsVzFEcN; Fri, 23 Sep 2016 10:04:38 -0500 (CDT)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id AE73D64101B;
 Fri, 23 Sep 2016 10:04:38 -0500 (CDT)
Message-ID: <57E54486.6020304@raptorengineeringinc.com>
Date: Fri, 23 Sep 2016 10:04:38 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
 rv:1.9.2.9) Gecko/20100922 Thunderbird/3.1.4
MIME-Version: 1.0
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan controller
References: <1474336344-1821-1-git-send-email-tpearson@raptorengineering.com>
 <1474336344-1821-2-git-send-email-tpearson@raptorengineering.com>
 <CACPK8Xf+m04SOBSV8EJ_xYR3qONU5ydbmA-3LPabZVqE2kvuYw@mail.gmail.com>
In-Reply-To: <CACPK8Xf+m04SOBSV8EJ_xYR3qONU5ydbmA-3LPabZVqE2kvuYw@mail.gmail.com>
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
X-List-Received-Date: Fri, 23 Sep 2016 15:04:44 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/23/2016 02:41 AM, Joel Stanley wrote:
> Hello Timothy,
> 
> On Tue, Sep 20, 2016 at 11:22 AM, Timothy Pearson
> <tpearson@raptorengineering.com> wrote:
>> Add a basic driver for the MAX31785, focusing on the fan control
>> features but ignoring the temperature and voltage monitoring
>> features of the device.
>>
>> This driver supports all fan control modes and tachometer / PWM
>> readback where applicable.
> 
>> This series adds a new hwmon driver for the MAX31875, which is
>> used for fan control on Firestone.
>>
>> This patch is a holdover until a PMBus driver is written at some
>> point.  Upstream has stated they will not accept unless a PMBus
>> driver is used for this particular device.
> 
> I'm happy to carry this in our tree for now.
> 
> Do you have a timeline for rewriting and submitting upstream?

At this time upstream needs some significant work; the PMBus core driver
as it currently exists does not support the required functions.
However, the hwmon maintainer (Gunter Roeck) has said he will work on
extending the PMBus driver and might even get something working for this
chip with that core driver, so there is definitely progress being made.
 I wouldn't expect anything upstream until at least kernel 4.9 or later
though.

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX5USGAAoJEK+E3vEXDOFbuZsIALMWMVl0LK/zGDpD3qVL5tib
M0t9QYXhMfYSX1CbP47lRTTDg779f6YadV4QsVslqVt3pVCVm+cA0q2SuyDGCVJ5
KCfVlocQ8KYjZXUieY/Ry3YLvU3oraCIAy5VLpeuPAZMU8RwA8gctElcmeWQNneV
nywY1wJPe1YjBrIZefVvkF5gJQ/Mzoo498Aeyo8Mi98EB+XSStCp5w9XKF7I7Hja
BL5FZbO13ghvfSoDUPv51uKS4r843Z7SL7yzPH1W4OH+beB8nKXyj5ajo2C21Z2V
ciyuWQQdQMw/rh5I7ejNvAczEUsYV7h8zXc4dMxoZQYmgcagP1P7uahFL/0skZo=
=+1Oo
-----END PGP SIGNATURE-----
