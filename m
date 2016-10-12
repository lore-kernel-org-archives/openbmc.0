Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svHrv1CxjzDsrf
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 02:31:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=swUHiS04; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 01DC2640445;
 Wed, 12 Oct 2016 10:31:22 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Xi20ODfWf50t; Wed, 12 Oct 2016 10:31:19 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1F842641208;
 Wed, 12 Oct 2016 10:31:19 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 1F842641208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1476286279; bh=rnpcsMI0Qzz1Tohg5znDHb0ILByDODTSLa48QvvN6tk=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=swUHiS04yNcxerNaxqiRAfZ6FMQicV5BFAICjAglSqB9obPYq/wQo5FEpSRCLPVSx
 SmHEsf0Z79w61MNXsON6LBDHfxM6skGw090IjKHGty4eeYlrbfpU4tjMunlTQ0QUUI
 FP5vYhHlzXJhaG+VQDWVQc8gVaqq3ZCDoVL6bz+k=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id HjqrfvFDwNZc; Wed, 12 Oct 2016 10:31:18 -0500 (CDT)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id A66E8640445;
 Wed, 12 Oct 2016 10:31:18 -0500 (CDT)
Message-ID: <57FE5746.2030306@raptorengineeringinc.com>
Date: Wed, 12 Oct 2016 10:31:18 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
 rv:1.9.2.9) Gecko/20100922 Thunderbird/3.1.4
MIME-Version: 1.0
To: Joel Stanley <joel@jms.id.au>
CC: Patrick Williams <patrick@stwcx.xyz>, 
 Matt Spinler <mspinler@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: I2C device driver names
References: <b659d152-5481-193e-ce1b-520d3de7d2ba@linux.vnet.ibm.com>
 <CACPK8XdPfy7jN6ejsN=w_4wejy2zxBpwb8M3+b0GoLaW=0cKMw@mail.gmail.com>
 <20161007015152.GA17914@heinlein.lan>
 <CACPK8Xfwj82abqJS_j20WZFzwwPZke2y1FCHk3eoMTwJopxDpw@mail.gmail.com>
 <57FCFA02.8060001@raptorengineeringinc.com>
 <CACPK8XfcwECCYPgPYG5a5QqxGgtjH_ZQJyTfPuz=+HgGBWyevw@mail.gmail.com>
In-Reply-To: <CACPK8XfcwECCYPgPYG5a5QqxGgtjH_ZQJyTfPuz=+HgGBWyevw@mail.gmail.com>
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
X-List-Received-Date: Wed, 12 Oct 2016 15:31:28 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10/11/2016 06:11 PM, Joel Stanley wrote:
> On Wed, Oct 12, 2016 at 1:41 AM, Timothy Pearson
> <tpearson@raptorengineering.com> wrote:
>>> Yeah. I did ask that he spit out the maintainers part of that patch
>>> before we applied it.
>>>
>>> Timothy, are you able to make that change?
>>
>> No problem.  Updated version sent to the OpenBMC mailing list.
> 
> Thanks. I'll take a close look and add it to our tree today.

Sounds good, thanks!

> 
>>> Timothy, do you have any update on the rewrite?
>>
>> Not at this time.  I've requested a status update from the hwmon
>> maintainer that was working on it.
> 
> Cool. If you could, please me on future correspondence. I'd like to
> keep a track of how it goes, and we might be able to offer some help
> if the hwmon guys don't have time.

I don't follow hwmon too closely, but if I hear anything I'll let you know!

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX/ldEAAoJEK+E3vEXDOFbVJkH/iUBsjkWPw4GZGfFU/6+b8Mx
qOquV1/kRXsbV3O/hjJSAbXBjRlfv7S/jCFMmnsxoMoAYzhG0rRANXBMycE9jkSi
raD2VZs48vgbUGwihrB4FlmuUHcKg8i1QkRNe70hYF0dusasKmNYeDJbt+mKRT4C
KbHAbjh9TOj52SsDz+uFmEa+iSmuOvZn4nGkMXmXRT9TuPwj4Wu/TsUeRo0CbubJ
uQCisOyqGQhdZowbJWxgWemr32u9lpXxa3b8OpMI7z3hPT2iB0E6/B28gpg9Hd3u
8XeY6co7ei+rMS89JqooXGZbV0V1A9E74e/vXAe9MLkICFfTw1Mo45nyXrBtCsw=
=CDeR
-----END PGP SIGNATURE-----
