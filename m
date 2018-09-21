Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="b3eR1nvf"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Gqy10vRNzF3Q8;
 Fri, 21 Sep 2018 20:45:44 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2B6B94190F;
 Fri, 21 Sep 2018 10:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1537526739; x=
 1539341140; bh=gjiXs4WkqJbLwExOlL5znI01b1EAWdXhDaeXsZ4CtU0=; b=b
 3eR1nvf6x3rAYYg+rYZmm5xhqvkXA15BZx83WWjHJ8XvBxzM657gSk8wwzGHcu2g
 1ZlCOjOcH/ARlX1UaIhq2+TsVe6dwMS5X2fkeMGJloQTC8R/kKjAgrtbLOybjAYr
 uE2WJjaYdOYTe4aIs/ObcEmK0VfYrh1cfyWUMEmcFo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZD3lcGj4lMq; Fri, 21 Sep 2018 13:45:39 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B3B77418F7;
 Fri, 21 Sep 2018 13:45:39 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 21
 Sep 2018 13:45:39 +0300
Subject: Re: Version and Functional FRU fields for motherboard and membuf
To: George Keishing <gkeishin@in.ibm.com>, Lei YU <mine260309@gmail.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, openbmc
 <openbmc-bounces+gkeishin=in.ibm.com@lists.ozlabs.org>, Michael Walsh
 <micwalsh@us.ibm.com>
