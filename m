Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cigpCTyx"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44392p6lZhzDqHd;
 Tue, 19 Feb 2019 03:54:55 +1100 (AEDT)
Received: by mail-it1-x142.google.com with SMTP id r11so42742128itc.2;
 Mon, 18 Feb 2019 08:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m09BRRypUQM1FgBJmSGNFi6wBNivkbQVP5e5vq0kqHg=;
 b=cigpCTyx7m4NcCpgBztEOEuUiD+OhlfJZHFLyYann73Mk/YWzJiPebHhmbf1QjZvES
 8eYUCBG09N0rZFQnfhOImJ26WHit27pEzNQRvS9GzkneEmdDLcQyhYnnbyYqLDmYlgTC
 P0fjk6TRnEWajEgKwX5VsahHIjawsI4eaojz38tmFN7B+EcPam9mBFtfnkmZm3jx9ayN
 jZqZxvDy3e60NsK/5YepWwL2mGZcdTMPbS68cdtCL5KFr/qpHSTmas5wkoKzWYercEEA
 yRyTfAKMD2PANSTmDdpljv/KLbJXuNbwN8OxHSVWvd39qdi1KQjQKio346G4PevyJYrx
 0biA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m09BRRypUQM1FgBJmSGNFi6wBNivkbQVP5e5vq0kqHg=;
 b=HtzseFP5JC7lbbhrqyUKbozj+Bq/X81MVzkcmgKMxEUjPV6sy2rv0asKXkLGfLgita
 XghYQqNsisrrp8aNYDmE/n4P56NT7srv/lGu+6uuTQv9nOdErSgX0vFTt6gwssL5mupq
 k2FYYK02fiRTYZroxTX6gw0N+c6IYPhqiW9D2Y99ocvrq5k6LYRl1Z4K6WskJ2QNi/qz
 j0d6dNBf27/6RDwpYACBFAgZ0BDhyyRiaFF+PJeJr2CEGVTufsY5TqWYYO+cGqlykjzC
 CmwM4OL0C6O/laSvUXGfHhtQTh94BWMob071qlZYIIhNS8NfoeyhkMDJbqSFxhKgewwF
 Df5g==
X-Gm-Message-State: AHQUAuYwKfSDuX2aBRl8VahVs7W6Bf3C+bLbaMbTJW0QlGyN8zZal4KW
 y4w8n1bklibOJspSCMHvpuz7ywOLUQlbNteAWQ==
X-Google-Smtp-Source: AHgI3IZifjFXhq0vQBojqngHXOeRoTlkZs+R9qaMbrHkAt7DtoeghI+cd1Z5Vx0i2ceQaSG/N4/Wyp/O2UXrw4KWBxk=
X-Received: by 2002:a6b:8b17:: with SMTP id n23mr14121505iod.214.1550508893646; 
 Mon, 18 Feb 2019 08:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
 <1549861046.1162750.1655235472.36317B95@webmail.messagingengine.com>
 <CADfYTpENfKyyoMuhuN+RzD7nCQbo+g8sWS-mxMU0PUS5C-Z3yw@mail.gmail.com>
 <1550013215.2866613.1656755904.44211550@webmail.messagingengine.com>
 <02642911831c76d37123735a2964984f@linux.vnet.ibm.com>
In-Reply-To: <02642911831c76d37123735a2964984f@linux.vnet.ibm.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 18 Feb 2019 18:54:46 +0200
Message-ID: <CAKKbWA6s8DBg-m-aebvRKyb5V3JN7Thqop47OXJ8-jQKYSEfAg@mail.gmail.com>
Subject: Re: Secure boot for BMC
To: Joseph Reynolds <jrey@linux.ibm.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 openbmc <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>, 
 uri.trichter@nuvoton.com, eyal.cohen@nuvoton.com, 
 Moshe Alon <moshe.alon@nuvoton.com>
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
X-List-Received-Date: Mon, 18 Feb 2019 16:55:00 -0000

Hi Joseph, Brad and all,

We (Nuvoton) followed the Secure Boot thread discussion and want to
contribute from our experience with NPCM7xx (Poleg) BMC security.
Joseph, we believe your secure boot view is fully supported by our
Poleg and is already used in mass production.

The Poleg BMC implements Root Of Trust (RoT) in its on-chip ROM code
which is the anchor to start a Chain Of Trust (CoT) to boot up a
secure system.
The CoT starts from ROM that authenticates and boots the other parts
of the system e.g. Boot block -> UBOOT -> Linux .

The RoT  framework has up to 3 x RSA keys maintained in a protected
OTP storage which are used by the ROM code to authenticate the next
stage of the boot.
The ROM code implements recovery options and configurable security
policies for un-authenticated boot scenarios  (e.g. limitted
operational mode or full halt mode).
The RoT allows SW development of various security schemes such as NIST 800-193.

We have uploaded our Security generation tools  to the GitHub
https://github.com/Nuvoton-Israel/igps
The tools are OpenSSL based and are capable to take a Private Key +
Image Binary and create a signed image.
An XML description flies are used to describe the layout of the flash
and the OTP, and Python scripts generates the images based on the XML
files.

We are open to discuss about BMC Secure Boot in the next Hackathon if
this is of an interest to the group.

Thanks,
Avi

On Thu, Feb 14, 2019 at 2:27 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> On 2019-02-12 17:13, Andrew Jeffery wrote:
> > On Tue, 12 Feb 2019, at 11:00, Nancy Yuen wrote:
> >> We are working on secure boot, but we have a requirement for a Google
> >> HW
> >> root of trust so I'm not sure if that fits in with these discussions.
> >
> > I think it would help to have some idea of Google's requirements so the
> > project
> > can accommodate them where we can, if you can reveal any details. It
> > may also
> > help inform others (me?) on strategies to secure firmware.
>
> The OpenBMC security working group has discussed various "root of trust"
> ideas.  The way I understand it, OpenBMC community members are looking
> into different solutions including
> "Secure Boot" and "Trusted Platform Module" (TPM) solutions, including
> Google's OpenTitan chip.  See the meeting minutes for details:
> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI
>
> My understanding of the "Secure Boot" concept is that some chip
> validates the boot loader's digital signature after loading it and
> before jumping into it.  Then the boot loader would validate the code it
> loads before jumping into it.  Etc.  A validation failure could either
> (a) cause the BMC to fail to boot, or (b) boot the BMC in failsafe mode
> where it could not write to its flash or talk to its host.  OpenBMC may
> also need some way to talk to the chip.
>
> My understanding of TPMs is much more limited.  So we are waiting for
> proposals.
>
> - Joseph
>
> > Andrew
>


-- 
Regards,
Avi
