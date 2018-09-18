Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XPbXPa04"; 
 dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FHYR6hRczF3KH
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 08:22:35 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id h79-v6so1671888pfk.8
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 15:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fp3SluZ4emi3BiblL7ldv8uq9Rl6GZv6j4lmaFfKd14=;
 b=XPbXPa04diE5BaEdmNm983PZtfcL9U7EHpXzpvpHsUUxcpeGJX0pbMQzgXtNHq8dWG
 K1XB+1YkIgU1zwEuHfn19/8577L7ErAEeXpOBJz13nvcA0+z7ITWGQBtQbsSdmsWaalq
 1OVvBe+EqRNY9toVNrnYYJff34XqiPwBT4C8KFFbSNPpWsCB9jeUyn8Vt1/6EFaIjsYa
 ftmwmMvO1R0YPBVQlUYug5+h7qsaZSxhqAAGyykoFGrXTCuF94s0ZuKXbPWHFHgEmZNg
 r3Y73dL2uADEow6FaGAxILkvvRLTOP2BSFZihdg97rTr4i86vB+rEvrGNdNDOgeE43/z
 z2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fp3SluZ4emi3BiblL7ldv8uq9Rl6GZv6j4lmaFfKd14=;
 b=bgH0nQa2o8AFKvZnAsn5VGWgqSPzdY6PK19OJlcEVIjS7k94RwzgGTlQv5l66jAnas
 TUvUEbiyn443v3bClH7AVvW4Tf38UHB2Kd7wsHcIMP3OfAK8WjJA440a2P0gaDZ7NsrZ
 9gGLdfrPvDjF4xiDF30GHOPPINEvu5SlaWsfTfPSRs70yXecKTeX+qQVJfZF8GBDSQEN
 DZrMVfGVQv0nGI4/eijImYcOKMQOCQbifPf7l0JyHFy49w0X1hxRa7/v/dERah+Qc34P
 s0M76KhCrdu9eRppkIhy/37OHHMisBde9y83RBCwdUP2L8kEKM/T57W9F2Sq4r259ts5
 GfYg==
X-Gm-Message-State: APzg51CjCZSv+tWN8/bsxjnP4T2FKVIGLov202wXp43R4FlzvytwKhLU
 TSTwnxOfWqH2/0viz390vedqbt4/wQNOzzeTNFzzgg==
X-Google-Smtp-Source: ANB0VdaeJfskYCIIN5O8sU3Tn5IGqHid4quPm6XxNPLfE1WHV8uus/wxm+ou3m3AjdckNcIJ2h58+R+Uet1CJ1Vw/+o=
X-Received: by 2002:a63:6c04:: with SMTP id
 h4-v6mr16824530pgc.290.1537309352925; 
 Tue, 18 Sep 2018 15:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=noty_TQ2jvQw-Yxb-RYe+0xOXa4F39ozF11r9PN1w2Qt_Dw@mail.gmail.com>
 <C385EBD1-871A-4E5B-8FDE-80146795CC6D@fuzziesquirrel.com>
 <CAO=notx9KnTNNC1UnL=DQkfpgqaUmKsbMeAG1H8CkodXGDVQ4Q@mail.gmail.com>
 <A951F86E-51B1-49DB-8219-592A9236E59A@fuzziesquirrel.com>
In-Reply-To: <A951F86E-51B1-49DB-8219-592A9236E59A@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 18 Sep 2018 15:22:21 -0700
Message-ID: <CAO=notxhTdJ+aTRH=zwBbi+QsV5ZNtFWgymQGMLTTfS2DFnyZA@mail.gmail.com>
Subject: Re: New Repository Request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, 
 Emily Shaffer <emilyshaffer@google.com>, tomjoseph@in.ibm.com
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
X-List-Received-Date: Tue, 18 Sep 2018 22:22:37 -0000

On Tue, Sep 18, 2018 at 3:21 PM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
>
>
> > On Sep 18, 2018, at 11:47 AM, Patrick Venture <venture@google.com> wrot=
e:
> >
> > On Fri, Sep 14, 2018 at 6:00 AM Brad Bishop <bradleyb@fuzziesquirrel.co=
m> wrote:
> >>
> >>
> >>> On Sep 13, 2018, at 1:55 PM, Patrick Venture <venture@google.com> wro=
te:
> >>>
> >>> Brad,
> >>>
> >>> I'd like to set up a new repository in openbmc to store a google oem
> >>> ipmi library I'd like to share with everybody.  It allows grabbing
> >>> ethernet device statistics over IPMI.
> >>
> >> As far as where the code is hosted I=E2=80=99m good one way or the oth=
er.
> >> Will wait a couple days for objections and create openbmc/phosphor-ipm=
i-ethstats.
> >
> > Please go ahead and create openbmc/phosphor-ipmi-ethstats

Thanks!

>
> done!
