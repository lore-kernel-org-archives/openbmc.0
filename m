Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::736; helo=mail-qk1-x736.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oS8uJqkv"; 
 dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44KL5l5fWFzDqJg
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 05:31:37 +1100 (AEDT)
Received: by mail-qk1-x736.google.com with SMTP id n6so1732530qkf.1
 for <openbmc@lists.ozlabs.org>; Wed, 13 Mar 2019 11:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2aetLbnNZrTOFkAD5PTGKYH3QG7gIuovrFieCu4xdUs=;
 b=oS8uJqkv5oEQ3fcgMDzo3Jsin3DkJeJaKdrFBG6zhI8TciUxzoY50ZyITprs59nh2U
 n2+kfAfr7YtS2bVXSvu9PJSr01Z8FSw8EPEn37qUwgyJ6LKYzYvlW/n/OpuSvKBUD42Q
 huN5Kh5JPCPzkrdHoE5k7hMr+FcsjXMQO43KOOsMEeYQaXELcmjUgp9owoy+WMEwXBG5
 te+8yskMoUL7smQgBfzmIQ5oajiBF8PbkWD/xQEYEiFtOhKCBiJib1EHOgwi+5juZ7gm
 oVuGkzov55xhWJJ2wpyU/LdQV8S9cqwYdprlG+AZvrMSXO6vKvlXul9VydWL6sgIriTz
 Jppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2aetLbnNZrTOFkAD5PTGKYH3QG7gIuovrFieCu4xdUs=;
 b=Xdk0AsERq7p1rvouiwrgQ1/MF2SoYf6dDT6gvjR3jVkiKRVs8aiXYyMdTl60h904H+
 ihFs0TX1ISTLFfm5ZdIpaRpbsRG+Q3rzquZq/W6W24cQ+0shzOTs1hyRsSTndhiwOOm8
 9tk4obsyHVJWDaKJHdkqlzPONSsMUl2izhsCET8uqiu6kOqqHUcB1TGQ2mXCKgoBruZ/
 Ij+z0fJsz9130x1UDIOJhNb5oIvWD3UZ2FOXx3E0J/OwNB8Xaj1ZBYrN5VmURvQ5gUAU
 FQdOVMJvHb/M/WsdyR9Xv6QOnv6s13tB/lJSLozKfvTWFeh1OOtahANsB0CxZHh0Vovp
 MPAw==
X-Gm-Message-State: APjAAAXmxrR226v3J1Xp2orsxke2KjElDFM7NQT/hdld60NA9yJSWs+x
 4TgUPM8xNFWb2vgXUBn6I5KWZYp/DP2iETX+P2JnOw==
X-Google-Smtp-Source: APXvYqwWzmodL1NGR7Gf8y2u35XDPw5jG7O1uZMq7t30iBIgHtrtRghnsF6ztCfN0L2dt7ht231U/9rmsP4UpJHFNaQ=
X-Received: by 2002:a37:c80d:: with SMTP id c13mr13448504qkj.224.1552501893658; 
 Wed, 13 Mar 2019 11:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAMTupoQpdx2Hw=dy_pWsMYHbHvbYjj5L6j36Tp=WNnTOPDMrLg@mail.gmail.com>
In-Reply-To: <CAMTupoQpdx2Hw=dy_pWsMYHbHvbYjj5L6j36Tp=WNnTOPDMrLg@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 13 Mar 2019 11:31:22 -0700
Message-ID: <CAJoAoZnUxBzsXRS_o-E4Z8mmDdxSA2M+BS5yo-f1RYPi5pGu-g@mail.gmail.com>
Subject: Re: Restore MAC address to factory settings
To: Jandra A <jandraara@gmail.com>
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
X-List-Received-Date: Wed, 13 Mar 2019 18:31:41 -0000

We have a use case for editing MAC. I don't know about factory
default.  So there's one (rather large) end user who would get value
:)

On Tue, Mar 12, 2019 at 12:42 PM Jandra A <jandraara@gmail.com> wrote:
>
> Hello all,
>
> I=E2=80=99d like your input on the value you see =E2=80=93 if any =E2=80=
=93 in the ability for
> a user to restore a MAC Address to the factory default via the GUI
> (Network Settings).
>
> BACKGROUND: Several end users have told us that they RARELY need to
> change their MAC Address, if at all. However, we=E2=80=99ve heard from se=
veral
> subject-matter experts that there IS value in making the MAC Address
> editable as well as having a way to restore it to the factory default.
>
> QUESTION: Is there value for the end user in being able to edit a MAC
> address? What about restoring it to the factory default?
>
> VIEW CURRENT DESIGN:
> https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/319002386_V2_Networking_Mu=
tliple_VLAN
>
> Appreciate all thoughts on this.



--=20
Emily Shaffer
