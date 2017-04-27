Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x236.google.com (mail-yb0-x236.google.com
 [IPv6:2607:f8b0:4002:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wCzgK1YtrzDqHv
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 11:21:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mgQxE5cK"; 
 dkim-atps=neutral
Received: by mail-yb0-x236.google.com with SMTP id s22so4570925ybe.3
 for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2017 18:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=xfvW5Vs8JxrdpU4Zk000NtA6fud8/vS0R25uByM03aI=;
 b=mgQxE5cK3g75NipGVfXN0O3nM+ezd83XHQLdG2CQAcg4X6QJJZprPnWpO6CH5me25Y
 jmnJhgeAquTCMsgimQ7L/cIb9kDE/78LEmpFM2xMs8T1/8ZeahvqkRNHJ9Ur+sjW8rD7
 VM53vFGs8kGUTNgEtcA91CSL+5EubjY+bNPzlTPx1yudEnpGgEw2SPHqAAfPTpfVcN3L
 oyYNi6pgKb2YD7epqR6N8QvVtdaic3CyY6RpaKLzgv/5ZoeL/WONWnuJ/AgfCLcYYFF5
 wZINW3/KkbsrB0vE/eBJ8aA3bg9MBcJ8vkdVvIblSwuLpjKBA7HRp3U0sBQTwvNluK1M
 fOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=xfvW5Vs8JxrdpU4Zk000NtA6fud8/vS0R25uByM03aI=;
 b=kfnSEWr4pDE6pe4gLmLU8ME7vJARCfviIfKoHGB6y1Offmu0yzLGUi/r/vyQMqa8at
 DniomrbPFaO3dgPMU38sSZGwWqw6Ie79pdZ2bQtsnAmd1wAuUSCJAN8iJUvC7g7zo4LB
 +oriPe4NTtasanlM2O8/6IMu0qOywt99qpOJMEzU0nogKIZ63HZHXMdQgFHi7zNq4IET
 GWh4aGevF89dczV7y7cc3UNw0uxYxFyZHmJmYmAx9jlXtlHqYRHoL2r6RPBMxFmfssEe
 RJG0fA+l/mrZQsmilbMYxzs1dFmTUFWZcQjo4tpSqDkT8eDxUu7WBtkrXLXeY1DpIyeA
 qKCQ==
X-Gm-Message-State: AN3rC/5vxRUpPnvcrvslsHplCTEwjjbQHwyV1cf/gKgHqLUhbH9DiR2T
 9+wzoXkd8YTinrtNhASHmUrbaH5avG7T
X-Received: by 10.37.33.193 with SMTP id h184mr2478065ybh.57.1493256090606;
 Wed, 26 Apr 2017 18:21:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Wed, 26 Apr 2017 18:21:10 -0700 (PDT)
In-Reply-To: <2cbb411eb150459eaf1484f0067be47f@rackspace.com>
References: <1493226355476.40153@rackspace.com>
 <3C77A62F-4926-4D09-B11E-48CC33A3F293@rackspace.com>
 <OF183DA0D0.8B27A4BC-ON8625810E.0061E1C9-8625810E.00620572@notes.na.collabserv.com>
 <384e9172ef1c4bed81152e7354575f5e@rackspace.com>
 <OF81B1700A.BAAADA39-ON8625810E.00824CFE-8625810E.00825DAC@notes.na.collabserv.com>
 <fc3dc13e5adb4125b3f22853c8326b62@rackspace.com>
 <CACPK8XfO3dUUkRNfx+_S7Z4PfndmiV-dm9p_av6-C2YXZ2jg2g@mail.gmail.com>
 <2cbb411eb150459eaf1484f0067be47f@rackspace.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Apr 2017 10:51:10 +0930
X-Google-Sender-Auth: Q425QGrCjVjMri09yA0RApb0B3Q
Message-ID: <CACPK8XeJyt6vPB5G0q6a7kyieWth3Akodkqdk+ECKZLoM+gB1w@mail.gmail.com>
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
X-List-Received-Date: Thu, 27 Apr 2017 01:21:33 -0000

On Thu, Apr 27, 2017 at 10:43 AM, Aaron Sullivan
<aaron.sullivan@rackspace.com> wrote:
> Hi Joel,
>
> The emergency console still seems stuck. Could be the XenServer agent for=
 emergency console is broken.
>
> Here's my public key:
>
> ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAlQRZE/2XupioiqseEicKBYhF/gUumN8oUzFVC=
bnwzwqe/LQ5F8EbOM7X40NLCSr0/PTFganXQH+dKL5Ka2aqOmKw1DDxNxDFHV71qvYNl1niWUE2=
V3nQI/8gX5SGUT7MqRPRfkcwD7yXAojmcqmJVqKdZVvVjOC0MCTCNe7ePwJRyFqiUucEo//1KVn=
hKCKkQFS5jDzUIQw6BoG7lFJLgySu3f9s6b+Iz3heIRE1H0VFznqpqI837SujB2dEPIhRsPEkHd=
rK7TUhqdB0+p3Am+C2Nfmd23VChcqndJaQod3CcwMstVA/djSo71Dr72mNtE6z7HpSkxGq4HbyS=
LnCzw=3D=3D rsa-key-20170426

I've added this to your account.

Cheers,

Joel

>
> -----Original Message-----
> From: joel.stan@gmail.com [mailto:joel.stan@gmail.com] On Behalf Of Joel =
Stanley
> Sent: Wednesday, April 26, 2017 7:28 PM
> To: Aaron Sullivan <aaron.sullivan@rackspace.com>
> Cc: Chris Austen <austenc@us.ibm.com>; joel@jms.id.au <openbmc@lists.ozla=
bs.org>; Chad Somerlot <chad.somerlot@RACKSPACE.COM>
> Subject: Re: OpenBMC cloud instance migration from Aaron's account
>
> On Thu, Apr 27, 2017 at 9:34 AM, Aaron Sullivan <aaron.sullivan@rackspace=
.com> wrote:
>> Hi Joel,
>>
>> The server appears to be nearly out of space, on the root volume, and no=
t responding to a shell-login on the volume. I never got around to setting-=
up the right backup attributes (backup was too large, and often fails).
>>
>> Before Friday, mid-day, I wanted to clean-up the volume and reconfigure =
backup, and get the emergency console working again. I suspect that if you =
just delete whatever is filling up the volume, and bounce the server, my em=
ergency console will work again.
>>
>> Alternatively, I can make contact with you to get the password and ssh k=
ey, and do the volume clean-up, etc., myself.
>
> Thanks for the heads up. There was an old packet capture sitting in a hom=
e directory from when we were diagnosing some network issues.
> Removing this fixed up the space issue on the root volume.
>
> I'll coordinate with you off list to sort out the backups.
>
> Cheers,
>
> Joel
>
>
>>
>>
>>
>> Let me know what you prefer.
>>
>>
>>
>> --Aaron
>>
>>
>>
>> From: Chris Austen [mailto:austenc@us.ibm.com]
>> Sent: Wednesday, April 26, 2017 6:44 PM
>> To: Aaron Sullivan <aaron.sullivan@rackspace.com>
>> Cc: joel@jms.id.au <openbmc@lists.ozlabs.org>
>>
>>
>> Subject: RE: OpenBMC cloud instance migration from Aaron's account
>>
>>
>>
>> Aaron,
>> Joel knows the current root password. He is on CC
>>
>>
>>
>> Chris Austen
>> POWER Systems Enablement Manager
>> (512) 286-5184 (T/L: 363-5184)
>>
>> Aaron Sullivan ---04/26/2017 01:51:53 PM---Hi Chris, Did we share root
>> access info, on the server? I don=E2=80=99t recall. If so, I need to che=
ck-in
>> wi
>>
>> From: Aaron Sullivan <aaron.sullivan@rackspace.com>
>> To: Chris Austen <austenc@us.ibm.com>
>> Cc: Adi Gangidi <adi.gangidi@rackspace.com>, Brad DeBauche
>> <brad.debauche@RACKSPACE.COM>, Chad Somerlot
>> <chad.somerlot@RACKSPACE.COM>
>> Date: 04/26/2017 01:51 PM
>> Subject: RE: OpenBMC cloud instance migration from Aaron's account
>>
>> ________________________________
>>
>>
>>
>>
>> Hi Chris,
>>
>> Did we share root access info, on the server? I don=E2=80=99t recall. If=
 so, I need to check-in with you.
>>
>> --Aaron
>>
>> From: Aaron Sullivan
>> Sent: Wednesday, April 26, 2017 1:06 PM
>> To: 'Chris Austen' <austenc@us.ibm.com>
>> Cc: Adi Gangidi <adi.gangidi@rackspace.com>; Brad DeBauche
>> <brad.debauche@RACKSPACE.COM>; Chad Somerlot
>> <chad.somerlot@RACKSPACE.COM>
>> Subject: RE: OpenBMC cloud instance migration from Aaron's account
>>
>> Hi Chris,
>>
>> Site is looking good! Brief interruption. I needed to reboot it and chan=
ge a few settings around backup.
>>
>> You might see a hiccup.
>>
>> --Aaron
>>
>> From: Chris Austen [mailto:austenc@us.ibm.com]
>> Sent: Wednesday, April 26, 2017 12:51 PM
>> To: Aaron Sullivan <aaron.sullivan@rackspace.com>
>> Cc: Adi Gangidi <adi.gangidi@rackspace.com>; Brad DeBauche
>> <brad.debauche@RACKSPACE.COM>; Chad Somerlot
>> <chad.somerlot@RACKSPACE.COM>
>> Subject: Re: OpenBMC cloud instance migration from Aaron's account
>>
>> Thank you Aaron,
>>
>> Welcome Chad I look forward to working with you. If you ever wondered
>> what we do with your server feel free to see it in action...
>> https://openpower.xyz/
>>
>>
>>
>> Chris Austen
>> POWER Systems Enablement Manager
>> (512) 286-5184 (T/L: 363-5184)
>>
>> Aaron Sullivan ---04/26/2017 12:47:51 PM---Hi Guys, I think we're just g=
oing to migrate my account over to Chad. That process is in flight now.
>>
>> From: Aaron Sullivan <aaron.sullivan@rackspace.com>
>> To: Adi Gangidi <adi.gangidi@rackspace.com>
>> Cc: Chad Somerlot <chad.somerlot@RACKSPACE.COM>, Chris
>> Austen/Austin/IBM@IBMUS, Brad DeBauche <brad.debauche@RACKSPACE.COM>
>> Date: 04/26/2017 12:47 PM
>> Subject: Re: OpenBMC cloud instance migration from Aaron's account
>>
>> ________________________________
>>
>>
>>
>>
>>
>> Hi Guys,
>>
>> I think we're just going to migrate my account over to Chad. That proces=
s is in flight now.
>>
>> Should be no disruption to the OpenBMC team.
>>
>> Sent from my mobile
>>
>> On Apr 26, 2017, at 12:05 PM, Adi Gangidi <adi.gangidi@rackspace.com> wr=
ote:
>>
>> Hi Team
>>
>> Chris Austen on cc from OpenBMC team would like to be posted timely on m=
igration of OpenBMC build server out of Aaron's account. Mainly if there is=
 any down time expected or just making sure the process is smooth so that t=
heir builds don't have too much impact.
>>
>> -Adi
>>
>>
>>
