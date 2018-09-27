Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XOGjkrMM"; 
 dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42LHZR0r0yzF3LY
 for <openbmc@lists.ozlabs.org>; Thu, 27 Sep 2018 11:40:46 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id y10-v6so722950ioa.10
 for <openbmc@lists.ozlabs.org>; Wed, 26 Sep 2018 18:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+/dvo/FB8m1dpj3MPCy43opFPmU4YzdZEJqL7KBEdBM=;
 b=XOGjkrMMUR4fjln8tfFts42ObDlTV/CrVd1NtF/Bgvvm06wwyFHv424+sc+e71gxbI
 YgbKIcnFvth22Uyo/vrxRQOWtTKMDCHCLmaU8PUqkLoLtWV7cIo4ebxjfJRtOu7hS4YA
 sdfN5YXaI47qXTNn6oZIz1CiazCoS0svTX0uBCI79JUDfM5YsM49PW85x64YzdwCGrlJ
 825UhLslmAkYfyRsGrhSH4FSpFYYgiNrQKKn6BEpkUhVMZHNRhpOcpIbc8NJdt7R5dhy
 9Kpz/uZfaYYgs0IT4CjcYfo0IAeqLOAFdRLl7DKMXwtWwEItG6qKDp/nZApY+Dg0gkaS
 NmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+/dvo/FB8m1dpj3MPCy43opFPmU4YzdZEJqL7KBEdBM=;
 b=MVo/4sMHz1Pe8xTb7UomzLkDWMLJCXmlkXZ26BHlpLX5K+ckSehjZ6KocDlHYvY1FE
 +4e9G8AYP7sPC+fw5HE4WgzFYKnywrOs14bv7KQ3SViGvLs8JDCAKJEar+qvG1GEMdDy
 QSMfvf33YrpqtmuGnxOXi4DpNMRL2rDZy2+6LQ4qAY05OxpFVnZJTGK+4OtIB4Oj2hqM
 LaQrpt41Pd//ZcnK69ut9LLe0Zb0qzQkaU/4oi1Z1pxiebyG5QVrC/HSJOUgYnGF2h4n
 l3T4/nu+GrcgNnmd99c6otd5ZILOM7tbygPAqVW0672cs1B0WgPR9hV1+QWvj4UHMutv
 rH8g==
X-Gm-Message-State: ABuFfoi4jvFXdzH4ludzMTsfYUjmzaRjaQmn0pJ1BPXGIsKPbqfCnvB3
 HsgKIHNIA9rJux24V9he5jVQFe8Y5eCJlgMYJkQ=
X-Google-Smtp-Source: ACcGV613CulC8c7SGOVncGec/gfQncHatRWh69ojo1ulK2YsObDvWkWTYlO73YfpOQ3PInI54UcMTbrWzK/n7vhaGAs=
X-Received: by 2002:a6b:bf86:: with SMTP id
 p128-v6mr7104033iof.156.1538012442258; 
 Wed, 26 Sep 2018 18:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR01MB40382A2AF6BB37B46FD74C1CCF170@AM6PR01MB4038.eurprd01.prod.exchangelabs.com>
 <CAARXrtmyz50-LrWh2UpfiPWuPLB3djkiKZUHFwfDhiN7qkEQ1A@mail.gmail.com>
 <AM6PR01MB4038E359689A3867507AAC7BCF150@AM6PR01MB4038.eurprd01.prod.exchangelabs.com>
In-Reply-To: <AM6PR01MB4038E359689A3867507AAC7BCF150@AM6PR01MB4038.eurprd01.prod.exchangelabs.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 27 Sep 2018 09:40:27 +0800
Message-ID: <CAARXrtm6zitU6c=BMxw+hug_98j_QfDW+Muk-e_0o1qvM-Ppww@mail.gmail.com>
Subject: Re: Question on flashing firmware and bmc image
To: pietro.maltoni@studio.unibo.it
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, a.bartolini@unibo.it
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
X-List-Received-Date: Thu, 27 Sep 2018 01:40:48 -0000

So what exactly netfn are you trying to use?
Please check the code in
https://github.com/openbmc/openpower-host-ipmi-oem/blob/master/oemhandler.c=
pp#L225:
only below netfn are implemented:
* IPMI_CMD_PESEL
* IPMI_CMD_PREP_FW_UPDATE
* IPMI_CMD_RESET_BMC_PASSWORD

On Thu, Sep 27, 2018 at 12:48 AM Pietro Maltoni
<pietro.maltoni@studio.unibo.it> wrote:
>
> Thank for your reply,
>
> Now i see the openpower sensors and if I issue the ipmitool  sel elist co=
mmand I see the OCC represented as follow:
>
> =E2=80=9C
> occ_3_0050       | 08h | ok  |  0.0 | Device Enabled
> =E2=80=9C
>
> However when I try to issue ipmitool raw 0x3A command we do not get passt=
hrough toward OCC, as it seems that the OCC netfn codes is not defined.
>
>
> =E2=80=9CRAW Commands:  raw <netfn> <cmd> [data]
>
> Network Function Codes:
>
>   VAL   HEX     STRING
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   0     0x00    Chassis
>   2     0x02    Bridge
>   4     0x04    SensorEvent
>   6     0x06    Application
>   8     0x08    Firmware
>   10    0x0a    Storage
>   12    0x0c    Transport
> =E2=80=9C
>
> This is my version of BMC image
> commit 282ba3dea1b56d620202e7ffe24cfdb671ceed6d
> Author: Alexander Filippov <a.filippov@yadro.com>
> Date:   Mon Sep 10 09:47:35 2018 +0300
>
> And this is the pnor image version.
> commit 4fd251a60984d2eb39ed5895a8f84b979f5d0b4a (HEAD -> master, origin/m=
aster, origin/HEAD)
> Merge: c50dae9 d8de440
> Author: Corey Swenson <cswenson@us.ibm.com>
> Date:   Tue Sep 4 12:18:44 2018 -0500
>
>
>
> ________________________________
> Da: Lei YU <mine260309@gmail.com>
> Inviato: mercoled=C3=AC 26 settembre 2018 05:12
> A: Pietro Maltoni
> Cc: OpenBMC Maillist; Andrea Bartolini
> Oggetto: Re: Question on flashing firmware and bmc image
>
> The questions in the mail does not reflect to the title, hope you could u=
se a
> more specific title.
>
> On Wed, Sep 26, 2018 at 7:53 AM Pietro Maltoni
> <pietro.maltoni@studio.unibo.it> wrote:
>
> > After installing it I've recognized that oem openpower commands and sen=
sors are not available.
> >
> > For instance when doing ipmitool sdr elist I do not see openpower senso=
rs(occ ones) as well as netfn in ipmi does not contain commands for the occ=
.
>
> What is the revision of your build?
> The ipmi related configs are not complete for Palmetto, and there is a
> [recent commit][1] to add part of the sensors for ipmi.
> With the commit, ipmi sdr elist works ok.
> If you are looking to adding more sensors, patches are welcome!
>
> And what do you mean by "netfn in ipmi does not contain commands for the =
occ"?
>
> >
> > By searching on the code I've recognized that these are in meta-openpow=
er recipes. How can i enable them? Is there a standard procedure for enabli=
ng them on openpower hardware or in palmetto?
>
> Please refer to the below link as an example of ipmi config for Palmetto'=
s
> sensors.
>
>
> [1]: https://github.com/openbmc/openbmc/commit/f47fb7cf87e6d69132f4ca1012=
06dbf091097027#diff-d90eaa8cd7210f2f005894b7f7001d9d
