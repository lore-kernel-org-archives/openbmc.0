Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x233.google.com (mail-yw0-x233.google.com
 [IPv6:2607:f8b0:4002:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wCyTt6Z8yzDqC6
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 10:28:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CUehDwVl"; 
 dkim-atps=neutral
Received: by mail-yw0-x233.google.com with SMTP id k11so8493493ywb.1
 for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2017 17:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=++fDvQCLx2LzOWKEy9alsKRqLGPPxHHldRbZSkZwssk=;
 b=CUehDwVl/xw0rGMrCe+3tUh59XlkK0rZPyE7NL3BcY/vwdtfw1c7AE2NtNpEG2haTI
 /rWBcZ60a4jQ8gNvhfGrxQ1nPrWOoXBu1e7+p/UthgM+HHWa2m3GYzecg1hx4knc36Ox
 WVHu0LIeZnhJvMGEcAew2IscS0rbAlWcqVkZuaH5PhftIy7WcHhyInG9KvHbXkw+n0xd
 yXY/ZpvLkIv3UFyPeuyT0JL04lhIhdwjbLNmRG1brrOC92JRQDzbpKz5aMfWbtzqBM9j
 M3sd5NL5W18Ion9hBIBjvi5uFR92vjl1OgPDAhV35ZNRcg9whJt4uC/kkhYG3FALZxaG
 KBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=++fDvQCLx2LzOWKEy9alsKRqLGPPxHHldRbZSkZwssk=;
 b=rBhY9IH5PeIE3ZMj6iGOcJLHU7R+IOg+nroMM4ZOCW0zebXVkA+ZGZYIYBAFSk56sO
 yEeZ6Mw800++od9xqF9KVIVRMTWhYaiZ56MfuDU10rdQIerlVRlmLquM4ozMFY8kUZ8V
 1txsH+Uzd7FRi0s6BBcbRClMpExA/W3yJuzhHVl/GrtyKPqLblyTzRovagl8boBdK4Vg
 CRgWX1M/tQ8ymElEK+XNVXfpl0M6NikmsyqanrtdwjhHuyT6SNZqi9j43wwCZh7m321g
 fAg3o0IK2GVZmR5e6/ORUumbA6LFLtROnYJEoe/Z6BbJE1cl0cVtlMbto+AyxMpnEU2P
 CHzA==
X-Gm-Message-State: AN3rC/5uRkuB2J4p/8HVZrvVWtak08qvTYccV7A48NJGLsk1CKtdMDkf
 CK41itX/sMRmbMTfNv82Pwx1q580Rw==
X-Received: by 10.129.65.74 with SMTP id f10mr2251187ywk.164.1493252896024;
 Wed, 26 Apr 2017 17:28:16 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Wed, 26 Apr 2017 17:27:55 -0700 (PDT)
In-Reply-To: <fc3dc13e5adb4125b3f22853c8326b62@rackspace.com>
References: <1493226355476.40153@rackspace.com>
 <3C77A62F-4926-4D09-B11E-48CC33A3F293@rackspace.com>
 <OF183DA0D0.8B27A4BC-ON8625810E.0061E1C9-8625810E.00620572@notes.na.collabserv.com>
 <384e9172ef1c4bed81152e7354575f5e@rackspace.com>
 <OF81B1700A.BAAADA39-ON8625810E.00824CFE-8625810E.00825DAC@notes.na.collabserv.com>
 <fc3dc13e5adb4125b3f22853c8326b62@rackspace.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Apr 2017 09:57:55 +0930
X-Google-Sender-Auth: ttv5NZT3YxkJZLkvwMEU7BkF01M
Message-ID: <CACPK8XfO3dUUkRNfx+_S7Z4PfndmiV-dm9p_av6-C2YXZ2jg2g@mail.gmail.com>
Subject: Re: OpenBMC cloud instance migration from Aaron's account
To: Aaron Sullivan <aaron.sullivan@rackspace.com>
Cc: Chris Austen <austenc@us.ibm.com>,
 "joel@jms.id.au" <openbmc@lists.ozlabs.org>, 
 Chad Somerlot <chad.somerlot@rackspace.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 27 Apr 2017 00:28:19 -0000

On Thu, Apr 27, 2017 at 9:34 AM, Aaron Sullivan
<aaron.sullivan@rackspace.com> wrote:
> Hi Joel,
>
> The server appears to be nearly out of space, on the root volume, and not=
 responding to a shell-login on the volume. I never got around to setting-u=
p the right backup attributes (backup was too large, and often fails).
>
> Before Friday, mid-day, I wanted to clean-up the volume and reconfigure b=
ackup, and get the emergency console working again. I suspect that if you j=
ust delete whatever is filling up the volume, and bounce the server, my eme=
rgency console will work again.
>
> Alternatively, I can make contact with you to get the password and ssh ke=
y, and do the volume clean-up, etc., myself.

Thanks for the heads up. There was an old packet capture sitting in a
home directory from when we were diagnosing some network issues.
Removing this fixed up the space issue on the root volume.

I'll coordinate with you off list to sort out the backups.

Cheers,

Joel


>
>
>
> Let me know what you prefer.
>
>
>
> --Aaron
>
>
>
> From: Chris Austen [mailto:austenc@us.ibm.com]
> Sent: Wednesday, April 26, 2017 6:44 PM
> To: Aaron Sullivan <aaron.sullivan@rackspace.com>
> Cc: joel@jms.id.au <openbmc@lists.ozlabs.org>
>
>
> Subject: RE: OpenBMC cloud instance migration from Aaron's account
>
>
>
> Aaron,
> Joel knows the current root password. He is on CC
>
>
>
> Chris Austen
> POWER Systems Enablement Manager
> (512) 286-5184 (T/L: 363-5184)
>
> Aaron Sullivan ---04/26/2017 01:51:53 PM---Hi Chris, Did we share root ac=
cess info, on the server? I don=E2=80=99t recall. If so, I need to check-in=
 wi
>
> From: Aaron Sullivan <aaron.sullivan@rackspace.com>
> To: Chris Austen <austenc@us.ibm.com>
> Cc: Adi Gangidi <adi.gangidi@rackspace.com>, Brad DeBauche <brad.debauche=
@RACKSPACE.COM>, Chad Somerlot <chad.somerlot@RACKSPACE.COM>
> Date: 04/26/2017 01:51 PM
> Subject: RE: OpenBMC cloud instance migration from Aaron's account
>
> ________________________________
>
>
>
>
> Hi Chris,
>
> Did we share root access info, on the server? I don=E2=80=99t recall. If =
so, I need to check-in with you.
>
> --Aaron
>
> From: Aaron Sullivan
> Sent: Wednesday, April 26, 2017 1:06 PM
> To: 'Chris Austen' <austenc@us.ibm.com>
> Cc: Adi Gangidi <adi.gangidi@rackspace.com>; Brad DeBauche <brad.debauche=
@RACKSPACE.COM>; Chad Somerlot <chad.somerlot@RACKSPACE.COM>
> Subject: RE: OpenBMC cloud instance migration from Aaron's account
>
> Hi Chris,
>
> Site is looking good! Brief interruption. I needed to reboot it and chang=
e a few settings around backup.
>
> You might see a hiccup.
>
> --Aaron
>
> From: Chris Austen [mailto:austenc@us.ibm.com]
> Sent: Wednesday, April 26, 2017 12:51 PM
> To: Aaron Sullivan <aaron.sullivan@rackspace.com>
> Cc: Adi Gangidi <adi.gangidi@rackspace.com>; Brad DeBauche <brad.debauche=
@RACKSPACE.COM>; Chad Somerlot <chad.somerlot@RACKSPACE.COM>
> Subject: Re: OpenBMC cloud instance migration from Aaron's account
>
> Thank you Aaron,
>
> Welcome Chad I look forward to working with you. If you ever wondered wha=
t we do with your server feel free to see it in action... https://openpower=
.xyz/
>
>
>
> Chris Austen
> POWER Systems Enablement Manager
> (512) 286-5184 (T/L: 363-5184)
>
> Aaron Sullivan ---04/26/2017 12:47:51 PM---Hi Guys, I think we're just go=
ing to migrate my account over to Chad. That process is in flight now.
>
> From: Aaron Sullivan <aaron.sullivan@rackspace.com>
> To: Adi Gangidi <adi.gangidi@rackspace.com>
> Cc: Chad Somerlot <chad.somerlot@RACKSPACE.COM>, Chris Austen/Austin/IBM@=
IBMUS, Brad DeBauche <brad.debauche@RACKSPACE.COM>
> Date: 04/26/2017 12:47 PM
> Subject: Re: OpenBMC cloud instance migration from Aaron's account
>
> ________________________________
>
>
>
>
>
> Hi Guys,
>
> I think we're just going to migrate my account over to Chad. That process=
 is in flight now.
>
> Should be no disruption to the OpenBMC team.
>
> Sent from my mobile
>
> On Apr 26, 2017, at 12:05 PM, Adi Gangidi <adi.gangidi@rackspace.com> wro=
te:
>
> Hi Team
>
> Chris Austen on cc from OpenBMC team would like to be posted timely on mi=
gration of OpenBMC build server out of Aaron's account. Mainly if there is =
any down time expected or just making sure the process is smooth so that th=
eir builds don't have too much impact.
>
> -Adi
>
>
>
