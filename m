Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x22d.google.com (mail-yb0-x22d.google.com
 [IPv6:2607:f8b0:4002:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wpBtP1tbxzDqLd
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 15:30:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tNtPqLoz"; 
 dkim-atps=neutral
Received: by mail-yb0-x22d.google.com with SMTP id f192so1125895yba.2
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 22:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=9czXV4UhZTb3YdiO9Iu+EPUnrui8NOTveyjVb1E90+k=;
 b=tNtPqLoztEdjShBCFKW6wHegHhaQn7XYZ9G2n12V2WZya7Ul4YgPXzm2wfDH9MJM/P
 +dyM9jJxM9g+9DF26iwPqDZRgc2RClu5eNIfiLcvKT5mSrbLCfNqFZtRkWk88l8JVsbM
 1KEDk8kwnpJh9redDjsnP5r1ek0qFHG0Gf+ITskYJ80rxMgXjokPQkpSupt8okXtrg5w
 HZe77k5IPVtzQQLCvwY0A1EfEDva2+A3ISU/cFk5L7TTC/O+bhMNTfMWjTOW8XQ/oJqc
 OqzZX/WzUCUaI+pMy1sP1hl3q7oh5F8Uos7hZF0vrBA9YT2dU/t5C3WTC8hQ1FRCRsbr
 LmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=9czXV4UhZTb3YdiO9Iu+EPUnrui8NOTveyjVb1E90+k=;
 b=jlpP2haaltPN6Tf0BA9hRd2x/jf02KSSPZfnd9YvjMNw9dNJ4PwwZw6prHzjGiNLpy
 SRZ80yz3vWVFchJeQU1EyP3cn5MHKiOvdwwvOivbPisXFDk1cl/vfD8mKGS7rpb/qBOy
 GeX6ZDmyykJiGl59Eb0fRUqXFq6y6aC7DlANGnUFBW2LohEhpTMNq+q0WHhBPXPSr+bP
 iLayohJOPvyDMstiZIDuiFjqFFw3IOjMG/NFpzBerEyGcQ/Ais/C81dQpyjwclgDsbGk
 TfHA5gi0mgZqPK50KaVaW+sT6jOdFXK5xEMQWr6v63HPcG9x8rPhf2Bo9ynyhCp8L5Qw
 fGzw==
X-Gm-Message-State: AKS2vOwez1Co2yt41/lJf+UleLE9BLGjJsWgsFU05r2Sdc0W+aN+OcRS
 NU+Ck+PQahvkyjKjhLZVC2AO/Ee4iA==
X-Received: by 10.37.88.193 with SMTP id m184mr2862345ybb.39.1497504650487;
 Wed, 14 Jun 2017 22:30:50 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Wed, 14 Jun 2017 22:30:30 -0700 (PDT)
In-Reply-To: <OF6B672B6D.E6759427-ON0025813A.005D800E-0025813A.005DB2CB@notes.na.collabserv.com>
References: <EDE9FA85-CF2B-4B72-9974-1E92EE9EC676@rackspace.com>
 <1497022202970.71679@rackspace.com>
 <OF6B672B6D.E6759427-ON0025813A.005D800E-0025813A.005DB2CB@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Jun 2017 15:00:30 +0930
X-Google-Sender-Auth: aaCJx2bEuQBwdhXFLYZ7MELj7aA
Message-ID: <CACPK8Xdi8bQWYc5QErBi2rJgMfEHLLOdBW7MoasUdK2tpk-GaQ@mail.gmail.com>
Subject: Re: Switch up eth0 and eth1 to BMC shared and dedicated resp. ( Zaius
 )
To: Adriana Kobylak <anoo@us.ibm.com>
Cc: adi.gangidi@rackspace.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 brad.debauche@rackspace.com, Chad Somerlot <chad.somerlot@rackspace.com>, 
 ryan.dc.yu@foxconn.com, Adrian Barrera <abarrera@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 15 Jun 2017 05:30:53 -0000

On Sat, Jun 10, 2017 at 2:33 AM, Adriana Kobylak <anoo@us.ibm.com> wrote:
> From: Adi Gangidi
> Sent: Friday, June 9, 2017 10:06 AM
> To: anoo@us.ibm.com; Kenneth Wilke; Brad DeBauche; Chad Somerlot;
> abarrera@us.ibm.com; ryan.dc.yu@foxconn.com; Rob Lippert
> Subject: Switch up eth0 and eth1 to BMC shared and dedicated resp. ( Zaius )
>
> Hi Adriana /.  Ryan ( Foxconn )
>
> Right now on openBMC
> BMC Shared      = eth0
> BMC Dedicated = eth1
>
>
> Instead, Is there a way we can make sure the BMC dedicated comes up as eth0
> and BMC shared link comes up as eth1, in Zaius / Barreleye G2 ?
>
>
> In how it works currently . you could have BMC dedicated be eth0 or eth1
> depending upon the hardware config ( Whether or not Broadcom 5719A is popped
> OR de-popped ) . That could confusing to support operators who don't
> understand the nuances .
>
> If you guys are busy with other things to make the change  , can I have your
> thoughts on if this can be changed ? I'm guessing this is a u-boot change .
> Any thoughts on how we could make this change ourselves ?

You can use a udev rule to ensure the devices are named as you expect.

Cheers,

Joel
