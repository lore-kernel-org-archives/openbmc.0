Return-Path: <mam.nagv@yahoo.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yahoo.com
 (client-ip=66.163.185.148; helo=sonic305-22.consmr.mail.ne1.yahoo.com;
 envelope-from=mam.nagv@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="IOS+Jet1"; 
 dkim-atps=neutral
Received: from sonic305-22.consmr.mail.ne1.yahoo.com
 (sonic305-22.consmr.mail.ne1.yahoo.com [66.163.185.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 401q8J25KnzF0p6
 for <openbmc@lists.ozlabs.org>; Thu, 15 Mar 2018 11:23:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1521073432; bh=w2WiqXhLM00RimNRbNCDFLYqfdudxpdOCsmiLCU8t4I=;
 h=Date:From:To:Subject:References:From:Subject;
 b=IOS+Jet1LV5YuWZI6ptTBMxk75zSlMr7yGXXrVUCJ5j2O2g790nAeqVohDKhn0+UGbaessuGuemvLnb5I6SeCPeBQuMuh/M7tFz1iMZBQP6RheyPUTByDXCGfHqkp9flNDHcRH1YCFFsqOZ3Iscktk5eq67DzhxmT09ScysDFXhD7qaGuIhL+/uqz7AEaNpIwt114G6xz4RAyLm4zEu9+rBmEFBEofxSAT7A4Zmo2yamrH3uPMh56N6oGo2X34E0JNQCMylwtq5z3wWKLiVvaESD1jAGyokUFwjYfGrN47H7nRG8C9uZqq9U7sUZ1QcsJK3mcheY50cTRjJkb0J0dA==
X-YMail-OSG: Je4cJqgVM1mA9FqxgN3tD9JxXcriXJQcUgz7cmfiVt2YnKv2aOX0p5pYSkHDD_m
 zi24O7RBtI4Tm5ebZiP1u.DxzWYLeNXay8HBUt_qWMqpWKDqyAifsdesfHbMMcHYS2iDLow8KvDs
 Z6s6g_TboHBFajkYc.RpGcn3WN4AZdA.w58nOaPzszVahFmNdaLX0kW_KpfQI9QvQJoVWeXNfSuM
 RZNC1Y_x8YcFWrl4rbjQC6RrahQ_a9RATN2fcNTf1e7CCDoFgtG1EyZ0PTXnFrSdg4rf6UNw6hQ7
 IPMKJxih1.olJlxjkyKGoSxZWQI8rVyQNp4jaY.h3X.GQXBt3GfiRcyQgG4kr508cqXvlPnrLdmH
 UI6PvBfl5rGr7Hu_rqxv9eSXEwuWBGyQHU0Fioml8egqWObxl83rzWbJHDWHbwWXDpypESq1xOXW
 SF_6P7r4cwInQh8Cm8UvFihWjLboQQZImAjPJxvFDv0GMYGz23HEaobBHV2gHODVRAtLiCOGbCkf
 oSjHXhAeRdl4VoCvcTqnbOKMwRZ7R3i5Xf8ouRtSESgvjby5xR._OKwAh
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.ne1.yahoo.com with HTTP; Thu, 15 Mar 2018 00:23:52 +0000
Date: Thu, 15 Mar 2018 00:23:50 +0000 (UTC)
From: Mam Nag <mam.nagv@yahoo.com>
To: openbmc@lists.ozlabs.org
Message-ID: <1771766654.816001.1521073430437@mail.yahoo.com>
Subject: Need info on inventory
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_816000_395467255.1521073430436"
References: <1771766654.816001.1521073430437.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.11588 YMailNorrin Mozilla/5.0 (Windows NT 6.3; Win64;
 x64; rv:58.0) Gecko/20100101 Firefox/58.0
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
X-List-Received-Date: Thu, 15 Mar 2018 00:24:01 -0000

------=_Part_816000_395467255.1521073430436
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Hello,=20


I have got system (which is still in development), with AST2500 and openBMC=
 4.10.17 running on it. I don=E2=80=99t know what=E2=80=99s working and wha=
t=E2=80=99snot working. I tried dbus browser and curl commands(as mentioned=
 indocument) , below is some curl command output.




curl -b cjar -k https:// <BMC IPaddress>//xyz/openbmc_project/inventory/sys=
tem

{

=C2=A0"data": {

=C2=A0=C2=A0=C2=A0"AssetTag": ""

=C2=A0},

=C2=A0"message": "200 OK",

=C2=A0"status": "ok"

=C2=A0

curl -b cjar -k https://<BMC IPaddress>/xyz/openbmc_project/inventory/list

{

=C2=A0"data": [

=C2=A0=C2=A0=C2=A0"/xyz/openbmc_project/inventory/system"

=C2=A0],

=C2=A0"message": "200 OK",

=C2=A0"status": "ok"



Not much details in =E2=80=9Cinventory=E2=80=9D, how can I get FRU statusan=
d other details. If support is not implemented, how do I need to implements=
upport.
Thanks.


------=_Part_816000_395467255.1521073430436
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"font-family:Helvetica Neue, Helvetic=
a, Arial, sans-serif;font-size:13px;"><div><p class=3D"ydp20eb4fa2MsoNormal=
">Hello, <br></p>

<p class=3D"ydp20eb4fa2MsoNormal">I have got system (which is still in deve=
lopment), with AST
2500 and openBMC 4.10.17 running on it. I don=E2=80=99t know what=E2=80=99s=
 working and what=E2=80=99s
not working. I tried dbus browser and curl commands(<a href=3D"https://gith=
ub.com/openbmc/docs/blob/master/rest-api.md" rel=3D"nofollow" target=3D"_bl=
ank">as mentioned in
document</a>) , below is some curl command output.</p>

<p class=3D"ydp20eb4fa2MsoNormal" style=3D"margin-left:.5in"><br></p>

<p class=3D"ydp20eb4fa2MsoNormal" style=3D"margin-left:.5in">curl -b cjar -=
k https:// &lt;BMC IP
address&gt;//xyz/openbmc_project/inventory/system</p>

<p class=3D"ydp20eb4fa2MsoNormal" style=3D"margin-left:.5in">{</p>

<p class=3D"ydp20eb4fa2MsoNormal" style=3D"margin-left:.5in"><span>&nbsp;
</span>"data": {</p>

<p class=3D"ydp20eb4fa2MsoNormal" style=3D"margin-left:.5in"><span>&nbsp;&n=
bsp;&nbsp;
</span>"AssetTag": ""</p>

<p class=3D"ydp20eb4fa2MsoNormal" style=3D"margin-left:.5in"><span>&nbsp;
</span>},</p>

<p class=3D"ydp20eb4fa2MsoNormal" style=3D"margin-left:.5in"><span>&nbsp;
</span>"message": "200 OK",</p>

<p class=3D"ydp20eb4fa2MsoNormal" style=3D"margin-left:.5in"><span>&nbsp;
</span>"status": "ok"</p>

<p class=3D"ydp20eb4fa2MsoNormal" style=3D"margin-left:.5in">&nbsp;</p>

<p class=3D"ydp20eb4fa2MsoNormal" style=3D"margin-left:.5in">curl -b cjar -=
k https://&lt;BMC IP
address&gt;/xyz/openbmc_project/inventory/list</p>

<p class=3D"ydp20eb4fa2MsoNormal" style=3D"margin-left:.5in">{</p>

<p class=3D"ydp20eb4fa2MsoNormal" style=3D"margin-left:.5in"><span>&nbsp;
</span>"data": [</p>

<p class=3D"ydp20eb4fa2MsoNormal" style=3D"margin-left:.5in"><span>&nbsp;&n=
bsp;&nbsp;
</span>"/xyz/openbmc_project/inventory/system"</p>

<p class=3D"ydp20eb4fa2MsoNormal" style=3D"margin-left:.5in"><span>&nbsp;
</span>],</p>

<p class=3D"ydp20eb4fa2MsoNormal" style=3D"margin-left:.5in"><span>&nbsp;
</span>"message": "200 OK",</p>

<p class=3D"ydp20eb4fa2MsoNormal" style=3D"margin-left:.5in"><span>&nbsp;
</span>"status": "ok"</p>

<p class=3D"ydp20eb4fa2MsoNormal"><br></p>Not much details in =E2=80=9Cinve=
ntory=E2=80=9D, how can I get FRU status
and other details. If support is not implemented, how do I need to implemen=
t
support.

<p class=3D"ydp20eb4fa2MsoNormal">Thanks.</p>

<br></div></div></body></html>
------=_Part_816000_395467255.1521073430436--
