Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::233; helo=mail-it0-x233.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SR86mx3b"; 
 dkim-atps=neutral
Received: from mail-it0-x233.google.com (mail-it0-x233.google.com
 [IPv6:2607:f8b0:4001:c0b::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40TSYZ208gzF1pP
 for <openbmc@lists.ozlabs.org>; Sun, 22 Apr 2018 21:49:21 +1000 (AEST)
Received: by mail-it0-x233.google.com with SMTP id h143-v6so7574446ita.4
 for <openbmc@lists.ozlabs.org>; Sun, 22 Apr 2018 04:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5ah1djLh9Gy4s4ARFhjsyJfjmMbwqJX2qygTIXdEGbg=;
 b=SR86mx3bzbgooi5Qs+TgilM3gpHiBdomvOwJoDpFLOuUe7+tEKKhni/TBD/4Cx7nRD
 KD+JpsrtYvziSSybPmdGIzWJvb5ZbCsGVV/nwNPzOhAjrtrih36yc93EuRXBv1Q4kWJa
 SkfnAT2vyJYDSAs0iMrlr1EblhROiolDyc6ZCKuJikhmpDVVvUDfgvUHwAeC29BDBm4P
 wvHqT+sYJ0vRlroNSvhtxx542QeXTJV3E+7P9jBb+J2XDdipp3mV/qyq98m1BgvnUwtK
 aMLhfY+DnR+SubEwUC6MtL97Y9vRKUtEJvy7a4SNK1QIr4DYC3CnMdIqxpQE1N66EdSX
 WoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5ah1djLh9Gy4s4ARFhjsyJfjmMbwqJX2qygTIXdEGbg=;
 b=W/NqThwlHRfn25RwkRkUiGY7Hsf6mM5Jb/GrgW54fbayu7V+wjHC31rfMw2UbU9hdZ
 roMCcOvOU2gEXoMXGXjjZHQZphWSfeGBsJoPSsvRjyyzxJ4RTFdLUJP8YXAdVgB+yKvn
 eRDpgxF7felLEtWfCFERVm/S2iBevQgDmJ97gwKBrviy14TMKcIS2QClfqktmuOSqqSp
 MXQ510dSDH3alb7uN2mFaA+HsTrITV7KPE5ZC2uqDN1t9xBhzE0ccLb20EyjtF9SZh6u
 lxOJMBpuJUiLfpZ2616AA0XOIaF16hsAhfxN9UW0Ir8dD3OArMU1W8SE54KBO3kHQbAM
 fuuw==
X-Gm-Message-State: ALQs6tDuUS9P3Cy2snRrG6sB5lg4apE/DrjUpM/ShUCeHi1qNz2F4Xc8
 X4AWycK+es3Qz5GBUBXRGXd8wZMtx5sAU7/setqfig==
X-Google-Smtp-Source: AIpwx49XkJ+c+lgkPD/Grp6jYBiMqB90lfkfFlOv4rwO0OT+FksJZb0FHV0qOS/yFGr9XH/HAeZITlJh5kOStgPsHkQ=
X-Received: by 2002:a24:5081:: with SMTP id
 m123-v6mr10523004itb.118.1524397758767; 
 Sun, 22 Apr 2018 04:49:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:854e:0:0:0:0:0 with HTTP; Sun, 22 Apr 2018 04:49:18
 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 22 Apr 2018 14:49:18 +0300
Message-ID: <CAP6Zq1jiKZVZPXQ8X_jJxKUse7CkR_Y7NxM3zMSWShhK3xcYcw@mail.gmail.com>
Subject: Does Gerrit identification has changed?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000e86a48056a6e82a5"
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
X-List-Received-Date: Sun, 22 Apr 2018 11:49:23 -0000

--000000000000e86a48056a6e82a5
Content-Type: text/plain; charset="UTF-8"

Hello,

I get the following message when I try to communicate with Gerrit:

*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*
*@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @*
*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*
*IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!*
*Someone could be eavesdropping on you right now (man-in-the-middle
attack)!*
*It is also possible that the RSA host key has just been changed.*
*The fingerprint for the RSA key sent by the remote host is*
*1b:85:48:a8:46:19:b5:06:fc:6f:92:a2:81:e6:a7:4b.*
*Please contact your system administrator.*

*RSA host key for [gerrit.openbmc-project.xyz
<http://gerrit.openbmc-project.xyz>]:29418 has changed and you have
requested strict checking.*
*Host key verification failed.*
*fatal: Could not read from remote repository.*

*Please make sure you have the correct access rights*
*and the repository exists.*

Does Gerrit identification has changed?

Thanks,

Tomer

--000000000000e86a48056a6e82a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I get the following message when=
 I try to communicate with=C2=A0Gerrit:</div><div><br></div><div><div><b>@@=
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</b></div><div><b>=
@=C2=A0 =C2=A0 WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!=C2=A0 =C2=
=A0 =C2=A0@</b></div><div><b>@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=
@@@@@@@@@@@@@</b></div><div><b>IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHI=
NG NASTY!</b></div><div><b>Someone could be eavesdropping on you right now =
(man-in-the-middle attack)!</b></div><div><b>It is also possible that the R=
SA host key has just been changed.</b></div><div><b>The fingerprint for the=
 RSA key sent by the remote host is</b></div><div><b>1b:85:48:a8:46:19:b5:0=
6:fc:6f:92:a2:81:e6:a7:4b.</b></div><div><b>Please contact your system admi=
nistrator.</b></div><div><b>RSA host key for [<a href=3D"http://gerrit.open=
bmc-project.xyz">gerrit.openbmc-project.xyz</a>]:29418 has changed and you =
have requested strict checking.<br></b></div><div><b>Host key verification =
failed.</b></div><div><b>fatal: Could not read from remote repository.</b><=
/div><div><b><br></b></div><div><b>Please make sure you have the correct ac=
cess rights</b></div><div><b>and the repository exists.</b></div></div><div=
><br></div><div>Does Gerrit identification has changed?=C2=A0<br></div><div=
><br></div><div>Thanks,</div><div><br></div><div>Tomer</div></div>

--000000000000e86a48056a6e82a5--
