Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22d; helo=mail-oi0-x22d.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mYoIF5tG"; 
 dkim-atps=neutral
Received: from mail-oi0-x22d.google.com (mail-oi0-x22d.google.com
 [IPv6:2607:f8b0:4003:c06::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QdFF5PNDzDqx6
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 22:10:41 +1000 (AEST)
Received: by mail-oi0-x22d.google.com with SMTP id k81-v6so48775675oib.4
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 05:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2FT1WQZ3K2UDza/usWQzCChWlVYMSlOQPwtrcbnfo+s=;
 b=mYoIF5tGol1W7KD/OKK9TQpx0KxOswRXvKPQNd24njfd0hUonrc0RZBjcknVgJtksb
 c26KMhlby20M317fB+uKIFEh3rYJZGmnLpUPB537L3jCJ37BwboQB441TTicrh2BzFm2
 daa2oD8KU8K3Z4nADrAfTsY8C8fn1idppZj51nmm1ixuCWbSI8EojL3RX4PjkrR9hC+U
 KmILO/KBVC8t946MvgjLyNXTEIecZkTo+ti3WUWL+qQOf47VRYdPOjG7TfvMOxVcy3ua
 NAUR7YUZlwtvV03q7eP/xaDY1XReOsA+2YiHu0vJ8U+w+z2wJjVrQNFsAngaUkoE89Be
 bh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2FT1WQZ3K2UDza/usWQzCChWlVYMSlOQPwtrcbnfo+s=;
 b=pCIbMeezjRwVvD1bIWyY5P8jysatUhHM3r5eLVEH37NAHesj7E4d/Z2+lQxSVTVCYG
 9hrtkI7+7DgZGRbWHIIGb8J1zhhuM/XOH+9ofi0ChMTfDnIZcfAOvvo8Swkw5TfY8C82
 YLHOQrbi/ejYFxB5F5C+KCibG2XiIV9TcMWBu3BOYtlZfOrjfpg7e+7Ohwp1lO5pzW14
 MfY28jPeafCiTEwDbJsNir+LAnlDO2yQhRT7Nuh1A6I3d0AFcT+ad+DrVY1J3UknSjJp
 cMYcfGO3nWBwScZ6/Pk+zptcV2Y4RZHz4yZb/tCPu8Vwy16nZODUSJXI6JQw4iwDfaNZ
 UGng==
X-Gm-Message-State: APt69E0r+mAI8AdUvHgwpK8ojLuBIWsgQxiGFk22ASDgS9ewK1WHKdTd
 Eb4K8/z1XQ5g1TmhMrmlG3iimqFBVf/4oSBag5w=
X-Google-Smtp-Source: AAOMgpdbi+n02u5FiXyils/UoYYEad3Qh/HAg9DeL4aFYYrjgNkeXLai4S5ZRsPueJrc82HVN7LYKUhIGRR2My1f/hw=
X-Received: by 2002:aca:c585:: with SMTP id
 v127-v6mr35067530oif.348.1531311039441; 
 Wed, 11 Jul 2018 05:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=o8yNPgjuvC_gDhqVR5TrrdA5pszi+vMmAmATGmZC1w6Q@mail.gmail.com>
 <b562920a-329f-d5c4-28af-555e4bb3bc33@gmail.com>
In-Reply-To: <b562920a-329f-d5c4-28af-555e4bb3bc33@gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 11 Jul 2018 07:10:28 -0500
Message-ID: <CALLMt=oO7x9MtCNrmFzrXCrmYEiVys31cLJJat31N1y89nSZEQ@mail.gmail.com>
Subject: Re: gerrit server update coming - 2.15.2
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
X-List-Received-Date: Wed, 11 Jul 2018 12:10:42 -0000

On Tue, Jul 10, 2018 at 4:33 PM krtaylor <kurt.r.taylor@gmail.com> wrote:
>
> On 7/10/18 3:13 PM, Andrew Geissler wrote:
>
> I'm planning a gerrit update in the near future (this Saturday
> maybe?).  Anyone have any issues with an update (or know of any issues
> with the 2.15 release)?
>
> OpenStack is still on 2.13.9+ (we're at 2.14.7), is there a problem we need fixed? No issues, just curious.

A few months ago someone asked when I was doing the next update since
they wanted some of the new user interface features in gerrit, I said
"a few months" and put a calendar reminder to do an upgrade.   So no
big reasons, I think updating periodically is a nice way to avoid any
security issues, and (knock on wood) it should only take about 15
minutes if everything goes smooth.

>
> Kurt Taylor (krtaylor)
