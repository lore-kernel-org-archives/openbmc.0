Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::236; helo=mail-io0-x236.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QiIsqwUY"; 
 dkim-atps=neutral
Received: from mail-io0-x236.google.com (mail-io0-x236.google.com
 [IPv6:2607:f8b0:4001:c06::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Tmp15rC6zDr55
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 01:01:29 +1000 (AEST)
Received: by mail-io0-x236.google.com with SMTP id v26-v6so38090665iog.5
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 08:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PBKVpC2vlR1C1DFwA4J4rY+2OqXEqcRbw6/5MiR6OQw=;
 b=QiIsqwUYzgjs1g3OtXA7PprTjIjr5ufQRvFivCkL4t7kNNk3QNc3oJmgprSXC3wZZv
 ztG+ELINj51cL7CANCz14P8SIEjnvTIwVaGF+mdvO2vlMkPRxwtKNhakvD6jtH9qgYet
 yAbbOtwZLK6I7G6PizpmqFsHKS8As4fJoZtL+S88yuTwup7CZZ67iHzfmmeSxoxqgVef
 IkVi2o/Z8FaIAtKcRxC2eiyeqyPTYTqJwly0HaHP4WsPAoOLmdGyvItzHEyK1A7y0MBv
 Sle5g98zYjrs5NuA4m4Qd+5wc2py13gcVhuS307JW1Vr5VPANWD/gXgWJj6RZBGM8pn1
 O/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PBKVpC2vlR1C1DFwA4J4rY+2OqXEqcRbw6/5MiR6OQw=;
 b=YtPygc53J4/YwkVuOECs8KaxjofFWj2zn2TKU/J0vSKM2s4VK0nOS++HhNfXmZ3VIJ
 9Bu/aD33ol8mjuBlPdElDcWGuM4FnPC5KQYCROBQl07I6ZAWX/AhG16o+85wPlar0q0G
 9mS+ZrzkVBVS7LuFss9EQPCkV9hrLWc3+JFQS04lGqfKG6Q1NW3kNSO9JrJsfvSxkb0N
 uppuCjhITjVV0EOk5NkPjWgca+J+wfFqZWBNdvDklopfhNy6xU0haocErJ9InBg9L2t4
 bpJ4qzd0a3A87kku0/rbzgiJ9RvSNO/qgScAUofIEP5ZxmpQW7rxe51NnA9LJJJWbx9n
 q77w==
X-Gm-Message-State: APt69E2zsZ/iiT2RIVe15KX+jvcTHq6z3JGBjUED3jH69wlnADN8/k2r
 Hu1pCcaCNLPZWd40Jn/K7fC/vF+wmJ2cKiTiBQ==
X-Google-Smtp-Source: AAOMgpeNNV6kVck3xca2x05LSelRvCFJMOlKdaHV6BnKAW3tPAtTZRP/fGv1WUIqnPL/996aiOvHYeFi+xDXhQNhwkE=
X-Received: by 2002:a6b:c8c8:: with SMTP id
 y191-v6mr39870705iof.295.1531753287011; 
 Mon, 16 Jul 2018 08:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLHVuuMgcEQw1xkGP+H1h_Gxq1Vf0Re2SKjVbPhiAgkxNQ@mail.gmail.com>
 <8df2b64e-b903-caa8-f439-96128f3c9b19@linux.vnet.ibm.com>
In-Reply-To: <8df2b64e-b903-caa8-f439-96128f3c9b19@linux.vnet.ibm.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 16 Jul 2018 18:01:15 +0300
Message-ID: <CAKKbWA7i884rXOd2nKnMKRoOB-sbzwK7YQENGYWiGze-qbN9WA@mail.gmail.com>
Subject: Re: KVM Support?
To: eajames@linux.vnet.ibm.com
Cc: akashgj91@gmail.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 uri.trichter@nuvoton.com, eyal.cohen@nuvoton.com
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
X-List-Received-Date: Mon, 16 Jul 2018 15:01:30 -0000

Hi Eddie,

Is it based on V4L or also VNC?
Does it have HW compression or SW only?

Thanks,
Avi
On Mon, Jul 16, 2018 at 5:03 PM Eddie James <eajames@linux.vnet.ibm.com> wrote:
>
>
>
> On 07/16/2018 01:34 AM, AKASH G J wrote:
> > Hi Team,
> >
> > Please someone share whether Keyboard Video Mouse (KVM) over IP
> > implementation available in OpenBMC ?
>
> Hi Akash,
>
> It's in development... If you want to help, let me know! I'll be
> updating the mailing list with drivers, etc, when it's more functional.
>
> Thanks,
> Eddie
>
> >
> >
> >
> > Thanks and Regards,
> >
> > Akash
>
