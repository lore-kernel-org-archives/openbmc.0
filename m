Return-Path: <leetroy@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=leetroy@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bqTBzVGX"; 
 dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fKdl4mpqzDqF6
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 20:09:47 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id v7so1246667oie.8
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 03:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1+QAZlOuzX4zs5uxS9tdT2/DUCZrOF2/DFwxtVty8Cc=;
 b=bqTBzVGXgN8mICzSKsYV/KPLGq+LQzEL1JVJJY0j7tZO4P42ZpdpNfbm2TSySalDBr
 28pPnVBBVzRs/kVf9H5FsI3jA8FYO3fxAuMR5AJILjtky/EwjIceturPN3Z53xUmnkcv
 uo/EoCnJxf30J9gfpkLKdN2wJW6QGZYDzE3IlreVcoXIL4r2VkRr8HJ21Yjt7e7V7e+b
 8NWZfOY8xCGuSZv0LcENgzz0TnVBBCZKoldR0w0pvz2mvyxaSluKgnT+f2lBLb2s4Ko7
 igLQ6l9pZRei5XNjFOtsa0uVNgosBlqO+GK0uSxp3vMVvCo8s8Prz2+zsXi7cZIvlkxp
 KtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1+QAZlOuzX4zs5uxS9tdT2/DUCZrOF2/DFwxtVty8Cc=;
 b=ekKS59nEZAxMO8NBBCQKMGGPoxIQ8yi3+skKwfX6MroL8kmsoXG+BqHr+L0PpvVkBA
 /gV/bcYHSv2VmvoqqemzFUR3U7OkUvZGFNONq+A69VFDFnS8iPR2tm/T1YYXVgHo9+PZ
 rU2K3Y6tvzKiDqZCBwJg2a5PGWzHaxVCVDoHVrSvpo3jfJsOwoWUHQm6Lf3n0+dlKBW7
 rHTbS8Vvqa+QsY3KbCofib//SxfZRTm2Wj+Ym1aBHQTkomrSgHuuFzOgOgyAq7krIFZx
 lKpchH0HVpmg3M89SorFE9SonOc9YprjkOnZtBafYkDlJi3SpWvkqCfcoc5A/LxGuuWw
 t5yQ==
X-Gm-Message-State: APjAAAW+sj3pM9WmnMDBhWq757SgztuDwG7io5tYJGFFwBt9qFSbxJQ9
 9hNGfPeCIeskDXU8nTYqWAF5hYUNj/+K9cr16KY=
X-Google-Smtp-Source: APXvYqy4Sl2HcSwSc5Gd3pzEh079c4AfxW/ut7oHencBv4ysSDBxPhPHNfXhfSgWEDfczK4WMZ3xO+5JivGPQTkxdhY=
X-Received: by 2002:aca:6288:: with SMTP id w130mr1870476oib.116.1554890983653; 
 Wed, 10 Apr 2019 03:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAN9Jwz1y3q3msG28uck2_0oyqNwmACbixHCRiF-hbshZ7ZLTJg@mail.gmail.com>
 <CAPnigKkYwyMKR3Wb2ehajEfmKjHgFdgHTZRXYcsF_RSyBiiKeg@mail.gmail.com>
In-Reply-To: <CAPnigKkYwyMKR3Wb2ehajEfmKjHgFdgHTZRXYcsF_RSyBiiKeg@mail.gmail.com>
From: Troy Lee <leetroy@gmail.com>
Date: Wed, 10 Apr 2019 18:09:32 +0800
Message-ID: <CAN9Jwz3=X-FMaCgG9YNiU3VgtvqA34XRdfaS8rGDXdVgswKS4w@mail.gmail.com>
Subject: Re: Switching to static network address issues
To: William Kennington <wak@google.com>
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
X-List-Received-Date: Wed, 10 Apr 2019 10:09:48 -0000

Hi William,

This issue could be reproduce with WebUI or REST interface.
1. Starts up romulus-bmc qemu as normal, so the IP address is acquired
from DHCP by default, let's say "10.1.1.2".
2. Open the browser and login to https://10.1.1.2/,
3. Switch to [Server Configuration] tab.
    Then you will see the current setting is "OBTAIN AN IP ADDRESS
AUTOMATICALLY USING DHCP".
4. Click on checkbox "ASSIGN A STATIC IP ADDRESS, and DO NOT CHANGE
the IP address, leave it the same as DHCP IP address "10.1.1.2".
5. Click on "Save settings" button.

Thanks,
Vertiv Avocent
Troy Lee

William Kennington <wak@google.com> =E6=96=BC 2019=E5=B9=B44=E6=9C=8810=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:45=E5=AF=AB=E9=81=93=EF=BC=9A
>
> What are the configuration steps you are using to achieve this?
>
> On Wed, Apr 10, 2019 at 2:36 AM Troy Lee <leetroy@gmail.com> wrote:
> >
> > Hi there,
> >
> > We met an issue about switching network address from DHCP to static iss=
ue.
> > If we manually set the new static IP address which is the same as
> > DHCP, the network setting will be dropped.
> > This issue could be reproduced on qemu with romulus-bmc daily build ima=
ge.
> >
> > root@romulus:~# cat /etc/systemd/network/00-bmc-eth0.network
> > [Match]
> > Name=3Deth0
> > [Network]
> > LinkLocalAddressing=3Dyes
> > IPv6AcceptRA=3Dfalse
> > DHCP=3Dfalse
> > Gateway=3D10.1.1.1
> > [DHCP]
> > ClientIdentifier=3Dmac
> > UseDNS=3Dtrue
> > UseNTP=3Dtrue
> > UseHostname=3Dtrue
> > SendHostname=3Dtrue
> >
> > Thanks,
> > Vertiv Avocent
> > Troy Lee
> > --
> > Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
