Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="evJ04CvX"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="B3uDrNns"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xpNn1N0DzDrWY
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 12:36:08 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F103B21BF4;
 Thu, 31 May 2018 22:36:05 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Thu, 31 May 2018 22:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=I/YHS15qq5CM4xtlqZDaMJhbqyRHs
 kp0Dp5old22Oaw=; b=evJ04CvX5GH+4NN2R3rMUwnp0ZCe303FyCHzPG03qMTaP
 eAM9cp7fSMt0JObMGaBt240KOJrb1jkNvmBx3EXY1vjXTm5BAPo12isv/weKCfJ4
 aaI5jj9JXG3JEwh1vWxLT/iEggzLaF8gbnpazNQlYf57hzoG8FFoFdtBR2ER09h0
 z4rcXaNQ9BO3S+DEPXG5eI+7VpAMNHQDbSJpkrRDGuNTfEtdgzjXwHX2KHPd8gy8
 M8MH2yVuGDRZ8jRy5B1uNcntZBcpdcQQAVwkp+jCIla3nBmNzB5UspvePwOLnBK5
 cUsNsOOgQIP4pDU6g5HLEAjtKp8E7AkJ2QLyzh8iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=I/YHS1
 5qq5CM4xtlqZDaMJhbqyRHskp0Dp5old22Oaw=; b=B3uDrNnsb7bEuFrQSPZkcL
 gE4Eg79EDrd2jmfecvd7CCqWJd8g8rSfvaLPakc6capwLOiFInsBgZdQGJ76906/
 YkM0XFvzzKpCqetewaq6CGogE9oGzubDaq4GEOv/alYLbRHj3r2KWQtFQ/1r0KLa
 WiSzlFc/iqz4sVlRwViZz0byKTSardTtFJZvA0VaTTTtp+xThggL7Dgw9uxGE8vc
 SWExSuxVCwDOg2ebz1BGSGOMbElMlw1Vn0uJv860hf2fq8aEWEBtuUwXhPjjP3oi
 kJK2XHNOI7hFDCbZCGgxwkMtBODmNa8wu/8E6Y6lmwX+qk5IlpOtiO05XCwZFiDA
 ==
X-ME-Proxy: <xmx:FbEQW1sKrujHlGfu02vRALdbgjHjs9U58zgad83kIBczfpIZaH_lHA>
X-ME-Proxy: <xmx:FbEQW6SpbvSNBDbovIHO2qvDXYe1ypaZA-_91Xpcc8i4O9b4w8Oszg>
X-ME-Proxy: <xmx:FbEQWwHBlFU0vwGqfOSenpyP8SaoXPv0eqOzBT_5t3E8MDTnLEecew>
X-ME-Proxy: <xmx:FbEQW_f2M952dmNkhNR-FzzfIKDf-sfjBELyiR8H-Kp46clLMNTNkQ>
X-ME-Proxy: <xmx:FbEQWwrD5_NF1oWlp1vsAVhwVO_UwHae3Nx2MTHgtT2p9b5CUrC3Tg>
X-ME-Proxy: <xmx:FbEQW40NdSKJldXpaGL2inMp5ORST_GCeINBTqAKiucym5jaKhDNYw>
X-ME-Sender: <xms:FbEQWyF4W76LP7LyDWzRplN00616k0Iejqa8iV1U57mJW0CnSYCaxA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id A6887BA780; Thu, 31 May 2018 22:36:05 -0400 (EDT)
Message-Id: <1527820565.499695.1392530280.7147CEB3@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembeded-devel" <openembedded-devel@lists.openembedded.org>,
 openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-397f98d6
References: <20180510063718.16913-1-andrew@aj.id.au>
 <1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
 <CAMKF1spm=GQQq90gu58BdrNtqPQx_fxnA01ar9Jmr4PbQnmttQ@mail.gmail.com>
In-Reply-To: <CAMKF1spm=GQQq90gu58BdrNtqPQx_fxnA01ar9Jmr4PbQnmttQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame
 recipe
Date: Fri, 01 Jun 2018 12:06:05 +0930
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
X-List-Received-Date: Fri, 01 Jun 2018 02:36:11 -0000

Hi Khem,

Thanks for testing.

On Fri, 1 Jun 2018, at 02:18, Khem Raj wrote:
> fails to build on qemumips
> 

Do I have to support MIPS for the recipe to be acceptable? Is there some way we can limit the recipe to architectures for which the software is known to work?

Andrew

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
> `/mnt/jenkins/workspace/OpenEmbedded/build/tmp/work/mips32r2-bec-linux/
> python-pyflame/1.6.6-r0/build/src'
> 
> On Tue, May 29, 2018 at 4:48 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Thu, 10 May 2018, at 16:07, Andrew Jeffery wrote:
> >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >
> > Ping - is there anything I need to revise for this patch or the following two?
> >
> > Cheers,
> >
> > Andrew
> >
> >> ---
> >>  meta-python/recipes-devtools/python/python-pyflame.inc      | 12 ++++++++++++
> >>  meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb |  1 +
> >>  2 files changed, 13 insertions(+)
> >>  create mode 100644 meta-python/recipes-devtools/python/python-pyflame.inc
> >>  create mode 100644 meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
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
> >> +SRC_URI = "git://github.com/uber/pyflame.git;protocol=https;tag=v${PV}"
> >> +S = "${WORKDIR}/git"
> >> +
> >> +inherit pkgconfig autotools
> >> +
> >> diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
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
