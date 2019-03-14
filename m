Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hSfCHJRg"; 
 dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44L1Sw2hMFzDqKR
 for <openbmc@lists.ozlabs.org>; Fri, 15 Mar 2019 08:05:36 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id b3so7811770qtj.3
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 14:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vXuDGjSBrH0t83kynyhhIgbn243z/RHsSKx2z0V39ho=;
 b=hSfCHJRgC1wO/N01u88LiMka7X6bf+SIdtOxYMCIbcfvrsfnq/HlFEI1qe+yLuosIo
 KNEsZuwoqRSBHH1ALuwRwHMlgHpKwJgkEXOP+Y/KaJk1MrNO6tnf1Nx/xZEqExtOniCw
 7IpaiE6qYg/DA9pnQ0nC34O0ZnQ3dQv8G2e1WTmTL/HcuCSxDgBW1+I7UkaKwPkFXvso
 Rc7P+7IfFDA7Wjgt9zOuZrl9W/3jiK5YV5tgJef3Ryy0omYix2OdoAxBBKg1NCdxvlYZ
 Nz9rWGDgYmslbCgKrdvs1tuaOixXnOGpwkNphewwXFWCUhwFag06vxJYbfoWXrChhzEy
 ONoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vXuDGjSBrH0t83kynyhhIgbn243z/RHsSKx2z0V39ho=;
 b=q2TFRrP2+T1/JHIT6xBEmqCZ1ZwE4hTgtOmpCEwthkHTMRbQ2JRtwlkHlK25++8wac
 73wxQkOcNZnnEszKWE+7xfpzc6Goz+Pwo1EARfbPR7EFZbHmAnW8FY41SsSc/ipE0N+C
 2PkADth5OG2K0pKBI4Kaas57yVVufS8Vesbt4am+iiw3ib6xOt+2lV7t4LrRR5USMLCD
 Q9bBt1VirtP02n7fz6FCmlc+M3oN/cQF+PWgMunh9De+f2ebtbuO0GM72KOQCwPlBZSS
 kJ61NnynXP/T44dPPjGctU+cVk8PBYa4KSZ0KGci/HyeZXjH1ddVdL+kd1BTfNiK08kY
 BhRg==
X-Gm-Message-State: APjAAAUiVExtfXFbN6EHMCHLqMUzH1g60k6kKgX8AnTcmgtH6FpUUJ9W
 WqQtmuYujAANYLkeUpVK/u2rjkN3sJg53MoOyglHSg==
X-Google-Smtp-Source: APXvYqwK/4uHxpXm1jS8FQRiwhKkr4J0hD0gsmXpc1j7tQBpk4N/WrXGudLldRTFc+Xw8g/joBAb+i2Gls9fRaCPbjw=
X-Received: by 2002:a0c:8957:: with SMTP id 23mr1327126qvq.92.1552597531860;
 Thu, 14 Mar 2019 14:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <9D7F7790-90A4-4312-B714-F948FD6251F7@fb.com>
In-Reply-To: <9D7F7790-90A4-4312-B714-F948FD6251F7@fb.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Thu, 14 Mar 2019 14:05:19 -0700
Message-ID: <CAJoAoZmtVEd+-HP6tCQA69tegRm6jt=TBEpbFXRbh1WX_kguSw@mail.gmail.com>
Subject: Re: [OCP] Open Source Firmware Meetup@OCP Global Summit
To: Sai Dasari <sdasari@fb.com>
Cc: "OCP-HWmgt@OCP-All.groups.io" <OCP-HWmgt@ocp-all.groups.io>, 
 "OCP-OSF@OCP-All.groups.io" <OCP-OSF@ocp-all.groups.io>, 
 "OCP-Security@OCP-All.groups.io" <OCP-Security@ocp-all.groups.io>, 
 "OpenRMC@OCP-All.groups.io" <OpenRMC@ocp-all.groups.io>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 14 Mar 2019 21:05:38 -0000

I took the liberty of adding a "Time" column to this sheet so we can
propose times to hold these discussions.

On Mon, Mar 11, 2019 at 10:08 AM Sai Dasari <sdasari@fb.com> wrote:
>
> Team,
>
>
>
> For those of you planning to attend OCP Global summit *this* week @ 2019 OCP Global Summit, please check out the post about the meetup @
>
> https://www.opencompute.org/news/open-source-firmware-meetup-at-the-2019-ocp-global-summit-call-for-participation.
>
>
>
> Community members came up with few topic streams for this meetup opportunity are captured @ https://docs.google.com/spreadsheets/d/1cKAYFP2fEhgBoEBjGrCrOAq6-01nyX53M9rrLaJxlk4/edit#gid=0
>
>
>
> Will look forward to meeting you at this meetup to accelerate efforts in open source firmware. Please reach out to me and/or project leads for more info.
>
>
>
> Thanks,
>
> Sai.
>
>
>
>



-- 
Emily Shaffer
