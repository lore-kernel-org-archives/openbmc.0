Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22e; helo=mail-vk0-x22e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ZpPwpByz"; 
 dkim-atps=neutral
Received: from mail-vk0-x22e.google.com (mail-vk0-x22e.google.com
 [IPv6:2607:f8b0:400c:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z2lTH59kdzF0Bx
 for <openbmc@lists.ozlabs.org>; Fri, 22 Dec 2017 08:41:39 +1100 (AEDT)
Received: by mail-vk0-x22e.google.com with SMTP id n2so11073412vkf.4
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 13:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cJdzKm9Fn8NutxEiZLhxBcW1G9twdW0LNbqq4ONPEio=;
 b=ZpPwpByzk8Us+hrgbJPR4UB+AASx9MgW/FCwcom3rI1LfRSYL21fxm2iz32TyAustJ
 VB2cRfXZLxwVRhfG/6skEPf23brZI3+Up/n8ErkP3+GaJy/IU77XlIgvPYkRHxJWCevM
 HUDC7e+7hdRtpXdoYeaGNNZ+I8efDi9N8M0Fmj//mWUJ+LY9uaeQWm0r4jhjSC1Mt+jz
 Qi0TuutzkFuXLSAG1zgW1S8zyqZDmu8HELk0n4JOU99UhTVxrpd7IW++EcOajorGccMP
 8LkD3i6b86Ts65B8G3d2jo9DOz71ziJxjJ+YHwUZgGCBGsAM7y0h71km5R0Ses66KYlK
 6dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cJdzKm9Fn8NutxEiZLhxBcW1G9twdW0LNbqq4ONPEio=;
 b=E6bRuyS25ZO0RntuJppHK8+unpnYQ1YfMLhQ9z0DWwpa7lHC55qVleLKIYr7JqPDWV
 o5zNE3CqtzE690nnMYob1BCTbH7TpZ4e3Njjklr9EqLDTatUd4xoffHXvWxrhWSQtzCd
 TqHQvK93YBwz0rt6AP3vRgABPwU11vqf8n612ktCUyJdz/MH/IxP6p+AUt6DQwYpUXgi
 8zoOUbe+1WiMwATpFwgN6tA1DLsKVt5Yfp/ghYkQ9CMwOyZWV25zcf+DVXCS+WWAldEa
 cbp+fZ8lW6Ad9/Kb/mxb2soLGNJDgfdA2nLH5n5s1UnJ/Nb5cf+6ash2IHD6p/EMfpVa
 /3zw==
X-Gm-Message-State: AKGB3mJ8+VhFYawe3YkOzgUB/Sk8dPS0KXBW8+fijr9ATnD9ivcBJJUq
 ZGwFDHHNFFrc9UYU7aJys8otlNdsDboSNkIYmp8q5g==
X-Google-Smtp-Source: ACJfBoujSc/xS2xyCt6333VAxU6X5DY7mKf3HvJ/veA1eswfIrnxK6sH7MqdRDf2ECVMnlA567aK2yhGiSWVApClnlM=
X-Received: by 10.31.55.135 with SMTP id e129mr10938221vka.127.1513892495570; 
 Thu, 21 Dec 2017 13:41:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.164.82 with HTTP; Thu, 21 Dec 2017 13:41:15 -0800 (PST)
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F4B253F@ORSMSX114.amr.corp.intel.com>
References: <7E9441B1E5EFFD4681F54958E82169932F4B253F@ORSMSX114.amr.corp.intel.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 21 Dec 2017 13:41:15 -0800
Message-ID: <CAO=noty9Z6VuPtyuCgSqVeT4jRon4=YfwzHid=8zup50gA8u4w@mail.gmail.com>
Subject: Re: Request for a development repo
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 21 Dec 2017 21:41:40 -0000

On Thu, Dec 21, 2017 at 11:16 AM, Tanous, Ed <ed.tanous@intel.com> wrote:
> In the hope of being more open with our development process, we=E2=80=99d=
 like to
> create a repo for hosting work-in-progress applications, and applications
> that don=E2=80=99t really fit into the other repositories.  Internally, w=
e have such
> a repository, informally named proving ground, where we try to build out
> concepts to test new applications, modes, and put the things that are
> specific to our platform that don=E2=80=99t really fit anywhere else.  An=
 example of
> a component that would be contained in here would be this:
> https://gerrit.openbmc-project.xyz/#/c/8197/
>
>
>
> With the goal of being more open, we=E2=80=99d like to find a way to make=
 these
> prototypes available to the community sooner, and have our machine target=
s
> build some of the components while still in development.  The options we=
=E2=80=99ve
> considered thusfar are:
>
>
>
> 1.       Acquire a repository under github/openbmc, possibly called intel=
,
> possibly called something more company agnostic.  Here we would put our
> prototypes, and things that we would like to enable on our platforms.

I vote for this option with a more generic name.  It would be handy
since a lot of new daemons or work has nowhere to really be staged.

>
> 2.       Start our own repository on 01.org (Intels open source repositor=
y)
> and simply make our platform recipes in openbmc point to it.
>
> 3.       Create repositories for each component under openbmc, and define=
 a
> faster SLA and process for requesting new repos.
>
> 4.       Continue with our internal fork, and publish prototypes to
> repositories once they fit some definition of =E2=80=9Cdone=E2=80=9D.
>
>
>
> My personal preference would be #1, but I=E2=80=99m curious if anyone has=
 any
> thoughts on other opinions on how this should be done, or have better
> options that we haven=E2=80=99t thought of yet.
>
>
>
> Thanks,
>
>
>
> -Ed
