Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="cr0I7Okw"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42rMXc2cpGzF3FX
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 23:09:34 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id F0FA54193E
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1541678970; x=
 1543493371; bh=mbM+VfNidxOQsl+a5CyGrQ7r3v/W9EmT8c+RWwE4RTk=; b=c
 r0I7OkwVtLivTcDnP44Z273JO64zOg7zYJPYifgoVkIRSbjZ2FwjIeYMQd76/dsh
 OLUGziUBy9BJ/+3nFZHD+YWmTq8z+7pCxP+OM5ddPaZxnMe8IKsJ+2/xgjO5kMvc
 7wP9cFpp+Yrnc+qnwBuv8lxDW1UBiHWIgiB7CEYpeU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wHD-DXKuqVv2 for <openbmc@lists.ozlabs.org>;
 Thu,  8 Nov 2018 15:09:30 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id CA06841258
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 15:09:30 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 8 Nov
 2018 15:09:30 +0300
Subject: Re: Mains blink, chassisoff, and power restore policy
To: <openbmc@lists.ozlabs.org>
References: <959CAFA1E282D14FB901BE9A7BF4E7724E3FF8A0@shsmsx102.ccr.corp.intel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <f456a985-59f2-f2c5-7fb7-06c313acb0d0@yadro.com>
Date: Thu, 8 Nov 2018 15:09:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E7724E3FF8A0@shsmsx102.ccr.corp.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OC5NNvp7AV3KdlvjWFB0Vy4xLQ9EOxZbN"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Nov 2018 12:09:38 -0000

--OC5NNvp7AV3KdlvjWFB0Vy4xLQ9EOxZbN
Content-Type: multipart/mixed; boundary="PFkjydKRanwFAPouvihRIX83NSKvJdTva";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org
Message-ID: <f456a985-59f2-f2c5-7fb7-06c313acb0d0@yadro.com>
Subject: Re: Mains blink, chassisoff, and power restore policy
References: <959CAFA1E282D14FB901BE9A7BF4E7724E3FF8A0@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E7724E3FF8A0@shsmsx102.ccr.corp.intel.com>

--PFkjydKRanwFAPouvihRIX83NSKvJdTva
Content-Type: multipart/alternative;
 boundary="------------4D182859BFCE0178C717B3C6"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4D182859BFCE0178C717B3C6
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

I don't see any IPMI command there. Only some yaml and yaml-generating sc=
ripts.

Anyway, such a command is vendor-specific would not be supported by ipmit=
ool (unlike `chassis power off`).

Most admins would just do `ipmitool chassis power off` and won't know abo=
ut the need to issue a raw command afterwards.

08.11.2018 04:55, Wang, Kuiying wrote:
>
> Hi Alexander,
>
> We did ipmi command to user to configure the policy.
>
> Please refer:
>
> https://gerrit.openbmc-project.xyz/#/c/openbmc/intel-dbus-interfaces/+/=
15471/
>
> =A0
>
> =A0
>
> Thanks,
>
> Kwin.
>
> =A0
>


--------------4D182859BFCE0178C717B3C6
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html;
      charset=3Dwindows-1252">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>I don't see any IPMI command there. Only some yaml and
      yaml-generating scripts.<br>
    </p>
    <p>Anyway, such a command is vendor-specific would not be supported
      by ipmitool (unlike `chassis power off`).</p>
    Most admins would just do `ipmitool chassis power off` and won't
    know about the need to issue a raw command afterwards.<br>
    <br>
    <div class=3D"moz-cite-prefix">08.11.2018 04:55, Wang, Kuiying wrote:=
<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:959CAFA1E282D14FB901BE9A7BF4E7724E3FF8A0@shsmsx102.ccr.corp.i=
ntel.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html;
        charset=3Dwindows-1252">
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
=2EMsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal">Hi Alexander,<o:p></o:p></p>
        <p class=3D"MsoNormal">We did ipmi command to user to configure
          the policy.<o:p></o:p></p>
        <p class=3D"MsoNormal">Please refer:<o:p></o:p></p>
        <p class=3D"MsoNormal"><a
href=3D"https://gerrit.openbmc-project.xyz/#/c/openbmc/intel-dbus-interfa=
ces/+/15471/"
            moz-do-not-send=3D"true">https://gerrit.openbmc-project.xyz/#=
/c/openbmc/intel-dbus-interfaces/+/15471/</a>
          <o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
        <p class=3D"MsoNormal">Kwin.<o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------4D182859BFCE0178C717B3C6--

--PFkjydKRanwFAPouvihRIX83NSKvJdTva--

--OC5NNvp7AV3KdlvjWFB0Vy4xLQ9EOxZbN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJb5Cd6AAoJEOiTWHtbdBeNBssQAJcIlj8wFnEzeVPqIyAhh46T
VwSD2k1C+b3k/mFb8Xzs+yUXd+h1VBfffKk3GOJTEKigZHZBjFf9W9YVgvQ+5nNB
Ae/3ZaGxZPbpWCHPJy62K+rOPeBOSimRWh9RtJWcndUzht90OjYEFmOuQR3YH34e
s/JQm5eMNidfN+kI8q94GjZvixG9watInO5VxIscGfzETwK2HR2bmhpGqGon6ba7
bZE8mk6SAHpNZG1bCe5Je2+Ia3UsruofVuHuXDl3sAljO0gPwY8lhsGgOpgroA7u
DvS5kAi+Xp2vvD0zQCXccfu7t3+3Tou6ii5nJCPqSsUyRYBwCDpAxo7W/zdkqL4S
UUYUVTUT+X0DrwslqVAdNMrSktjoyWJVEcufo7wYS/VRfBwp3v/giq770RzpogDJ
JZQKbyAo/UmbBIR3K7EFb22tEgX4YOeI51lZxnzOkbQj8PIfkwhUCwJAYenZIc3p
RxjAijOynmV1dosc/b4UaLytpw/56V4gfpQaymsGzl1mEjYO4FJQxyPRJ5V45eUV
/VYdqRN0TImHjUNwhWPG0NWFPpm0PyoK6Pww5pWAOGu0K8TCy7KSOwEfP1fKkp6S
auS8iU/BjuvpimaZNq/+P/yWOFQGGtc95uVicVGZW19JHMPGQEyxxgR+WL6TBod9
vfb6M64EVcMz9pByUPDO
=ylWc
-----END PGP SIGNATURE-----

--OC5NNvp7AV3KdlvjWFB0Vy4xLQ9EOxZbN--
