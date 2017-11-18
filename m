Return-Path: <xow@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c00::229; helo=mail-pf0-x229.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SA57uQxU"; 
 dkim-atps=neutral
Received: from mail-pf0-x229.google.com (mail-pf0-x229.google.com
 [IPv6:2607:f8b0:400e:c00::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yf0JW2b4yzDrRY
 for <openbmc@lists.ozlabs.org>; Sat, 18 Nov 2017 14:07:05 +1100 (AEDT)
Received: by mail-pf0-x229.google.com with SMTP id b6so3281450pff.10
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 19:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ZDEZu2opXTTwAdfhPk951ZOF96JrKv8D2usVl7WbsVA=;
 b=SA57uQxUnR4yEK643sG3aPkfhCFbdRPCAeglngvVFxXIpVUAONwfRgTg6SiuAFRB6Q
 qQZTRge5mi/beDn9HNk8rNZUNtcJbcEnxeE13PoTwfp1r3p6RsEHLnQ2IPcYiBztQbEs
 zo0ppm76Hvqvv/53W4KB+w4Q2S9oTwvQHY/N80MErABckwuHYaoWoG8J8MMIhUbscNgg
 dzG9CD9JW+hQT0Yq5idFhMfJBptXStgevqmUb1OCTj0CVAqO5YkXDjWpASzeZhqHVlX6
 sa5opP21NT3hEqJVx3GG2ZQpp02Rv1VoUVrgWf5jSgR9gYG/FonkDI9bWKWJUu0XFoYU
 bCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZDEZu2opXTTwAdfhPk951ZOF96JrKv8D2usVl7WbsVA=;
 b=fVcCw8XIlQc3C10KCmZ5yG8aFaJFzxZDtoohQwAFhdXeQ30GmYpyn3ZoVl+8TAMiZH
 aM2+Zy87d9bee1TPsM7nFPHfqDjYE9MNM+cZRlxfN1vJHivgfw3TJLdiGxW+jsPYkUlw
 TJjU3mIvufd3umaDSNFskCu7XfVVHTvEqRh2einzIJdnn8UDb69WI4o8BOgeLA8+7AQz
 dBVUvVGoOeJUURAVCbWw82tmRcBqXvL+G5Qpr8Z47WY+K8RYeCKlBQsLiuS02HXkodAG
 FgRu8QESqXaPsc6maFMMtPqz3diHBoNqz4kG6wh4G3OwAMsg/glqtaNLztD0hM/XczrV
 bGiw==
X-Gm-Message-State: AJaThX584H73lK6QlwLwqmQydZPAk+i9+EUAFtfr5Kdc9G+s5zuyKbxb
 kpCGKrxIfrOrNOoORpy0AQbc8/OCtEGlp4g1rkzyOA==
X-Google-Smtp-Source: AGs4zMYFjfp2893apGxgelvDGUMdlbg4pO1MzXt9BYbTOcODxBJ6CqnSIjnoQJDqceC/IQ50gPgIN6UDsKhV9EKyjtY=
X-Received: by 10.84.130.41 with SMTP id 38mr7180102plc.387.1510974423249;
 Fri, 17 Nov 2017 19:07:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.236.183.140 with HTTP; Fri, 17 Nov 2017 19:07:02 -0800 (PST)
In-Reply-To: <CAMNAJg0Qez1EbKUEvgA1-tVbVvowQAiY0qSX21to5ecMWVc7XQ@mail.gmail.com>
References: <CAMNAJg0Qez1EbKUEvgA1-tVbVvowQAiY0qSX21to5ecMWVc7XQ@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Fri, 17 Nov 2017 19:07:02 -0800
Message-ID: <CAPH-5w7mA1v0dsA698fe9iis1SQtUCQGddeR83i14=Jd0F+NBA@mail.gmail.com>
Subject: Re: Valgrind support in OpenBMC
To: guhan balasubramanian <guhan.sac@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Nov 2017 03:07:09 -0000

What BMC processor are you targeting? If it's ASPEED AST2400/2500,
then it's an ARMv6 processor and like that recipe file says...

# valgrind supports armv7 and above
COMPATIBLE_HOST_armv4 = 'null'
COMPATIBLE_HOST_armv5 = 'null'
COMPATIBLE_HOST_armv6 = 'null'

cheers
xo

On Fri, Nov 17, 2017 at 6:29 PM, guhan balasubramanian
<guhan.sac@gmail.com> wrote:
> Hi,
>
> I was experimenting on an application on top of OpenBMC. But apparently
> there seems to be a memory leak that I'm not able to narrow down.
> I am trying to build the image with Valgrind to analyze the error. But
> valgrind is not identified as a compatible host.
>
> Error observed:
>
> bash-4.1$ bitbake valgrind
>
> Loading cache: 100%
> |#######################################################################################|
> Time: 0:00:00
>
> Loaded 2753 entries from dependency cache.
>
> Parsing recipes: 100%
> |#####################################################################################|
> Time: 0:00:01
>
> Parsing of 2046 .bb files complete (2045 cached, 1 parsed). 2755 targets,
> 380 skipped, 6 masked, 0 errors.
>
> ERROR: Nothing PROVIDES 'valgrind'
>
> ERROR: valgrind was skipped: incompatible with host
> arm-openbmc-linux-gnueabi (not in COMPATIBLE_HOST)
>
>
> I tried to meddle with the COMPATIBLE_HOST variables in the bb file present
> in:
> import-layers/yocto-poky/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>
> But it seems to throw some errors with respect to certain assembly
> instructions.
>
> Any pointers would be helpful.
>
> Thanks,
> Guhan
