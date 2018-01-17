Return-Path: <emilyshaffer@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c09::232; helo=mail-wm0-x232.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cFphQmIg"; 
 dkim-atps=neutral
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com
 [IPv6:2a00:1450:400c:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zMNDN14JzzF0Yx
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jan 2018 10:13:06 +1100 (AEDT)
Received: by mail-wm0-x232.google.com with SMTP id r78so19132132wme.0
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 15:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=KlgXi5lJpoUeTBwiMOxJ/7VxU6udCDJBvOqdCuVA7Qs=;
 b=cFphQmIgwc+Uh0eXpMPoDLPtWjXkbTwzCgZzfE88fbnnCb9CLXOD0lIB514aCGbNSq
 iRDwv2VpklPXchnt3j91Ltf8ZW7JXzHq14ad/MjnZa7L92K1QvBGEIneFPe4FqMLfomp
 7dnjg+sE9kdozmj8EH0WOrm0y63COfagZMnHJNZt1GtzbNcVzWmvQcyJ1fzjbyGdlhiB
 M2dvEl10HNm6JrFkRiX2abqxAI/jzMTdk8+nvxryOuyD99lAWpH2qqlcFjePEGRISkhD
 Hy7RWWQMYsrBOhq4hiLFI/FuKOD9dOQvu0DysHUCOtrM1gmEGgRfjlDaqBvnBmexO9uB
 h/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=KlgXi5lJpoUeTBwiMOxJ/7VxU6udCDJBvOqdCuVA7Qs=;
 b=mzo2IWnN4yO0Mr9E7mbiCULme8iD4uqtBHN+GhyzTiSykeYpq0Za2tt6Po3RD/yiua
 1vM/MBN8ghWLXCjqnpRMK5omPQujrY1Xgf9XsMwsI5EvLdBjT1X3LGg5qFs/ZeTcu1eE
 UrruYnyhZqWXmStkIaOU+3FfsAbHqEUh1yehxtAISkotithMo/5GkHVaWZHLNj2k1dYt
 oZOfI7SpKLAXsSqEFOos2WcOVEZRM0j/QmeuWdXKpeur+yAFsNyUpMf4J3Z1nwRFnN0v
 uRjjG4pfxR5d9Tz7bJR1gge1pu2bpaUvSiYsjPhWMwySStF1C0X3HVMsMMCL7GDxYgDW
 XPcQ==
X-Gm-Message-State: AKwxytcr/ZVrLmGuv89SQqn6bCjaTzThoxbDDNBXBWSgQywQo1WJddG4
 ja2YQ7rVQgKRvymcpDqQhR47hZNFAdEmiXPpUsoC5Fov+cg=
X-Google-Smtp-Source: ACJfBouRgV+i1AyQiQqStv/2OkJEzegr3QURvxp/3j/D3ybbTXfpKyeAKT6kR9tunnL4hYIj4EX3KvZoiWaCpGOJY4M=
X-Received: by 10.28.87.138 with SMTP id l132mr2668263wmb.27.1516230783159;
 Wed, 17 Jan 2018 15:13:03 -0800 (PST)
MIME-Version: 1.0
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 17 Jan 2018 23:12:52 +0000
Message-ID: <CAJoAoZmgK7Q8O6KwGvLpKFxT5TUAS34BK-vYsV=TvPEGtd+NGw@mail.gmail.com>
Subject: Introducing IPMI Maintainer Staff
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Tom Joseph <tomjose@linux.vnet.ibm.com>, 
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Emily Shaffer <emilyshaffer@google.com>
Content-Type: multipart/alternative; boundary="001a11444cb83ae232056300fd8d"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jan 2018 23:13:10 -0000

--001a11444cb83ae232056300fd8d
Content-Type: text/plain; charset="UTF-8"

Hi all,

If you aren't interested in developing on IPMI, you can stop reading now.

As some of you may be aware, at the beginning
<https://github.com/openbmc/docs/commit/fa258d825e289c9d82d4d891562e355173a439a5>
of January, myself, Tom Joseph, and Vernon Mauery volunteered to become
maintainers on the IPMI stack.  We'd like to share with you some more
details on how this maintainership is going to function moving forward;
these same details will very soon be added into READMEs in the relevant
IPMI repositories (ipmitool, ipmi-fru-parser, phosphor-host-ipmid,
phosphor-net-ipmid, and openpower-host-ipmi-oem).


For ipmitool, ipmi-fru-parser, phosphor-host-ipmid, and phosphor-net-ipmid,
all three of us are maintainers:

- All code reviews for any of these repositories must be made available for
review for a minimum of 48 hours to allow for visibility, and must be
approved by at least two maintainers.  If any maintainer objects to the
code with a -1, the concern must be addressed before the code review can be
approved.  Please add all three of us as reviewers on any commits for any
of these repos.  If you're a reviewer on a code review under any of these
repos and notice the submitter didn't add any or all of the maintainers,
feel free to add us yourself.  This means that Brad Bishop will no longer
be the final gate for new code going into these IPMI repositories; if you
think your review has adequate approval but you haven't been cleared
with +2, it's appropriate to ping one or more of the three of us on IRC.

- Include tests with your code reviews wherever possible.  We will be
requiring tests for new IPMI commands to demonstrate that they work as
expected.  In the coming weeks or so we will be working on bringing up a
clear unit testing infrastructure within these repos; we will also accept a
test added to the Robot testing suite here:
https://github.com/openbmc/openbmc-test-automation linked within the
changeset description.

- Design discussions should be carried out initially via email with the
three of us, and the OpenBMC list if desired.  For architectural or design
decisions, the three of us will need to agree unanimously on the correct
approach.  If we are unable to do so, we will escalate the decision to the
Technical Steering Committee to determine the best path forward.


For openpower-host-ipmi-oem, Tom Joseph will be the sole maintainer.  All
changelists and design decisions will be at his discretion and he should be
the final approver.


The maintainers are located in Pacific Time Zone and India Time Zone.  We
have a conference every other week on Tuesday evening Pacific/Wednesday
morning India; if you wish to discuss something with us, let someone know
on IRC at least 12 hours ahead of time and you will be welcome to join the
call.  We will be mailing out a brief summary of what's discussed at the
meetings afterwards (I'll be sending the summary from yesterday's call
shortly after this).


All three of us are generally present during our appropriate working hours
on IRC and email, and will be happy to address any questions or concerns.
Feel free to contact us:

Tom Joseph: tomjose@linux.vnet.ibm.com or IRC handle tomjoseph
Vernon Mauery: vernon.mauery@linux.intel.com or IRC handle vmauery
Emily Shaffer: emilyshaffer@google.com or IRC handle emilyshaffer


We're looking forward to working with the community!

Emily, Tom, and Vernon

--001a11444cb83ae232056300fd8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>If you aren&#39;t interested in=
 developing on IPMI, you can stop reading now.<br><div><br></div><div>As so=
me of you may be aware, at the <a href=3D"https://github.com/openbmc/docs/c=
ommit/fa258d825e289c9d82d4d891562e355173a439a5">beginning</a> of January, m=
yself, Tom Joseph, and Vernon Mauery volunteered to become maintainers on t=
he IPMI stack.=C2=A0 We&#39;d like to share with you some more details on h=
ow this maintainership is going to function moving forward; these same deta=
ils will very soon be added into READMEs in the relevant IPMI repositories =
(ipmitool, ipmi-fru-parser, phosphor-host-ipmid, phosphor-net-ipmid, and op=
enpower-host-ipmi-oem).</div></div><div><br></div><div><br></div><div>For i=
pmitool, ipmi-fru-parser, phosphor-host-ipmid, and phosphor-net-ipmid, all =
three of us are maintainers:</div><div><br></div><div>- All code reviews fo=
r any of these repositories must be made available for review for a minimum=
 of 48 hours to allow for visibility, and must be approved by at least two =
maintainers.=C2=A0 If any maintainer objects to the code with a -1, the con=
cern must be addressed before the code review can be approved.=C2=A0 Please=
 add all three of us as reviewers on any commits for any of these repos.=C2=
=A0 If you&#39;re a reviewer on a code review under any of these repos and =
notice the submitter didn&#39;t add any or all of the maintainers, feel fre=
e to add us yourself.=C2=A0 This means that Brad Bishop will no longer be t=
he final gate for new code going into these IPMI repositories; if you think=
 your review has adequate approval but you haven&#39;t been cleared with=C2=
=A0+2, it&#39;s appropriate to ping one or more of the three of us on IRC.<=
/div><div><br></div><div>- Include tests with your code reviews wherever po=
ssible.=C2=A0 We will be requiring tests for new IPMI commands to demonstra=
te that they work as expected.=C2=A0 In the coming weeks or so we will be w=
orking on bringing up a clear unit testing infrastructure within these repo=
s; we will also accept a test added to the Robot testing suite here:=C2=A0<=
a href=3D"https://github.com/openbmc/openbmc-test-automation">https://githu=
b.com/openbmc/openbmc-test-automation</a>=C2=A0linked within the changeset =
description.</div><div><br></div><div>- Design discussions should be carrie=
d out initially via email with the three of us, and the OpenBMC list if des=
ired.=C2=A0 For architectural or design decisions, the three of us will nee=
d to agree unanimously on the correct approach.=C2=A0 If we are unable to d=
o so, we will escalate the decision to the Technical Steering Committee to =
determine the best path forward.</div><div><br></div><div><br></div><div>Fo=
r openpower-host-ipmi-oem, Tom Joseph will be the sole maintainer.=C2=A0 Al=
l changelists and design decisions will be at his discretion and he should =
be the final approver.</div><div><br></div><div><br></div><div>The maintain=
ers are located in Pacific Time Zone and India Time Zone.=C2=A0 We have a c=
onference every other week on Tuesday evening Pacific/Wednesday morning Ind=
ia; if you wish to discuss something with us, let someone know on IRC at le=
ast 12 hours ahead of time and you will be welcome to join the call.=C2=A0 =
We will be mailing out a brief summary of what&#39;s discussed at the meeti=
ngs afterwards (I&#39;ll be sending the summary from yesterday&#39;s call s=
hortly after this).</div><div><br></div><div><br></div><div>All three of us=
 are generally present during our appropriate working hours on IRC and emai=
l, and will be happy to address any questions or concerns.=C2=A0 Feel free =
to contact us:<br><br>Tom Joseph: <a href=3D"mailto:tomjose@linux.vnet.ibm.=
com">tomjose@linux.vnet.ibm.com</a>=C2=A0or IRC handle tomjoseph</div><div>=
Vernon Mauery: <a href=3D"mailto:vernon.mauery@linux.intel.com">vernon.maue=
ry@linux.intel.com</a>=C2=A0or IRC handle vmauery</div><div>Emily Shaffer: =
<a href=3D"mailto:emilyshaffer@google.com">emilyshaffer@google.com</a>=C2=
=A0or IRC handle emilyshaffer</div><div><br></div><div><br></div><div>We&#3=
9;re looking forward to working with the community!</div><div><br></div><di=
v>Emily, Tom, and Vernon</div></div>

--001a11444cb83ae232056300fd8d--
