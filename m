Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22a; helo=mail-oi0-x22a.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HPVIbieB"; 
 dkim-atps=neutral
Received: from mail-oi0-x22a.google.com (mail-oi0-x22a.google.com
 [IPv6:2607:f8b0:4003:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41XJ943FNPzDq6t
 for <openbmc@lists.ozlabs.org>; Sat, 21 Jul 2018 03:41:44 +1000 (AEST)
Received: by mail-oi0-x22a.google.com with SMTP id 13-v6so22769763ois.1
 for <openbmc@lists.ozlabs.org>; Fri, 20 Jul 2018 10:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bO3X0A05wAX9DpZCGcp+voQfxIsg07q0kwL/i3mdvpg=;
 b=HPVIbieB8djkM212kW389K44x1QUHoaXm93uEOnTEWTnIFMJE+ermQ8pz83Ui4du4t
 7xTCGYgNGvRkNXjarmtzdzYAY3RKrMhNisGDEEbnDvnu5q0/T3GnPGbJLYIo4Mr4Lj3F
 78bV3wIDlY3TnDHj0RruDn9NNQQP1JjS/faEleVqLluYSWCK6nYNMM5jUxdGpmtbrx7j
 t8FIo+m30TnuBN+5ejVVgvDX+VfkZWXb/KWFiUM3Ef8eG14fjXhvG6C/yAAu4xKw3ACh
 DJYmPnKMQN4eMpPDXoHT9L3U6IjreU6PY6e5O0y5/XI4XoCBI6pQua2LZ32MJHLNnWQr
 4wfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bO3X0A05wAX9DpZCGcp+voQfxIsg07q0kwL/i3mdvpg=;
 b=GXchpLG/yCYvpF8UiSNlKatMvW3Pi+HjcGLhliA3nScQ1ydupKiozx+T3C3RazmpD3
 WDtLkaXApQj3zlSRAoo0WNx/5DQigYOKQcKFKetKjaJZyYI4U0Ed3wYl1OOnRikrfh/I
 3KUvIRaMaShKsVJ1Fn+/I7AriRQzDLmI8tYmD0oVfYbv2LDT1MVVymAXfq1+vJWvbb9O
 zanjgo7pwFzN/BGxtcLBsyseHgjsOkioH7ldvZk3vr312UZsVyT/Z7h6K+QjPioTsJCn
 7Hs1enQiTr6s1103ZY26+xtW8wuYsk6HF0SYxBlNOWGcE/pdxjFNcAt1Gfnb2Vrj+d2S
 XEIQ==
X-Gm-Message-State: AOUpUlH9kPkDmTck8mRtwS7q3IJWem63vIGsxqlghGRoK/C8R5j8Vhw2
 /YP5ZnnP0g7IPxYIoYr9OwautyXVsz9lFyoop1E=
X-Google-Smtp-Source: AAOMgpfBB9fmrif6+5LejbUUYx2YwehCabkWmO0Relf2BGL4U5VDcps1ic0p7U6EVs1PrYzFlq8z17M498TW+/L2yvw=
X-Received: by 2002:aca:b909:: with SMTP id
 j9-v6mr2929183oif.257.1532108501763; 
 Fri, 20 Jul 2018 10:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <OFC1A0F558.EB78B1DD-ON002582D0.00149A34-002582D0.0014CFBF@notes.na.collabserv.com>
 <d8ebd772-7566-cd23-28f8-b2e98982f2c7@gmail.com>
In-Reply-To: <d8ebd772-7566-cd23-28f8-b2e98982f2c7@gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 20 Jul 2018 12:41:30 -0500
Message-ID: <CALLMt=qUzt55cL47j3+vKOKaqFQpKXiMps0FVJHVwd8jJeF-aQ@mail.gmail.com>
Subject: Re: openbmc test work group - wiki
To: Kurt Taylor <kurt.r.taylor@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jul 2018 17:41:45 -0000

On Fri, Jul 20, 2018 at 10:58 AM krtaylor <kurt.r.taylor@gmail.com> wrote:
>
> On 7/19/18 10:47 PM, Sivas Srr wrote:
>
>
> Hi All,
>
> Have https://github.com/openbmc/openbmc/wiki/Test-work---group  created this page in our
> wiki for upcoming test work group. Please review and provide your inputs / raise questions if you need any clarification.
>
>
> Thanks Sivas! I'll join and help however I can. When would be a good time for a kickoff meeting?
>
> It looks like the initial list is a good summary, where do we start, what is the most painful thing to fix? Also, is there room for remote (third-party) CI testing in this WG?

Second this one, Brad and I were just chatting a bit on this the other
day, how could we scale the HW CI testing with third parties.  Would
def like it if we could discuss within this WG (and any other
improvements to our CI process)

>
> Kurt Taylor (krtaylor)
>
> Sivas R. S
> E-mail: sivas.srr@in.ibm.com
>
> Automation is good, Identifying Defect earlier is better always
> 9902233500
> 08046678273
>
>
