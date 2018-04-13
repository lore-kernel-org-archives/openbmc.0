Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22d; helo=mail-ua0-x22d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="beeANPdm"; 
 dkim-atps=neutral
Received: from mail-ua0-x22d.google.com (mail-ua0-x22d.google.com
 [IPv6:2607:f8b0:400c:c08::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40N2f02kzHzF1Rt
 for <openbmc@lists.ozlabs.org>; Sat, 14 Apr 2018 02:04:23 +1000 (AEST)
Received: by mail-ua0-x22d.google.com with SMTP id j18so6088719uae.12
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 09:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YNK1zAvJhVkgsD6VldIuidlsQaab2HddbYWyWk/edxc=;
 b=beeANPdmD0XeDuGBOFDHatu6oFGgKACoJDz4LTdOOoOqe5p2PJchOqZn6HYmGPvXIx
 kM2WQnMZGnWeaFIgAnFmu0z2/ocaXs5ZHFK05430s1YOxlgVS9SmmQMFrJD3lBqxEyqb
 qOSNLHrJktcrZbdklgsW8wJ2w6pBcUwxvUmG6EKdMQEUV2uLLx8c57dyl5eOqOoR7aQe
 yl27jjhRSi4RkKaYCu9357fng9QmEWef9Gx0G7X/c8E7HSmnukJd2v7XCEF8DcRVXXHb
 QmPFdyu0tpkl8qS3zP0hd5A7yNAw1Cjs+k+yN0FTLn+CMiNG7vsVrRlAowx3KM5CyHge
 hZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YNK1zAvJhVkgsD6VldIuidlsQaab2HddbYWyWk/edxc=;
 b=s/JSIQWQRJVpeHbvVI9WMuN2NpxTN43BQ3iLurzOyHwaADb8mnD90kUfjKVx6KCd/q
 pE2wqWL/EDVBLYu3O8fjdUgfyXzNYMgteGtnccOq0c1Zq9gvHcC8HTTdrpgllT1ORZ83
 e8WeTws85qeidrkFFt+vYaAqyb3aSwBUfFORBVEByEBEocxNNFeOsMG41HS84vpR63nW
 OgQzHBNvgsH0JkptGFELsar39wnAm4ARyFyi76uMm7Z6QoRi7PFbTFF5kW5UYXrjksg2
 scnnTanYjjBxc/8b011Ql5OTqhChJ8lvLBqrfDUNlIQIiKdooZ/MLT/+cmNFlykqfKYy
 Qsqw==
X-Gm-Message-State: ALQs6tAU1xYCjmXEYM0PSF3/5c7RMrxC1nkdAm3yzxm5z12GWpTNkElc
 IJAYpx0v0UzhWJaSq8XJbR+TsBa0U2mEOX2OGNfBXQ==
X-Google-Smtp-Source: AIpwx4/YqhHv+bxCBNTI3V6Me/G3Kwj/Ac7p9MNNPBbNap5FHbH63a5ANoWhqg3M/ZFWEQV8cFYjysNl7amDYYZFuto=
X-Received: by 10.159.56.202 with SMTP id w10mr4364552uaf.147.1523635458346;
 Fri, 13 Apr 2018 09:04:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Fri, 13 Apr 2018 09:03:57 -0700 (PDT)
In-Reply-To: <A920519B-A2F5-44BB-80D5-73EC81827448@fuzziesquirrel.com>
References: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
 <1523591789.2710142.1336453024.5787B0DF@webmail.messagingengine.com>
 <A920519B-A2F5-44BB-80D5-73EC81827448@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 13 Apr 2018 09:03:57 -0700
Message-ID: <CAO=notx+WsxRbeGRPvLEOpfvZPkFQqmF8wx1A408s6inBk7zqQ@mail.gmail.com>
Subject: Re: YASL Request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Emily Shaffer <emilyshaffer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 13 Apr 2018 16:04:25 -0000

On Fri, Apr 13, 2018 at 8:21 AM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>> On Apr 12, 2018, at 11:56 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>>
>> Some advantages I've found to this technique are:
>>
>> * There's no reduction of readability in the code
>
> This.
>
>> * You get test binaries that you can run independent of your test framew=
ork, as there isn't really a test framework, just autotools running your te=
st binaries in parallel
>> * By extension, if you need to debug a failing test case, you can gdb th=
e test binary directly without needing to comprehend the side-effects of th=
e test framework on your test binary
>
> And this.
>
> Honestly these are my _real_ objections but I brought up runtime overhead=
 because
> that is not subjective.  I just don=E2=80=99t like how the direction we a=
re headed
> obfuscates things for developers that have a good understanding of standa=
rd libraries,
> tools, and language features (libc, libstd++, STL, GDB, etc...) and don=
=E2=80=99t have an
> understanding of the internals of GMock or the =E2=80=9Ctechniques" its u=
se drives into the
> code.  I expect there to be way more of the former (those up to speed on =
the standard
> libraries, tools, language features) than the latter (those comfortable w=
orking on
> a GMock inspired codebase).

I find a flaw in this logic that, because a developer would need to
learn something new, because as you say few people will be familiar
with gmock.  Every developer I've met tends to learn new things all
the time, and I specifically hadn't used c++ since 2004, and basically
learned it to contribute to OpenBMC, and I doubt I'd be an exception
to this.

>
> IMHO these concepts have a greater (positive) impact on the project overa=
ll than
> super-easy-unit-test writing.  I=E2=80=99d guess I=E2=80=99m in the minor=
ity, but hey=E2=80=A6I have to
> speak my mind right?  I can certainly relate to the opposing viewpoint.
