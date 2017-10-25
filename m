Return-Path: <raltherr@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::232; helo=mail-vk0-x232.google.com;
 envelope-from=raltherr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SwmCZbRI"; 
 dkim-atps=neutral
Received: from mail-vk0-x232.google.com (mail-vk0-x232.google.com
 [IPv6:2607:f8b0:400c:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yMh9D3tFnzDqmr
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 07:11:11 +1100 (AEDT)
Received: by mail-vk0-x232.google.com with SMTP id g69so794028vke.5
 for <openbmc@lists.ozlabs.org>; Wed, 25 Oct 2017 13:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=taLTAyhceQQf4l0WBtVXbbsnBy35Z1/DFdSTVcZiOa0=;
 b=SwmCZbRIjyhxJqtex9olK0BPhKthJzX2m+PUCWWE21wGs+YL+bHgWvxrMHEUSIyh4j
 Tu5gatAInejXKufDuKnwxvEVByP53dz5rwaSmfazsnDRMsn7Pm1zk4Ujd4HXGHJXMDIs
 uRZ1L7TXUtlK6R7iMf/MsNK+EnzqYkAaqjDMknkclkmBWN7DH+oHmDfPyrrY2rYQIHlY
 b3aeP/rDg2KWLAbyVjb0gV+riSJPT74Aax8Tai5v3iEnoDugA3TzVJECas5FiuxAeKS9
 1WlI1urg8qoXVLkyzOao03IEgS9Nj7FxhkOfuMZWvCKj7m3P9rW0kVG0/ewkTfUxsFiG
 0OGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=taLTAyhceQQf4l0WBtVXbbsnBy35Z1/DFdSTVcZiOa0=;
 b=GqkWljMcs83tDQvjGaVGkeC6hBJVfC3gwPWr7IaDtb3JX0GZJ5zKC8WStHQUph8JNF
 Ys9D71HOLJd6wxOzz9QKnN+OV//0HjZkPggRN7f2Y3RQV3Ngwt1AnqS9h0EMbCD/yuXE
 Yuqb+8pJnBxHt2QhZbdD3MBNRukQ85YLrgDWOg8J74p4/3R4VsOtKEks/5/YDyf9MSJW
 0ANsE+CcAXfjPFJc6Pi/Si6+tF/NPl3W5yrXmc7kGId6HZK9FQ3ThddxngpvL75ekXBF
 I4+iybDYxJXg2Y4PPNQirsZ5oZVkuehDO1GNzASiRxpnGehW3ww/Gqz1nPSiadM81x2v
 xmvg==
X-Gm-Message-State: AMCzsaV05nQR5JEKSI9RVoSLbzqp1ghYzE50wHyGhiZE1k+sDTOYK+HS
 zfKQzZyzkQM4aMrvM0Cyia7kCrb/YyFUaUkXEIopkA==
X-Google-Smtp-Source: ABhQp+TsGhvBEqFSiWnmCaboFPUb5N7H2OdFx46W1lB2L/l1KTXxL6oeW49663Isy7fgAHdZS3YokdocdMKSGHlkOF0=
X-Received: by 10.31.76.129 with SMTP id z123mr2391874vka.158.1508962267926;
 Wed, 25 Oct 2017 13:11:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.70.4 with HTTP; Wed, 25 Oct 2017 13:11:07 -0700 (PDT)
In-Reply-To: <a90a276b-2fce-fef1-919b-fbce3625af8d@elsoft.ch>
References: <2971e0b7-6339-35f6-b0e3-1901020ed46a@elsoft.ch>
 <7E9441B1E5EFFD4681F54958E82169932EAECC2A@ORSMSX105.amr.corp.intel.com>
 <a90a276b-2fce-fef1-919b-fbce3625af8d@elsoft.ch>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 25 Oct 2017 13:11:07 -0700
Message-ID: <CAPLgG=mfchDw0hS8Eo76=8DdEnNJaWa3rGa4z1BmAFzJvma9xQ@mail.gmail.com>
Subject: Re: PECI API?
To: =?UTF-8?Q?David_M=C3=BCller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Cc: "Tanous, Ed" <ed.tanous@intel.com>, OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 25 Oct 2017 20:11:14 -0000

I'll gladly review patches that propose a new kernel subsystem.  Based
on Ed's comments, I expect it would be very similar to the i2c
subsystem.

On Tue, Oct 24, 2017 at 4:12 AM, David M=C3=BCller (ELSOFT AG)
<d.mueller@elsoft.ch> wrote:
> Hello
>
> Tanous, Ed wrote:
>
>> What are you looking at doing with it?
>
> PECI seems to play a major role in the communication between the BMC and
> x86 CPUs, as a lot of the system control/status infrastructure is only
> accessible by the BMC through PECI.
>
> Possible use cases may be:
>
> - Get CPU temperature.
> - Get CPU machine check exception info.
> - After a cold boot, delay CPU start until BMC is up and running.
>
>
> Dave
