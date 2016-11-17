Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK8Gj2RC3zDvrN
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 16:06:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HQruUKOs"; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id o1so12549249ito.1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 21:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=L0CI6Z+kal1vYEjwYwYgQhz6k56KdhHPte4JQEkkpc4=;
 b=HQruUKOsXni/NX/riS1yAwh6ndLjDymDVrMlYlPaFkTegpDLMSgtWn/1pwyXwfTSwV
 gOv+MJ4WLSEScP2QVUte+9oQGlGKINl2E71zkp+4V37NKPe+d9fLhfIG9j6i1Dkcx88g
 cRPxlELyANc05T9/kckj+czufKi/yyZHAnJRb44mCxMuXIaAwL90gfarLHUihLTghe7U
 tVbgMjtalTBS4lT/bq4Tlid8E+eRgadWf/fcLPEeOfl8zuaDkvaF1u1IjjkWBjnRNniT
 DwLC7Z3AQjY7W20BDZTT/olcUmCynWODaL6uKLbvjMjMR4j3A5wcmIEHPiDIc0dOZjdj
 ftVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=L0CI6Z+kal1vYEjwYwYgQhz6k56KdhHPte4JQEkkpc4=;
 b=K+eh2c+qb0u249p4Eg7mK9KQRTOIz/ml0J/91iBBIQe0r/qOPccv0ug7OoBskYuDbP
 VeMjd+p/dhk+TlahttvkSxzFmlZdmmgFXFpe8I/obenE2xZ2PHD3VsvSwPKr4dz3d2Oj
 Rt7/yZ0VDWhmDxjLmkP5yW2EMgLKI4f9pQ5d4FA2kaw6Dv0bOAcTz73bzfroZmTx7APl
 ZEsnP+MT1otkgK2DEV9Z5JarTOJDjevxFEtJbrSU35VdCrRSB5jrnWm55rzJb2IosRHu
 9r6MUvyID3uqUbXm/wlnajdEjdjRpRQZNYLwpbi/W69DTU75BMaq+5IZ4Lz0unLPBgfZ
 zRzA==
X-Gm-Message-State: AKaTC02fRiHkpRi1B9/MQRXsW7M6zMBCeQM/NUBRCFMHBhEy/vTwGkYUI2uP+IfRdEAEUIN9FSfxbUpLfINQ+Q==
X-Received: by 10.202.55.70 with SMTP id e67mr443675oia.51.1479359163318; Wed,
 16 Nov 2016 21:06:03 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Wed, 16 Nov 2016 21:05:42 -0800 (PST)
In-Reply-To: <C160D2872FE0DE4683E1910F9BF82941574257FF@avsrvexchmbx2.microsemi.net>
References: <C160D2872FE0DE4683E1910F9BF82941574257CE@avsrvexchmbx2.microsemi.net>
 <CACPK8Xf5OMSNxDN1xnFwSYYbkUSJ9OC_UfD1zFbgu3ZizSJdtg@mail.gmail.com>
 <C160D2872FE0DE4683E1910F9BF82941574257FF@avsrvexchmbx2.microsemi.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Nov 2016 15:35:42 +1030
X-Google-Sender-Auth: vKHyHF1fwMdC-XpkBvb_Wr2FIiQ
Message-ID: <CACPK8Xfm=Uaa9vp9aS7Lx-rwCGXHyGCgo=ayF_L6W6wM3HWCjA@mail.gmail.com>
Subject: Re: Query on image deployment on ASPEED board
To: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 Balaji Marimuthu <balaji.marimuthu@microsemi.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 17 Nov 2016 05:06:05 -0000

On Thu, Nov 17, 2016 at 3:30 PM, Arjun Padmanabhan
<arjun.padmanabhan@microsemi.com> wrote:
> Hi Joel,
>
> Thanks for reply.
>
>> Is this an AST2400 EDK?
> Its' an AST 2400 evaluation board.
>
>> I recommend building on modern Ubuntu or Fedora machine.
> I am using CENT OS 6.6 to build images for openbmc. Is it recommended?

No. I would never recommend anyone put themselves through that. But it
should work; one of the teams working on OpenBMC uses RHEL 6.4 to do
builds.

>> Once you have an image built in openbmc/build/tmp/deploy/images, you can netboot it with tftp.
> Should I need a flash programmer to flash image onto ASPEED board? If I want to boot the image from ASPEED board, how should I proceed? Is there a GUI available for the image of ASPEED board?

There is no GUI.

If you have a flash programmer available you can put the
palmetto-flash image on there. I recommend taking a back up of the
flash in case it does not work.

You can either build the Palmetto image yourself, or use one from our
continuous integration server here:

https://openpower.xyz/job/openbmc-build/distro=ubuntu,target=palmetto/lastSuccessfulBuild/artifact/images/palmetto/

It produces output on UART5 at 115200 baud. On my ast2500-evb that
connector is labeled DEBUG UART.

Cheers,

Joel
