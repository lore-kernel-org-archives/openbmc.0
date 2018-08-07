Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22f; helo=mail-oi0-x22f.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SxJFQ/0Z"; 
 dkim-atps=neutral
Received: from mail-oi0-x22f.google.com (mail-oi0-x22f.google.com
 [IPv6:2607:f8b0:4003:c06::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41l9MT5NlkzDqBx
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 20:13:24 +1000 (AEST)
Received: by mail-oi0-x22f.google.com with SMTP id 13-v6so27491767ois.1
 for <openbmc@lists.ozlabs.org>; Tue, 07 Aug 2018 03:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=5deZBJSQwJbWSHu0OyCcoZVxxdIAZnZmzD38r7jTGG8=;
 b=SxJFQ/0ZVqlNjLsGBe/8P9Wp0MSrZ18b6BN40CPuM09OKaqDcYRL4qJQJEP7KB/AIK
 dJtCngtAsAMeBma24MZfcNrFw25L1iMzbS2kxmFw0gccgIvbRIIqgyccKIuH6J5ZcJgG
 cNfhLUX/BCCGtXWgBifRXoiQJ5B5Wf+DMsY9Lv+rgsCEj2VyWz9IcHciSLxn2gFO+vA0
 ygLT6QNulDBNzeNDGQSmCOe9ruRMxR/j1EUwZ3P8LfumhG4OvdklZEFHTPI1BAYY9CYv
 elu4JiAjmhfXw7KMnkrwhPZ/Zs5Oj1I6BCfNR273oMYEFyV/wA7p8kVl80taHE0+sE+P
 sBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=5deZBJSQwJbWSHu0OyCcoZVxxdIAZnZmzD38r7jTGG8=;
 b=FjqX1oKcCsqQLbyOaE9DFRIxIDfo3X6rtEKOjmmOmqcC38keFadJs8IRbtw7Z6BwIX
 GzuUDz92g/caNe6GbCMFNuYuSW8/Dg/h2RK3O8aPSL84so+SCENey8dc6vODPVPBpu8L
 rDLcTDokU76WPp9eFS3H50I6MIV7MQtCitVaa1b9tz5pgUNAN+hccisHRICVDPWL7w0F
 nQJqsQIUWyPJjLxL1wgCmASly8/kogz/cX32Px57fXcZSm2IOR0liPaLS5eSgfz8dGHA
 7n3ZEkChi2OeXCpvLNXnB1k1fuW2DggD+34t2hBZopijoSg5YPtrh6SJV8G/kvwvAtND
 g/Lw==
X-Gm-Message-State: AOUpUlESD7YkZuvBSAVg1qjawVjV24y7Zq/DeuYcP2VJs7SsCxsZgU+8
 I6h24KQoDEufGGCRqAwJiktvXhEvgFsrJvxQNs4=
X-Google-Smtp-Source: AAOMgpf1isS456seQhbvtwZEUG5nKP12Cdq1MGMSvRCvulq+6y9ny4O/+Lq5Wqyj6vh68+B8LMhctEyRS4Y1EorlpPY=
X-Received: by 2002:aca:e6cd:: with SMTP id
 d196-v6mr17618177oih.94.1533636802182; 
 Tue, 07 Aug 2018 03:13:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:2c4a:0:0:0:0:0 with HTTP;
 Tue, 7 Aug 2018 03:13:21 -0700 (PDT)
In-Reply-To: <25bebbd3-7df8-f396-ef62-0b846e3435aa@intel.com>
References: <CAE33tLFQ6v2n2tBavZVJmHdYK1cFmFFhKRb9_8RG3xS4xzr6ug@mail.gmail.com>
 <25bebbd3-7df8-f396-ef62-0b846e3435aa@intel.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Tue, 7 Aug 2018 15:43:21 +0530
Message-ID: <CAE33tLHsd5HwrCS9qLXO6Mo_gzka1Mrv7vs3Ofy0AF=YRJdT1w@mail.gmail.com>
Subject: Re: Phosphor Web-ui: Server unreachable
To: Ed Tanous <ed.tanous@intel.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000cf09650572d5a425"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2018 10:13:26 -0000

--000000000000cf09650572d5a425
Content-Type: text/plain; charset="UTF-8"

Hi Ed,

Sorry for the late reply. I was on leave for last week.

I am hosting phosphor-webui on a different machine and trying to connect
the BMC board using its IP address. I am using bmcweb platform. When I
tried to login, the following message appeared in browser console.

Cross-Origin Request Blocked: The Same Origin Policy disallows reading the
remote resource at https://<BMC-IP>/login. (Reason: CORS request did not
succeed).
<unavailable> activity-stream.bundle.js:3170:9
CSI/tbsd_ cb=gapi.loaded_0:458:127
CSI/_tbnd cb=gapi.loaded_0:458:127
CSI/tbsd_ cb=gapi.loaded_0:458:127
CSI/_tbnd cb=gapi.loaded_0:458:127



Thanks and Regards,

Akash

On Mon, Jul 30, 2018 at 11:06 PM, Ed Tanous <ed.tanous@intel.com> wrote:

> On 07/30/2018 05:04 AM, AKASH G J wrote:
>
>> Hi Team,
>>
>> I added phosphor-webui into the Linux image and set up client side of the
>> web interface. In the client side of web interface I could able to give the
>> IP address, username and password. After entering all those details, it is
>> showing "server unreachable". But I could able to ping the server board and
>> ssh into the system. Please someone help to resolve the problem.
>>
>>
>>
>> Thanks and Regards,
>>
>> Akash G J
>>
>
> We need some basic information to help you troubleshoot.  You might also
> find faster responses on irc;  Most of the people involved in the web
> infrastructure are online there.
>
> 1. What platform are you using?
> 2. If not one of the upstream platforms, which web server is your platform
> using?  (probably one of phosphor-rest, bmcweb, or phosphor-rest+nginx)
> 3. When you open up the debugger window in your chosen browser (usually
> the F12 key) then go to the network tab and attempt to log in, what do you
> see?  You should see an attempt to get to the /login url, with some kind of
> error code (maybe 401, maybe 500, maybe something else).  We'll need that
> to help troubleshoot.
> 4. Is there anything else strange about your setup that you might think
> would contribute to your issue?
> 5. Are you hosting phosphor-webui from a different machine from the BMC.
> Depending on what server you are using, there are likely security settings
> preventing cross site scripting that are blocking you.
>

--000000000000cf09650572d5a425
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ed,</div><div><br></div><div>Sorry for the late re=
ply. I was on leave for last week.</div><div><br></div><div>I am hosting ph=
osphor-webui on a different machine and trying to connect the BMC board usi=
ng its IP address. I am using bmcweb platform. When I tried to login, the f=
ollowing message appeared in browser console.</div><div><br></div><div>Cros=
s-Origin Request Blocked: The Same Origin Policy disallows reading the remo=
te resource at https://&lt;BMC-IP&gt;/login. (Reason: CORS request did not =
succeed).<br>&lt;unavailable&gt; activity-stream.bundle.js:3170:9<br>CSI/tb=
sd_ cb=3Dgapi.loaded_0:458:127<br>CSI/_tbnd cb=3Dgapi.loaded_0:458:127<br>C=
SI/tbsd_ cb=3Dgapi.loaded_0:458:127<br>CSI/_tbnd cb=3Dgapi.loaded_0:458:127=
</div><div><br></div><div><br></div><div><br></div><div>Thanks and Regards,=
</div><div><br></div><div>Akash<br></div></div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On Mon, Jul 30, 2018 at 11:06 PM, Ed Tanous <=
span dir=3D"ltr">&lt;<a href=3D"mailto:ed.tanous@intel.com" target=3D"_blan=
k">ed.tanous@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div class=3D"HOEnZb"><div class=3D"h5">On 07/30/2018 05:04 AM, AKASH G=
 J wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi Team,<br>
