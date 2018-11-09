Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lwgv/27n"; 
 dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42rmSL2ZwKzF3SX
 for <openbmc@lists.ozlabs.org>; Fri,  9 Nov 2018 14:52:18 +1100 (AEDT)
Received: by mail-io1-xd2e.google.com with SMTP id n11-v6so365558iob.6
 for <openbmc@lists.ozlabs.org>; Thu, 08 Nov 2018 19:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dJyQXUlztXBOwnemIlTHlsvnEcWomULK0LX+VTOLMyM=;
 b=lwgv/27nVXylUPGvkTbqbLfFKvTFYfvcXh9krLhBGodb0+XMqN+sIC48VfRmEP2/30
 eessNSzAI2n68qK3fFu2ct/U2OCnSs9JzwXJ99VlehWvCTFTyCvSNTvjTAKH8NU0c/MA
 goilkpUfLQVQZmm8EQIjtA/Td1VpluGDIGgoczYQ0DXNezvFcZwfgfBNL0Jz69JeMR2l
 TYHA9MJWyXvLh5waPEyNnj0+5vv9vEiVhk/KSqcd6wLOy8cYIKmE5/4/pXvLzSBxXWDN
 Ma7ld9CVLXfTgo+EPtRok3FzEAdSyx49YLbDcQMY0TQ8GlUkb7NTyNSx5HiCScokG0aT
 2UMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dJyQXUlztXBOwnemIlTHlsvnEcWomULK0LX+VTOLMyM=;
 b=Zadt6qjsIsvqu21npEnCIxCXANb8MB/AFve05jpiNYNTLbS8RDgdIXjPmxEqfMxPUW
 YqzOjFeIL/CQsYxewTYpEH5A8G6vNX4GNkUsfdfv5J5n86JR473csVacMilxe5cqLkmg
 OPCGw4d8OorDtZcknkRAC0wfP1zn2dCgfjEePG0m6eK7ZX1WSONnR6UE+ZoQjlf9hdRZ
 aVyqlDfHt+GVrvjJAGh1q26PwddIzkdx+k23OO7u+0l084VWETKKm+yv0saeNLeXpbZ3
 K4Y82blfIcQhvpvttjAFScJX20H/eMiBCeji2OTJpPmrKOQAptRiyfJaegTaiTsLSiOT
 QNmw==
X-Gm-Message-State: AGRZ1gIrheJLqFmrsH4/Y1PBnFSRcJeBWTcoPAnXKlHZocnjdbdvkiaT
 P54oUItutZmj7bhP4AcO060TyCbdIYZTR/c2uVw=
X-Google-Smtp-Source: AJdET5cnamdjr2er6WVBb0P7PGeLOSOQKIzDxAj1BZ8dtaoqZggSleURB4jqgsbmEYPbf4RrsS2cLXpKoYeb8zUb3c8=
X-Received: by 2002:a6b:cc05:: with SMTP id
 c5-v6mr5877923iog.171.1541735534553; 
 Thu, 08 Nov 2018 19:52:14 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLEFXcushQzAthRY6LNMLfFh9YSVySPFudn+KmSHTqXUYw@mail.gmail.com>
In-Reply-To: <CAE33tLEFXcushQzAthRY6LNMLfFh9YSVySPFudn+KmSHTqXUYw@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 9 Nov 2018 11:51:56 +0800
Message-ID: <CAARXrtkZ8AsP7JBJ_caRfuo9bZNXT5cEbYJy8Xz_8bneP3HUzw@mail.gmail.com>
Subject: Re: Flashing Image using 'pflash' Tool
To: AKASH G J <akashgj91@gmail.com>
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
X-List-Received-Date: Fri, 09 Nov 2018 03:52:20 -0000

On Thu, Nov 8, 2018 at 6:05 PM AKASH G J <akashgj91@gmail.com> wrote:
>
> I tried to flash kernel image fitImage.bin to the flash memory address 0x20100000 using the following command.
>
> root@zaius:/var# pflash -a 0x20100000 -f -p fitImage.bin
>
> It exited with following error.
>
> About to program "fitImage.bin" at 0x20100000..0x20371e20 !
> Programming & Verifying...
> [                                                  ] 0%Flash write error 3 for chunk at 0x20100000
>
> Please someone help to resolve the problem.

1. pflash defaults to operate on the PNOR chip. If you want to flash the BMC
   chip, you need "-b" argument.
2.To program a flash area, you need to erase before writing, so you need "-e"
   argument.

Putting together, you command should look like:
pflash -b -e -a 0x20100000 -f -p fitImage.bin
