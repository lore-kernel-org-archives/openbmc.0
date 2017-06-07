Return-Path: <venture@google.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wjcJR5LYBzDqCt
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2017 04:19:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="P9TTK260"; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id 83so8380879pfr.0
 for <openbmc@lists.ozlabs.org>; Wed, 07 Jun 2017 11:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qsYYJNStwssYNHp2FnRaufN2WK+TCvmaTWUpcMWnlBA=;
 b=P9TTK260pbd9zOcumEchPHMltSlgjdPTQgXXdCqcVQ7clohnm9sjn3fyjYVUxByfme
 adCW9gBjgHhipzcTyf/ei/lL4GwjaHlgy0m2tyox3eYI2RcU3ntGY5fhIG3pSOW0UoX5
 /hmWCU3nR33xMELl4fqGysYIqQcqcRUm5PJuCtb93DHQczi5ik1NUEJmDtbVC076TZOe
 8lq9zk1e0TlontR/OrkXj0VPm679uZKO1QlVJdTUat83Uzh3mC7Vtxc8idM05I3h6Znv
 h7qXShCCq5EqvtXBn+aZGj42EhkM56jXroaaZsCevZwJNOaQyTK1pz2BpoaV24UJY9xx
 p/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qsYYJNStwssYNHp2FnRaufN2WK+TCvmaTWUpcMWnlBA=;
 b=Mo/rgRJjbJNhABTn87YCXUmxwySAdWIE2xFFU86KnVrvAG56+pbAdM9xLlXVQIxOam
 gVng7gcYSANU90jcCoWf7Muf+L8sZtbkDO54bcA/6rauf22gcxj15zDghxp4viaSCNqk
 jTkwy5SwC/e0XLeuXKhBcbi8YvvT7VGQIZ/5J3/kJnOQkO08VUkcP0/PsjMHnWEaoQ30
 SXG83ZL6zj6sGI6uMRdO9J0VxHTd43CziTLDsWxagkH0oGErJbRzwDG2JOfri5AC7s+W
 6Awlf3lAtPw6RkDWnw61Gwrb27QelJlAsHR8PDeSGzQ22Y/Txp0yDtxjRr7TPGNWgyag
 8AxA==
X-Gm-Message-State: AODbwcC4cB9I+l+d/8mOcwTThgeElh+jk7QEjQhWbtVbEk/dolZODf03
 k4z7HEr4xiJgO+ee2Fu5NcZ6FsPFCcKZTDJ2NQ==
X-Received: by 10.84.224.206 with SMTP id k14mr30072542pln.195.1496859539664; 
 Wed, 07 Jun 2017 11:18:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.160.108 with HTTP; Wed, 7 Jun 2017 11:18:39 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Wed, 7 Jun 2017 11:18:39 -0700
Message-ID: <CAO=notyH_wpUBZELWGf5dBeCApB4+Zo-VrTa4vYJyHYjpxHvjQ@mail.gmail.com>
Subject: New Platform Guide
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="f40304361288246af9055162c566"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Jun 2017 18:19:04 -0000

--f40304361288246af9055162c566
Content-Type: text/plain; charset="UTF-8"

Where is the new platform guide?

In trying to get the quanta board running with everything; I've often run
into stumbling blocks when trying to define what packages are required and
what need to be replaced with custom versions -- for things like sensors.

Often I've been more or less reduced to checking the journal logs to see if
something is saying why it's not running (settings.py was crashing which
meant ipmid wouldn't start as an example).  It took some source searching
to figure out that x really depended on some object existing.  Often those
were in the service file, but not every time.  And especially as OpenBMC is
a moving target, this has been somewhat discouraging.  Especially when the
"supported" platforms all stem from the skeleton which still has its
fingers in many places.

That said, there are a lot of dependencies between packages, and things
that you receive that maybe you don't want or need or aren't configured
properly.  For example, I don't know why or what the led-manager is doing
but it's on my system running.  I don't believe I configured it.

If there is a guide, then I didn't see it and I apologize.

If there isn't a guide -- I can start one; however, I won't really have to
do it properly until some time in July.  My approach would be, create a new
platform that mimics Zaius but under a different name and see what it takes
to output a similar image and what is really required -- although difficult
for me to test.  So maybe a new Quanta image from scratch and see what's
running, and why and what things need to be configured.

Thanks,
Patrick

--f40304361288246af9055162c566
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">Where is the new platform=
 guide?</span><div style=3D"font-size:12.8px"><br></div><div style=3D"font-=
size:12.8px">In trying to get the quanta board running with everything; I&#=
39;ve often run into stumbling blocks when trying to define what packages a=
re required and what need to be replaced with custom versions -- for things=
 like sensors.</div><div style=3D"font-size:12.8px"><br></div><div style=3D=
"font-size:12.8px">Often I&#39;ve been more or less reduced to checking the=
 journal logs to see if something is saying why it&#39;s not running (setti=
ngs.py was crashing which meant ipmid wouldn&#39;t start as an example).=C2=
=A0 It took some source searching to figure out that x really depended on s=
ome object existing.=C2=A0 Often those were in the service file, but not ev=
ery time.=C2=A0 And especially as OpenBMC is a moving target, this has been=
 somewhat discouraging.=C2=A0 Especially when the &quot;supported&quot; pla=
tforms all stem from the skeleton which still has its fingers in many place=
s.</div><div style=3D"font-size:12.8px"><br></div><div style=3D"font-size:1=
2.8px">That said, there are a lot of dependencies between packages, and thi=
ngs that you receive that maybe you don&#39;t want or need or aren&#39;t co=
nfigured properly.=C2=A0 For example, I don&#39;t know why or what the led-=
manager is doing but it&#39;s on my system running.=C2=A0 I don&#39;t belie=
ve I configured it.</div><div style=3D"font-size:12.8px"><br></div><div sty=
le=3D"font-size:12.8px">If there is a guide, then I didn&#39;t see it and I=
 apologize.</div><div style=3D"font-size:12.8px"><br></div><div style=3D"fo=
nt-size:12.8px">If there isn&#39;t a guide -- I can start one; however, I w=
on&#39;t really have to do it properly until some time in July.=C2=A0 My ap=
proach would be, create a new platform that mimics Zaius but under a differ=
ent name and see what it takes to output a similar image and what is really=
 required -- although difficult for me to test.=C2=A0 So maybe a new Quanta=
 image from scratch and see what&#39;s running, and why and what things nee=
d to be configured.</div><div style=3D"font-size:12.8px"><br></div><div sty=
le=3D"font-size:12.8px">Thanks,</div><div style=3D"font-size:12.8px">Patric=
k</div></div>

--f40304361288246af9055162c566--
