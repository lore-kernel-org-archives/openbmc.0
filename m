Return-Path: <dja@axtens.net>
Received: from mail-pa0-x242.google.com (mail-pa0-x242.google.com
 [IPv6:2607:f8b0:400e:c03::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D02C1A06BB
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 13:14:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=qJOLoxtm; 
 dkim-atps=neutral
Received: by mail-pa0-x242.google.com with SMTP id yy13so25216413pab.1
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 18:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:user-agent:date
 :message-id:mime-version:content-type;
 bh=7FkZVXrXyUiC8mQhVccHX2CcJWVLPOJ8QJxhzNIdBlM=;
 b=qJOLoxtmLsAjgEm/w+RhbFAUsFy/ywAKo4p2gSyO3RRwL6vBlVt5ph0g23+e15VpsL
 HprpmfBjzwodIyYOBoI5bv8dQXz2DzAyjVnv4HSr25d91M+c87FIR3PvMsN/jt+uFX0g
 6BtFe8KuxWdBsrqLPDvCScTM2+92BdacHuU2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=7FkZVXrXyUiC8mQhVccHX2CcJWVLPOJ8QJxhzNIdBlM=;
 b=KDeGtA+9MKP8Ywhbdp+W3BVsR5sMgnXpEOTo38PAWb8goAtK8/mu6zdqkGkf8r6qvM
 LYty29ZU84P8TAc1pn0KS66zLaDNgIc1AFPBo86KQXFUHFSKDZBByqSzaFnggL9e8dd4
 VVGvNlgsAMqgdcR49LkltdEbBgTngAIZAZaLVLGJO8hxQqnBIe9TYRiJ8uhDISSVhoF+
 nC7bKCZiYBOkcZP+TJLoj2KbWXA1lWARHyq8X5HV7HwaqNZVlWSqPwy+2wA+GGeXzxxQ
 WF0TwYWKlpB+bzhbDZ7flflQ81GTGrDMS9OPEkSKlw5vCzPLtlu3g6OgdfdCoKjxVtQb
 VBwQ==
X-Gm-Message-State: ALoCoQlmDV+PhePfRxT6oXRjWJhyvBK7i7/5CMpJJW7ODXdFpBPaJwn+SdWPA4cbwaZVVTyA78z0DuDd+S/Ju+RUHoqint3Nlg==
X-Received: by 10.66.184.15 with SMTP id eq15mr129207212pac.42.1452564845285; 
 Mon, 11 Jan 2016 18:14:05 -0800 (PST)
Received: from localhost (ppp121-45-193-224.lns20.cbr1.internode.on.net.
 [121.45.193.224])
 by smtp.gmail.com with ESMTPSA id m86sm26030377pfi.27.2016.01.11.18.14.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2016 18:14:04 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Chris Austen <austenc@us.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc] pflash and linux updates
In-Reply-To: <201601120021.u0C0LZJq018374@d03av03.boulder.ibm.com>
References: <877fjf7k3d.fsf@gamma.ozlabs.ibm.com>
 <1452531631-14153-1-git-send-email-openbmc-patches@stwcx.xyz>
 <201601120021.u0C0LZJq018374@d03av03.boulder.ibm.com>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Tue, 12 Jan 2016 13:13:46 +1100
Message-ID: <87y4bv5yud.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jan 2016 02:14:12 -0000

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Chris,

Chris Austen <austenc@us.ibm.com> writes:

>  I hope this comes through as plain text...
Yep! Something is a bit weird after your full stops in the next
paragraph. Renders as a "=C2=A0" (looks like an underscore) for me. But yea=
h,
no HTML, so I'm happy.

>
> We are using the Robottest framework for automated testing.=C2=A0 I would=
 love some help making the last mile automated.=C2=A0 We have test cases.=
=C2=A0 We have systems.=C2=A0 We have Jenkins.=C2=A0 There is some funny bu=
siness to get the code started (setting up ip addresses, accepting ssh key =
changes, copying a helper tool over to the victim box) but after that we ar=
e rolling.=C2=A0=20
>
> If you are able to help swing a hammer I can provide all the materials yo=
u need.=20
>
Sure! I have done some stuff with SSH keys and copying helper tools
around for Skiboot, so hopefully some of that translates.

(I realise some of this might be IBM specific: I'm daxtens@au1.ibm.com
if you need an @ibm address.)

Regards,
Daniel

>
> Chris Austen
> POWER Systems Enablement Manager=20
> (512) 286-5184 (T/L: 363-5184)
>
> -----"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wr=
ote: -----
> To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
> From: Daniel Axtens=20
> Sent by: "openbmc"=20
> Date: 01/11/2016 06:04PM
> Subject: Re: [PATCH openbmc] pflash and linux updates
>
> OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
>
>> I've tested on Barreleye
>
> I realise this might be a bit optimistic, but do we have any automated
> (or even semi-automated) testing for existing machine types?
>
> If not, I'm happy to start chipping away at little bits of it.
>
> Regards,
> Daniel
>
>>
>> https://github.com/openbmc/openbmc/pull/130
>>
>> Chris Austen (1):
>> =C2=A0 pflash and linux updates
>>
>> =C2=A0meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb | 2 +-
>> =C2=A0meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb =C2=A0|=
 2 +-
>> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>>
>> --=20
>> 2.6.4
>>
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>
> [attachment "signature.asc" removed by Chris Austen/Austin/IBM]

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWlGFcAAoJEPC3R3P2I92FNAwP/R+Mm0IBKV+ZM4V+rpQVNexi
EflBKso74LCMedc11/6WMoUloDDaz+oIoVXLfWIlR2A7a9RJ9JP9fTXpoU/ayCwL
Cv48q43Oz9PLepGAzTKauo73pNP0eTvcCJMem7Q7EzYCMbsgUpVuwyjUOs15PBpN
58j7osfQ/RIC9j2pPAqLN/CtyccWPXW+JLQ39s4rgnYNcE73KxwmQ2zJLd1p+V/7
u5/YDI/aqpJZE2t/SbvvuzqZOTP+rlL86NiU183VNLCAkAtmUdaMMQEJGPNGiC01
3F3rnA47ykZfkjgRuOFLsXGHLXmge4rdOjpKk5aZW0pFAMQ76eP7knw5yJStCCFJ
UVi3yrmwULPWvKpSbh1pxJ1YZotuoVrEkvnV5oE+f/tpgIbxwlvRYlyrD1Tl9X6I
51pb1ATRxEggC56h/oF5CN4HyUCg9sgU2J+oB6JkgExdyJYxGH+KaGvnx9bW8CEb
hlkj45xt9iRP4TcvXIDwo3aAx/3Sj0Rsbj2SOb6n/xRdItIcrUPulJoXPW+aY+o4
JGIiYgksLAFyjvfEQfhNsmN+OEa2+jDJQPLelMs0s2BNIvp+6m1JbMnE8vruV5q3
JNzxScV24dNd3XhzEmP7JeHAv2577CUoTr1BczsaO29CRYWzIvfr9eGJSEnJEX7X
hmhkUOfbS75XEJcFFBSv
=4VsB
-----END PGP SIGNATURE-----
--=-=-=--
