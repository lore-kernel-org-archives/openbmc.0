Return-Path: <brendanhiggins@google.com>
Received: from mail-ua0-x232.google.com (mail-ua0-x232.google.com
 [IPv6:2607:f8b0:400c:c08::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7qNX6pFRzDvLj
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 11:53:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=isIfEEZn; 
 dkim-atps=neutral
Received: by mail-ua0-x232.google.com with SMTP id 20so609119uak.0
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 17:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=xA5TXJFHH65tmI2YJcfCce2OLVTaxDMRniuD6iH2QmA=;
 b=isIfEEZnOYT5pygYb6NTPpMZ1D+pNOk6IfLPrrhIgCqsqU/i9WL4+8ZvDVHGMhErLR
 VY68QJ6P/YwvZNuKyRxXS8H9BnMULYePiwhhTzX+MSgSybX1bxhUIHrsgCT+enzryuIX
 W5EJo9CoJfZJImiq1DZrG+mY2GFUOsVu/Ei1x17K4f6roLobSCC6T3bLbNxJWcLr0/+q
 rL+TEneOkFYuj1peK7Twf6hlMY9nRv4JMchIyOZeo8nOmH0qYYyKO2moXMDu9DRsnO9b
 z5DPkgQfgR1rdT9q7x+EQaWfRwLpAlhpbKY94XulH8OLueXPotVYMPn5++geZO6u9ZJB
 OhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=xA5TXJFHH65tmI2YJcfCce2OLVTaxDMRniuD6iH2QmA=;
 b=WQ2dAgqJeMbfUIIzTqzFaFD2NaXGJcnnzs03/zvUXQGnOSL364KA1VgG7y2ovGR14+
 6s5ZGKeN7SqeUfivylq88dD+33K1INFX9Re1+bc1+OPxr9jhcdAYJG3JMM7MusQFfzGb
 3jwBVGqZXL/auaLCo3LVwzQuIwQxHtJ/A53nnCUKOHwuYNagGMDOacwV9hml/PsRREGP
 aDYska4FydnBzEqZ7da1cetA8OdwqgObHoyuHL05tW7d6W7iBcPKNm5Pvmw4qa5q8ffG
 MdJNhvo4d2zBAAZcXxT9hCIdJUHD9nTEwi1S/jAxh/rOWlLI+D0lqCqh8lB6u17DUoIS
 vtbQ==
X-Gm-Message-State: ABUngvcOgbwRqfjnuiWx6cKS4nKNBBXckzEwuSfSdpYdF6VsEJVsC7YJE4VyPqxHR3GgsH2uiYAPxSowX5xd8k8t
X-Received: by 10.176.68.134 with SMTP id n6mr666076uan.160.1478048025206;
 Tue, 01 Nov 2016 17:53:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.64.36 with HTTP; Tue, 1 Nov 2016 17:53:44 -0700 (PDT)
In-Reply-To: <CAFd5g47LDkSS2g62NTTsXHMyDkwERK9CF=5xaO8Ww9sTvwiGRQ@mail.gmail.com>
References: <CAFd5g47LDkSS2g62NTTsXHMyDkwERK9CF=5xaO8Ww9sTvwiGRQ@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 1 Nov 2016 17:53:44 -0700
Message-ID: <CAFd5g44ro35Wi4-tJK65nucXWoA6n1fxvHAFKXeRZisqH=KHbQ@mail.gmail.com>
Subject: Re: C++ Feature Whitelist/Blacklist
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c05ce1881e43c054046df07
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
X-List-Received-Date: Wed, 02 Nov 2016 00:53:49 -0000

--94eb2c05ce1881e43c054046df07
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Following up with what I think the whitelist/blacklist should be:

Blacklist:

    * Variables of class type with static storage duration (including
constants),
      plain old data types (POD) are allowed
        - Main reason for this is that it is hard to keep track of when
these
          variables get initialized
    * Implicit conversion constructors and operators
        - Makes code confusing and difficult to debug
    * Multiple Inheritance (unless at most one of the parent classes is an
      interface i.e. only has pure virtual methods)
        - Detracts from readability
    * Non-const-non-r-value references
        - Use of const references and r-value references are encouraged
        - For non-const-non-r-value-references use pointers
        - Use where required or needed to maintain consistency with the STL
is
          allowed
    * Exceptions
        - Functions have to explicitly opt out of exceptions with noexcept,
          cleaner to assume no function throws exceptions
        - No way to force exception handling (forcing handling of status
objects
          is possible with the warn_unused_result attributes supported by
gcc
          and clang).
        - Exceptions are not typed
        - Does not play nice with legacy code
        - We are interested in porting existing code to OpenBMC most of
which is
          not exception safe

Other considerations:
    * Doing Work in Constructors
        - Avoid virtual method calls in constructors, and avoid
initialization
          that can fail if you can't signal an error.
        - Don=E2=80=99t throw exceptions in constructors or destructors
        - Generally, anything that can fail should be kept out of
constructors
            - Maybe a separate Init function

Again, the above is by no means exhaustive; it only lists features which we
propose should be completely banned.

On the other hand, we do not think restrictions should be placed on using
virtual
functions.

Also, we do not feel strongly about stream operators, but would in general
object to using it as the primary grounds to not use a particular library,
as an
example.

(sorry about any html in the previous email)

--94eb2c05ce1881e43c054046df07
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Following up with what I think the whitelist/blacklis=
t should be:</div><div><br></div><div>Blacklist:</div><div><br></div><div>=
=C2=A0 =C2=A0 * Variables of class type with static storage duration (inclu=
ding constants),</div><div>=C2=A0 =C2=A0 =C2=A0 plain old data types (POD) =
are allowed</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Main reason for this is=
 that it is hard to keep track of when these</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 variables get initialized</div><div>=C2=A0 =C2=A0 * Implicit=
 conversion constructors and operators</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 - Makes code confusing and difficult to debug</div><div>=C2=A0 =C2=A0 *=
 Multiple Inheritance (unless at most one of the parent classes is an</div>=
<div>=C2=A0 =C2=A0 =C2=A0 interface i.e. only has pure virtual methods)</di=
v><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Detracts from readability</div><div>=
=C2=A0 =C2=A0 * Non-const-non-r-value references</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 - Use of const references and r-value references are encourag=
ed</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - For non-const-non-r-value-refere=
nces use pointers</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Use where require=
d or needed to maintain consistency with the STL is</div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 allowed</div><div>=C2=A0 =C2=A0 * Exceptions</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Functions have to explicitly opt out of exc=
eptions with noexcept,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cleaner=
 to assume no function throws exceptions</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 - No way to force exception handling (forcing handling of status object=
s</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is possible with the warn_un=
used_result attributes supported by gcc</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 and clang).</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Exceptions a=
re not typed</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Does not play nice wit=
h legacy code</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - We are interested in =
porting existing code to OpenBMC most of which is</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 not exception safe</div><div><br></div><div>Other cons=
iderations:</div><div>=C2=A0 =C2=A0 * Doing Work in Constructors</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Avoid virtual method calls in constructors, a=
nd avoid initialization</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 that c=
an fail if you can&#39;t signal an error.</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 - Don=E2=80=99t throw exceptions in constructors or destructors</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Generally, anything that can fail shoul=
d be kept out of constructors</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 - Maybe a separate Init function</div><div><br></div><div>Again, the=
 above is by no means exhaustive; it only lists features which we</div><div=
>propose should be completely banned.</div><div><br></div><div>On the other=
 hand, we do not think restrictions should be placed on using virtual</div>=
<div>functions.</div><div><br></div><div>Also, we do not feel strongly abou=
t stream operators, but would in general</div><div>object to using it as th=
e primary grounds to not use a particular library, as an</div><div>example.=
</div><div><br></div><div>(sorry about any html in the previous email)</div=
></div>

--94eb2c05ce1881e43c054046df07--
