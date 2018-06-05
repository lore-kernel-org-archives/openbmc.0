Return-Path: <yuenn@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::232; helo=mail-io0-x232.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jWV0qfjb"; 
 dkim-atps=neutral
Received: from mail-io0-x232.google.com (mail-io0-x232.google.com
 [IPv6:2607:f8b0:4001:c06::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 410PB004LfzF1g1
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jun 2018 17:50:47 +1000 (AEST)
Received: by mail-io0-x232.google.com with SMTP id d185-v6so2249613ioe.0
 for <openbmc@lists.ozlabs.org>; Tue, 05 Jun 2018 00:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=iYutcLoBhJU723fZQf397/c/h4/ax1smT/y75fDTs3g=;
 b=jWV0qfjbRcvue8a1aploCBDnSLzWTOJohr8c96fGjal8pboAoZsgCNJka/ZdEjxqNa
 DbuI2gWP+Df/CbAHoKFbBJ8pU0VqC7oRKJBIYmhSi3VGE3Ibyn6xfpEWQ232/QP5Bmor
 +Lbm4Q5gqDjCZxj/a8Fa91rUK5U22BlwrHma2/h2bvVqDn02TOWjGdI5BPyK1FnGztfg
 SxjO0I43hvkTHkYhcCmbnUuYu5NEJPX6VrvpGoOkftESzJ0WUOIyW3hu5NIu1YqWfPZg
 836kEBlJztTWfGO5YbvF3P1Bcz9CLavC46rqJkILb7z1ThNDlsKuHFKQEceliMszZI0w
 9toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=iYutcLoBhJU723fZQf397/c/h4/ax1smT/y75fDTs3g=;
 b=o9XQXfL8lh3EFCsjafi0iTCcvbHoWODoZAy+CgDHVsrrGGGBIPXdm+IB53LMz+mpyX
 gMCtI78j2rvEYoxmL5u7qii3x9bCtOSEWWk4SoJA5iTh5fPRrbmgKS84dhuCimi3q3fB
 9tJ0ELDmpBz8o7g62OQeiqtNKCHyV2kkGl8aHB45kVv738huCkz95UDE3rxNNIHvJvzK
 fLexQGxoEBBMO4Uc2I1x1RS1kTi7igwhj2/frp1ICaGKsTFPALkgr/CFbSwJyrlZZYov
 I5sq89yciMrO3R+73auao8pr5SgzStv1gmpGDutLFdOSbZ+tqosrhA2nTPT5/y8qE2Ax
 tLTA==
X-Gm-Message-State: APt69E2/Mhwvif/e1y0exR4UGwJRzlb5Vm7tSeVdGRYy3ZCaW/M8Y1dk
 9wxAoNvodBLeTJaNtMb0/xslJCqf9hjFjMrCX6o9EmoobzA=
X-Google-Smtp-Source: ADUXVKL7xIgEOF+NE618SrkOZvPSqxcrywIxDO7CRuILzCJV9Xuv8Pof+yEJj4ALws7kQOJ5i9Zhc/ozqerYgXwyWpE=
X-Received: by 2002:a6b:c006:: with SMTP id
 q6-v6mr23569653iof.61.1528185042942; 
 Tue, 05 Jun 2018 00:50:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5003:0:0:0:0:0 with HTTP;
 Tue, 5 Jun 2018 00:50:02 -0700 (PDT)
From: Nancy Yuen <yuenn@google.com>
Date: Tue, 5 Jun 2018 00:50:02 -0700
Message-ID: <CADfYTpGjD4rAqtVexK-TK53s=LmB9mzUOzPC+w=uAyOyD1FQMQ@mail.gmail.com>
Subject: OpenBMC Fix-It Planning
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000a3568f056de04e97"
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
X-List-Received-Date: Tue, 05 Jun 2018 07:50:48 -0000

--000000000000a3568f056de04e97
Content-Type: text/plain; charset="UTF-8"

I've created this spreadsheet
<https://drive.google.com/open?id=1S8h68UPVTh3Fc79P6Az-95JEFiGesTce3M--y0IDLaA>
for everyone to share ideas for next week's Fix-It, Tues 6/12.  Please
remember this is a virtual Fix-It, so please plan to work on Fix-It items
for most of your work day and and communicate via IRC to ask questions and
discussions.

This is just a list of possible tasks people can sign up to do on Fix-It
day.  Suggesting something doesn't mean you have to be the one fixing it!

Please suggest ideas that are in the spirit of fix-it.  Small tasks that
can be tackled in less than a day by one or two engineers.  Tasks that are
not regular ongoing development.  Tasks don't have to be code related;
documentation, website changes, improving things in gerrit or other setting
up other infrastructure are good things to tackle in a Fix-It.

Some examples:

   - specific tests cases for a feature
   - specific documents that would be useful
   - code that needs to be cleaned up (adding comments, refactoring,
   splitting into multiple source files or header files)
   - smallish bugs that never make it to the top of priority list


----------
Nancy

--000000000000a3568f056de04e97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font size=3D"4">I&#39;ve created this <a href=3D"https://=
drive.google.com/open?id=3D1S8h68UPVTh3Fc79P6Az-95JEFiGesTce3M--y0IDLaA">sp=
readsheet</a> for everyone to share ideas for next week&#39;s Fix-It, Tues =
6/12.=C2=A0 Please remember this is a virtual Fix-It, so please plan to wor=
k on Fix-It items for most of your work day<span style=3D"font-size:large;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;float:none;display:inline">=C2=A0and and communicate via =
IRC to ask questions and discussions.</span></font><div><font size=3D"4"><b=
r></font><div><div><font size=3D"4"><div style=3D"font-size:small;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial"><div><font size=3D"4">This is just a list of possible tasks peop=
le can sign up to do on Fix-It day.=C2=A0 Suggesting something doesn&#39;t =
mean you have to be the one fixing it!</font></div></div><br></font><div><f=
ont size=3D"4">Please suggest ideas that are in the spirit of fix-it.=C2=A0=
 Small tasks that can be tackled in less than a day by one or two engineers=
.=C2=A0 Tasks that are not regular ongoing development.=C2=A0 Tasks don&#39=
;t have to be code related; documentation, website changes, improving thing=
s in gerrit or other setting up other infrastructure are good things to tac=
kle in a Fix-It.</font></div><div><font size=3D"4"><br></font></div><div><f=
ont size=3D"4">Some examples:</font></div><div><ul><li><font size=3D"4">spe=
cific tests cases for a feature</font></li><li><font size=3D"4">specific do=
cuments that would be useful</font></li><li><font size=3D"4">code that need=
s to be cleaned up (adding comments, refactoring, splitting into multiple s=
ource files or header files)<br></font></li><li><font size=3D"4">smallish b=
ugs that never make it to the top of priority list</font></li></ul></div><d=
iv><div><div><div class=3D"gmail_signature" data-smartmail=3D"gmail_signatu=
re"><font size=3D"4"><br></font></div><div class=3D"gmail_signature" data-s=
martmail=3D"gmail_signature"><font size=3D"4">----------<br>Nancy</font></d=
iv></div>
</div></div></div></div></div></div>

--000000000000a3568f056de04e97--
