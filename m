Return-Path: <raltherr@google.com>
Received: from mail-io0-x229.google.com (mail-io0-x229.google.com
 [IPv6:2607:f8b0:4001:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rlkFM6JcQzDqyS
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2016 02:52:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=ef1DCqoI; 
 dkim-atps=neutral
Received: by mail-io0-x229.google.com with SMTP id l202so24862304ioe.3
 for <openbmc@lists.ozlabs.org>; Thu, 07 Jul 2016 09:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=PynKGkKcN1JTqWgEZUcNuaKMrOOUD+wcWFGe1jgPEf0=;
 b=ef1DCqoIX2aOzU0M1cuum5d7VeU5AyBs7qFdsvZbBmqy7Ebsgz73OO5fAzGZXV6oLL
 pED+D0vgtxU4qHrnYvZbfsLJeKiRMxtgcRlp3HNuWC65Eu3Zv59ecy6mlSn6THbRUo71
 7fvaCCvxkEe11+19wz9d8Zmn+viQxVbJFLZM4ewffPlBh25s7ngShqIJ12lCX2bwGsXi
 GzQgXBiUzUMJoGAxG+1OmtUSdpUK1nO+OHeZWFC9gdZ6dipQEL6gR4rDqs5a/q5UFT9K
 YMizBgPHvLD7H4RCVoXt8tFOhZ1EldIanzvNyjSgQKzC93mjQXEOJylYcrSJGpSFp+7K
 1E7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=PynKGkKcN1JTqWgEZUcNuaKMrOOUD+wcWFGe1jgPEf0=;
 b=j8DHuCMEatp0bu3QEkwkE8XvqnSo6v/SIVD525o8Y121DCHbR+RPUkXREBEcVHN4b5
 jSS0CfHtaQnB4UUIzm3OgrGasrxEQKd3GLdkwWMS3l/bmNDZxeQ7z0mt5tTB5NXxXdJL
 oowfjaafNJuqVaQuPbP6JGt/VPd/gQGtjRZe4aCCiZH53cmuL0qqUL6JSgCXdR6bHKS8
 XSvw73mmOucWAJw0h7K1F0HSUUglwFHP7bfoSHhDxQwHGAJdmpEZm2wve92m1MivsIzT
 refPuITqZ7yW2FBasylyjjfjT+SL0wcv3MD0py/JGtnUXmdITdr4B38doiwDoD5COses
 TPUA==
X-Gm-Message-State: ALyK8tJguSb4dcGeyw9ERckvUjZxbrWmgv6SfTpDOoR4cj0zkFkEcaVH/GNEH0N2ib3iNYCVFa3UeHstKWCEx3ma
X-Received: by 10.107.58.65 with SMTP id h62mr4376149ioa.172.1467910357544;
 Thu, 07 Jul 2016 09:52:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.101.202 with HTTP; Thu, 7 Jul 2016 09:52:36 -0700 (PDT)
In-Reply-To: <OFAF379D90.EBDC1ECC-ON65258094.0026E76B-65257FE9.004807C1@notes.na.collabserv.com>
References: <OFAF379D90.EBDC1ECC-ON65258094.0026E76B-65257FE9.004807C1@notes.na.collabserv.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 7 Jul 2016 09:52:36 -0700
Message-ID: <CAPLgG=kcOH1h6NZ6-gV9dTaKzpjjZfqpQBjTzXd-r3t8e5VL5g@mail.gmail.com>
Subject: Re: Issues with setting the timeofday
To: Vishwanatha Subbanna <vishwanath@in.ibm.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114ac6166ceb7405370e83ac
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jul 2016 16:52:40 -0000

--001a114ac6166ceb7405370e83ac
Content-Type: text/plain; charset=UTF-8

If ntpd or systemd-timesyncd is running, this makes perfect sense.  Linux
maintains current time in the kernel.  The hardware RTC is only used to
load an initial time at boot and is written during shutdown.  When an NTP
daemon is running and an NTP server is reachable, it will adjust the
kernel's current time to match NTP time.  I believe with timesyncd, it
simply steps time instead of slewing like ntpd does.

What are you trying to accomplish?  There is likely a way to do it if you
can describe what you want to have happen.

On Thu, Jul 7, 2016 at 6:06 AM, Vishwanatha Subbanna <vishwanath@in.ibm.com>
wrote:

> hey Joel,
>
> Here is what I am seeing on one the Barreleye box that is running
> "4.4.12-openbmc-20160606-1 : kernel". I can see that time gets set but
> reverts immediately. Syncing what's in hwclock does not have any effect
> too. Any thoughts ?
>
> root@barreleye:~# date -s '2016-12-25 12:34:56' ; hwclock -w
> Sun Dec 25 12:34:56 UTC 2016
>
> root@barreleye:~# date
> Thu Jul 7 13:07:37 UTC 2016
>
> root@barreleye:~# hwclock -r
> Sun Dec 25 12:35:01 2016 0.000000 seconds
>
> root@barreleye:~# hwclock -s
>
> root@barreleye:~# date
> Thu Jul 7 13:07:52 UTC 2016
> root@barreleye:~#
>
> Thanks
>
>
> -------------------------------------------------------------------------------------
> Thanks and Regards,
> Vishwanath.
> Advisory Software Engineer,
> Power Firmware Development,
> Systems &Technology Lab,
> MG2-6F-255 , Manyata Embassy Business Park,
> Bangalore , KA , 560045
> Ph: +91-80-46678255
> E-mail: vishwanath@in.ibm.com
>
> ----------------------------------------------------------------------------------
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>

--001a114ac6166ceb7405370e83ac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If ntpd or systemd-timesyncd is running, this makes perfec=
t sense.=C2=A0 Linux maintains current time in the kernel.=C2=A0 The hardwa=
re RTC is only used to load an initial time at boot and is written during s=
hutdown.=C2=A0 When an NTP daemon is running and an NTP server is reachable=
, it will adjust the kernel&#39;s current time to match NTP time.=C2=A0 I b=
elieve with timesyncd, it simply steps time instead of slewing like ntpd do=
es.<div><br></div><div>What are you trying to accomplish?=C2=A0 There is li=
kely a way to do it if you can describe what you want to have happen.</div>=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Jul=
 7, 2016 at 6:06 AM, Vishwanatha Subbanna <span dir=3D"ltr">&lt;<a href=3D"=
mailto:vishwanath@in.ibm.com" target=3D"_blank">vishwanath@in.ibm.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><p>hey Joel,<br><br=
>Here is what I am seeing on one the Barreleye box that is running &quot;4.=
4.12-openbmc-20160606-1 : kernel&quot;. I can see that time gets set but re=
verts immediately. Syncing what&#39;s in hwclock does not have any effect t=
oo. Any thoughts ?<br><br>root@barreleye:~# date -s &#39;2016-12-25 12:34:5=
6&#39; ; hwclock -w<br>Sun Dec 25 12:34:56 UTC 2016<br><br>root@barreleye:~=
# date<br>Thu Jul  7 13:07:37 UTC 2016<br><br>root@barreleye:~# hwclock -r<=
br>Sun Dec 25 12:35:01 2016  0.000000 seconds<br><br>root@barreleye:~# hwcl=
ock -s<br><br>root@barreleye:~# date<br>Thu Jul  7 13:07:52 UTC 2016<br>roo=
t@barreleye:~# <br><br>Thanks<br><br>--------------------------------------=
-----------------------------------------------<br>Thanks and Regards,<br>V=
ishwanath.<br>Advisory Software Engineer,<br>Power Firmware Development, <b=
r>Systems &amp;Technology Lab,<br>MG2-6F-255 , Manyata Embassy Business Par=
k, <br>Bangalore , KA , 560045<br>Ph: <a href=3D"tel:%2B91-80-46678255" val=
ue=3D"+918046678255" target=3D"_blank">+91-80-46678255</a><br>E-mail: <a hr=
ef=3D"mailto:vishwanath@in.ibm.com" target=3D"_blank">vishwanath@in.ibm.com=
</a><br>-------------------------------------------------------------------=
---------------<br>
</p></div>
<br>_______________________________________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/listinfo/openbmc</a><br>
<br></blockquote></div><br></div>

--001a114ac6166ceb7405370e83ac--
