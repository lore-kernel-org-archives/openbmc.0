Return-Path: <yuenn@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::235; helo=mail-it0-x235.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tKl7rhVr"; 
 dkim-atps=neutral
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 411tV16syXzDqG0
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jun 2018 03:54:49 +1000 (AEST)
Received: by mail-it0-x235.google.com with SMTP id n7-v6so14001868itn.1
 for <openbmc@lists.ozlabs.org>; Thu, 07 Jun 2018 10:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=wJiXl8Ib8Arpnq70Rd52QTUmNUJytbm6a1C8mwza1fQ=;
 b=tKl7rhVr/UrDBLV3O/wfTyPCsSg44+aguHt+n7kFFLvh+yB2rjQS3afc9Qsi0lgWY3
 HPmGVhbEJN2IYv/BatvpG6sFA/3wN+ucWuxmoYjhQfK9l20sZwaefV/1NwsTF7bJeHDS
 a79qBYjFUBHU4irj4Mp93GGi1RViWFMZtIP5NQz78/KTrZGOgUCEoDfSAqfkygIlmI6b
 oElY/Oa3jBIhs6ND0jQObUXjguE3vaDg5AFbbhDGGJxaWaTJ7lEfPXdWyXfjMsQcrhHi
 tqSHNcGhu2bh1etNeMLlIdMOGSEXuRZZwzULrmr2FCoJhO/7R5GQr1zDZcWNpKUhXC9V
 E/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=wJiXl8Ib8Arpnq70Rd52QTUmNUJytbm6a1C8mwza1fQ=;
 b=m6CEfVL3RkAIPHPmESH1n73XHzq1s5xDSq+7RnbDHIjM42i205xF0n1UbZiAT7iC99
 E13tSx8e1qqQDDmPlvs3/9n4PUWQibFtiiNZ1/uBBMnRNdwhzT2DG3tAtDyf+5swpt1k
 OJJXv7THR3c6qklUAeykPvgCgfO88w1ATnQKbBPdlSZGraDZX0trhJF079mB5nqF4xQj
 13/AxmeaJqYhzx5vnsP1TQ108maGpiYM2+9Y8nxyP7W6QsyLE3dmbVi7/Xvr/DU4AgCT
 PT1W6+Yb3Ve6JCzRrZCyRrOzB9I6wNFz9wXcsFAOnRB7PR5rzaD9X8yusDhDymN9szPE
 oc2g==
X-Gm-Message-State: APt69E0lTLjLiyGWYaSsYw1zzLwz9Zbf9gQsgCcLNkEB5rzZOC+g3gg4
 aNaSVgvutHIYy0FWpE0P1tAmIQOXe5vYxsFUM5Eb6w==
X-Google-Smtp-Source: ADUXVKIOE/JGEUzCpBSd6MDyZ0M8M+eIBexZNObg3z8mDZLUCM0D0XzzhZ2OmFGyvov2F7drPymwUZqMXiqu4yo19Fw=
X-Received: by 2002:a24:f987:: with SMTP id
 l129-v6mr2797817ith.148.1528394086033; 
 Thu, 07 Jun 2018 10:54:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5003:0:0:0:0:0 with HTTP;
 Thu, 7 Jun 2018 10:54:05 -0700 (PDT)
In-Reply-To: <CAH3CpToDn9eaKJpyg73VvEPj0Dxe9d9uxVXBEfHBQkCX_Rx4iQ@mail.gmail.com>
References: <CAH3CpToDn9eaKJpyg73VvEPj0Dxe9d9uxVXBEfHBQkCX_Rx4iQ@mail.gmail.com>
From: Nancy Yuen <yuenn@google.com>
Date: Thu, 7 Jun 2018 10:54:05 -0700
Message-ID: <CADfYTpEGFx0D5DvtQgkqrvPZbXi9QSq7OYNAu8hySWXrJXGFVA@mail.gmail.com>
Subject: Re: OpenBMC Fix-It
To: Jayashankar Padath <jayashankarpadath@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000093bea4056e10fa46"
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
X-List-Received-Date: Thu, 07 Jun 2018 17:54:51 -0000

--00000000000093bea4056e10fa46
Content-Type: text/plain; charset="UTF-8"

Hi Jayashankar,

That's great!  Check out fix it ideas on this spreadsheet
<https://drive.google.com/open?id=1S8h68UPVTh3Fc79P6Az-95JEFiGesTce3M--y0IDLaA>.
Feel free to add other ideas there.  See the guidelines I posted here
<https://lists.ozlabs.org/pipermail/openbmc/2018-June/011963.html>.

----------
Nancy

On Thu, Jun 7, 2018 at 9:22 AM, Jayashankar Padath <
jayashankarpadath@gmail.com> wrote:

