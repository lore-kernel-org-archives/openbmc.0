Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tctrt2fq5zDvkV
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 06:56:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b="WL/DUDbz"; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4619A640EB1;
 Mon, 12 Dec 2016 13:56:43 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vbVyzf68ri-L; Mon, 12 Dec 2016 13:56:42 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 10568641103;
 Mon, 12 Dec 2016 13:56:42 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 10568641103
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1481572602; bh=J5cS2L7AEANafqsz9sMtXLVM0kbpWmCHsEN9LZEoXpI=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=WL/DUDbz/pK460KKqDq8/7d+qn24hA4K16F6FCjMNJK6eHnx2WRjt7kJJqCJmNfqM
 ZtbS4FNXID99jr48hnCsobSYo1SUhf/dSryDJD49+DiI28hGvhh5FpPITBPs42qZbf
 gS+eO2JjbTimeGP1ujcXbeTorwUrK2pt4JHFkI5U=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qxWtisk8siG4; Mon, 12 Dec 2016 13:56:41 -0600 (CST)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id D3777640EB1;
 Mon, 12 Dec 2016 13:56:41 -0600 (CST)
Message-ID: <584F00F9.4010300@raptorengineeringinc.com>
Date: Mon, 12 Dec 2016 13:56:41 -0600
From: Timothy Pearson <tpearson@raptorengineering.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
 rv:1.9.2.9) Gecko/20100922 Thunderbird/3.1.4
MIME-Version: 1.0
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
CC: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan controller
References: <1474336344-1821-1-git-send-email-tpearson@raptorengineering.com>
 <1474336344-1821-2-git-send-email-tpearson@raptorengineering.com>
 <CACPK8Xf+m04SOBSV8EJ_xYR3qONU5ydbmA-3LPabZVqE2kvuYw@mail.gmail.com>
 <57E54486.6020304@raptorengineeringinc.com>
 <de14e2a8-06f3-19f9-c783-3d05e6856993@linux.vnet.ibm.com>
 <CACPK8XfZ=yHgx75xBgy8kyQqxpCLwW406hyKvQYfiBpnC6Hvqw@mail.gmail.com>
 <584ED13B.8050206@raptorengineeringinc.com>
 <a5f21dcd-9ab5-68f1-c65c-46600e5d0e33@linux.vnet.ibm.com>
In-Reply-To: <a5f21dcd-9ab5-68f1-c65c-46600e5d0e33@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 12 Dec 2016 19:56:47 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/12/2016 12:17 PM, Matt Spinler wrote:
> Hi Tim,
> 
> 
> On 12/12/2016 10:32 AM, Timothy Pearson wrote:
> On 12/11/2016 05:36 PM, Joel Stanley wrote:
>>>> Hi Matt,
>>>>
>>>> On Sat, Dec 10, 2016 at 2:55 AM, Matt Spinler
>>>> <mspinler@linux.vnet.ibm.com> wrote:
>>>>> Hi,
>>>>>
>>>>> We're getting closer to needing the hwmon driver for this.  Has
>>>>> anyone heard
>>>>> an outlook?
> There is a functional driver merged into the OpenBMC kernel tree.
> Upstream is still working on a replacement driver as far as I know; they
> just wanted a different internal implementation of the driver versus the
> one in the OpenBMC kernel tree.
> 
>> Your driver is a hwmon driver, so it will make an entry in
>> /sys/class/hwmon?  I realized after
>> I sent this email that the chip wasn't specified in the device tree, so
>> it wasn't going to show
>> up anywhere even if it was.

This is correct.  You can read fan speeds and set PWM values, as well as
modifying the automatic fan control modes.

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJYTwD1AAoJEK+E3vEXDOFbcMcH/3BBXUpg4He2kS2T2TPZfgWr
jbWo+2fvdfJ5RZGS/iffrxv26dVw1s6QHocnlnW3xbUhgqQpz7ruXD4YfXtizIgY
+Fa7zWmptQTNqLbM2brOxKRYXBS1qAgRS9Xmciwk7aWsFMtms5cjLZ5JjLWy01cS
tPiRcYX+SQ6RcTgNYZi0QlYIB4gUIwJai4WRs3m0V2sFv4iXJB9CNKuv9Tw7miJY
wNTNQrlV1R0mj05cR8IemgT9S9iONavAZzN71uGSyXHauigMq88BaOVJB/unRtoT
PAI+5+bqGEH8UhfVQnk+epydPkzxTOYkKG5XLkc8VchfCEawontZ3p5dYy97Das=
=doBJ
-----END PGP SIGNATURE-----
