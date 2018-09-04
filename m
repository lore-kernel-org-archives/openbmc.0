Return-Path: <raj.khem@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.179; helo=mail-qk1-f179.google.com;
 envelope-from=raj.khem@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ok6Txo9J"; 
 dkim-atps=neutral
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 424bYg45qfzF35y
 for <openbmc@lists.ozlabs.org>; Wed,  5 Sep 2018 04:52:35 +1000 (AEST)
Received: by mail-qk1-f179.google.com with SMTP id f62-v6so1437456qke.2
 for <openbmc@lists.ozlabs.org>; Tue, 04 Sep 2018 11:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nMCIeAZYPngWrYAj5gaTgch+vdW1rv/KybiQAzKH2Zs=;
 b=Ok6Txo9JzG8ug4CQ6Y3pj1lBUORAIlRo4uB1qvMh53nLq46uwOQTtt4nqDTxVH4BgR
 C+rUyHCL2fd3TTVbNWSHROvkkKW5j44shdKQ2LeH6eSY/Q+jUweRiCSYAbqgIv5H4iZN
 go/Cc8uGoPYtWTwCbpZxLNZY4lfa8hRDjruf7ctqBFUU941VEd/oMtlq/TpE6lk8MA9+
 SeYf/vWy1GEuvx2QKQzTCLoEtLDWglD3LDIb9jIfRyeVWkNGtHpuvXKHwGvxCs+s2Wkn
 5ak7n3sQ7Y0x7/u0Io35vzS77A+pBs/sdLxMaL+kZt53fCXTr6EsFE4jGHMZjT/Kdo7K
 X1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nMCIeAZYPngWrYAj5gaTgch+vdW1rv/KybiQAzKH2Zs=;
 b=f1EAh//yQiPfqNqyYDl6QZ9yonAuj69+HBGTVByd8WiLq15RTl3oA2S4yUCgHsnIL+
 IGy9y0yGCTYeUxCk9v7eaFE7+ANnjDcK5cNrygY7vlvJI8wM1FF6/XW9ayeSQvDqVi23
 l4bdXLucWnTx0mxJ3sbpL6H17OLesQ+lfFJ56mqieCL50IW1NPZ0SeSvDi3SzxSKSr2+
 nnjMoKdLsgyGXZDASa2TRBLtlKF9ZyJSVxhBEg0DCTnuuBIfOGt/xlsaUeKrfh3HaUAz
 fIE4iOZSCqI0yKyp0QhZ4IfLKLgOZIUWJaLXOZccotzQjUcW1m3+nnNeRXD3vUoCcJGH
 q9Kg==
X-Gm-Message-State: APzg51AV6diltICyy2mLp7I2dr7aFFqXNoYrxofkLXh4wLUCKk4hkftB
 kjJWMG8zVbb3yfLdhIKXQtqOJxaK4iqU3B4bERaF0w==
X-Google-Smtp-Source: ANB0VdbCQ8UMzSzcbM6ZHsTvpzed/GcLYeyAK0UsxzBEdiEVBxh/7skhbXkZ2obSqHgX9bpNVYflKUegMniA8RBR2RI=
X-Received: by 2002:a37:e118:: with SMTP id
 c24-v6mr24759929qkm.68.1536087093206; 
 Tue, 04 Sep 2018 11:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20180510063718.16913-1-andrew@aj.id.au>
 <1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
 <CAMKF1spm=GQQq90gu58BdrNtqPQx_fxnA01ar9Jmr4PbQnmttQ@mail.gmail.com>
 <CA+chaQcY0TXd5ZpsaV-pOn-zO+kMQ8=_2hK3OOKbOEF-CFWEBg@mail.gmail.com>
In-Reply-To: <CA+chaQcY0TXd5ZpsaV-pOn-zO+kMQ8=_2hK3OOKbOEF-CFWEBg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Sep 2018 11:51:06 -0700
Message-ID: <CAMKF1spxy6nqbo6zUavgmBjB8QaTEB=rexJaMz9rvXbhY+bA4g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame
 recipe
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, 
 openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2018 18:52:41 -0000

