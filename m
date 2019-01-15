Return-Path: <ryanarnellibm@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::243; helo=mail-oi1-x243.google.com;
 envelope-from=ryanarnellibm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pao9EHQo"; 
 dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fPtr5PsXzDqSS
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 09:21:05 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id r62so3483910oie.1
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 14:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=FOYPRac1+N1JnnQXwFLxlsBP2FMFOM3qgC++uUjB8uY=;
 b=Pao9EHQo3ayvx5UbqciYD13q7b6HB/3TLyrIcts71QxqVSGJW6IUgQw0CEhUXOGbSn
 YHm6lKh62a8qx1aDkTjysaeg741IFOVXDgau+QgrG4J5x5gilG62aj4/EpHtXzNjIDTc
 MGl4DYrkXjlayJzSRWdqicW+JE4YiXVa8EqiD540yeMUwFyB1MrPnlqdOqZNKgldgU9L
 ClvbAy1aGjqxfNqNfMHLaL2OEyegXZ3NWZlRjov+0JP3s5EoqZvKfMYotifG3d8vojdN
 zKL5tIUDmuU94OjXauD/ubIk+uEgFdwxiRdURKuEe0ivlBl/6tUcbFAYJPDGoqXJpDOC
 6lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FOYPRac1+N1JnnQXwFLxlsBP2FMFOM3qgC++uUjB8uY=;
 b=nHgjpPBj7+qbDdnL2IoAxsLTkEx+iZv4jopwMBYTqNp4UERKuTdjIXE78Wv/Ao74qS
 RD3ImzkaGQDDEh0jFseYOxdyD/2X7krMi5KrGv/XvvFNU0o5pCYwkmZCFwuiIyloJNyv
 6M0d6Q8AOVVMHIpWq8yN8gq32Xgy8J0GmMftkO5Yka2tPa80lvNzUWHwSbbg5epLm4uS
 XXNH55H/Uf9RBr/lhrlDxYQa17rEOuLZ1B+K2BT6aPTsWEAkI0cbIcPJXKjQdw/aXDcX
 sLx3hCdK4H2iOE8WxUiVar8En3d4sRgSCUrd5sznYGvogJ8prQJ3mcze+cDxyid368kv
 1J+g==
X-Gm-Message-State: AJcUukdfcsRXhF1Wdlfx91suqtvwjm5Xd5qEL45c50qFnkWHmONqTM8e
 tptBx/GAT/NYnm6Fn/vgN0QuuPwYp/PSCi2EF/wTleT4
X-Google-Smtp-Source: ALg8bN7vAZrYBIpWMme8AFbL5abDUw5y8c5jRXNx/RM1umJ0NOitOOleLClmmjB7VPvpfsG3WCWZzV/T9clSmT0q8E4=
X-Received: by 2002:aca:570a:: with SMTP id l10mr3061910oib.305.1547590863092; 
 Tue, 15 Jan 2019 14:21:03 -0800 (PST)
MIME-Version: 1.0
From: Ryan Arnell <ryanarnellibm@gmail.com>
Date: Tue, 15 Jan 2019 16:20:52 -0600
Message-ID: <CAH3qHnYAVEVVgQZHaezCS6v=gUGGwUF7bsch700T-OzYv_0NUQ@mail.gmail.com>
Subject: OpenBMC Globalization
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000a700f5057f86934f"
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
X-List-Received-Date: Tue, 15 Jan 2019 22:21:09 -0000

--000000000000a700f5057f86934f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hi,
Happy new year everyone! Last month in our community call, IBM Design Team
discussed about globalization for OpenBMC. The slide deck can be found
here-

We tested our existing app against about the following 9 baseline
languages-

1. German
2. French
3.Italian
4. Spanish
5. Brazilian
 6. Portuguese
 7.Japanese
 8.Simplified Chinese
 9. Traditional Chinese

Overall our web app tested pretty well for adopting different length of the
words and line orientation for different languages. However there are few
places we found some issues that is addressed below.

*Recoding to prevent layout breakage*
We have enough space in the UI for longer texts. But there are few areas
that broke and need to be recoded to support better warping of text
elements. These are

Header notification and timezone area
Navigation
Server control- Server power operations
Server health- Event log

Tables in the current design breaks pretty easily with different length of
data. This is present in the following pages-

Server health- Hardware status
Server health- Sensors

