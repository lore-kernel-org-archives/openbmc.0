Return-Path: <brendanhiggins@google.com>
Received: from mail-ua0-x230.google.com (mail-ua0-x230.google.com
 [IPv6:2607:f8b0:400c:c08::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sP28w6fggzDrhs
 for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2016 07:44:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Q+Nlo6zq; 
 dkim-atps=neutral
Received: by mail-ua0-x230.google.com with SMTP id k90so56805249uak.1
 for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2016 14:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yeQfjITJ+U39P1PddT61wVS+Cvk1EA4KpQ/dfqlhJKI=;
 b=Q+Nlo6zq7MI9tkwBW3tNBT3ZPVQn+IJviQilw+rtXbEFhM/orBdGTIPLngEZpIE8X7
 t0NVtjfNUXqTiSZALDNgqu1CoUP+Ck2XvdbzWuyTIJKwcnHJSpTECYkx7lthdMq+0ZeP
 m0hlcfhC2TiRQhbMAj9LaqsFW7ZAQxjN6mMF0d8Awt8b/VQebmgGThWBp5iWWa+CvLqZ
 7Xi33Xy2otguGN17TO9pbRVn2nJpmhfjEpjsR0Mh8c5MqGD40cnhJ45vbHf7ophLLefx
 SMBTURPJ463LHYU5K+5nUG7uN1eaQ00TuiYsyuTIwTSwk3jNtnaW4CkyInido1LeTSEC
 9Pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yeQfjITJ+U39P1PddT61wVS+Cvk1EA4KpQ/dfqlhJKI=;
 b=kpR4A4QMifS0twTwUoyu5MLvFdbiU1Qa3R53lbxOx1mGCHwhmUhDJjF0QUaRBPNVoY
 nJqvfarkbyMwWlU62vbuVXzHexKIuKZiQy2rJViYXGbLzziPgTL/SyiCv4Nsxdax/OPu
 C/Mfl8QxlJBaFI6MZvmbROi1QvxlWKrT1cHzOtCc9+H/az2m27HoIgnrsQnS/14u2oNt
 7WSR93sU1t7HO/BvqOOe0xMuTajja9m/c7q1FFsEFL1r8wslkML+k5K3uy2jKX9rydCC
 YVjFEG4l18SH5fv3XpVdGk+pQsZTC55OkQTrxligYP7vkf/gIrt5IePG8kvEyL8ySgVx
 oYug==
X-Gm-Message-State: AE9vXwNFIn6tIwlPzPQ8wQXj+fldjNqy/FLGdnNAT2GY5p7ap4PyQbwRv7UJBz7iD3JC2x0S0VOtmL7Uy+wvMPCH
X-Received: by 10.159.36.206 with SMTP id 72mr3199269uar.126.1472593454620;
 Tue, 30 Aug 2016 14:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <1471743258-7179-1-git-send-email-brendanhiggins@google.com>
 <1471743258-7179-3-git-send-email-brendanhiggins@google.com>
 <CACPK8XfAfiuas_D3UGMf6Hf922oFH9dcHg_9QUP7xvmuTkmabg@mail.gmail.com>
 <CAFd5g45iZBEAPQtkHRUuT6aB5zTYxjW50sFMTYEw=h0u7mUJrA@mail.gmail.com>
In-Reply-To: <CAFd5g45iZBEAPQtkHRUuT6aB5zTYxjW50sFMTYEw=h0u7mUJrA@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 30 Aug 2016 21:44:04 +0000
Message-ID: <CAFd5g45-aOGnpAb4gWjz7Zz-_+3gLux61+kzZT4Wni9VZCmpLg@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: aspeed: cleanup driver
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: multipart/alternative; boundary=001a113ee93ac32e4f053b50e182
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
X-List-Received-Date: Tue, 30 Aug 2016 21:44:17 -0000

--001a113ee93ac32e4f053b50e182
Content-Type: text/plain; charset=UTF-8

Oh, and one more note: I moved out the eeprom quirk patch from this patch
set because I think it makes sense as a different submission upstream.

On Tue, Aug 30, 2016 at 11:59 AM Brendan Higgins <brendanhiggins@google.com>
wrote:

> checkpatch seems to be upset about my device tree identifiers being
> undocumented; do we have a coordinated effort for this? I did not even see
> a directory for aspeed under arm.
>
> checkpatch is also asked about updating MAINTAINERS, but looks like it
> should be covered under existing line:
> F: drivers/*/*aspeed*
> Does it just ask this every time you add a file?
>
> changelog:
>  - Squashed driver commits as suggested by Joel
>  - Renamed a couple functions for consistency
>  - Fixed a couple style errors
>
> On Sun, Aug 28, 2016 at 10:35 PM Joel Stanley <joel@jms.id.au> wrote:
>
>> Hi Brendan,
>>
>> On Sun, Aug 21, 2016 at 11:04 AM, Brendan Higgins
>> <brendanhiggins@google.com> wrote:
>> > Rewrote most of master IRQ handler, xfer functions, and error recovery.
>> > Minor refactor of probing functions. Added remove functions.
>>
>> Thanks for the patch. The diff is quite noisy given you're deleting
>> lots of cruft from the vendor driver. It would be easier for us to
>> review if you send the patch that adds the driver from scratch.
>>
>> One suggestion I did have is to rename the driver to use the aspeed_
>> prefix for all functions so that it matches the drivers that have
>> already gone upstream.
>>
>> Given our goal is immediate upstream submission, how about you send a
>> complete patch that adds the driver to upstream (say 4.8-rc4?)? Send
>> it to the i2c lists and cc myself, jk@ozlabs.org, and andrew@aj.id.au.
>>
>> I hope we can get this sent out for upstream review this week. Let me
>> know if there's anything I can do to help achieve that.
>>
>> Cheers,
>>
>> Joel
>>
>> > ---
>> >  drivers/i2c/busses/i2c-aspeed.c | 932
>> ++++++++++++++--------------------------
>> >  1 file changed, 318 insertions(+), 614 deletions(-)
>>
>

--001a113ee93ac32e4f053b50e182
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oh, and one more note: I moved out the eeprom quirk patch =
from this patch set because I think it makes sense as a different submissio=
n upstream.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Au=
g 30, 2016 at 11:59 AM Brendan Higgins &lt;<a href=3D"mailto:brendanhiggins=
@google.com">brendanhiggins@google.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"ltr">checkpatch seems to be upset about my d=
evice tree identifiers being undocumented; do we have a coordinated effort =
for this? I did not even see a directory for aspeed under arm.<div><br></di=
v><div>checkpatch is also asked about updating MAINTAINERS, but looks like =
it should be covered under existing line:</div><div>F:<span class=3D"m_6253=
558928841242401Apple-tab-span" style=3D"white-space:pre-wrap">	</span>drive=
rs/*/*aspeed*</div><div>Does it just ask this every time you add a file?</d=
iv><div><br></div><div>changelog:</div><div>=C2=A0- Squashed driver commits=
 as suggested by Joel</div><div>=C2=A0- Renamed a couple functions for cons=
istency</div><div>=C2=A0- Fixed a couple style errors</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr">On Sun, Aug 28, 2016 at 10:35 PM Joel=
 Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.i=
d.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Brendan,<br>
<br>
On Sun, Aug 21, 2016 at 11:04 AM, Brendan Higgins<br>
&lt;<a href=3D"mailto:brendanhiggins@google.com" target=3D"_blank">brendanh=
iggins@google.com</a>&gt; wrote:<br>
&gt; Rewrote most of master IRQ handler, xfer functions, and error recovery=
.<br>
&gt; Minor refactor of probing functions. Added remove functions.<br>
<br>
Thanks for the patch. The diff is quite noisy given you&#39;re deleting<br>
lots of cruft from the vendor driver. It would be easier for us to<br>
review if you send the patch that adds the driver from scratch.<br>
<br>
One suggestion I did have is to rename the driver to use the aspeed_<br>
prefix for all functions so that it matches the drivers that have<br>
already gone upstream.<br>
<br>
Given our goal is immediate upstream submission, how about you send a<br>
complete patch that adds the driver to upstream (say 4.8-rc4?)? Send<br>
it to the i2c lists and cc myself, <a href=3D"mailto:jk@ozlabs.org" target=
=3D"_blank">jk@ozlabs.org</a>, and <a href=3D"mailto:andrew@aj.id.au" targe=
t=3D"_blank">andrew@aj.id.au</a>.<br>
<br>
I hope we can get this sent out for upstream review this week. Let me<br>
know if there&#39;s anything I can do to help achieve that.<br>
<br>
Cheers,<br>
<br>
Joel<br>
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/i2c/busses/i2c-aspeed.c | 932 ++++++++++++++------------=
--------------<br>
&gt;=C2=A0 1 file changed, 318 insertions(+), 614 deletions(-)<br>
</blockquote></div></blockquote></div>

--001a113ee93ac32e4f053b50e182--
