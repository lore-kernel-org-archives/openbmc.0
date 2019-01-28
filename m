Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Mlvl/4xQ"; 
 dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43pDHw4CnyzDqKV
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 02:36:28 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id w7so7341820pgp.13
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jan 2019 07:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3rIq4lGudxqF2sMQ6OJOxfoaQT2b40Cb+/WayQfYQdA=;
 b=Mlvl/4xQGLhICSnJwSt7+LhnNx/1FwlFSdtEbnPA54AkDYl6voS3m34eAzVWLXpDOb
 pN4MO2RJsyfXINeAA9iDE263Ls+0FOiT9/eKa3qsde9fTTY7SsdYsawrBtsEwuykk2QL
 ttNBkeAdAKnKdmtSBBtwQEGJms/e0PcroDAfwWnLALCYmtx/e6Wvyjnd2g1ki96Vqq/D
 4jHyeIhsvVbAjIsiHZNvI0pJeUX9ylc+ijZxETa0XTBGe0nVVE6M+0OcXqumgxRTj7H+
 lxsJ7aswHfCUjogBlpWWuZTZvtefeA4z/7R/6t7cVkmSOwFeuw3VX8bpBK/qdK7aYVyd
 rbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3rIq4lGudxqF2sMQ6OJOxfoaQT2b40Cb+/WayQfYQdA=;
 b=l6YwBB8j0qKatSlymKS0BfLMS26jlHzgVBLZKDVbQs+3jd89Wcf4C55+dV6QIXII7F
 sVx1L5O9bjOPuG9ODuNmadtW22P2WsrSWc2DhnZ9dXrKDD5bfaqaDS+AEaEGstozyAac
 fLpBTRSVD6tyuzqnBFLa/ua2ReF6OVHReN2rRvAqywnPOsBi+/vt6X1qPI/baNY2bpd3
 fbj2QIe77u4t6HATflLJvDxSGvaYE1UuDt3DJMeTp5fBVtUmBk2fSkxRYPzcX4uSQPHn
 zE446IqSixf1HtAB/AOIwoLAXi4wrL62RJ98JltL6sclqhQrc/CfOQeNgx0VLhZhArJw
 Ftig==
X-Gm-Message-State: AJcUukeyzSR50NI/qMcBUgRo1Tx6XOVEp3AFrwd4z+i3u9aNzZE73bal
 Q6KWw2PDzgPBLZgxplxeKA6/nBilKNYNMyIRpJNz3Q==
X-Google-Smtp-Source: ALg8bN7dwIt8IN/yWmb7fYMi86eAZ9PAzbowNJA11GQk1dwllBc2QdvwMv6DKyvw53USLe7geoDQKQ8cu8TCb4XF418=
X-Received: by 2002:a63:e545:: with SMTP id z5mr20270271pgj.195.1548689786108; 
 Mon, 28 Jan 2019 07:36:26 -0800 (PST)
MIME-Version: 1.0
References: <VI1PR0502MB38692122CA756E330804994EDD960@VI1PR0502MB3869.eurprd05.prod.outlook.com>
In-Reply-To: <VI1PR0502MB38692122CA756E330804994EDD960@VI1PR0502MB3869.eurprd05.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 28 Jan 2019 07:36:14 -0800
Message-ID: <CAO=notzpM25QD+LcQ59RNp7ZLVSHjzCT98sM05zso2r7miC3Uw@mail.gmail.com>
Subject: Re: Question on upstreaming and release planning
To: David Thompson <dthompson@mellanox.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 28 Jan 2019 15:36:29 -0000

On Mon, Jan 28, 2019 at 7:21 AM David Thompson <dthompson@mellanox.com> wro=
te:
>
> Hello all,
>
>
>
> I work for Mellanox Technologies and we=E2=80=99ve have been using OpenBM=
C
>
> for a while now.  We hope to upstream the code contributions that
>
> support our machine (called =E2=80=9Cbluewhale-ast2500=E2=80=9D) which is=
 a hardware
>
> platform based on ASPEED AST2500.
>
>
>
> We have a new meta-layer at:
>
> $TOP/meta-mellanox/meta-bluewhale-ast2500/
>
> which holds the supporting files for our machine.
>
>
>
> What=E2=80=99s the process to get our machine into the upstream?
>
> Do I need to attend a release planning meeting and discuss?
>
> I see there=E2=80=99s a meeting on Mon 1/28, that=E2=80=99s why I ask now=
.
>
>
>
> FWIW, I have submitted a signed CCLA, and it=E2=80=99s been accepted alre=
ady.

I can't speak for the release planning group, however we're pretty far
from the next release as we're currently releasing against thud.
IIRC, only bug fixes will go into it at this point.

Looking at meta-mellanox, I don't see a MAINTAINERS file.  I think a
good first step would be setting that up in coordination with Brad.
Then I'd send up the implementation in small pieces.  Such that, at
each point your image can be built, albeit not complete.  For
instance, add your machine configuration without any overrides to pick
out things.  Then add a recipe and the override, then repeat until
it's all in place.  Using the maintainers file, you'll add appropriate
people to the review, and then other interested parties will likely
jump onto the reviews to provide _community_ feedback.

At least that's my $0.02 on it.

>
>
>
> Thanks,
>
> Dave
>
>
>
>
>
> David Thompson
>
> Sr. Staff Engineer, System SW
>
> Mellanox Technologies
>
> 1900 West Park Drive, Suite 290
>
> Westborough MA USA 01581
>
> Direct: +1 508-475-6375
>
>
