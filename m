Return-Path: <xow@google.com>
Received: from mail-qt0-x22d.google.com (mail-qt0-x22d.google.com
 [IPv6:2607:f8b0:400d:c0d::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJcJc1S74zDqBr
 for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2017 10:06:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SGVyOLPc"; 
 dkim-atps=neutral
Received: by mail-qt0-x22d.google.com with SMTP id k15so181054122qtg.3
 for <openbmc@lists.ozlabs.org>; Wed, 08 Feb 2017 15:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NSRQc3+SVCN5LecoJTiuE5ViWuHJoMzRpk83R6eHjYM=;
 b=SGVyOLPcfRwO30H4hMD6oB9d+J62gyWWom8smVzkTAPxqohvPOkvoBrM2Gu1rCE4TX
 RbLAe8dyp/YUptkx9MRK55WleHsjjUDWubce/RXXnsjDmOOt3SD8TVGx62oUa3cLsvEP
 mtQFL0cT2LRKrchSJCMxRYpWz06WxZFulTzF9mESPCmqNilJ+bS3pe7aS0JomVpkgbfb
 VSXDYf+dg2tPt23xIvvEJ8zMepWgsfnx5ovPVvZk+j670v6WRFy7XVooGb2QxcYAqILN
 q5KGijjDbtEGK9ANiMi1ejAveI8FO8SGMRM0761YVk9ZbPKRh0tQS8NC1D9INgFwvmdz
 W5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NSRQc3+SVCN5LecoJTiuE5ViWuHJoMzRpk83R6eHjYM=;
 b=uRcs+bgIIHAko8z23pvQ05zNdqgELAiAIAnEYzVggd7dU/kydn0fpWh5TzDIxCE4dC
 d+rvL/UQgIu368FMM4mj9ztdo9cgVDFTwuK13LpvatN8DchPxoLItJbkUUToYyJLUy05
 gUjYBiSf8Qm0Lx3t/O0DQvAurq4S51wV+t1HDkZmhDmqhWpBpzCfpQ8v/Ay8nKI36TGK
 3EhWmBpKsWdgCpHOiSDtBWUxlchRiMYxhZVIvnI4JUSLMCN1Zgtws5SeK+GYNlZDowad
 HfQq9I+Hv1jxPqgCN+oYN96MDO3+BJosEYSxickS31c5dwmTfUSfoMRcof8UFlo5EzFk
 2vJQ==
X-Gm-Message-State: AMke39mktQzwEFz+6Kd/LNCQnM8TfepEPpHKFBHiHnho9wU409IMdMPVetBKvCB8pIQXHhke3pImmTbN3cztvwqt
X-Received: by 10.200.41.153 with SMTP id 25mr41494qts.108.1486595164887; Wed,
 08 Feb 2017 15:06:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Wed, 8 Feb 2017 15:06:04 -0800 (PST)
In-Reply-To: <490CE008-B094-4008-83A7-7CD13F3F6C26@fuzziesquirrel.com>
References: <20170131183927.30887-1-raltherr@google.com>
 <CACPK8Xf7qFw-LgnwTyJH3fMme5w_c99JuJ1LVA74VmFGkBMDPg@mail.gmail.com>
 <CALLMt=pHyZhj8W7i7qWgM6ppf0a+4aUp8+zxfx8QFSuZ_xNpnQ@mail.gmail.com>
 <490CE008-B094-4008-83A7-7CD13F3F6C26@fuzziesquirrel.com>
From: Xo Wang <xow@google.com>
Date: Wed, 8 Feb 2017 15:06:04 -0800
Message-ID: <CAPH-5w7D9XeTpFHJefE-7abYnBY6r32UsRSjZnN4aCEzm1JF0Q@mail.gmail.com>
Subject: Re: [PATCH linux] dts: aspeed: merge initrd into kernel in flash
 layout
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 08 Feb 2017 23:06:08 -0000

On Fri, Feb 3, 2017 at 8:44 AM, Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
> I=E2=80=99m not suggesting one way or the other as far as how to proceed =
but I don=E2=80=99t
> think pulling chips is ever necessary.  You can always netboot and flash =
the
> entire image image that way.
>

The hack we've been using for whole-image updates here on non-netboot
BMCs is to use flashcp/dd of=3Dmtdblock0/pflash to erase and program the
BMC flash, then assert the hotswap reset GPIO.

It saves a bit of time rebooting and is reliable, but feels dirty every tim=
e.

xo
