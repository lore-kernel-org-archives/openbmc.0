Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="nfn15MRb"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420kB652p0zF31M
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 21:37:18 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 57BD84120E
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1535542634; x=
 1537357035; bh=BYSQ9fG7iu5xItL2uhd6PeVAVjw+YDQ4IeSkdei8abY=; b=n
 fn15MRbpneIkl7UCSYRcDvwtKUsBViAzyYHDv4GkjasH0dqyfCed4FVkypPXegBy
 zUGRpvOo2i+iEu8CzfhAgZO8NUh6jLVpMy2ObPzQuZHphK0yfd1HUk0pmPgvW8jB
 qd9y6xkk7FY+ZrD4LgV+243cIzmEpDTySPTVSClkgg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5l-fsyhx7cRK for <openbmc@lists.ozlabs.org>;
 Wed, 29 Aug 2018 14:37:14 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 011F541185
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 14:37:14 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 29
 Aug 2018 14:37:13 +0300
Subject: Re: SOL Logging
To: <openbmc@lists.ozlabs.org>, Artem Senichev <a.senichev@yadro.com>
References: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <8ec90e03-10ed-a052-7a0b-328d7c6cde64@yadro.com>
Date: Wed, 29 Aug 2018 14:37:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AH1Rb3UVwnw8NCXr9zejardw4qKPr760a"
X-Originating-IP: [172.17.14.168]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
X-List-Received-Date: Wed, 29 Aug 2018 11:37:20 -0000

--AH1Rb3UVwnw8NCXr9zejardw4qKPr760a
Content-Type: multipart/mixed; boundary="NzGsJfHpp1LuHDASenPnypcJpwuss6AmI";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org, Artem Senichev <a.senichev@yadro.com>
Message-ID: <8ec90e03-10ed-a052-7a0b-328d7c6cde64@yadro.com>
Subject: Re: SOL Logging
References: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>

--NzGsJfHpp1LuHDASenPnypcJpwuss6AmI
Content-Type: multipart/alternative;
 boundary="------------8B98422BC85B271D56FB6B16"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8B98422BC85B271D56FB6B16
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


25.08.2018 00:02, Tanous, Ed wrote:
>
> I would like to start a discussion around the feature of SOL logging, a=
nd how to best implement it.
>
> =A0
>
> There is a proposal here https://gerrit.openbmc-project.xyz/#/c/openbmc=
/phosphor-webui/+/12063/ that proposes dumping the SOL console text buffe=
r from Javascript into a file, and presenting it to the user as a downloa=
d.=A0 On its face, it seems to work as designed.=A0 This has some pretty =
severe limitations, in that you can only dump the console log from your s=
ession, and your session is essentially destroyed when you switch pages i=
n the webui, or hit refresh.=A0 I think this is overly limiting, and of t=
he production BMC stacks that I know of, none of them implement SOL loggi=
ng in this way.
>
> =A0
>
> Instead, other BMCs implement it as a circular buffer inside the BMC it=
self, which allows SOL to log data all the time, not just while the user =
is logged in.=A0 I think architecting it this way would be much more usef=
ul for admins consuming OpenBMC, and make us more useful as a solution.=A0=
 Doing it this way also can make the SOL log available to IPMI and Redfis=
h, as well as a file download, which improves the usability quite a bit.=A0=
 Most places I see the SOL logging requested is for audit type purposes, =
which the javascript based version can=92t do.
>
> =A0
>
> I=92m looking for feedback from the community here.=A0 As written, I do=
n=92t think the javascript console export is a useful feature given its l=
imitations.=A0 Do others agree?=A0 Am I off base?=A0 Are there use models=
 where having a log of only the current session is useful?=A0 Should we d=
ocument the limitations so we can respond to bugs in the future?
>
> =A0
>
That's exactly what we have implemented in our BMC for YADRO VESNIN.
We have a circular buffer that constantly logs host console output and al=
so preserves the first several pages of each host boot. That way we alway=
s have the last host boot "dmesg" as well as the very last few pages befo=
re the host dies (or the logs were gathered).

Alexander.

--------------8B98422BC85B271D56FB6B16
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html;
      charset=3Dwindows-1252">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <br>
    <div class=3D"moz-cite-prefix">25.08.2018 00:02, Tanous, Ed wrote:<br=