<br>
I added phosphor-webui into the Linux image and set up client side of the w=
eb interface. In the client side of web interface I could able to give the =
IP address, username and password. After entering all those details, it is =
showing &quot;server unreachable&quot;. But I could able to ping the server=
 board and ssh into the system. Please someone help to resolve the problem.=
<br>
<br>
<br>
<br>
Thanks and Regards,<br>
<br>
Akash G J<br>
</blockquote>
<br></div></div>
We need some basic information to help you troubleshoot.=C2=A0 You might al=
so find faster responses on irc;=C2=A0 Most of the people involved in the w=
eb infrastructure are online there.<br>
<br>
1. What platform are you using?<br>
2. If not one of the upstream platforms, which web server is your platform =
using?=C2=A0 (probably one of phosphor-rest, bmcweb, or phosphor-rest+nginx=
)<br>
3. When you open up the debugger window in your chosen browser (usually the=
 F12 key) then go to the network tab and attempt to log in, what do you see=
?=C2=A0 You should see an attempt to get to the /login url, with some kind =
of error code (maybe 401, maybe 500, maybe something else).=C2=A0 We&#39;ll=
 need that to help troubleshoot.<br>
4. Is there anything else strange about your setup that you might think wou=
ld contribute to your issue?<br>
5. Are you hosting phosphor-webui from a different machine from the BMC.=C2=
=A0 Depending on what server you are using, there are likely security setti=
ngs preventing cross site scripting that are blocking you.<br>
</blockquote></div><br></div>

--000000000000cf09650572d5a425--