References: <11b98338b00640daa3cbeba50c6ef324@yadro.com>
 <33ffdf42-0d9d-0331-0e14-2898cd1a1e73@yadro.com>
 <CAARXrtmmeixPcYx4U11Zy19fm0GnOLbvUD2MTpZOEp-ytQ9T2g@mail.gmail.com>
 <0c38bf32fc3c43f79a4356170fe23df0@yadro.com>
 <CAARXrtmDv74030kX_tZ+n7qAHKCX6BRXhj_i9Rni3wdj_D3h-w@mail.gmail.com>
 <OF753FD5AF.343964B8-ON0025830F.002727AF-6525830F.0029FC4F@notes.na.collabserv.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 xsFNBFj0jdkBEADhQF4vZuu9vFfzxchRQtU/ys62Z13HTaYK/VCQKzPnm2mf593Il61FP9WV
 0Srt4t4yumiXK7NhHeqktN/YZjYDYVr9l+vZpNydOHpDjk7xjPgb0KkoFCo7bcQ2/e4AtLTQ
 XGoWIKv983vWlphPCG1Jof5jH3RA7mccCNXtGlzVYF0RYR0/qKGgsoBymkldNKPwgPf/3SXb
 QY5V3sJ5SHwDjmhg3MYnblV29OULdi72DKI9MkhTTHQFlA++CfYstx/cZ1BZwWmoMgi0umpj
 Pf+5mAkmTtlPW7U54EUgFpvTMfxRRS7yH+iTlvngduYW6jryt0zm6r7M2LGR+uWGSTmWBB7Y
 t06D0Xrm0Zwl4alQ5WDrlUTkzZcXDb0QqY7UkQSkghLmUjItEj4Z+ay7ynIsfjQe0OYdTofh
 dY0IUxMxNm9jeckOkRpSdgsQrTcKIOAt/8jI62jlzN1EXA6blhASv5xtt7I1WXCpDU+mpfKf
 ccUVJfmd0Q2nlG64L4Bv8o+iBI0Xu5+EX2NzDKQF5vSQIK8mwniAPT16hi80mZG9EQf0fJ1C
 p7xJGvwA6IiwXWsAqhNRhYbmNDfiR2MMxw5DFdQSeqoK3ONeeIwrJAPNdme+Z1DoT2+ZuZP0
 nfUa8e2QaMHkXwCz9e0cI2NUmAwFJ9Qg4L0eyhdZP4rQ1KCg/QARAQABzSxBbGV4YW5kZXIg
 QW1lbGtpbiA8YWxleGFuZGVyQGFtZWxraW4ubXNrLnJ1PsLBgAQTAQgAKgIbAwULCQgHAgYV
 CAkKCwIEFgIDAQIeAQIXgAIZAQUCWmWolAUJcjFDNwAKCRDok1h7W3QXjXyOEACUv6oDO7Vn
 KnDTUypYhyTVi8C+fjlHTH+AIDP4qk6nXjMIJeh0P7rQCHAOIOCW9osy/urYQ5at90eUolDV
 udMe5+sSvKRHYksu74O+4XedE2TDFJnntnz0JIeyuaH4FVRDX5i2hlK6wx2D06wTJj4JONlW
 c1aLULPKfrCbMbpNlD9s/+48RkCj77kl30nJ+56ThEMkSgomMIL9XMesNnQAa83Y55mJhx1f
 n3Gz7kH6nxLPPgLWgKXebAgM6ltJAjaCIWxZYlJK5dQmQC5N7PR0kXdnHttSx89ldgPacpX7
 V39dBMoURY/+YtMU7VKUNVW/IXkwXT7m42QoxO3H+HNHRVfDtELy2l6fBCf0ShXs4b3AF654
 aRJrwQX1Za3mg6OXTmAVDEerqOBht5XZl2Y/FyxV1Tka2SarkYrNVjD3YXODnmF3GfAuP8Jk
 F8uYvQyXpLMpThnUPjs+Vl1NC1exh2mrM+7kxGXPKhrFWxX7tduAJpULpdCk4mefO9/U7I8/
 Edf5giE1o9yhECZ71lzmA7p7bLDv54Qfu4WAVndUgHLHCH7uUsKf3cds/gLtpuTrHB83nvvh
 LKZ6+kYnn5pK89hkia0EbpOrTrqBqphMyxFb7WFapXip7kRaqUdMOqdRO+JHG3rFAhz7sl/0
 DPWSea7WGLe0TNySCQ4GdytKLs7BTQRY9I3ZARAAygmVNgjvxkqud75kP5fwhmwMVu13sLh8
 QnZxjMsA9Zelt1Hu+BVmjET7YL4xBhdJDZ4y3UI/MV8ZzOfJHUWSNr6POwKIrsQfGzdlgB0e
 w2k6Rm651Jp+aAsygB4GR7BopptJd9d/q5oCnZxpPgDpZOBCpl4DQ3fJIGSc8iQVmA84lHLS
 +mqIJ94PZ7uza4F0ly6Au+Hbkhowh/1q+BUd6Rn553WAmPAG7g0lAG/Obq1m77ovlR86yY5i
 C503QKlPJELSNYtzczuLQZetjDtaFkugke4QMlhzHyc7DjSsjyccdhepPtXWEm84jPCx1/KU
 3m9jAWtPdARQ73su/fiitmXAifQXJBB2R9fmKuM2F3ClHcJxv/l0W1ruekD9vojOO75yvBEG
 7fGlLc9hUgIIGgBJvI+Yb1/KhqWC9r53TS6kcuCi+z9kf+4MTBge2sU97DtivZGzul6yhrcr
 3Ic5paWoaka2ClGqKBQo3A9o4F60q3rRq5FAcMdKQq7qJutCzcjkcCpVVik1im0u0+UGrK0s
 YQuAgTu45mJPOfINqz1xz+qwxSjYI/wjxJaYTZLO68CIdBiDj+zxIeo9o/mUJvS+DhnPzKhW
 KXToZl2D7VdjOlu8zZ0tIFYrULJYhuw2f/KwD1lwoehlKikEE0H0xkPygufjtiYo6jTb+BKa
 sG8AEQEAAcLBZQQYAQgADwIbDAUCWmWo6AUJcjFDNwAKCRDok1h7W3QXjc9vEADXse2POSaT
 M0uqR3KGTeF8XVKdyRqK9afWbMaxFzOWGp9pNtcmIvfmyE0M6LPLgUb33jek/Ngup/RN7CjZ
 NCjOc2HTID99uBkYyLEcOYb+bycAReswjrv3a49ZBmmGKJZ+aAm0t6Zo6ekTdUtvlIrVYvRs
 UWWj4HdCaD+BMvSqcDZgyQESLI9nfEGuWtVqdi2QlZZeQT7W+RH4lihHKTdzOsVC93o4h6og
 ZvgOJ/0g1SP3la88RWONejHxVbGzBOyNjkH71CFujnAfuVuuhkJaN8PY/CS56sKMREKJOy0L
 vouE7eSU4bp13GK1xsnbWcDQpyzTsCsP9taqQmeld8Hw1yuPamc6fdpKNyPHyN20vzh20f0C
 QUMAjh3Vym12aKhyRan08VNEaLOKiyya6+i9c3Z3LiWUEqTSzELCkesb68UQVtE6/CXPM2P/
 vs3EQuLFXBC/rD9lurT0kG99xElAbKjHLer5NSw2WA2vQXaFadGNDyHI32Yt2cAqWzZtVqmN
 ESE0npJ5eeAcVWPHjhCwL8phZCDtfxJMy2cqYS8QLIBGfQTIHMQAgqBbpq9FLXCn008tvaTr
 KijxDkPtWeXDLbMgH1kA46gTPJWxsm0c45w7c3aXhXl4hOgXp+iWDTOT83tJU0zoD9hYlpZf
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <c15f402d-4a0d-caa5-a437-475482b3daca@yadro.com>
Date: Fri, 21 Sep 2018 13:45:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <OF753FD5AF.343964B8-ON0025830F.002727AF-6525830F.0029FC4F@notes.na.collabserv.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Uaw8zn3hiul8GHvnYt9QGj9B2yNPjqiH0"
X-Originating-IP: [172.17.14.168]
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
X-List-Received-Date: Fri, 21 Sep 2018 10:45:46 -0000

