Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e+x92rej"; 
 dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42QP3x73pVzF36g
 for <openbmc@lists.ozlabs.org>; Thu,  4 Oct 2018 04:02:05 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id s4-v6so3850628plp.0
 for <openbmc@lists.ozlabs.org>; Wed, 03 Oct 2018 11:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=XR7ckrhJ+UAks3xPe6GBQVLR6PF4I1RSTwn/UGiCK5M=;
 b=e+x92rejcLsLDwjt+qS+qK/rJMApx67M2JXqz5JEmAfehoBGppX28X3URIEeHQEb6N
 1we50fJLFQNAkNw73UtIKgJB5ooCrDNkBXZ0f3eloEkbtZ5c+1tjf1VrzLvfoKuc5R4D
 hIjVFrrrYNO7akSpircl0k/69+RF7eeY8KXLX9RvCDcpzAdvNorDFugeXCwsTBbv9Mw7
 URHlrmFOJdM/GEZ7N2JBX1Nl6MrKmC7psQTnkrIXDeWJiYoeM07ej4iEACfO2YaKTzkD
 jyxYlZId476wwimQxiqOda5pRiZ1fskw4LIuVUWiPZSbKuNlKXBiKSOEDPzwu2vSB6wL
 xz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XR7ckrhJ+UAks3xPe6GBQVLR6PF4I1RSTwn/UGiCK5M=;
 b=UCylA5YPbv+e7dlpkQHRMTmgpnUHH9s/oZi2QkdUduinoiK27NHm7OUhHvOOjr4jPj
 szvL8ikWRPnButaJyXqrrs62tYaf+pfpfwQQYqaD346n9tCdUDStFoFxrI/eAYEl2eoR
 D1epmy1mJqPX1Ar0dTfYgLwONVNwLGEdyWnFo6g+SXwNt8CyMBxkcuKARioYklw4lbcf
 tsQ4efpRyuUpjKKvkt4uPKDImWHUQ8u3jlPEPRK/K7FGatJBjOB9SNOfPEzv//DLZjBn
 mkPk5v1E+p9/CwK0vJmEeAfY3Nw2WmsKKnC8Q8NzfkkWqoN/lFDu5Y/dZMEtkLNYFYLQ
 VSPg==
X-Gm-Message-State: ABuFfogSZibVt6uNJt7Oo3/eLYjmeVvlYdBHputXGEpEqNVWY3Gni7jl
 JChNruJbIgjA7D6q+e/DU5Co2izkYk4D2tsU9fHJaxuq
X-Google-Smtp-Source: ACcGV63bHPJR0KWbZExUesy33lLlB2sqP4jO7YLOHCYDLUqOI+DOwzaEJn6yhxvuxExnX1TSOSjjk2UDM49TaU1hFvA=
X-Received: by 2002:a17:902:ab8a:: with SMTP id
 f10-v6mr2803376plr.203.1538589723219; 
 Wed, 03 Oct 2018 11:02:03 -0700 (PDT)
MIME-Version: 1.0
From: susan jasinski <susantjasinski@gmail.com>
Date: Wed, 3 Oct 2018 13:01:52 -0500
Message-ID: <CANT4Nr+UGpw7j7BpBOmxLxMzgW10Uk=1t6sg1frnwuS2Kq9j2A@mail.gmail.com>
Subject: NEW GUI Design work group starts Wed, Oct 17
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000e85b26057756d550"
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
X-List-Received-Date: Wed, 03 Oct 2018 18:02:07 -0000

--000000000000e85b26057756d550
Content-Type: text/plain; charset="UTF-8"

Hello everyone.

My name is Susan Jasinski, and I am the UX Design Lead for the IBM OpenBMC
GUI. Alissa Lee and I will be hosting a new bi-monthly OpenBMC work group
for reviewing new GUI designs. It will be held on the first and third
Wednesdays of the month.

