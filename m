Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="B6gWX/4I"; 
 dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Y0ql433CzDqJV
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 05:14:59 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id b12so5186646pgk.0
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 11:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=hh18tZiwIlC5qwUO2c/qR292H2uYPi+3XkcXL7OdWKs=;
 b=B6gWX/4IBQiT1/g/9gF15u0rn5QOkk1MxONEfsrTiFxFX/9uucTb90tbu8oiQYZ92J
 fRXwFqx6dz5HIxKsc/v7w3zbNym9EPRQwmXpONV8gnNSc8gW11e7jUlIqX3o8M07BOdJ
 a76LrFcO+n5YQKQc8k2UoPxia/7B89t3hT7iGKTXUdRIW1PBgJpzCdjkm3nQsCy/0YJo
 hSM6KEODwBF69mcRZWk/7k0VZRsJUpZW+g/9UKS4spDAkBcQ4ZZE9GrIOPolygo/HdiZ
 Khy+f/rDlbAiG80Uc+TU6IVfF0LtkdlbtEWYup/4AZCM9aoe9i0xhwXsMVeEzda9L6e5
 TjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hh18tZiwIlC5qwUO2c/qR292H2uYPi+3XkcXL7OdWKs=;
 b=e8B+TNWMYCe30qDge8TpxDkNW/PRrmsIJmm722L1gIAYPId+Q9mMeu7f3d8pamZtBo
 zvTEL2jvWVaDvKVa1f0RjO9LdNnlkjTcvXYNWpE+suV41+j6PKfLGP4Y5zjYizj4YARN
 VCOKUTuecshpgAxeFtikt2Cn76j+0mvzUWGkW/qMccDOs0wkSD34vwaDv4Y/3tuskOAI
 7qaYalTNBeRrCdGCAc1F2a9KkDi4WATkrTrdn6Gh380OxH93/UsTEZhyvedL//qhb0Gm
 /T8eQhVGQ/sg2w1bL09h/6ciwqMy56bWNKAojlwD1HX9JyJGOlXCekGsPA2EgoJ51dij
 9/zQ==
X-Gm-Message-State: APjAAAVGmGlgG318O86TJjaxY07bx18TDUQcEZzjuSIdJzIMd9Ml9cyM
 R0GF4dm0uEakDmvcA9pdi+22Tjgo+mUXW7m7hZADhL2g
X-Google-Smtp-Source: APXvYqyIUYiwQnIKe67cpPU9XPBt8+tn6TngQZWGLIlXe7YdfJDE3k/wn0T1osBkMIfC8bSyTtEeQ4Iv9D+RfmKO4CU=
X-Received: by 2002:aa7:82cb:: with SMTP id f11mr58143349pfn.0.1554142496229; 
 Mon, 01 Apr 2019 11:14:56 -0700 (PDT)
MIME-Version: 1.0
From: susan jasinski <susantjasinski@gmail.com>
Date: Mon, 1 Apr 2019 13:14:45 -0500
Message-ID: <CANT4Nr+ueeb1qGcWFeYuGHrtoovMvxdgP6+vKpJN+bKKDEUpwA@mail.gmail.com>
Subject: PLEASE ATTEND: GUI Work Group -- Wednesday April 3 at 7:30AM CT
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000006b0e0205857bffa2"
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
X-List-Received-Date: Mon, 01 Apr 2019 18:15:00 -0000

--0000000000006b0e0205857bffa2
Content-Type: text/plain; charset="UTF-8"

This is a reminder that the GUI Design Workgroup is this Wednesday, *March
20 at 7:30 am CT*.

Web conference:
https://ibm.webex.com/meet/susantj

Anyone can add feature or panel designs to the agenda here:
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

So far we will be looking at
- *Firmware *panel redesign
- (new) *Backup and Restore* design and GUI panel
- (new) *Remote Logging* Server Configuration design and GUI panel

Thank you, Susan Jasinski

--0000000000006b0e0205857bffa2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">This is a reminder that the GUI=C2=A0Desi=
gn Workgroup is this Wednesday,=C2=A0<b>March 20 at 7:30 am CT</b>.<br></di=
v><div dir=3D"ltr"><br>Web conference:<br><a href=3D"https://ibm.webex.com/=
meet/susantj" rel=3D"noreferrer" target=3D"_blank">https://ibm.webex.com/me=
et/susantj</a><br><br>Anyone can add feature or panel designs to the agenda=
 here:<br><a href=3D"https://github.com/openbmc/openbmc/wiki/GUI-Design-wor=
k-group" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/op=
enbmc/wiki/GUI-Design-work-group</a><br><br>So far we will be looking at<br=
>- <b>Firmware </b>panel redesign<div>- (new) <b>Backup and Restore</b> des=
ign and=C2=A0GUI panel<br>- (new) <b>Remote Logging</b> Server Configuratio=
n design and=C2=A0GUI panel</div><div><br></div><div>Thank you, Susan Jasin=
ski</div></div></div>

--0000000000006b0e0205857bffa2--