On Tue, Sep 4, 2018 at 2:38 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Hi,
>
> it also fails for aarch64:
>
> | ../../git/src/ptrace.cc: In function 'user_regs_struct pyflame::PtraceGetRegs(pid_t)':
> | ../../git/src/ptrace.cc:127:14: error: 'PTRACE_GETREGS' was not declared in this scope
> |    if (ptrace(PTRACE_GETREGS, pid, 0, &regs)) {
> |               ^~~~~~~~~~~~~~
> | ../../git/src/ptrace.cc:127:14: note: suggested alternative: 'PTRACE_GETREGSET'
> |    if (ptrace(PTRACE_GETREGS, pid, 0, &regs)) {
> |               ^~~~~~~~~~~~~~
> |               PTRACE_GETREGSET
> | ../../git/src/ptrace.cc: In function 'void pyflame::PtraceSetRegs(pid_t, user_regs_struct)':
> | ../../git/src/ptrace.cc:136:14: error: 'PTRACE_SETREGS' was not declared in this scope
> |    if (ptrace(PTRACE_SETREGS, pid, 0, &regs)) {
> |               ^~~~~~~~~~~~~~
> | ../../git/src/ptrace.cc:136:14: note: suggested alternative: 'PTRACE_SETREGSET'
> |    if (ptrace(PTRACE_SETREGS, pid, 0, &regs)) {
> |               ^~~~~~~~~~~~~~
> |               PTRACE_SETREGSET
> | Makefile:524: recipe for target 'ptrace.o' failed
> | make[2]: *** [ptrace.o] Error 1
>
> I don't plan to use it, so I'm ok with aarch64 removal from compatible archs if the fix turns to be complicated.
>

Lets exclude it if it does not build. Care to send a patch ?

> Cheers,
>
> On Thu, May 31, 2018 at 6:49 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> fails to build on qemumips
>>
>> | ../../git/src/ptrace.cc: In function 'user_regs_struct
>> pyflame::PtraceGetRegs(pid_t)':
>> | ../../git/src/ptrace.cc:125:41: error: return type 'user_regs_struct
>> {aka struct user_regs_struct}' is incomplete
>> |  user_regs_struct PtraceGetRegs(pid_t pid) {
>> |                                          ^
>> | ../../git/src/ptrace.cc:125:18: error: ambiguating new declaration
>> of 'void pyflame::PtraceGetRegs(pid_t)'
>> |  user_regs_struct PtraceGetRegs(pid_t pid) {
>> |                   ^~~~~~~~~~~~~
>> | In file included from ../../git/src/ptrace.cc:15:0:
>> | ../../git/src/./ptrace.h:48:18: note: old declaration
>> 'user_regs_struct pyflame::PtraceGetRegs(pid_t)'
>> |  user_regs_struct PtraceGetRegs(pid_t pid);
>> |                   ^~~~~~~~~~~~~
>> | ../../git/src/ptrace.cc:126:20: error: aggregate 'user_regs_struct
>> regs' has incomplete type and cannot be defined
>> |    user_regs_struct regs;
>> |                     ^~~~
>> | ../../git/src/ptrace.cc: In function 'void
>> pyflame::PtraceSetRegs(pid_t, user_regs_struct)':
>> | ../../git/src/ptrace.cc:135:48: error: 'regs' has incomplete type
>> |  void PtraceSetRegs(pid_t pid, user_regs_struct regs) {
>> |                                                 ^~~~
>> | In file included from ../../git/src/ptrace.cc:15:0:
>> | ../../git/src/./ptrace.h:29:16: note: forward declaration of
>> 'user_regs_struct {aka struct user_regs_struct}'
>> |  typedef struct user_regs_struct user_regs_struct;
>> |                 ^~~~~~~~~~~~~~~~
>> | make[2]: *** [ptrace.o] Error 1
>> | make[2]: *** Waiting for unfinished jobs....
>> | make[2]: Leaving directory
>> `/mnt/jenkins/workspace/OpenEmbedded/build/tmp/work/mips32r2-bec-linux/python-pyflame/1.6.6-r0/build/src'
>>
>> On Tue, May 29, 2018 at 4:48 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > On Thu, 10 May 2018, at 16:07, Andrew Jeffery wrote:
>> >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> >
>> > Ping - is there anything I need to revise for this patch or the following two?
>> >
>> > Cheers,
>> >
>> > Andrew
>> >
>> >> ---
>> >>  meta-python/recipes-devtools/python/python-pyflame.inc      | 12 ++++++++++++
>> >>  meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb |  1 +
>> >>  2 files changed, 13 insertions(+)
>> >>  create mode 100644 meta-python/recipes-devtools/python/python-pyflame.inc
>> >>  create mode 100644 meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
>> >>
>> >> diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/
>> >> meta-python/recipes-devtools/python/python-pyflame.inc
>> >> new file mode 100644
>> >> index 000000000000..3b84a7e8f8e3
>> >> --- /dev/null
>> >> +++ b/meta-python/recipes-devtools/python/python-pyflame.inc
>> >> @@ -0,0 +1,12 @@
>> >> +SUMMARY = "Pyflame: A Ptracing Profiler For Python"
>> >> +HOMEPAGE = "https://github.com/uber/pyflame"
>> >> +SECTION = "devel/python"
>> >> +LICENSE = "Apache-2.0"
>> >> +LIC_FILES_CHKSUM = "file://${S}/
>> >> LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>> >> +DEPENDS = "python"
>> >> +
>> >> +SRC_URI = "git://github.com/uber/pyflame.git;protocol=https;tag=v${PV}"
>> >> +S = "${WORKDIR}/git"
>> >> +
>> >> +inherit pkgconfig autotools
>> >> +
>> >> diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
>> >> b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
>> >> new file mode 100644
>> >> index 000000000000..96f03305f883
>> >> --- /dev/null
>> >> +++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
>> >> @@ -0,0 +1 @@
>> >> +require python-pyflame.inc
>> >> --
>> >> 2.14.1
>> >>
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
