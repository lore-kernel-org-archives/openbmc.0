Return-Path: <yuenn@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22c; helo=mail-ua0-x22c.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="T28j0ZeN"; 
 dkim-atps=neutral
Received: from mail-ua0-x22c.google.com (mail-ua0-x22c.google.com
 [IPv6:2607:f8b0:400c:c08::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yd9M42F0dzDqvq
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 05:51:27 +1100 (AEDT)
Received: by mail-ua0-x22c.google.com with SMTP id 108so8571uaf.2
 for <openbmc@lists.ozlabs.org>; Thu, 16 Nov 2017 10:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=u4hljZVP/TpTS9YuRMksoHH+kpPndqM+PLE0q9ku8sU=;
 b=T28j0ZeNmmbme0ljctiiDKSe4aC+MMe5pfJeu3w+zStloqSh2+IWbKGA/sy6T2HUcP
 ae5XjU2ISc2JyUJqTjJpl1VXgFYVMCT4bojbCs7XBDTyiTMOjUBC9wlhLt0PO8j8I7EM
 sLkz/su1dI84zrVUgz+31h9qW9tOlvvTIVRaHqu7ERQ9K/VNi+LH6/9xWRQkHv0HMfGV
 U5bTw740kyIxD14yjXLCzjLZf35a7V+4YszevEaYQEpU93WeDn0Rfn/hxi+ln2FI/ky9
 avgS54RYvHki6n3ffA5lQ4AkHOsHM5QVgc6Sh3r2ssE9O/9Ct7mPAopioFIeA6CUUIY8
 2Q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=u4hljZVP/TpTS9YuRMksoHH+kpPndqM+PLE0q9ku8sU=;
 b=iPxFBsS0O4Wv7fAMR+BrD0Xap1eAzS5WOKL2h2A4GIlP2wtcl3yKWBOZ3Ajhe4BJ6V
 /yfB5kG0dnWxFrl2CjpZKhlZOzHrjbtUANx2iuSAePykD55+ygaC+m+VdVj9wPH7EAQi
 ufp/TSxr4R9+YE9bY2uLx3vVAIRqiKAR/EAmXSUtj/jW1qRvuKhep8VGyJgxMN+yHmxF
 PSs3PBR7/vHonPVoW5ZUjn2pWJrH1O4RlS4xXs3LbcQaYonNkGYe5HC4rrQlXFwtjq/1
 2W/LKgzxl8/sXhWKXwzMisuPw45z7AeY/LnYMQaK1zYivSUD3wZVXilnTpXfwySdaXsT
 9YYA==
X-Gm-Message-State: AJaThX5QkKLucD15z2Y5PNXVi+6rW5YiR5ka+86fc9T5OJJfvbmqtHnZ
 1hqIUMXoNnGlRwHmqQnAyOu08P4uv/Ub0PihbVWRJQ==
X-Google-Smtp-Source: AGs4zMbM+pqJeywhvYUPAwDTnD1iAUf1UY3rSfJ+c+0df2Dot727qRMkceHcTtGlPGQJMRbFwMOnrrMTK1CNpP4a6Qg=
X-Received: by 10.159.37.69 with SMTP id 63mr2139177uaz.12.1510858285030; Thu,
 16 Nov 2017 10:51:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.178.66 with HTTP; Thu, 16 Nov 2017 10:50:44 -0800 (PST)
In-Reply-To: <4effb314-f8c7-4f2d-74b4-2f097d050397@linux.vnet.ibm.com>
References: <7E9441B1E5EFFD4681F54958E82169932EAF421E@ORSMSX105.amr.corp.intel.com>
 <C3C38226-E41A-44DB-BFA9-2EB06E57AEE7@fuzziesquirrel.com>
 <4effb314-f8c7-4f2d-74b4-2f097d050397@linux.vnet.ibm.com>
From: Nancy Yuen <yuenn@google.com>
Date: Thu, 16 Nov 2017 10:50:44 -0800
Message-ID: <CADfYTpFg-=tr5FCs-5iJk7vP4joWh68+x8E_giJ_X6a9Dik94w@mail.gmail.com>
Subject: Re: Use of Boost in OpenBMC
To: vishwa <vishwa@linux.vnet.ibm.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Tanous,
 Ed" <ed.tanous@intel.com>, OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="94eb2c0476c6632cc6055e1e1b4a"
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
X-List-Received-Date: Thu, 16 Nov 2017 18:51:29 -0000

--94eb2c0476c6632cc6055e1e1b4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Google doesn't use Boost internally and in general have no objections to
this.

My biggest concern is how it might impact our servers with limited BMC
memory (128MB).  It's already been an issue tweaking OpenBMC to run on it
without memory issues, and it's been a constant battle.  It doesn't always
fail gracefully either.  Maybe the answer is to specify minimum
requirements for running OpenBMC, such as 512MB RAM.

----------
Nancy

On Wed, Nov 15, 2017 at 4:33 AM, vishwa <vishwa@linux.vnet.ibm.com> wrote:

> I like the proposal of using Boost when it makes more sense.
>
> As an example, In one of the recent code development, I was looking for
> string tokenizer support and could not see that in C++ and Boost had a go=
od
> support of that. I ended up using strtok_r for that development.
>
> !! Vishwa !!
>
>
> On 11/14/2017 05:49 AM, Brad Bishop wrote:
>
>> On Nov 13, 2017, at 3:36 PM, Tanous, Ed <ed.tanous@intel.com> wrote:
>>>
>>> All,
>>>   I=E2=80=99d like to start a discussion around the thoughts about the =
inclusion
>>> of Boost headers.  I=E2=80=99ve heard before that it=E2=80=99s a contro=
versial subject.
>>>   For record, here=E2=80=99s what the style guide currently says:
>>>   Boost, QT, etc.
>>>   If you give a mouse a cookie...
>>> While, in general, we appreciate reuse over rewriting, we are not using
>>> large general-purpose libraries such as Boost. Due to 'Code should be
>>> performant: code size' we do not want to utilize the entirety of Boost.=
 If
>>> approval is given for a single part of a large general-purpose library =
it
>>> becomes much more difficult to disapprove of another part of the librar=
y.
>>> Before long, we may have effectively approved of the entire library.
>>>   We do look for single feature libraries that can be used in place of
>>> our own implementations.
>>>   I=E2=80=99d like to start a discussion around challenging a core tena=
nt of
>>> this statement, that approval of one part of the library makes it diffi=
cult
>>> to disapprove other parts.  I would argue that the overhead of making a
>>> library available, while still rejecting improper use that effects the
>>> project, is much lower than rewriting and debugging equivalent =E2=80=
=9Cnew=E2=80=9D
>>> components for openbmc.
>>>   I would like to update the coding style conventions with the below
>>> verbiage in regards to boost.
>>>   Boost
>>>   Use of boost is allowed, under the following circumstances:
>>> 1.       Use is done as a header-only library.  This allows unused
>>> functions and methods to be removed by the compiler at link time, and
>>> avoids adding large amounts of overhead and flash usage.
>>> 2.       Implementers should include the lowest level header required t=
o
>>> solve the problem at hand.  This allows uses to be found and moved forw=
ard
>>> when new standards are available, as well as reduce compile times, and
>>> decrease the possibility of accidental use.  (ie, #include
>>> <boost/container/flat_map.hpp>  not #include <boost/container.hpp>)
>>> 3.       The module used should not have an equivalent in the std
>>> namespace that meets the same requirements for implementation or clarit=
y:
>>> For example, std::chrono should be preferred over boost::chrono.
>>> std::array over boost::array.
>>> 4.       Use does not conflict with any of the core tenants of this
>>> coding standard (clarity, modern practices, or performance)
>>>     Some examples of libraries in boost that (I believe) would be usefu=
l
>>> for openbmc:
>>> Boost containers (flat_map, flat_set, ect)
>>>                  Among other things, this module provides standards
>>> compliant containers backed by a sorted vector.  This allows a reduced
>>> memory footprint over using std::set or std::map, and in certain use ca=
ses
>>> can be more performant, or lower memory usage.
>>>   Boost asio
>>>                  This module provides C++ level networking, sockets,
>>> SSL, and asynchronous frameworks that are not available in C++ today.  =
It
>>> has been proposed as a Networking TS to the C++ standards committee.
>>> http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/n4656.pdf  This
>>> use would likely align us with moving toward compliant standards in the
>>> future.
>>>   Boost string
>>>                  Implementations of common string operations not presen=
t
>>> in the standard library.  String join, split, case insensitive compare =
ect.
>>>     I=E2=80=99d like to see what other people opinions are on the matte=
r, and
>>> see if we can reach a consensus.
>>>   Thanks,
>>>   -Ed
>>>
>>
>> This has my support.  I think (hope?) we can rely on a rigorous peer
>> review process to flush out and raise awareness of any questionable usag=
e.
>>
>> Would it make sense to have another bullet point documented somewhere to
>> this effect?
>>
>> "If you are considering a boost component, it is suggested you outline
>> your intended usage publicly (the mailing list) to avoid wasted effort i=
f
>> the community does not feel the specific usage is appropriate."
>>
>> -brad
>>
>>
>

--94eb2c0476c6632cc6055e1e1b4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Google doesn&#39;t use Boost internally and in general hav=
e no objections to this.<div><br></div><div>My biggest concern is how it mi=
ght impact our servers with limited BMC memory (128MB).=C2=A0 It&#39;s alre=
ady been an issue tweaking OpenBMC to run on it without memory issues, and =
it&#39;s been a constant battle.=C2=A0 It doesn&#39;t always fail gracefull=
y either.=C2=A0 Maybe the answer is to specify minimum requirements for run=
ning OpenBMC, such as 512MB RAM.</div></div><div class=3D"gmail_extra"><br =
clear=3D"all"><div><div class=3D"gmail_signature" data-smartmail=3D"gmail_s=
ignature">----------<br>Nancy</div></div>
<br><div class=3D"gmail_quote">On Wed, Nov 15, 2017 at 4:33 AM, vishwa <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:vishwa@linux.vnet.ibm.com" target=3D"_b=
lank">vishwa@linux.vnet.ibm.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">I like the proposal of using Boost when it makes more sense.<=
br>
<br>
As an example, In one of the recent code development, I was looking for str=
ing tokenizer support and could not see that in C++ and Boost had a good su=
pport of that. I ended up using strtok_r for that development.<span class=
=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
!! Vishwa !!</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 11/14/2017 05:49 AM, Brad Bishop wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On Nov 13, 2017, at 3:36 PM, Tanous, Ed &lt;<a href=3D"mailto:ed.tanous@int=
el.com" target=3D"_blank">ed.tanous@intel.com</a>&gt; wrote:<br>
<br>
All,<br>
=C2=A0 I=E2=80=99d like to start a discussion around the thoughts about the=
 inclusion of Boost headers.=C2=A0 I=E2=80=99ve heard before that it=E2=80=
=99s a controversial subject.<br>
=C2=A0 For record, here=E2=80=99s what the style guide currently says:<br>
=C2=A0 Boost, QT, etc.<br>
=C2=A0 If you give a mouse a cookie...<br>
While, in general, we appreciate reuse over rewriting, we are not using lar=
ge general-purpose libraries such as Boost. Due to &#39;Code should be perf=
ormant: code size&#39; we do not want to utilize the entirety of Boost. If =
approval is given for a single part of a large general-purpose library it b=
ecomes much more difficult to disapprove of another part of the library. Be=
fore long, we may have effectively approved of the entire library.<br>
=C2=A0 We do look for single feature libraries that can be used in place of=
 our own implementations.<br>
=C2=A0 I=E2=80=99d like to start a discussion around challenging a core ten=
ant of this statement, that approval of one part of the library makes it di=
fficult to disapprove other parts.=C2=A0 I would argue that the overhead of=
 making a library available, while still rejecting improper use that effect=
s the project, is much lower than rewriting and debugging equivalent =E2=80=
=9Cnew=E2=80=9D components for openbmc.<br>
=C2=A0 I would like to update the coding style conventions with the below v=
erbiage in regards to boost.<br>
=C2=A0 Boost<br>
=C2=A0 Use of boost is allowed, under the following circumstances:<br>
1.=C2=A0 =C2=A0 =C2=A0 =C2=A0Use is done as a header-only library.=C2=A0 Th=
is allows unused functions and methods to be removed by the compiler at lin=
k time, and avoids adding large amounts of overhead and flash usage.<br>
2.=C2=A0 =C2=A0 =C2=A0 =C2=A0Implementers should include the lowest level h=
eader required to solve the problem at hand.=C2=A0 This allows uses to be f=
ound and moved forward when new standards are available, as well as reduce =
compile times, and decrease the possibility of accidental use.=C2=A0 (ie, #=
include &lt;boost/container/flat_map.hpp&gt;<wbr>=C2=A0 not #include &lt;bo=
ost/container.hpp&gt;)<br>
3.=C2=A0 =C2=A0 =C2=A0 =C2=A0The module used should not have an equivalent =
in the std namespace that meets the same requirements for implementation or=
 clarity:=C2=A0 For example, std::chrono should be preferred over boost::ch=
rono.=C2=A0 std::array over boost::array.<br>
4.=C2=A0 =C2=A0 =C2=A0 =C2=A0Use does not conflict with any of the core ten=
ants of this coding standard (clarity, modern practices, or performance)<br=
>
=C2=A0 =C2=A0 Some examples of libraries in boost that (I believe) would be=
 useful for openbmc:<br>
Boost containers (flat_map, flat_set, ect)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Among other t=
hings, this module provides standards compliant containers backed by a sort=
ed vector.=C2=A0 This allows a reduced memory footprint over using std::set=
 or std::map, and in certain use cases can be more performant, or lower mem=
ory usage.<br>
=C2=A0 Boost asio<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This module p=
rovides C++ level networking, sockets, SSL, and asynchronous frameworks tha=
t are not available in C++ today.=C2=A0 It has been proposed as a Networkin=
g TS to the C++ standards committee.=C2=A0 <a href=3D"http://www.open-std.o=
rg/jtc1/sc22/wg21/docs/papers/2017/n4656.pdf" rel=3D"noreferrer" target=3D"=
_blank">http://www.open-std.org/jtc1/s<wbr>c22/wg21/docs/papers/2017/n465<w=
br>6.pdf</a>=C2=A0 This use would likely align us with moving toward compli=
ant standards in the future.<br>
=C2=A0 Boost string<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Implementatio=
ns of common string operations not present in the standard library.=C2=A0 S=
tring join, split, case insensitive compare ect.<br>
=C2=A0 =C2=A0 I=E2=80=99d like to see what other people opinions are on the=
 matter, and see if we can reach a consensus.<br>
=C2=A0 Thanks,<br>
=C2=A0 -Ed<br>
</blockquote>
<br>
This has my support.=C2=A0 I think (hope?) we can rely on a rigorous peer r=
eview process to flush out and raise awareness of any questionable usage.<b=
r>
<br>
Would it make sense to have another bullet point documented somewhere to th=
is effect?<br>
<br>
&quot;If you are considering a boost component, it is suggested you outline=
 your intended usage publicly (the mailing list) to avoid wasted effort if =
the community does not feel the specific usage is appropriate.&quot;<br>
<br>
-brad<br>
<br>
</blockquote>
<br>
</div></div></blockquote></div><br></div>

--94eb2c0476c6632cc6055e1e1b4a--
