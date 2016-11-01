Return-Path: <brendanhiggins@google.com>
Received: from mail-vk0-x235.google.com (mail-vk0-x235.google.com
 [IPv6:2607:f8b0:400c:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7n484F35zDvNT
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 10:09:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Pu3Uj1Ds; 
 dkim-atps=neutral
Received: by mail-vk0-x235.google.com with SMTP id p9so40398270vkd.3
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 16:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=q1IJw2oswdVJXGb88wv7eDp06Xm9VtNlll8WsMdmg+E=;
 b=Pu3Uj1DsrP+oUWpdR6KRW0HvRxyfjVKEDZCOL/pBF2d+oBpgvQofZCMe6Q1fYf+2he
 ySATep4351ve60UU4yjLyPjfYY9UTtnbc2+HYeXktIB0bWmZzS6kJr4gy2bPijgeFf7w
 cAkhQ8KOtGfyDf+4DrqZxPDC5fVNISsLKJNGv8N90oIdJ9DENabZ+whUH6Nk6qznN/MM
 7Qqu4tpgsUeo/pJgRZ0G2oISbkz2zTCaPovGJwFgvGHbZMnll0UBINJFihUnJyMKu/oH
 WA0A/vLpiT9cEBes3HOFvWfVt9E6WmVTSFDelR2wHKzvP4HfBEORLoybsBI9csmrr9pj
 GJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=q1IJw2oswdVJXGb88wv7eDp06Xm9VtNlll8WsMdmg+E=;
 b=GCbjzrINFKdCuCXb9LFLJOObYL/nFnq9nGL7W978iuJsNZFsoGa7KDJfAFt87nl5mW
 smnUXyHlS5QECRRgfY4uviuLcYp7863UxJe7mBVF6NXwINg7JdEbylXFTfWkSJjB63RJ
 cGY1sZ/200T68J7V7IYhy1RLiRLo3NEZ9o0dgTwc3SN747IJPYwb9T1Skth8umgYwSeb
 j0Tpx+ZhA5yn3G4s91L7gxQNGa7U3srUInUkFvFkk3aXIf6NGH3ws1Dkb/57DxijXzR8
 VtGpJ9uD83rVl4opV7pKvMGwct+4AnZMipte9EQGHKKMJ/uAY79Tof4+PjfbFJY9I6Gu
 tOIQ==
X-Gm-Message-State: ABUngvf86SN9q18CtvIMiNVYCph4av2lxx7+z5E5th/MqP8cUR0f3YNZLoU27AEr4US5mWQUG3DBo4ZPYpVVG9fy
X-Received: by 10.31.156.205 with SMTP id f196mr304361vke.45.1478041765815;
 Tue, 01 Nov 2016 16:09:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.53.80 with HTTP; Tue, 1 Nov 2016 16:09:25 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 1 Nov 2016 16:09:25 -0700
Message-ID: <CAFd5g47LDkSS2g62NTTsXHMyDkwERK9CF=5xaO8Ww9sTvwiGRQ@mail.gmail.com>
Subject: C++ Feature Whitelist/Blacklist
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a113d24ba6a691f0540456a85
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
X-List-Received-Date: Tue, 01 Nov 2016 23:09:29 -0000

--001a113d24ba6a691f0540456a85
Content-Type: text/plain; charset=UTF-8

At the OpenBMC meetup last week we discussed creating an authoritative C++
style guide as well as a feature whitelist/blacklist. I am going to try to
get an early style guide out fairly soonish (this week or next) that we can
discuss, but while I do that I would like to bring up the topic of
explicitly supported/unsupported features to discuss on the mailing list.
First off, I think it is something that would have much more discussion and
stronger opinions that would be convenient on gerrit/I would like to start
the discussion earlier. I also think that there will probably only be a few
things on that list, so discussion via email should not be overly
burdensome.

At the meeting Patrick brought up two features to blacklist:

   - Streams and stream style operators.
   - Virtual functions/runtime polymorphism

In the case of virtual functions, I get the sense that the use is more
discouraged rather than completely forbidden.

For the whitelist, the only current candidate is:

   - exceptions

In general, I suppose the notion of a whitelist is rather silly, but
exceptions have historically been a controversial feature of C++, so I
figured it best to explicitly call out.

I do not want to mischaracterize the arguments in favor of this proposal;
it also does not seem fair to offer up a viewpoint with little explanation
and critique it in the same breath, so instead I will post a follow up
email with what I propose for the whitelist/blacklist.

Cheers

--001a113d24ba6a691f0540456a85
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">At the OpenBMC meetup last week we discussed creating an a=
uthoritative C++ style guide as well as a feature whitelist/blacklist. I am=
 going to try to get an early style guide out fairly soonish (this week or =
next) that we can discuss, but while I do that I would like to bring up the=
 topic of explicitly supported/unsupported features to discuss on the maili=
ng list. First off, I think it is something that would have much more discu=
ssion and stronger opinions that would be convenient on gerrit/I would like=
 to start the discussion earlier. I also think that there will probably onl=
y be a few things on that list, so discussion via email should not be overl=
y burdensome.<div><br></div><div>At the meeting Patrick brought up two feat=
ures to blacklist:</div><div><ul><li>Streams and stream style operators.</l=
i><li>Virtual functions/runtime polymorphism</li></ul>In the case of virtua=
l functions, I get the sense that the use is more discouraged rather than c=
ompletely forbidden.</div><div><br></div><div>For the whitelist, the only c=
urrent candidate is:</div><div><ul><li>exceptions</li></ul>In general, I su=
ppose the notion of a whitelist is rather silly, but exceptions have histor=
ically been a controversial feature of C++, so I figured it best to explici=
tly call out.</div><div><br></div><div>I do not want to mischaracterize the=
 arguments in favor of this proposal; it also does not seem fair to offer u=
p a viewpoint with little explanation and critique it in the same breath, s=
o instead I will post a follow up email with what I propose for the whiteli=
st/blacklist.</div><div><br></div><div>Cheers</div></div>

--001a113d24ba6a691f0540456a85--