Detailed examples with screenshots can be found in the slides.
https://drive.google.com/file/d/15xG-v0jY7VKTFE-KRBFtmnxyjrUHa6IT/view?usp=
=3Dsharing

*Restructuring sentences*
There are few terms in our build that creates improper translation. For
example in our Server Information page (Homepage) we have -

Turn <on/off> server LED

Based on the current status of the LED,  the =E2=80=98On=E2=80=99 or =E2=80=
=98Off=E2=80=99 term displays.
Since these terms sits in the middle of the sentence, it breaks the
sentence in two phrases- =E2=80=98turn=E2=80=99 and 'server LED=E2=80=99. T=
his creates incorrect
translation. We recommend re-writing the phrase to  Turn server LED
<on/off> which doesn=E2=80=99t not break the sentence.

*Using a translation service *
This is probably the biggest issue we have with our app. Right now all the
terms and messages that need to be translated are embedded into our html
files. This creates serious issues translating the app properly.

We propose using a service like g11n-pipeline
<https://www.npmjs.com/package/g11n-pipeline>. This way we will only have a
single ts file to translate. Also, this way we will have more robust
translation as we will have control over translated phrases. We can also
test our layout properly against all the proposed languages.

Thanks
Ryan
User Experience Engineer
IBM

--000000000000a700f5057f86934f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">





Hi,<br>Happy new year everyone! Last month in our community call, IBM Desig=
n Team discussed about globalization for OpenBMC. The slide deck can be fou=
nd here- <br><br>We tested our existing app against about the following 9 b=
aseline languages- <br><br>1. German<br>2. French<br>3.Italian<br>4. Spanis=
h<br>5. Brazilian <br>=C2=A06. Portuguese<br>=C2=A07.Japanese<br>=C2=A08.Si=
mplified Chinese<br>=C2=A09. Traditional Chinese<br><br>Overall our web app=
 tested pretty well for adopting different length of the words and line ori=
entation for different languages. However there are few places we found som=
e issues that is addressed below.<br><br><b>Recoding to prevent layout brea=
kage</b><br>We have enough space in the UI for longer texts. But there are =
few areas that broke and need to be recoded to support better warping of te=
xt elements. These are <br><br>Header notification and timezone area<br>Nav=
igation <br>Server control- Server power operations<br>Server health- Event=
 log<br><br>Tables in the current design breaks pretty easily with differen=
t length of data. This is present in the following pages- <br><br>Server he=
alth- Hardware status <br>Server health- Sensors <br><br>Detailed examples =
with screenshots can be found in the slides. <br><a href=3D"https://drive.g=
oogle.com/file/d/15xG-v0jY7VKTFE-KRBFtmnxyjrUHa6IT/view?usp=3Dsharing">http=
s://drive.google.com/file/d/15xG-v0jY7VKTFE-KRBFtmnxyjrUHa6IT/view?usp=3Dsh=
aring</a><br><br><b>Restructuring sentences</b><br>There are few terms in o=
ur build that creates improper translation. For example in our Server Infor=
mation page (Homepage) we have -<br><br>Turn &lt;on/off&gt; server LED<br><=
br>Based on the current status of the LED, =C2=A0the =E2=80=98On=E2=80=99 o=
r =E2=80=98Off=E2=80=99 term displays. Since these terms sits in the middle=
 of the sentence, it breaks the sentence in two phrases- =E2=80=98turn=E2=
=80=99 and &#39;server LED=E2=80=99. This creates incorrect translation. We=
 recommend re-writing the phrase to =C2=A0Turn server LED &lt;on/off&gt; wh=
ich doesn=E2=80=99t not break the sentence. <br><br><b>Using a translation =
service </b><br>This is probably the biggest issue we have with our app. Ri=
ght now all the terms and messages that need to be translated are embedded =
into our html files. This creates serious issues translating the app proper=
ly. <br><br>We propose using a service like <a href=3D"https://www.npmjs.co=
m/package/g11n-pipeline">g11n-pipeline</a>. This way we will only have a si=
ngle ts file to translate. Also, this way we will have more robust translat=
ion as we will have control over translated phrases. We can also test our l=
ayout properly against all the proposed languages.<div><br></div><div>Thank=
s</div><div>Ryan</div><div>User Experience Engineer=C2=A0</div><div>IBM=C2=
=A0<br>=C2=A0 <div><br></div><div><br></div></div></div>

--000000000000a700f5057f86934f--
