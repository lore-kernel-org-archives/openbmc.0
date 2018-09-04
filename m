Return-Path: <martin.jansa@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.221.54; helo=mail-wr1-f54.google.com;
 envelope-from=martin.jansa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tZ9hV2ZA"; 
 dkim-atps=neutral
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 424MXS1YsqzF3Lq
 for <openbmc@lists.ozlabs.org>; Tue,  4 Sep 2018 19:50:43 +1000 (AEST)
Received: by mail-wr1-f54.google.com with SMTP id u12-v6so3253131wrr.4
 for <openbmc@lists.ozlabs.org>; Tue, 04 Sep 2018 02:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nj2/h1IWIXXUPqWEr1TkxcADekTRwWueunQf4+25lcY=;
 b=tZ9hV2ZAJd/BIsN+tT91pJqM5IWY2rbqQgYkpdIC9pKu6B1dO7djXWKkJww2wHLony
 za60DcQ0zYCvLW4rwx7PsoR7p9u07DllU0YHtoiMij/k9jZTOrqgk4103krxwTH9juoO
 lgQ4r5vl+Iuh4JDtw5aj1t1sR1vGidX1Ivlro++qaspiq/ItIGDX4fu189Db7UBdrgrr
 0ev+9UuNFE3lI86BolQHPTU5yuu+8q+keb1X8pBJdq4PCz4cT8aW/xVWnpHyUbZyAOtB
 smM4DfcR43WRXSiD21lnd+/nZK/59WlX4wA2ThaTMZQbPrqbx62O16K5ONMvm+Ut4WQO
 U1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nj2/h1IWIXXUPqWEr1TkxcADekTRwWueunQf4+25lcY=;
 b=OuG0OMiaglu6hbcyV0gVjEtiAeqRbCRMnIJG5OTjLpjrgMYTBJMC84olzcUgOHf1/h
 P8nINPvPUHHG1UjaKGRe+nBVaM3E45VywC8ssApnLvi5pNen4cxKbnPhbOKfsJHqpu8H
 0eP4SRxxfsVBR4+lrzhaeYNTGBbAdsYeepFQ+7Hb1XZ4ZKxD6Mvb1rhYkIh6FUayvbrm
 QUWfn/AkNjxijtGQCCW0XkhQSuHtzGImBaCgO2AYli6kFYf05ngRLgZW+6t/Q94L2pfM
 qdlPLSO4xXFjap4k6wSmBh0k40aecfsy+4r6vk6KmmZ4HxWbLmrMId+5d6tuIS0imYJ+
 CUdA==
X-Gm-Message-State: APzg51CFk53NE+fzrIAvRPcUjzKoZXr16cW6hyrTrnxhMr50OwqW5pHt
 7iBqVXc3jWU0wc/VkR6FkdAO9HhyzBqea2hIPhXsjli4
X-Google-Smtp-Source: ANB0VdbP9idcS9bpkPT7BmEaNLzJWqx2h/0vwstgrExz4o+bF3kyphtFnnbAie4KvuJnIWIvamXTkKauOMGaAdby/2M=
X-Received: by 2002:adf:bd90:: with SMTP id
 l16-v6mr22854767wrh.250.1536053903430; 
 Tue, 04 Sep 2018 02:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20180510063718.16913-1-andrew@aj.id.au>
 <1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
 <CAMKF1spm=GQQq90gu58BdrNtqPQx_fxnA01ar9Jmr4PbQnmttQ@mail.gmail.com>
In-Reply-To: <CAMKF1spm=GQQq90gu58BdrNtqPQx_fxnA01ar9Jmr4PbQnmttQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 4 Sep 2018 11:38:12 +0200
Message-ID: <CA+chaQcY0TXd5ZpsaV-pOn-zO+kMQ8=_2hK3OOKbOEF-CFWEBg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame
 recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org, 
 openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000045188e0575086b78"
X-Mailman-Approved-At: Mon, 10 Sep 2018 10:12:06 +1000
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
X-List-Received-Date: Tue, 04 Sep 2018 09:50:50 -0000

--00000000000045188e0575086b78
Content-Type: text/plain; charset="UTF-8"

Hi,

it also fails for aarch64:

