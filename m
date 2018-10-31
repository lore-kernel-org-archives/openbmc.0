Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rMlcks05"; 
 dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42lgNl2j6kzF3Kt
 for <openbmc@lists.ozlabs.org>; Thu,  1 Nov 2018 07:46:30 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id q1so6427866otk.0
 for <openbmc@lists.ozlabs.org>; Wed, 31 Oct 2018 13:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=pDjE+ocTr/0xZdYXW4J01DyKsaGEGNi4tIFTXsp3Dms=;
 b=rMlcks05PkFVBmusxkFUJMGvRuJ298A0HQFENKki1AIgoTQWW9G66xnyuLRZLchBT/
 F9GiMxRxs8GHy2foT4dq6ylWpmPcsKuDeVXS1yQmU2FYnDuZkvztBLahD6iKlBJIDB1Q
 s/hM/aMFKIyueX5u8mYpbWJ0/4fgUgWoB367yOOPIUMlWy5Kzb88nIX20UcMDcBdfilE
 fEpr9IE0LhgV+EU8oIlqHOMdxIKpW/oxjNjo6IYXG/hZ0kMUzHtcKypTEgjbzRJOFqCp
 Pp+58M8FSzc3G2DYM8HYcE7DuahNh67LQFprcUAhSPDFZChWUkjRFALlqkQJr22HSIIh
 1pHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pDjE+ocTr/0xZdYXW4J01DyKsaGEGNi4tIFTXsp3Dms=;
 b=gFQm1R0DgidfqE3HrktZZrCIT1irlfhkVnD1iZTtI3gi5py6PLxOYB+L70slC9uxxp
 OUxjIyG2ahJSQAN43oW3s6ccpfHPre6/P0axPWgLz/oYahlRWfcRVFfeUqAOqhshRZe4
 6U3FNRCFjUmGoi2dUTZ3ulKc7tL+3Io5GFbTJ8uSbdI0m700S5TOOK5t9yNplrEPThiC
 yStBU+xkKew0irpGb+xy2wPLVKqcOjVZjfsIGnKlKnjH8YrtP1NOGdIUYaG/FpVZ+2Ew
 ivn/Ft3oR4De83UgqTUzwVdT6xBjoMSnNUZmOSGBTOczG0koP6H+v9BR8WY+eraKEs7B
 Agmw==
X-Gm-Message-State: AGRZ1gJ57tqtxYxuVWuWPDlVHR6pQ7oNoDUMKWllzLN8e06r6/Mx8Hio
 EwXf09yyJPiJhY6GPMaBlwMUUO4w
X-Google-Smtp-Source: AJdET5d91X5xYK8L1RY02SQbB5WAcwKvGYysnkwrnAvKnufhe26aXD76rjhP4OeyqRcn1miUIc3dUg==
X-Received: by 2002:a9d:6181:: with SMTP id g1mr2733486otk.324.1541018788303; 
 Wed, 31 Oct 2018 13:46:28 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id m65-v6sm9390773oif.45.2018.10.31.13.46.27
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Oct 2018 13:46:27 -0700 (PDT)
Subject: Re: Infrastructure Workgroup?
To: openbmc@lists.ozlabs.org
References: <CALLMt=qiyO0HHqp3fj=XFqCnMx2XWqR-m8Wn+OgSTGBKS5f=-w@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <44344d78-e48f-5eb5-b645-645ff01cf2ca@gmail.com>
Date: Wed, 31 Oct 2018 15:46:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CALLMt=qiyO0HHqp3fj=XFqCnMx2XWqR-m8Wn+OgSTGBKS5f=-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 31 Oct 2018 20:46:32 -0000

On 10/30/18 10:49 AM, Andrew Geissler wrote:
> Based on some recent discussion in this area, I'm contemplating
> forming an Infrastructure workgroup. The focus would be on improving
> our CI infrastructure and the scripts and tools around it.

Actually, when I was suggesting this, I was thinking even broader. There 
is a need for folks interested in keeping *all* of our services and 
system resources healthy, not just our test systems.

I would think that the Test WG would take care of defining and 
automating test, the infrastructure WG would take care of the resources 
that Test needed for CI.

That said, it makes sense for the first order of work for the Infra WG 
would be to bolster the CI Test services and resources. There will be 
big early overlaps for sure.

I'll be happy to help as I can, at least initially. I have CI/DevOps 
experts in my network that I can get recommendations from as well.

Kurt Taylor (krtaylor)

> 
> There's been a lot of great community effort already around our CI
> build scripts.
> 
> Some thoughts on goals:
> - Documenting the existing flow
> - Alternatives to existing flow (ability to use freely provides clouds
> for open source projects, ...)
> - Managing the Jenkins nodes - Bringing new nodes online quickly
> (chef, puppet, ansible?)
> - Managing and optimizing the CI flow (repository CI, meta CI, openbmc CI)
> -- Which systems do we build?
> - Process for adding hardware CI (mechanism for individuals to add HW
> CI to gerrit commits)
> - Optimizations to existing scripts (docker building, CI, QEMU)
> - Gerrit, Jenkins, and build node periodic update process
> - Overall maintenance and responsibilities for infrastructure
> 
> Thoughts or interest?
> 
> Andrew
> 
