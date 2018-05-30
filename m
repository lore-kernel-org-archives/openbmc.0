Return-Path: <yuenn@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::22b; helo=mail-io0-x22b.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="prH2VJ8m"; 
 dkim-atps=neutral
Received: from mail-io0-x22b.google.com (mail-io0-x22b.google.com
 [IPv6:2607:f8b0:4001:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40x3531SJnzDrWZ
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 07:04:53 +1000 (AEST)
Received: by mail-io0-x22b.google.com with SMTP id o185-v6so23318988iod.0
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 14:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ZI5tqdJ4sJT5H8OcjrjeOV0Yv2mynOIp1PKyQNiQZNY=;
 b=prH2VJ8m/CX5S+60SBhMEjSgVC9bAGR3qkX85szJ9UbCCsWGwBCWf/HjX8tLhADHUh
 jM4epjnNwSSXu09P4CfW4XiVcvqOvk+dtWU2DvP4/VdJbNNuRqlqvnCGK/VIy8/EHWJI
 HQ35ab35rFjxZ2EvQsf5Rip6BGu8rc5eFt4eji+6k9KmIZ4dGmCiy8VR6RS2ehhElhff
 tva6ZUE3n2/35vqJx9ib2d/vDmHZc0eMKPHmP88OnCyQzaB1gY8jZtjamh14G2tiEgZp
 XAxd3Emh0E72qGzZ3tzPHWrf+PCd0Pu3Lw2vjE2YZLTiZSXMj8TDnVfhXyUaCkSB+U6f
 gubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZI5tqdJ4sJT5H8OcjrjeOV0Yv2mynOIp1PKyQNiQZNY=;
 b=lemGDhEBTgZN53hiCQv75DVu3A2INtiI/MNZ3Iu3POXoiSmKDrhaqCaEH1awfuCQ4s
 9JRWjGn34FyxFEsPtC5jfMZl4C+FkSLMb+qN6/Mnr5LaVfSiknsJuz8rZ1y3Tea/S6pI
 1WhDXHaqQovmmqbk4iHrj3jX+wAMVfP4Qw8IRI+EyPcucBCQAVdP5pAdAgUagt634eaU
 ezezuZZy0E8SuStRU1SqWAOTNBd6LZ6WMMUD6fo9eHrBDnt8yyKi9sE3DviUNU8eqDPp
 jvhmEPvqoCpp0bAQ+5pzxdkXQWhVwbCzVk7EJJAR82g0iJiKA+eu8NAFwS175RqJcuMw
 21RQ==
X-Gm-Message-State: APt69E0NSlogl4c0lqj6F2fC1pGLllq585mk+s+4ysYVfO69EFEyftmS
 3B3PuJc7bzYUrZk+ALwJ66+KRJeNxePQqTAZnheSfGcD
X-Google-Smtp-Source: ADUXVKJcrJzCM7BOxwuQ/LCplF3//uDqH8ALn74UYb9xBhpyiRBubPTsznkl5uEsiA1ZtxuqAAxdxkyLNj/V3A1obfA=
X-Received: by 2002:a6b:e215:: with SMTP id
 z21-v6mr3662788ioc.280.1527714290731; 
 Wed, 30 May 2018 14:04:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5e:c90c:0:0:0:0:0 with HTTP; Wed, 30 May 2018 14:04:10
 -0700 (PDT)
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 30 May 2018 14:04:10 -0700
Message-ID: <CADfYTpFTzVbnSpZn+J74fHNCDZ0QAKKyNLXMzbPKT2JK3fTefQ@mail.gmail.com>
Subject: OpenBMC Security Working Group Kick Off
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000009ecc28056d72b397"
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
X-List-Received-Date: Wed, 30 May 2018 21:04:56 -0000

--0000000000009ecc28056d72b397
Content-Type: text/plain; charset="UTF-8"

The OpenBMC Security Work Group kick off meeting is scheduled for Thurs May
31, 9AM PDT.  This first meeting is by invite only.  Please email me if you
are interested in participating in this working group.

In the future we will have public meetings open to the community.  But the
nature of security is such that some more restricted meetings will be
necessary.

The current agenda is below.  The group will send an update with meeting
notes after the meeting tomorrow.

Current agenda <https://goo.gl/forms/QS8j4j6mnWGYYNDj2>:

   - Introduction round table: what you're interested in and why
   - Joseph Reynolds: OpenBMC security documentation project
   https://gerrit.openbmc-project.xyz/#/c/10443/
   <https://gerrit.openbmc-project.xyz/#/c/10443/>
   - Ben Stoltz: CC as it applies to design and implementation phases.
   Separation of policy and mechanism in BMC lifecycle, including product
   lifecycle manufacture, provisioning, deployment, operations and
   maintenance, recovery, and disposition. E.g. repairs: {Low-/Med-/High-
   touch} x {manual-/automated-self-/automated-assisted- repair}


----------
Nancy

--0000000000009ecc28056d72b397
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font size=3D"4">The OpenBMC Security Work Group kick off =
meeting is scheduled for Thurs May 31, 9AM PDT.=C2=A0 This first meeting is=
 by invite only.=C2=A0 Please email me if you are interested in participati=
ng in this working group.</font><div><font size=3D"4"><br></font></div><div=
><font size=3D"4">In the future we will have public meetings open to the co=
mmunity.=C2=A0 But the nature of security is such that some more restricted=
 meetings will be necessary.</font><div><font size=3D"4"><br></font></div><=
div><font size=3D"4">The current agenda is below.=C2=A0 The group will send=
 an update with meeting notes after the meeting tomorrow.</font></div><div>=
<div><div><font size=3D"4"><br></font></div><div><font size=3D"4">Current <=
a href=3D"https://goo.gl/forms/QS8j4j6mnWGYYNDj2" target=3D"_blank">agenda<=
/a>:</font></div><div><font size=3D"4"><div><ul><li>Introduction round tabl=
e: what you&#39;re interested in and why<br></li><li>Joseph Reynolds: OpenB=
MC security documentation project <a href=3D"https://gerrit.openbmc-project=
.xyz/#/c/10443/" target=3D"_blank">https://gerrit.openbmc-<wbr>project.xyz/=
#/c/10443/</a></li><li>Ben Stoltz: CC as it applies to design and implement=
ation phases. Separation of policy and mechanism in BMC lifecycle, includin=
g product lifecycle manufacture, provisioning, deployment, operations and m=
aintenance, recovery, and disposition. E.g. repairs: {Low-/Med-/High- touch=
} x {manual-/automated-self-/<wbr>automated-assisted- repair}</li></ul></di=
v></font></div><div><br></div><div><div><div class=3D"m_4899249966545124773=
gmail_signature"><font size=3D"4">----------<br>Nancy</font></div></div>
</div></div></div></div></div>

--0000000000009ecc28056d72b397--
