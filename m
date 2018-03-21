Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="oqcIIrAO"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405t4p5lfkzF1bN
 for <openbmc@lists.ozlabs.org>; Thu, 22 Mar 2018 01:50:01 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id CF42D50C4E
 for <openbmc@lists.ozlabs.org>; Wed, 21 Mar 2018 14:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1521643790; x=
 1523458191; bh=OsQYW43kz6Xp2Ckz5vHOuYP9yliklzh16A59fAXfV2M=; b=o
 qcIIrAOo1gkGYb/MexjtzjqNJMbhV+S54A5pSf88E2NY12E05MqX6NQf+rmXnusN
 H59zLfTwmFT/4HR191TnQ+vk0BKx94NIZRjESExrdRqBmoWqCQSu3bct2V0GHA3u
 GGDQ6glYaU3bBXpASMpJq4/220xAd9QEW1THkeC6+M=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hZ_nUZhL51zv for <openbmc@lists.ozlabs.org>;
 Wed, 21 Mar 2018 17:49:50 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 27B5350A07
 for <openbmc@lists.ozlabs.org>; Wed, 21 Mar 2018 17:49:50 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 21
 Mar 2018 17:49:49 +0300
Subject: Re: IPMI Set LAN Configuration Parameters
To: <openbmc@lists.ozlabs.org>
References: <6de6bf00-ea77-a061-cd92-df255b2c0a7f@linux.intel.com>
 <CAO=notyuHzYmwxDre9-kTgPeYNSSrut32wJeRo46VWzrW6Q=xQ@mail.gmail.com>
 <7d9366d2-7816-227c-ac36-409faaa13d8b@linux.intel.com>
 <CAO=notzcgZxFthUY90V+2BgW=YnykrVsiVG4OdV0zR7kSTFoUA@mail.gmail.com>
 <20180214205327.GG113334@mauery>
 <f998fef8-0be3-8d1c-6856-768510a4cc9a@linux.vnet.ibm.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <644096ed-6248-850c-832d-797624c379f7@yadro.com>
Date: Wed, 21 Mar 2018 17:49:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <f998fef8-0be3-8d1c-6856-768510a4cc9a@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="i0d5ZcJfdMs6OEClpMGIARwQmAs2q1R6V"
X-Originating-IP: [172.17.14.168]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2018 14:50:04 -0000

--i0d5ZcJfdMs6OEClpMGIARwQmAs2q1R6V
Content-Type: multipart/mixed; boundary="5Q8JozEfc9XcKv1eAEAs0WgQdzuzmZEX6";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org
Message-ID: <644096ed-6248-850c-832d-797624c379f7@yadro.com>
Subject: Re: IPMI Set LAN Configuration Parameters
References: <6de6bf00-ea77-a061-cd92-df255b2c0a7f@linux.intel.com>
 <CAO=notyuHzYmwxDre9-kTgPeYNSSrut32wJeRo46VWzrW6Q=xQ@mail.gmail.com>
 <7d9366d2-7816-227c-ac36-409faaa13d8b@linux.intel.com>
 <CAO=notzcgZxFthUY90V+2BgW=YnykrVsiVG4OdV0zR7kSTFoUA@mail.gmail.com>
 <20180214205327.GG113334@mauery>
 <f998fef8-0be3-8d1c-6856-768510a4cc9a@linux.vnet.ibm.com>
In-Reply-To: <f998fef8-0be3-8d1c-6856-768510a4cc9a@linux.vnet.ibm.com>

--5Q8JozEfc9XcKv1eAEAs0WgQdzuzmZEX6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Just my 2 cents.

I did previously some commits to the ipmitool project, and can tell that
fixing ipmitool upstream now doesn't seem feasible as the only active
project maintainer (Zdenek Styblik) has called it quits about a year
ago. I've tried asking him to make me an admin of the project he doesn't
want to maintain anymore, but he just stopped responding.

