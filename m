Return-Path: <jandraara@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c33; helo=mail-yw1-xc33.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G3gdmKaq"; 
 dkim-atps=neutral
Received: from mail-yw1-xc33.google.com (mail-yw1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44PgsX3ggZzDqLx
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 07:06:08 +1100 (AEDT)
Received: by mail-yw1-xc33.google.com with SMTP id j128so3011164ywg.12
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 13:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ZqxEm3UZZIpTNxAWbPMWi9c4+c5AtkqkNArPNDto9w4=;
 b=G3gdmKaqIKSqOlvPPDBxc7DUGBgB+xrqmW6xgtCgvcwMovEq3S+pKwnE2c4Rfw180+
 2I7OJ6LmcE/xSTWhA8UGznUw9FoLEfA8PfiQkRPw7PgmLjnqlYDHBO4pvRVRmuW104HG
 aXF7+ysAA4MF/H+eVHoUfmK7xePr03PMT8Yvt/OeaUJMNIIfn0+7DMfyJUvExemaAt8K
 ndcYGp2VYpFfhwZuI3HlYLScn0oDgrb7zAZBpqzB/DesyJ7ZkOSjDbwMNA/NxZONA+tL
 elYjG2rBnSnUpDjxMdpESx9unCjk4JXd/SZ8GURcHC3Tmz3SBrz9T6bGJk3YEZPwJcJD
 SYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZqxEm3UZZIpTNxAWbPMWi9c4+c5AtkqkNArPNDto9w4=;
 b=n+U6Vt87a3d/dtrE039+xE979tAluoLgQsG/hPedP9/S2U6xpBIycmgiARWDXRqN80
 HUQno8XEos0W5fjMOC7wMMD7vZ1LXJX+TjQGu51oALvTvsJ2/z+/awIdNJUSF0enOOvs
 pcriqCmsHp/PD+Yq7VTB2aT8sdn4hfo3zxC3IqP9WSdqBzMh7Qi9TgboTycLNrKR6gYL
 sRfWJS/rO+4avIa/ut7Qbrl60cTd5Be5JjqEvhY3YH47EU5N5HYyEvHVXu/NiCVPJVqG
 HURLQQY8QLblfsZErHo4d56zHG79o6TMepo2Q6oPHBUVOa+GoghJKLihSo4S/TLPECXm
 5P6w==
X-Gm-Message-State: APjAAAWZSQI1w0a/X0e344SlWTaknHca3cVwbPUCYQ9BU4Kkz1r+4tWk
 GcEWBsUMaQAFBC5spO5uwEODAxCvIJxn1/7IMyR/Djl+
X-Google-Smtp-Source: APXvYqyxjmHWcBh9YG+8nICmvOU2UwMy5Khfn+wvhoCl7/0u/dIvPOqhl5J4NmoBUD491VgneztsWMJFPbnhjnY3jzU=
X-Received: by 2002:a81:6b41:: with SMTP id g62mr8519817ywc.154.1553112364471; 
 Wed, 20 Mar 2019 13:06:04 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Wed, 20 Mar 2019 15:05:53 -0500
Message-ID: <CAMTupoSb=1Yrw8qRB+-deY5cv-=8A+ievx3552=Q45J8VLUtqw@mail.gmail.com>
Subject: LDAP - final UI design proposal
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000c7dcce05848c2663"
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
X-List-Received-Date: Wed, 20 Mar 2019 20:06:08 -0000

--000000000000c7dcce05848c2663
Content-Type: text/plain; charset="UTF-8"

Hello all,

We want to share with you the final UI design proposal for LDAP. We have
consulted multiple end-users as well as subject matter experts; if you were
one of them, your feedback was tremendously helpful and want to thank you
for it.

Please view final designs at:
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/318942513_LDAP_Disabled

Now we can start developing the front end.

Regards,
- GUI Design Team

--000000000000c7dcce05848c2663
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello all,<div><br></div><div>We want to =
share with you the final UI design proposal for LDAP. We have consulted mul=
tiple end-users as well as subject matter experts; if you were one of them,=
 your feedback was tremendously helpful and want to thank you for it.=C2=A0=
</div><div><br></div><div>Please view final designs at:=C2=A0 <a href=3D"ht=
tps://ibm.invisionapp.com/share/RQNYHJ0VBDY#/318942513_LDAP_Disabled">https=
://ibm.invisionapp.com/share/RQNYHJ0VBDY#/318942513_LDAP_Disabled</a><br><b=
r></div><div>Now we can start developing the front end.</div><div><br></div=
><div>Regards,</div><div>- GUI Design Team</div></div></div>

--000000000000c7dcce05848c2663--
