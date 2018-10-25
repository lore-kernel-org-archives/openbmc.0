Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ucGLyo/Y"; 
 dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42gth26q8kzF38h
 for <openbmc@lists.ozlabs.org>; Fri, 26 Oct 2018 04:01:38 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id p24-v6so4789717qtq.0
 for <openbmc@lists.ozlabs.org>; Thu, 25 Oct 2018 10:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=FvxhuzlJML095TcwoTi2OdVyb+fMeImcTqY1SgZGt8w=;
 b=ucGLyo/YstEi01J8rMfZuIoHrghQ4Jwr38HCo+kwESRyDqbuDu+B8yiKGw3KQM0/fn
 qdVhrw8pHDQB9c08WI1m3iqSky+v61MRWrxWZwRHJCxCK6b7Zx+yXVdJsvE2ZjQhpxab
 38ZYPmaXFe46zSDoxQP0R4TJewJpr10LUY+whsP+J3M+ZFpGrtr3k/3jlQVKYQT3JUAK
 Ge8XrE1SACQy9kqPLh0V0z2HYIMM02GqnA0+uFMRkQWSLqE5HwsDlE96mCyZqpasStLq
 PuE2V5i6/w7iHjxS6tIOW827ZIP55iVe7LsQa81wo6z45j6N9QnhUZrwJeJHK9lnIAKY
 Y4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FvxhuzlJML095TcwoTi2OdVyb+fMeImcTqY1SgZGt8w=;
 b=f3FCW80dwUz28qmoaxTX60CavKwyj+hyomEiZblxAyIHOhh6eRJerV+T4ZNMMdzx8M
 /1NYXGOfuPyNDfLi39irnUKDlyzYyorOfPwfAmOZvOIXi4r24J9J1daNI66+H515r84A
 pKsEeRd5eQcTPLl8Nh4zVQGWcAx3zwdFd77z1neb7injW+bNpjKgASKhBGevrUywISM3
 axAL5tFOhS741wWdvyDsOeZePNn/BuBF5IOuIL3MohpqbBuFAnzt+EdTfRhghZPHXz+E
 TIkXfQdqWVRY+xCmj4SgHXDxRff0O1gIy+CE8Vcfa/xe5xOBpbh6l9X9oNdcnBW51tV5
 ljZQ==
X-Gm-Message-State: AGRZ1gKbkPtcxHEqBS7X/DphbsNi3TcoCiEJiLtzs6c07JN90lrrUlX8
 KoTumU0Itf3Jpd2A6bjwr2z16ziDgxXfWzdi5ap18/Ocp4o=
X-Google-Smtp-Source: AJdET5fb05TuvEmncseame388Prasb6WTfkKagD6GjGZxenMF6/F371c1hvDCVRIT+oq8FrAkikjFMJGc68+S5re17o=
X-Received: by 2002:ac8:34af:: with SMTP id w44-v6mr29251qtb.125.1540486895229; 
 Thu, 25 Oct 2018 10:01:35 -0700 (PDT)
MIME-Version: 1.0
From: Emily Shaffer <emilyshaffer@google.com>
Date: Thu, 25 Oct 2018 10:01:22 -0700
Message-ID: <CAJoAoZkE0g5T1j8LciO2hBMXfen98BpcTHB-rkXgCTwMsVaJug@mail.gmail.com>
Subject: Weigh in - Prefixes for Globals and Class Members
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000002c5a2a0579108e3d"
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
X-List-Received-Date: Thu, 25 Oct 2018 17:01:40 -0000

--0000000000002c5a2a0579108e3d
Content-Type: text/plain; charset="UTF-8"

There was some discussion in IRC, but I wanted to make sure people who read
the maillist also got a chance to weigh in.

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/14712

This is a proposal to adjust the language of our C++ Style Guide to allow
repo maintainers to require or encourage prefixes based on variable scope:

```
constexpr int gValue;

class Foo {
  private:
    bool mFlag;
  public:
    void Bar() {
      int thing;
      if (mFlag && gValue < 0) {
        thing++;
      }
    }
}
```

The great thing about this is that you have a much stronger guarantee that
you won't end up with shadowed variables - it becomes almost impossible to
name your local in a way that collides with a larger-scoped variable you
forgot about.

That said, there's some question about how and whether to standardize
across all of OpenBMC. Renaming variables in all our repos would be a big
effort, and some maintainers might prefer different prefixes than others -
for example, canonical indicators for member variable include mFooBar,
m_fooBar, _fooBar, fooBar_,....

If you've got some strong opinions on the subject, come weigh in and help
us figure out the right language.

Personally, I just want the language to allow me to start enforcing
prefixes in repos I comaintain, without being overly prescriptive; if
you've got a different opinion or a better idea of phrasing, I wanna hear
it.

Emily

--0000000000002c5a2a0579108e3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There was some discussion in IRC, but I wanted to make sur=
e people who read the maillist also got a chance to weigh in.<div><br></div=
><div><a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/14712"=
>https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/14712</a><br></div><di=
v><br></div><div>This is a proposal to adjust the language of our C++ Style=
 Guide to allow repo maintainers to require or encourage prefixes based on =
variable scope:<br><br>```<br>constexpr int gValue;<br><br>class Foo {<br>=
=C2=A0 private:<br>=C2=A0 =C2=A0 bool mFlag;<br>=C2=A0 public:<br>=C2=A0 =
=C2=A0 void Bar() {<br>=C2=A0 =C2=A0 =C2=A0 int thing;<br>=C2=A0 =C2=A0 =C2=
=A0 if (mFlag &amp;&amp; gValue &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 th=
ing++;<br>=C2=A0 =C2=A0 =C2=A0 }</div><div>=C2=A0 =C2=A0 }</div><div>}<br>`=
``</div><div><br></div><div>The great thing about this is that you have a m=
uch stronger guarantee that you won&#39;t end up with shadowed variables - =
it becomes almost impossible to name your local in a way that collides with=
 a larger-scoped variable you forgot about.</div><div><br></div><div>That s=
aid, there&#39;s some question about how and whether to standardize across =
all of OpenBMC. Renaming variables in all our repos would be a big effort, =
and some maintainers might prefer different prefixes than others - for exam=
ple, canonical indicators for member variable include mFooBar, m_fooBar, _f=
ooBar, fooBar_,....</div><div><br></div><div>If you&#39;ve got some strong =
opinions on the subject, come weigh in and help us figure out the right lan=
guage.</div><div><br></div><div>Personally, I just want the language to all=
ow me to start enforcing prefixes in repos I comaintain, without being over=
ly prescriptive; if you&#39;ve got a different opinion or a better idea of =
phrasing, I wanna hear it.</div><div><br></div><div>Emily</div></div>

--0000000000002c5a2a0579108e3d--
