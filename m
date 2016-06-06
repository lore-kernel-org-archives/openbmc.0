Return-Path: <raltherr@google.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
 [209.85.214.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNpqL4lMYzDqFJ
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 08:13:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=JytF0kRm; 
 dkim-atps=neutral
Received: by mail-it0-f52.google.com with SMTP id z189so56022340itg.0
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jun 2016 15:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=LZTnqJ7dzDDmf/Ko84cRB8wsfPsDgWdUwwiutjjE9gU=;
 b=JytF0kRmFmBDUQF+uhNWktL/RI+mw2HQ73/9AtMngd5MnucxbKuaE0CfsbZRJbgdfN
 rtLzA31682zKfZgjxMEaLCQT8ujvfhhqBKLA6k8MpbZI00PQ1VjDsqNW1byVYj2JtYAz
 +CevjozxW+V4f9JDRR86I8dM6yax5mXQfsqZU6D56pj3yijNYqa9P5vLZN2kAcXBlmuj
 2MGCKQXNnk6P3t3g7oqVf3vvHDC2lNfTt4TP3FJlhjVfHE2X7LIiDUBoY1nDV/cdJaVg
 dvl5IBe1j0weBT3ode73/HsoYkgO1XQWVrf1d49EgmvOctsI/7TLYpHsw6GduPK9So06
 hJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LZTnqJ7dzDDmf/Ko84cRB8wsfPsDgWdUwwiutjjE9gU=;
 b=lI0uUR9ju1l359YFcPUKKp9WCGlLXTfYw268xHOW3sHP7arKBldFSMPEP5PbOGEsv3
 +HazxwOnZJExSdpbYzVmhzDFixZ0PQDVtH90bwBsRTXUaHpFlSEMxE2jbVMZ44iMbgtX
 +35ytPhcXtcVJYivW5Apix6YYIuU5OQKvOR/6lVD1eWCQXGFpYdC9kQC0TtM5bzsMC79
 wOPTJKEFLk/s4RSCrbHM9a9xyDz41RC6i26D0NQJY4trZncGzZF4eOj7m8YxwaIT+Q0I
 Fd/jT+wUzcRoaNCxzk4E5Pj+8iKrqqxctD1bE5wuKoT7cduCaWIbB9NQwdTS8fRUCz5v
 u5DA==
X-Gm-Message-State: ALyK8tIp0od5WHBxNgJUzgshg4CUPXMBWo5JLijI7s/jlX/sh3vFp6qh5CCbv7k6HATbSwPfqDnTlhKybOXdcvbj
X-Received: by 10.36.2.71 with SMTP id 68mr1413986itu.38.1465251057472; Mon,
 06 Jun 2016 15:10:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.65.14.170 with HTTP; Mon, 6 Jun 2016 15:10:56 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
Date: Mon, 6 Jun 2016 15:10:56 -0700
Message-ID: <CAPLgG=moScGTagQ7gd4utT-Q339H91TG83RC0f5uvEpox+14ig@mail.gmail.com>
Subject: AST2500 progress
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a1144b1d0ca062f0534a3583e
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jun 2016 22:13:03 -0000

--001a1144b1d0ca062f0534a3583e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

There's been a fair amount of discussion on IRC about ast2500 progress.
Here's the recap for everyone else:


   - Joel Stanley's dev-4.7 <https://github.com/shenki/linux/tree/dev-4.7>
   tree builds and boots on ast2500 using the u-boot provided in the Aspeed=
 SDK
   - Rick Altherr rebased the above dev-4.7 onto 4.6 and Joel pushed the
   result to openbmc/linux on the dev-4.6
   <https://github.com/openbmc/linux/tree/dev-4.6> branch
   - C=C3=A9dric Le Goater rebased a minimal set of Aspeed's u-boot changes=
 onto
   u-boot 2016.05 which seems to boot kernels.  The tree is available at
   https://github.com/legoater/u-boot/tree/v2016.05-ast2500.
   - Brad Bishop sent a pull request
   <https://github.com/openbmc/openbmc/pull/312> for a BSP and machine
   layer for ast2500. This gets most of the plumbing in but u-boot doesn't
   build and the kernel config may not be right.
   - Rick Altherr has picked up Brad's changes and is working on finishing
   out the recipes for Cedric's u-boot tree.  The goal is to build a full
   phosphor image that boots on a ast2500 evb.

--001a1144b1d0ca062f0534a3583e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There&#39;s been a fair amount of discussion on IRC about =
ast2500 progress.=C2=A0 Here&#39;s the recap for everyone else:<div><br></d=
iv><div><ul><li>Joel Stanley&#39;s <a href=3D"https://github.com/shenki/lin=
ux/tree/dev-4.7">dev-4.7</a> tree builds and boots on ast2500 using the u-b=
oot provided in the Aspeed SDK</li><li>Rick Altherr rebased the above dev-4=
.7 onto 4.6 and Joel pushed the result to openbmc/linux on the <a href=3D"h=
ttps://github.com/openbmc/linux/tree/dev-4.6">dev-4.6</a> branch</li><li>C=
=C3=A9dric Le Goater=C2=A0rebased a minimal set of Aspeed&#39;s u-boot chan=
ges onto u-boot 2016.05 which seems to boot kernels.=C2=A0 The tree is avai=
lable at=C2=A0<a href=3D"https://github.com/legoater/u-boot/tree/v2016.05-a=
st2500">https://github.com/legoater/u-boot/tree/v2016.05-ast2500</a>. =C2=
=A0</li><li>Brad Bishop sent a <a href=3D"https://github.com/openbmc/openbm=
c/pull/312">pull request</a> for a BSP and machine layer for ast2500. This =
gets most of the plumbing in but u-boot doesn&#39;t build and the kernel co=
nfig may not be right.</li><li>Rick Altherr has picked up Brad&#39;s change=
s and is working on finishing out the recipes for Cedric&#39;s u-boot tree.=
=C2=A0 The goal is to build a full phosphor image that boots on a ast2500 e=
vb.</li></ul></div></div>

--001a1144b1d0ca062f0534a3583e--