I'm thinking about forking off (actually did it to YADRO organization on
github) and starting to maintain our own version of ipmitool. That
however doesn't solve the problem as the original ipmitool is a part of
all the available Linux distros, and making their maintainers switch to
our version I anticipate to be hell of a quest...

Applying the changes with a timeout after the set-complete looks good to
me as it both follows the specification and allows for addressing the
incorrect behavior of the original ipmitool.

Alexander.


13.03.2018 18:36, Tom Joseph wrote:
> Hello,
>
> There is a patch up for applying the network settings, with this patch
> it would not require set channel access command to apply the changes.
> A timer kicks in everytime set-complete happens, and the network
> settings are applied once the timer expires.
>
> https://gerrit.openbmc-project.xyz/#/q/topic:2932
>
> Regards,
> Tom
>
> On Thursday 15 February 2018 02:23 AM, Vernon Mauery wrote:
>> On 14-Feb-2018 12:32 PM, Patrick Venture wrote:
>>> I thought you had to explicitly set in_progress with the ipmitool?=C2=
=A0 My
>>> own ipmitool utility is implemented as you described where it doesn't=

>>> assume anything about your intent, just follows the actions.
>>
>> Currently, ipmitool (incorrectly) sets the "set in progress" bit for
>> every lan configuration parameter it sets. Given how the CLI
>> interface only allows the user to specify a single parameter at a
>> time, it might be smart to have ipmitool also expose controls for the
>> "set in progress" bit. Alternately, providing a way to to specify
>> multiple parameters in a single call would be good. Something like:
>>
>> ipmitool lan set 1 ipaddr 1.2.3.4 netmask 255.255.0.0 gateway 1.2.0.1
>> dns 1.2.1.1 ipmitool lan set 1 ipsrc dhcp
>>
>> and it would automatically set and use the set in progress bit
>> correctly.
>>
>> And ipmid could then take two actions, depending on how this bit is
>> (ab)used:
>> 1) if only a single command is wrapped up in the
>> set-in-progress/set-complete, then employ a timeout so that after
>> some amount of time, all the queued commands get applied.
>> 2) if multiple commands get wrapped up in the
>> set-in-progress/set-complete, then apply the command set when the
>> set-complete is received.
>>
>> Getting ipmitool changed to have correct behavior will take some
>> doing, so we will need to be able to deal with its incorrect behavior
>> for now. But also responding to correct behavior can make tools that
>> employ that behavior work even better (with no timeout delays).
>>
>> Just my $0.02.
>>
>> --Vernon
>>
>>> There's definitely the possibility of thrashing.
>>>
>>> On Wed, Feb 14, 2018 at 11:16 AM, Dave Cobbley
>>> <david.j.cobbley@linux.intel.com> wrote:
>>>> Do you have any concerns about ipmitool constantly flushing the
>>>> network as
>>>> it sets & unsets the complete bit inbetween parameters,
>>>> i.e. if you are setting 4 different parameters from a script?
>>>>
>>>> I'm not sure if this brings a lot of thrashing to the to the ipmi
>>>> network
>>>> stack or network manager.
>>>>
>>>> Seems like it would be prudent to fix ipmitool upstream to allow
>>>> you to set
>>>> multiple parameters, in addition to the ipmi stack.
>>>>
>>>>
>>>>> I personally have found this non-standard implementation a bit
>>>>> unpleasant, as it requires using a different command to basically
>>>>> flush it.=C2=A0 I am planning to implement it such that setting in
>>>>> progress
>>>>> before and complete after is how it all gets flushed instead of a
>>>>> timeout, since that approach reads more correct given the
>>>>> specification.=C2=A0 And really it's just about literally calling a=