--Uaw8zn3hiul8GHvnYt9QGj9B2yNPjqiH0
Content-Type: multipart/mixed; boundary="cIr9x6jF2MswCNrzgKVjccmBeM3FfbNdr";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: George Keishing <gkeishin@in.ibm.com>, Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 openbmc <openbmc-bounces+gkeishin=in.ibm.com@lists.ozlabs.org>,
 Michael Walsh <micwalsh@us.ibm.com>
Message-ID: <c15f402d-4a0d-caa5-a437-475482b3daca@yadro.com>
Subject: Re: Version and Functional FRU fields for motherboard and membuf
References: <11b98338b00640daa3cbeba50c6ef324@yadro.com>
 <33ffdf42-0d9d-0331-0e14-2898cd1a1e73@yadro.com>
 <CAARXrtmmeixPcYx4U11Zy19fm0GnOLbvUD2MTpZOEp-ytQ9T2g@mail.gmail.com>
 <0c38bf32fc3c43f79a4356170fe23df0@yadro.com>
 <CAARXrtmDv74030kX_tZ+n7qAHKCX6BRXhj_i9Rni3wdj_D3h-w@mail.gmail.com>
 <OF753FD5AF.343964B8-ON0025830F.002727AF-6525830F.0029FC4F@notes.na.collabserv.com>
In-Reply-To: <OF753FD5AF.343964B8-ON0025830F.002727AF-6525830F.0029FC4F@notes.na.collabserv.com>

--cIr9x6jF2MswCNrzgKVjccmBeM3FfbNdr
Content-Type: multipart/alternative;
 boundary="------------39D1BAF05D59E24B9B87B354"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------39D1BAF05D59E24B9B87B354
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

21.09.2018 10:38, George Keishing wrote:
> > By the way, what is at all the meaning and purpose of the 'Functional=
' property? Is it an indicator of a component functioning properly, or is=
 it a 'handle' to turn a component off before hot removal/replacement?
> >>>> Correct, the Field 'Functional' indicates the component is functio=
ning. =A0so Functional is a 'status' and not a 'control'.
>
> > There is no description anywhere that we could find.
> >>>> You can look at the YAML state/ namespace for it
> >>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xy=
z/openbmc_project/State/Decorator/OperationalStatus.interface.yaml

Yes, I've seen that. That's exactly what I call "no description". "Implem=
ent to indicate the operational status of the object" is not a decent des=
cription IMO as it's too sepulkarian (https://en.wikipedia.org/wiki/Sepul=
ka).

Alex.

