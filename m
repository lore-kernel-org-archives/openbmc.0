Return-Path: <yuenn@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::22d; helo=mail-io0-x22d.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Si8uA3bS"; 
 dkim-atps=neutral
Received: from mail-io0-x22d.google.com (mail-io0-x22d.google.com
 [IPv6:2607:f8b0:4001:c06::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40gV161JhkzF1v3
 for <openbmc@lists.ozlabs.org>; Wed,  9 May 2018 05:29:28 +1000 (AEST)
Received: by mail-io0-x22d.google.com with SMTP id d11-v6so39842616iof.11
 for <openbmc@lists.ozlabs.org>; Tue, 08 May 2018 12:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/kQ9UVAVisc4Rq6h+y1iSGP5+OJJu0hVp3liSs4Gp74=;
 b=Si8uA3bSKjJmlYgIWW2BUSUc5ZH1WrEwd35D0KdDpKFNkgf/brVGck22NhD/PN5CuH
 t33yrt2r7/hs5fLFRxGAeOaxqvJ6cYAMXLbI17kP4nHNj/1XIRMukWjIe/rhoXrdW8Sr
 HznocWB/qV738k85VTP+uarMTOaXwtxFVG/5SMZAOs6cGwCxjvm3NpFSNEiaO6A9cXhP
 jpxc2P20N20Q9DfKf9x4q0cmRMZCuS++7gcnCG62EkzwlaYzw7FA7Nme7u8fV2VUfsI1
 D16aqYcg0K0B3BTuM1qov8hD1BpKOH0GVdFViH35b0UTd4cUYyGqpXOF/QW9jH/qoUmZ
 Z0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/kQ9UVAVisc4Rq6h+y1iSGP5+OJJu0hVp3liSs4Gp74=;
 b=H7fj02Szx2SJ3GB57eqIgnFaOjxWqqo9j0cVJdcXwlL1n3y8ZH/XuMg1dzYpXEeqmL
 c0zmAmmM/s2cjD7XNjv4gcJttPO+TUTcuACPH8UUGyDDoNRAVtUy/Gv5w9BdDtHqZ3hr
 B4z7W6UJ6tExId8l7NP1uJhYLuNOkfrbd+nG59fRMOrrB21n/pniSCaCjCUALah8lOC0
 kycLtMqBnFdVs/lfFQLWTw1I5WxfCBgsVfZJkXTe3MrTad5KefXEARWMMsbKL/lYU2k9
 Lh72pcetb3kD67TZLh38TkHkAQOxIZQ1SQiyLaqMFj+wAlHauj2d7HOI3CD33hAzmflj
 2D5g==
X-Gm-Message-State: ALQs6tDyvD4aSj/5KN+TqUfMPzU+vquIoGO/nir9JRHnowcKFu/HTih+
 oTY5s+ueNOtSK7GFGpIZRqeSu3QPWo9ZQFM0Kp1wQLOG
X-Google-Smtp-Source: AB8JxZpIU7DcSPObgNQ1n5eT/0Vb80rGfK86MhymzK/A83VOVuLSUJwPqDOs/x0lnPhXZDts3jrpF9eFfSvG49WiMTQ=
X-Received: by 2002:a6b:27d5:: with SMTP id
 n204-v6mr45778952ion.206.1525807766263; 
 Tue, 08 May 2018 12:29:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.111.9 with HTTP; Tue, 8 May 2018 12:28:45 -0700 (PDT)
From: Nancy Yuen <yuenn@google.com>
Date: Tue, 8 May 2018 12:28:45 -0700
Message-ID: <CADfYTpFfoEe2SvvBAsjL-UAPocC02Z49o-rTDxA7JwA9OagHnw@mail.gmail.com>
Subject: OpenBMC Fix-It
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000e7f0e3056bb6cdce"
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
X-List-Received-Date: Tue, 08 May 2018 19:29:31 -0000

--000000000000e7f0e3056bb6cdce
Content-Type: text/plain; charset="UTF-8"

Please join my team for an OpenBMC  community "fix-it" event in June!

My team is devoting the week of 6/11/-15 to a Google OpenBMC "fix it" as
part of a larger fix-it initiative. OpenBMC is a large part of our project
so I'd like to spend part of the week on a fix-it on OpenBMC.

I propose to have the fix it on Tues and Wed 6/12 & 6/13.  We could set up
an IRC channel for the fix it where everyone participating would hang out
for the day.  We could pick one or two areas to focus on for those days,
put together a list of things to "fix" in those areas ahead of time.  On
the day, we all tackle things on the list (or something not on the list),
discuss over IRC and do code reviews.  Inevitably, people have meetings or
things they can't get out of, but if you can be available for most of the
day, that would be enough!

Anyone interested in participating?

----------
Nancy

--000000000000e7f0e3056bb6cdce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><font size=3D"4">Please join my team for an OpenBMC=
=C2=A0 community &quot;fix-it&quot; event in June!</font></div><div><font s=
ize=3D"4"><br></font></div><font size=3D"4">My team is devoting the week of=
 6/11/-15 to a Google OpenBMC &quot;fix it&quot; as part of a larger fix-it=
 initiative. OpenBMC is a large part of our project so I&#39;d like to spen=
d part of the week on a fix-it on OpenBMC.</font><div><font size=3D"4"><br>=
</font></div><div><font size=3D"4">I propose to have the fix it on Tues and=
 Wed 6/12 &amp; 6/13.=C2=A0 We could set up an IRC channel for the fix it w=
here everyone participating would hang out for the day.=C2=A0 We could pick=
 one or two areas to focus on for those days, put together a list of things=
 to &quot;fix&quot; in those areas ahead of time.=C2=A0 On the day, we all =
tackle things on the list (or something not on the list), discuss over IRC =
and do code reviews.=C2=A0 Inevitably, people have meetings or things they =
can&#39;t get out of, but if you can be available for most of the day, that=
 would be enough!</font></div><div><font size=3D"4"><br></font></div><div><=
font size=3D"4">Anyone interested in participating?</font></div><div><font =
size=3D"4"><br></font></div><div><div><div><div><div class=3D"m_-7890294177=
612788909gmail_signature" data-smartmail=3D"gmail_signature"><font size=3D"=
4">----------<br>Nancy</font></div></div>
</div></div></div></div>

--000000000000e7f0e3056bb6cdce--