>>>>> subroutine to flush everything when the in_progress bit is set to
>>>>> completed, and removing the code from "access on"
>>>>>
>>>>> If you're interested to do what I've just described, I don't think
>>>>> you'll get any push-back.
>>>>>
>>>>> Patrick
>>>>>
>>>>> On Wed, Feb 14, 2018 at 9:14 AM, Dave Cobbley
>>>>> <david.j.cobbley@linux.intel.com> wrote:
>>>>>>
>>>>>> I noticed that when using ipmitool lan set <channel> <parameter>,
>>>>>> the
>>>>>> openbmc stack does not apply the settings. This seems like a
>>>>>> non-standard
>>>>>> implementation. While using ipmitool as the standard is not quite
>>>>>> correct,
>>>>>> customers do expect it to work.
>>>>>>
>>>>>> After sending any sort of lan set command with ipmitool, the chang=
es
>>>>>> don't
>>>>>> appear to stick and this message shows up in the journal:
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 "Use Set Channel Access command to apply"=

>>>>>>
>>>>>> I know IPMI 2.0 is a little ambiguous about implementation
>>>>>> specifics, but
>>>>>> I
>>>>>> believe the intention was to utilize the "Set In Progress" bit
>>>>>> (Parameter
>>>>>> 0)
>>>>>> while doing work, and use "Set Complete" when you are finished to
>>>>>> flush
>>>>>> the
>>>>>> changes.
>>>>>>
>>>>>> To work around ipmitool constantly setting and unsetting the "Set =
In
>>>>>> Progress" bit in between every parameter applied, some BMC stacks
>>>>>> accumulate
>>>>>> network changes over a period of time and apply after a timeout -
>>>>>> this is
>>>>>> also compatible with ipmitool's non-standard use of the "Set In
>>>>>> Progress"
>>>>>> bit.
>>>>>>
>>>>>>
>>>>>> Is there a plan to circle back and change this functionality to
>>>>>> work with
>>>>>> ipmitool in the future?
>>>>>>
>>>>>> Thanks,
>>>>>> -Dave Cobbley
>>>>>>
>>>>
>>
>



--5Q8JozEfc9XcKv1eAEAs0WgQdzuzmZEX6--

--i0d5ZcJfdMs6OEClpMGIARwQmAs2q1R6V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJasnENAAoJEOiTWHtbdBeNDlEQAKPhk+t9gWy2vjQVHQv/iAmU
7zbMyx5vwNJzdHEuD87Y6XxyDQustlrvYG4HAmajKmyZOxBH6JHscHvryvxZ2pFm
4C8WuBk3L5zxAxCW67yo8adVTSZgfArJXbE6ROrF+Mw8nJ0dnTjVLtKRr07nWAy3
3BvP24zz5eQGEvr52x0Eb1CVzv4F3wPu851J67xZSqMr4kZNEDCuokjyqoqeEbtb
2jZ7s4TJFea8WIY3PYr4nl71lHDMEVUvYTLaSmVOsZpdAHModgEwEiPQAPNc/bNR
e8ojETsiX69usykkj5k3Ty1J+7ZGH5PUOJbnohXDMExXsw6r1vduPl1tVPrCXKg6
JhwmJ91Q5jj5y1qjkYVsqkHIWPCqYqpsvm7Wd8EkLxkDW9KGPZusq/jIXC/ezhn0
AEhSpuTgTTb2rMo/9KK9km0zoEDOjivm0paL9b1UF+/yM7C+KndG8XaZgix9my7o
qfcLOPatBomYXJHRgBqHHpjx7iyzTqKQRx9DO1qm0LnqcqDE8yj8nnJuG2YiKXwg
t+JsHWoEzMr+7maw5nMnNX1ba8jgMo7zHdaQGdyDc1V1MAAFYE4DZwRYriORrYiO
szbWvVWt9rxTdvGIfXvxuSiirZ+oian7Jh0ojSZn0zgxx1ccTkH3fIsXbFx94qpP
Pb/56sPrFlBgRXrVZuaz
=HR6z
-----END PGP SIGNATURE-----

--i0d5ZcJfdMs6OEClpMGIARwQmAs2q1R6V--