>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.i=
ntel.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html;
        charset=3Dwindows-1252">
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
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
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal">I would like to start a discussion around
          the feature of SOL logging, and how to best implement it.<o:p><=
/o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">There is a proposal here <a
href=3D"https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/1=
2063/"
            moz-do-not-send=3D"true">
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/12063/</a=
>
          that proposes dumping the SOL console text buffer from
          Javascript into a file, and presenting it to the user as a
          download.=A0 On its face, it seems to work as designed.=A0 This=

          has some pretty severe limitations, in that you can only dump
          the console log from your session, and your session is
          essentially destroyed when you switch pages in the webui, or
          hit refresh.=A0 I think this is overly limiting, and of the
          production BMC stacks that I know of, none of them implement
          SOL logging in this way.<o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">Instead, other BMCs implement it as a
          circular buffer inside the BMC itself, which allows SOL to log
          data all the time, not just while the user is logged in.=A0 I
          think architecting it this way would be much more useful for
          admins consuming OpenBMC, and make us more useful as a
          solution.=A0 Doing it this way also can make the SOL log
          available to IPMI and Redfish, as well as a file download,
          which improves the usability quite a bit.=A0 Most places I see
          the SOL logging requested is for audit type purposes, which
          the javascript based version can=92t do.<o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">I=92m looking for feedback from the commun=
ity
          here.=A0 As written, I don=92t think the javascript console exp=
ort
          is a useful feature given its limitations.=A0 Do others agree?=A0=

          Am I off base?=A0 Are there use models where having a log of
          only the current session is useful?=A0 Should we document the
          limitations so we can respond to bugs in the future?<o:p></o:p>=
</p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p><br>
        </p>
      </div>
    </blockquote>
    That's exactly what we have implemented in our BMC for YADRO VESNIN.<=
br>
    We have a circular buffer that constantly logs host console output
    and also preserves the first several pages of each host boot. That
    way we always have the last host boot "dmesg" as well as the very
    last few pages before the host dies (or the logs were gathered).<br>
    <br>
    Alexander.<br>
  </body>
</html>

--------------8B98422BC85B271D56FB6B16--

--NzGsJfHpp1LuHDASenPnypcJpwuss6AmI--

--AH1Rb3UVwnw8NCXr9zejardw4qKPr760a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbhoVpAAoJEOiTWHtbdBeN0PIQAIEVHlfNl4lfvUOiT2tIibVY
pR/ZofPX8m6zVYi+v5lyI+wPqNEc9yieyTodvybcHPkXTjkMQhTkLQCLSG+q5CTq
Fglokc+J0cqlH477SRpWIV8ApHy9Mrbitep7+zbHZy0tY/qe3ZE2pc/E1LmKJEPf
K3801ACkOhoJ54DUHaFRlosmCC0dqUPErS/hgwcxOIsm4hZLLCdch8vBgiOLYOWE
uITt0pGaxaEqqtCEOm+Bjgsb/bwddOCqEQdotmbUL20Y/rBlmJEBYTcydeEYcAcO
n/gv8iP/E1xCSy+KGmOc29OHt5WA/zimfpVi7uj7ZDTitNel1zrfnAngwSunw3vP
yYaJwnFWRJ8AZVWxr+BQ92xKHP6A7kFVPbAYwjJIChV28x/BbQxgSQKTYGXTRblO
GjmimelNewRQc4c8TeATErYHbZID3vyxUM9cnMdFkYXIE6WTbt0jJ/6pdoGcVOfM
B8rlB4NkWkgJ3AbwZuZRnV5yNf3uc7jL719hTLWMpLlDg37l6qhtU9akNmTHhlvF
NzXOxWjx6HYr6NH5XXvRUYIImljJt2cINFHlcdNV1NbenwiPkNflBzK9w1GWmNjq
dxmbBpYUOlD0+qSoGSKiqsytpHxWrqlPn7lP09C+BKiJLlYC4fyZ0qZtBHCimtEY
fQY7OrHFCJsvkQsOuV4K
=yJwU
-----END PGP SIGNATURE-----

--AH1Rb3UVwnw8NCXr9zejardw4qKPr760a--
