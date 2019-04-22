Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AeQZQnZe"; 
 dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44nsD25nwPzDqLP
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 02:17:06 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id j26so6069906pgl.5
 for <openbmc@lists.ozlabs.org>; Mon, 22 Apr 2019 09:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TbTsNkw/Y8civLACR7sWBJnYb98aZ/s4U7YhIkMFtlE=;
 b=AeQZQnZe3ZiA1ve8I2zvCrn2aHNqEkrP/Ur25wcCdrORdtiFUPoQgYUy4X+gQe4wpA
 zFdtVjKJqxDiTWZY5Jd4K8RDCA+TMLl3MltsHqGVhBsT6NtvORtEYcGdlrM2/+aaerXI
 BY+iCNyetV0UJ7Ay7f8uAf6Pe/7rYq0EY8/YPcKtc0QUv6mxSciDaLdyeDw/VIoKunw6
 oOZnDdBaQXlhV7NQ4S3qk+FlLZ9AEdNPxqkYt10ZPecf/KfhAQG8vNGVa7nxyU/BX69i
 8v/TagdhYS2yA7RKyHQmmlFCiP6nw/5w8RIRoAdHAg2Sd1kd+C0/AtoOsDCEErTAvofb
 AaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TbTsNkw/Y8civLACR7sWBJnYb98aZ/s4U7YhIkMFtlE=;
 b=HFDtBpYindx1eOFAKdrgN3moUY+s1x1MJ4vHFgHIR19tkBriMsJDqPXYyf9EwVcI0C
 0knXXdUqq3f82QxBlOpOl4Acbl8Ba1pUpHizEUlhgQilCe3GC3fJhmVsEFOxZk+JNqO+
 SiA56UyKgPEss4rILJJG7zXgusWFom6GYHZ+QtuEtWFgGcVt9SN/Ho8ct1+KasJ26pia
 kT//cljCjm5kl7GKI2lSW9iPDt3mwT1o9PELIAjtBWB86QkZYNW4sgQNdIx51olH0S2e
 Y84YWDfXDZVvt1clyGAkKnHCf4gKT20dLNds6a+AJHXIBvDxHDjth8Babp61nGRxF5T+
 CfYA==
X-Gm-Message-State: APjAAAWE8vATarYWEOVyNaMhXi4gmZReF99TrcF4lbX7rBm886sIA5rN
 f6slbNP67elS+XCRFKdjA+93kaHI56zuoly6815VIA==
X-Google-Smtp-Source: APXvYqx/nRQ/X7KNqnRecvbxdlxqFWB7bNfQ6tlWeZpwI/c3mj/FB8lCe8S2CY0VZOFWfjhIapBwmjrd+aG94dAkxus=
X-Received: by 2002:a63:5061:: with SMTP id q33mr18853308pgl.218.1555949822057; 
 Mon, 22 Apr 2019 09:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwmhWoeCry_Z+xL=7N1Pp+74tJ9BCF7nr4Jq1MwqRjfOA@mail.gmail.com>
 <BYAPR02MB58478B07866A63D01DA3EB25AE210@BYAPR02MB5847.namprd02.prod.outlook.com>
 <CAO=notzqWthZ29ghauXdzS7Y8WYeVrnMbbmz6Tgt=R6n_mRRAA@mail.gmail.com>
 <BYAPR02MB5847D889707010DEF7F58A95AE220@BYAPR02MB5847.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB5847D889707010DEF7F58A95AE220@BYAPR02MB5847.namprd02.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 22 Apr 2019 09:16:50 -0700
Message-ID: <CAO=notyZ8Qj96iGYqcPMnkMFSL-Q38-OC8F88oAgpsmu030pxQ@mail.gmail.com>
Subject: Re: Seeking openbmc programmer's editor info
To: Mark Brown <mkbrown32@hotmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 22 Apr 2019 16:17:07 -0000

+ openbmc mailing list

On Mon, Apr 22, 2019 at 9:11 AM Mark Brown <mkbrown32@hotmail.com> wrote:
>
> The openbmc build instructions state that Ubuntu 14
> should be used.
> Are you saying that you read, navigate, modify source code
> in a different development platform from the build ?

Yes, what documentation are you reading that says to use ubuntu 14?
It's likely just out of date.

>
> Also, someone else mentioned Vim/C-scope -- however, I experience
> many "cannot find file" errors and then hangs of the Term window
> under C-scope.

I don't use C-scope.

>
>
> ________________________________________
> From: Patrick Venture <venture@google.com>
> Sent: Monday, April 22, 2019 7:26 AM
> To: Mark Brown
> Subject: Re: Seeking openbmc programmer's editor info
>
> I don't use Ubuntu 14, but generally grep/sed/vim are used most.
>
> On Sat, Apr 20, 2019 at 5:30 PM Mark Brown <mkbrown32@hotmail.com> wrote:
> >
> > I am a firmware guy watching the traffic on this email list.
> > I am interested to know what programmer's editor is most useful,
> > under Ubuntu 14,
> > to navigate and read the source code here, perform multi-file searches,
> > and help find bugs.
> > Which editor is most commonly used here ?
> >
> > Mark
> >
> > ________________________________________
> > From: openbmc <openbmc-bounces+mkbrown32=hotmail.com@lists.ozlabs.org> on behalf of Patrick Venture <venture@google.com>
> > Sent: Friday, April 19, 2019 12:43 PM
> > To: Joel Stanley; Brad Bishop; Andrew Jeffery
> > Cc: OpenBMC Maillist
> > Subject: meta-ingrasys patches required for new merged drivers
> >
> > If you don't work on or maintain meta-ingrasys/meta-zaius you can stop
> > reading and go on with your Friday. :D
> >
> > All;
> >
> > https://gerrit.openbmc-project.xyz/20692 and below are all ready-to-go
> > and some are required for the meta-aspeed bump staged for
> > openbmc/openbmc.
> >
> > I wanted to throw this into an email to it jumps out more.
> >
> > Patrick