| ../../git/src/ptrace.cc: In function 'user_regs_struct
pyflame::PtraceGetRegs(pid_t)':
| ../../git/src/ptrace.cc:127:14: error: 'PTRACE_GETREGS' was not declared
in this scope
|    if (ptrace(PTRACE_GETREGS, pid, 0, &regs)) {
|               ^~~~~~~~~~~~~~
| ../../git/src/ptrace.cc:127:14: note: suggested alternative:
'PTRACE_GETREGSET'
|    if (ptrace(PTRACE_GETREGS, pid, 0, &regs)) {
|               ^~~~~~~~~~~~~~
|               PTRACE_GETREGSET
| ../../git/src/ptrace.cc: In function 'void pyflame::PtraceSetRegs(pid_t,
user_regs_struct)':
| ../../git/src/ptrace.cc:136:14: error: 'PTRACE_SETREGS' was not declared
in this scope
|    if (ptrace(PTRACE_SETREGS, pid, 0, &regs)) {
|               ^~~~~~~~~~~~~~
| ../../git/src/ptrace.cc:136:14: note: suggested alternative:
'PTRACE_SETREGSET'
|    if (ptrace(PTRACE_SETREGS, pid, 0, &regs)) {
|               ^~~~~~~~~~~~~~
|               PTRACE_SETREGSET
| Makefile:524: recipe for target 'ptrace.o' failed
| make[2]: *** [ptrace.o] Error 1

I don't plan to use it, so I'm ok with aarch64 removal from compatible
archs if the fix turns to be complicated.

Cheers,

On Thu, May 31, 2018 at 6:49 PM Khem Raj <raj.khem@gmail.com> wrote:

> fails to build on qemumips
>
> | ../../git/src/ptrace.cc: In function 'user_regs_struct
> pyflame::PtraceGetRegs(pid_t)':
> | ../../git/src/ptrace.cc:125:41: error: return type 'user_regs_struct
> {aka struct user_regs_struct}' is incomplete
> |  user_regs_struct PtraceGetRegs(pid_t pid) {
> |                                          ^
> | ../../git/src/ptrace.cc:125:18: error: ambiguating new declaration
> of 'void pyflame::PtraceGetRegs(pid_t)'
> |  user_regs_struct PtraceGetRegs(pid_t pid) {
> |                   ^~~~~~~~~~~~~
> | In file included from ../../git/src/ptrace.cc:15:0:
> | ../../git/src/./ptrace.h:48:18: note: old declaration
> 'user_regs_struct pyflame::PtraceGetRegs(pid_t)'
> |  user_regs_struct PtraceGetRegs(pid_t pid);
> |                   ^~~~~~~~~~~~~
> | ../../git/src/ptrace.cc:126:20: error: aggregate 'user_regs_struct
> regs' has incomplete type and cannot be defined
> |    user_regs_struct regs;
> |                     ^~~~
> | ../../git/src/ptrace.cc: In function 'void
> pyflame::PtraceSetRegs(pid_t, user_regs_struct)':
> | ../../git/src/ptrace.cc:135:48: error: 'regs' has incomplete type
> |  void PtraceSetRegs(pid_t pid, user_regs_struct regs) {
> |                                                 ^~~~
> | In file included from ../../git/src/ptrace.cc:15:0:
> | ../../git/src/./ptrace.h:29:16: note: forward declaration of
> 'user_regs_struct {aka struct user_regs_struct}'
> |  typedef struct user_regs_struct user_regs_struct;
> |                 ^~~~~~~~~~~~~~~~
> | make[2]: *** [ptrace.o] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | make[2]: Leaving directory
>
> `/mnt/jenkins/workspace/OpenEmbedded/build/tmp/work/mips32r2-bec-linux/python-pyflame/1.6.6-r0/build/src'
>
> On Tue, May 29, 2018 at 4:48 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Thu, 10 May 2018, at 16:07, Andrew Jeffery wrote:
> >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >
> > Ping - is there anything I need to revise for this patch or the
> following two?
> >
> > Cheers,
> >
> > Andrew
> >
> >> ---
> >>  meta-python/recipes-devtools/python/python-pyflame.inc      | 12
> ++++++++++++
> >>  meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb |  1 +
> >>  2 files changed, 13 insertions(+)
> >>  create mode 100644
> meta-python/recipes-devtools/python/python-pyflame.inc
> >>  create mode 100644 meta-python/recipes-devtools/python/
> python-pyflame_1.6.6.bb
> >>
> >> diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/
> >> meta-python/recipes-devtools/python/python-pyflame.inc
> >> new file mode 100644
> >> index 000000000000..3b84a7e8f8e3
> >> --- /dev/null
> >> +++ b/meta-python/recipes-devtools/python/python-pyflame.inc
> >> @@ -0,0 +1,12 @@
> >> +SUMMARY = "Pyflame: A Ptracing Profiler For Python"
> >> +HOMEPAGE = "https://github.com/uber/pyflame"
> >> +SECTION = "devel/python"
> >> +LICENSE = "Apache-2.0"
> >> +LIC_FILES_CHKSUM = "file://${S}/
> >> LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
> >> +DEPENDS = "python"
> >> +
> >> +SRC_URI = "git://github.com/uber/pyflame.git;protocol=https;tag=v${PV}
> <http://github.com/uber/pyflame.git;protocol=https;tag=v$%7BPV%7D>"
> >> +S = "${WORKDIR}/git"
> >> +
> >> +inherit pkgconfig autotools
> >> +
> >> diff --git a/meta-python/recipes-devtools/python/
> python-pyflame_1.6.6.bb
> >> b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> >> new file mode 100644
> >> index 000000000000..96f03305f883
> >> --- /dev/null
> >> +++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> >> @@ -0,0 +1 @@
> >> +require python-pyflame.inc
> >> --
> >> 2.14.1
> >>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

--00000000000045188e0575086b78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>it also fails for =
aarch64:</div><div><br></div><div><div>| ../../git/src/ptrace.cc: In functi=
on &#39;user_regs_struct pyflame::PtraceGetRegs(pid_t)&#39;:</div><div>| ..=
/../git/src/ptrace.cc:127:14: error: &#39;PTRACE_GETREGS&#39; was not decla=
red in this scope</div><div>|=C2=A0 =C2=A0 if (ptrace(PTRACE_GETREGS, pid, =
0, &amp;regs)) {</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~~~~~</div><div>| ../../git/src/ptrace.cc:127:14: note: =
suggested alternative: &#39;PTRACE_GETREGSET&#39;</div><div>|=C2=A0 =C2=A0 =
if (ptrace(PTRACE_GETREGS, pid, 0, &amp;regs)) {</div><div>|=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~</div><div>|=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PTRACE_GETREGSET</div><div>=
| ../../git/src/ptrace.cc: In function &#39;void pyflame::PtraceSetRegs(pid=
_t, user_regs_struct)&#39;:</div><div>| ../../git/src/ptrace.cc:136:14: err=
or: &#39;PTRACE_SETREGS&#39; was not declared in this scope</div><div>|=C2=
=A0 =C2=A0 if (ptrace(PTRACE_SETREGS, pid, 0, &amp;regs)) {</div><div>|=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~</div><di=
v>| ../../git/src/ptrace.cc:136:14: note: suggested alternative: &#39;PTRAC=
E_SETREGSET&#39;</div><div>|=C2=A0 =C2=A0 if (ptrace(PTRACE_SETREGS, pid, 0=
, &amp;regs)) {</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0^~~~~~~~~~~~~~</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0PTRACE_SETREGSET</div><div>| Makefile:524: recipe for target &=
#39;ptrace.o&#39; failed</div><div>| make[2]: *** [ptrace.o] Error 1</div><=
/div><div><br></div><div>I don&#39;t plan to use it, so I&#39;m ok with aar=
ch64 removal from compatible archs if the fix turns to be complicated.</div=
><div><br></div><div>Cheers,</div></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr">On Thu, May 31, 2018 at 6:49 PM Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">fails to build on qemumips<br>
<br>
| ../../git/src/ptrace.cc: In function &#39;user_regs_struct<br>
pyflame::PtraceGetRegs(pid_t)&#39;:<br>
| ../../git/src/ptrace.cc:125:41: error: return type &#39;user_regs_struct<=
br>
{aka struct user_regs_struct}&#39; is incomplete<br>
|=C2=A0 user_regs_struct PtraceGetRegs(pid_t pid) {<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=
<br>
| ../../git/src/ptrace.cc:125:18: error: ambiguating new declaration<br>
of &#39;void pyflame::PtraceGetRegs(pid_t)&#39;<br>
|=C2=A0 user_regs_struct PtraceGetRegs(pid_t pid) {<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~=
~~~~~~~~<br>
| In file included from ../../git/src/ptrace.cc:15:0:<br>
| ../../git/src/./ptrace.h:48:18: note: old declaration<br>
&#39;user_regs_struct pyflame::PtraceGetRegs(pid_t)&#39;<br>
|=C2=A0 user_regs_struct PtraceGetRegs(pid_t pid);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~=
~~~~~~~~<br>
| ../../git/src/ptrace.cc:126:20: error: aggregate &#39;user_regs_struct<br=
>
regs&#39; has incomplete type and cannot be defined<br>
|=C2=A0 =C2=A0 user_regs_struct regs;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^~~~<br>
| ../../git/src/ptrace.cc: In function &#39;void<br>
pyflame::PtraceSetRegs(pid_t, user_regs_struct)&#39;:<br>
| ../../git/src/ptrace.cc:135:48: error: &#39;regs&#39; has incomplete type=
<br>
|=C2=A0 void PtraceSetRegs(pid_t pid, user_regs_struct regs) {<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~<br>
| In file included from ../../git/src/ptrace.cc:15:0:<br>
| ../../git/src/./ptrace.h:29:16: note: forward declaration of<br>
&#39;user_regs_struct {aka struct user_regs_struct}&#39;<br>
|=C2=A0 typedef struct user_regs_struct user_regs_struct;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~=
~~~~<br>
| make[2]: *** [ptrace.o] Error 1<br>
| make[2]: *** Waiting for unfinished jobs....<br>
| make[2]: Leaving directory<br>
`/mnt/jenkins/workspace/OpenEmbedded/build/tmp/work/mips32r2-bec-linux/pyth=
on-pyflame/1.6.6-r0/build/src&#39;<br>
<br>
On Tue, May 29, 2018 at 4:48 AM, Andrew Jeffery &lt;<a href=3D"mailto:andre=
w@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; wrote:<br>
&gt; On Thu, 10 May 2018, at 16:07, Andrew Jeffery wrote:<br>
&gt;&gt; Signed-off-by: Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.a=
u" target=3D"_blank">andrew@aj.id.au</a>&gt;<br>
&gt;<br>
&gt; Ping - is there anything I need to revise for this patch or the follow=
ing two?<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Andrew<br>
&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta-python/recipes-devtools/python/python-pyflame.inc=C2=A0=
 =C2=A0 =C2=A0 | 12 ++++++++++++<br>
&gt;&gt;=C2=A0 meta-python/recipes-devtools/python/<a href=3D"http://python=
-pyflame_1.6.6.bb" rel=3D"noreferrer" target=3D"_blank">python-pyflame_1.6.=
6.bb</a> |=C2=A0 1 +<br>
&gt;&gt;=C2=A0 2 files changed, 13 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/pytho=
n-pyflame.inc<br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a hr=
ef=3D"http://python-pyflame_1.6.6.bb" rel=3D"noreferrer" target=3D"_blank">=
python-pyflame_1.6.6.bb</a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/python-pyflame.in=
c b/<br>
&gt;&gt; meta-python/recipes-devtools/python/python-pyflame.inc<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 000000000000..3b84a7e8f8e3<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/python-pyflame.inc<br>
&gt;&gt; @@ -0,0 +1,12 @@<br>
&gt;&gt; +SUMMARY =3D &quot;Pyflame: A Ptracing Profiler For Python&quot;<b=
r>
&gt;&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/uber/pyflame" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/uber/pyflame</a>&quot=
;<br>
&gt;&gt; +SECTION =3D &quot;devel/python&quot;<br>
&gt;&gt; +LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://${S}/<br>
&gt;&gt; LICENSE;md5=3D2ee41112a44fe7014dce33e26468ba93&quot;<br>
&gt;&gt; +DEPENDS =3D &quot;python&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/uber/pyflame=
.git;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=3D"_blank=
">github.com/uber/pyflame.git;protocol=3Dhttps;tag=3Dv${PV}</a>&quot;<br>
&gt;&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +inherit pkgconfig autotools<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:/=
/python-pyflame_1.6.6.bb" rel=3D"noreferrer" target=3D"_blank">python-pyfla=
me_1.6.6.bb</a><br>
&gt;&gt; b/meta-python/recipes-devtools/python/<a href=3D"http://python-pyf=
lame_1.6.6.bb" rel=3D"noreferrer" target=3D"_blank">python-pyflame_1.6.6.bb=
</a><br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 000000000000..96f03305f883<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python=
-pyflame_1.6.6.bb" rel=3D"noreferrer" target=3D"_blank">python-pyflame_1.6.=
6.bb</a><br>
&gt;&gt; @@ -0,0 +1 @@<br>
&gt;&gt; +require python-pyflame.inc<br>
&gt;&gt; --<br>
&gt;&gt; 2.14.1<br>
&gt;&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-devel mailing list<br>
&gt; <a href=3D"mailto:Openembedded-devel@lists.openembedded.org" target=3D=
"_blank">Openembedded-devel@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-devel" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/=
mailman/listinfo/openembedded-devel</a><br>
-- <br>
_______________________________________________<br>
Openembedded-devel mailing list<br>
<a href=3D"mailto:Openembedded-devel@lists.openembedded.org" target=3D"_bla=
nk">Openembedded-devel@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-deve=
l" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailm=
an/listinfo/openembedded-devel</a><br>
</blockquote></div>

--00000000000045188e0575086b78--