Generally, my team will request feedback on GUI designs BEFORE they are
coded. This could include wireframes, high-fidelity mockups, interactive
prototypes, and panel flows. If others have pre-code designs they would
like to share with the community, feel free to add yourself to the agenda.

However, during this first meeting I'd like to discuss how to openly and
consistently share mockups, provide feedback and track revisions.

Access to the web conference link and the agenda can be found in the
openbmc-openbmc wiki (just above the Weekly Community Telecon wiki link) .
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

Links to mockups will be sent via email and IRC prior to the meeting.
Please join the conversation even if you did not have time to review
designs before-hand.

I am looking forward to seeing you all next week.

-- Susan Jasinski (IBM Lead Designer and User Experience designer)

--000000000000e85b26057756d550
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><font size=3D"4">Hello everyone.=C2=A0</f=
ont></div><div dir=3D"ltr"><font size=3D"4"><br></font></div><div dir=3D"lt=
r"><font size=3D"4">My name is Susan Jasinski, and I am the UX Design Lead =
for the IBM OpenBMC GUI. Alissa Lee and I will be hosting a=C2=A0</font><fo=
nt size=3D"4">new=C2=A0</font><span style=3D"font-size:large">bi-monthly=C2=
=A0</span><font size=3D"4">OpenBMC work group for reviewing new GUI designs=
. It will be held on the first and third Wednesdays of the month.</font></d=
iv><div dir=3D"ltr"><div><div><font size=3D"4"><br></font></div><div><font =
size=3D"4">Generally, my team will request feedback on GUI designs BEFORE t=
hey are coded. This could include=C2=A0<span style=3D"color:rgb(36,41,46);f=
ont-family:-apple-system,system-ui,&quot;Segoe UI&quot;,Helvetica,Arial,san=
s-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Sego=
e UI Symbol&quot;">wireframes, high-fidelity mockups, interactive prototype=
s, and panel flows. If others have pre-code designs they would like to shar=
e with the community, feel free to add yourself to the agenda.</span></font=
></div><div><font size=3D"4"><span style=3D"color:rgb(36,41,46);font-family=
:-apple-system,system-ui,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&q=
uot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbo=
l&quot;"><br></span></font></div><div><span style=3D"font-size:large">Howev=
er, during this first meeting I&#39;d like to discuss how to openly and con=
sistently share mockups, provide feedback and track revisions.</span></div>=
</div><div><div><font size=3D"4"><br></font></div><div><font size=3D"4">Acc=
ess to the web conference link and the agenda can be found in the openbmc-o=
penbmc wiki (just above the Weekly Community Telecon wiki link) .</font></d=
iv><div><font size=3D"4"><a href=3D"https://github.com/openbmc/openbmc/wiki=
/GUI-Design-work-group">https://github.com/openbmc/openbmc/wiki/GUI-Design-=
work-group</a><br></font></div></div><div><font size=3D"4"><br></font></div=
><div><span style=3D"color:rgb(36,41,46);font-family:-apple-system,system-u=
i,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&q=
uot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:large=
">Links to mockups will be sent via email and IRC prior to the meeting. Ple=
ase join the conversation even if you did not have time to review designs b=
efore-hand.=C2=A0</span><br></div><div><span style=3D"color:rgb(36,41,46);f=
ont-family:-apple-system,system-ui,&quot;Segoe UI&quot;,Helvetica,Arial,san=
s-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Sego=
e UI Symbol&quot;;font-size:large"><br></span></div><div><span style=3D"col=
or:rgb(36,41,46);font-family:-apple-system,system-ui,&quot;Segoe UI&quot;,H=
elvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoj=
i&quot;,&quot;Segoe UI Symbol&quot;;font-size:large">I am looking forward t=
o seeing you all next week.</span></div><div><font size=3D"4"><br></font></=
div><div><font size=3D"4">-- Susan Jasinski (IBM Lead Designer and User Exp=
erience designer)</font></div><div><br></div></div></div>

--000000000000e85b26057756d550--