> Hi Nancy,
>
> Please count me in.
>
> Thanks and Best Regards,
> Jayashankar
>
> From:   Nancy Yuen <yuenn at google.com>
> To:     OpenBMC Maillist <openbmc at lists.ozlabs.org>
> Date:   05/09/2018 01:00 AM
> Subject:        OpenBMC Fix-It
> Sent by:        "openbmc"
> <openbmc-bounces+ngorugan=in.ibm.com at lists.ozlabs.org>
>
>
>
> Please join my team for an OpenBMC  community "fix-it" event in June!
>
> My team is devoting the week of 6/11/-15 to a Google OpenBMC "fix it" as
> part of a larger fix-it initiative. OpenBMC is a large part of our project
> so I'd like to spend part of the week on a fix-it on OpenBMC.
>
> I propose to have the fix it on Tues and Wed 6/12 & 6/13.  We could set up
> an IRC channel for the fix it where everyone participating would hang out
> for the day.  We could pick one or two areas to focus on for those days,
> put together a list of things to "fix" in those areas ahead of time.  On
> the day, we all tackle things on the list (or something not on the list),
> discuss over IRC and do code reviews.  Inevitably, people have meetings or
> things they can't get out of, but if you can be available for most of the
> day, that would be enough!
>
> Anyone interested in participating?
>
> ----------
> Nancy
>

--00000000000093bea4056e10fa46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font size=3D"4">Hi Jayashankar,<br></font><div><font size=
=3D"4"><br></font></div><div><font size=3D"4">That&#39;s great!=C2=A0 Check=
 out fix it ideas on this=C2=A0<a href=3D"https://drive.google.com/open?id=
=3D1S8h68UPVTh3Fc79P6Az-95JEFiGesTce3M--y0IDLaA" target=3D"_blank" style=3D=
"color:rgb(17,85,204);background-color:rgb(255,255,255)">spreadsheet</a>.=
=C2=A0 Feel free to add other ideas there.=C2=A0 See the guidelines I poste=
d <a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2018-June/011963.ht=
ml">here</a>.</font></div></div><div class=3D"gmail_extra"><br clear=3D"all=
"><div><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">--=
--------<br>Nancy</div></div>
<br><div class=3D"gmail_quote">On Thu, Jun 7, 2018 at 9:22 AM, Jayashankar =
Padath <span dir=3D"ltr">&lt;<a href=3D"mailto:jayashankarpadath@gmail.com"=
 target=3D"_blank">jayashankarpadath@gmail.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Hi Nancy,</div><div><br><=
/div><div>Please count me in.</div><div><br></div><div>Thanks and Best Rega=
rds,</div><div>Jayashankar</div><div><br></div><div>From:=C2=A0 =C2=A0Nancy=
 Yuen &lt;yuenn at <a href=3D"http://google.com" target=3D"_blank">google.c=
om</a>&gt;</div><div>To:=C2=A0 =C2=A0 =C2=A0OpenBMC Maillist &lt;openbmc at=
 <a href=3D"http://lists.ozlabs.org" target=3D"_blank">lists.ozlabs.org</a>=
&gt;</div><div>Date:=C2=A0 =C2=A005/09/2018 01:00 AM</div><div>Subject:=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 OpenBMC Fix-It</div><div>Sent by:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;openbmc&quot;=C2=A0</div><div>&lt;openbmc-bounces+ngorugan=
=3D<a href=3D"http://in.ibm.com" target=3D"_blank">in.<wbr>ibm.com</a> at <=
a href=3D"http://lists.ozlabs.org" target=3D"_blank">lists.ozlabs.org</a>&g=
t;</div><div><br></div><div><br></div><div><br></div><div>Please join my te=
am for an OpenBMC=C2=A0 community &quot;fix-it&quot; event in June!</div><d=
iv><br></div><div>My team is devoting the week of 6/11/-15 to a Google Open=
BMC &quot;fix it&quot; as=C2=A0</div><div>part of a larger fix-it initiativ=
e. OpenBMC is a large part of our project=C2=A0</div><div>so I&#39;d like t=
o spend part of the week on a fix-it on OpenBMC.</div><div><br></div><div>I=
 propose to have the fix it on Tues and Wed 6/12 &amp; 6/13.=C2=A0 We could=
 set up=C2=A0</div><div>an IRC channel for the fix it where everyone partic=
ipating would hang out=C2=A0</div><div>for the day.=C2=A0 We could pick one=
 or two areas to focus on for those days,=C2=A0</div><div>put together a li=
st of things to &quot;fix&quot; in those areas ahead of time.=C2=A0 On=C2=
=A0</div><div>the day, we all tackle things on the list (or something not o=
n the list),=C2=A0</div><div>discuss over IRC and do code reviews.=C2=A0 In=
evitably, people have meetings or=C2=A0</div><div>things they can&#39;t get=
 out of, but if you can be available for most of the=C2=A0</div><div>day, t=
hat would be enough!</div><div><br></div><div>Anyone interested in particip=
ating?</div><div><br></div><div>----------</div><div>Nancy</div></div>
</blockquote></div><br></div>

--00000000000093bea4056e10fa46--