--------------39D1BAF05D59E24B9B87B354
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html;
      charset=3Dwindows-1252">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    21.09.2018 10:38, George Keishing wrote:<br>
    <blockquote type=3D"cite"
cite=3D"mid:OF753FD5AF.343964B8-ON0025830F.002727AF-6525830F.0029FC4F@not=
es.na.collabserv.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html;
        charset=3Dwindows-1252">
      <tt><span style=3D" font-size:10pt">&gt; By the way, what is at all=

          the
          meaning and purpose of the 'Functional' property? Is it an
          indicator of
          a component functioning properly, or is it a 'handle' to turn
          a component
          off before hot removal/replacement?<br>
        </span></tt><span style=3D" font-size:10pt;font-family:sans-serif=
">&gt;&gt;&gt;&gt;
        Correct, the Field 'Functional' indicates the component is
        functioning.
        =A0so Functional is a 'status' and not a 'control'.</span><br>
      <br>
      <tt><span style=3D" font-size:10pt">&gt; There is no description
          anywhere
          that we could find.</span></tt><br>
      <span style=3D" font-size:10pt;font-family:sans-serif">&gt;&gt;&gt;=
&gt;
        You can look at the YAML state/ namespace for it<br>
        &gt;&gt;&gt;&gt; </span><a
href=3D"https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/x=
yz/openbmc_project/State/Decorator/OperationalStatus.interface.yaml"
        moz-do-not-send=3D"true"><span style=3D"
          font-size:10pt;color:blue;font-family:sans-serif">https://githu=
b.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/St=
ate/Decorator/OperationalStatus.interface.yaml</span></a><br>
    </blockquote>
    <br>
    Yes, I've seen that. That's exactly what I call "no description". "<s=
pan
      class=3D"pl-s">Implement to indicate the operational status of the
      object" is not a decent description IMO as it's too sepulkarian
      (<a class=3D"moz-txt-link-freetext" href=3D"https://en.wikipedia.or=
g/wiki/Sepulka">https://en.wikipedia.org/wiki/Sepulka</a>).</span><br>
    <br>
    Alex.<br>
  </body>
</html>

--------------39D1BAF05D59E24B9B87B354--

--cIr9x6jF2MswCNrzgKVjccmBeM3FfbNdr--

--Uaw8zn3hiul8GHvnYt9QGj9B2yNPjqiH0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbpMvTAAoJEOiTWHtbdBeNX/EP+wbPrguApNV2RlZEeL4b4voU
yPxdh8EyK+KWu9yOGFjNboE0TPP8aON1f4WjY+BBZ7ZQk9q/MrjqljOVFrj/bVUk
zpnuMZ2TS/9BY7JavXlGgri4qxx7NcFjGcQkVJ7DvNhi+WvGfrs21/bv3X3RxvOi
z9HubfM8KPop+eHbq7z1AGHjxoiht9vAidccjXHtyrcr5obL2rY+bT0vJDTstNlF
NEfdubi94AcKM2BBCx6yCuOkxmitUtdJiDS0sOV1tLUqEvMvAqSsHYCAOAzOIGYm
SDooLTeh5LWqNHUNe3R5DVToAFdKefrrspGNtMwb/sjhSNm0myXDpY+V4t3I33Zl
xfVckHf7P10j3CNJM7H1HPT/6gLNJ1zKvQGo1OqMya8gfBEiQ+h3XZ+EOEENJddC
Wv9eH07juObauN7a5XXdOl5XrBos8PJIc1/nVn+TTQGo/yf5MuKZzQdaVaNohWSg
b71bWm0KH0sakL5r2QpWNd4B1q4+oxMxyzFGmMrLr4Kp5L4CTimj5vNJX66TztV6
250Ex0bumRRoNPaAsErtxRtHWPxU8awpwIIIWP9wRFIgrvx0ONPR7teQXDSKjJk8
7juqlqO0cVkGXda9XIT9WWu7sowqzokJtrL0H5Tlo+RygjGWEl0F+t6gWH1sTgzW
+VYd4EWQPEt7LwVb3TSL
=xRpw
-----END PGP SIGNATURE-----

--Uaw8zn3hiul8GHvnYt9QGj9B2yNPjqiH0--
