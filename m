Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12d; helo=mail-it1-x12d.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LvykuxWU"; 
 dkim-atps=neutral
Received: from mail-it1-x12d.google.com (mail-it1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43YZrV4HPnzDqLq
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jan 2019 12:47:22 +1100 (AEDT)
Received: by mail-it1-x12d.google.com with SMTP id h193so3975870ita.5
 for <openbmc@lists.ozlabs.org>; Mon, 07 Jan 2019 17:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Numfc7dVpXgldG/jr0Zc8GdOkPwnOzXbnD8zAaITog=;
 b=LvykuxWUB/5Q5DkFDpkSkYy65tJ+x348UjmioLIN3q+bkhSGwrcqYg6Mps59n+p4Uz
 93hQlnh/EsLwU1blh/a9m8PS0kkkGTNVDAfLQzIO89nYtOaC74i1VrMvH3RLhhGxy16a
 /YdfXMDV7GDAa/khdYe+MIhm3WgKdENy6yG3q6aASr47ghHE76JDi8XQWxLp5AyaNPIn
 7NtCnH2AUncAS0u4i+fJw1M7Wwajy9gxDt/+eH/2DQPMAkPZKYA5PzfO+VqPWECk2PjZ
 1GgCbruSPKjbLGocwvo4vODvPHa2jFqQ+e6Y8xDx/7C8W9zbZHdsjV6Ag6C97m7BBgra
 1AMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Numfc7dVpXgldG/jr0Zc8GdOkPwnOzXbnD8zAaITog=;
 b=nvp6MQ/JJexaODJSCn1MI9oFWo9cvvmrU5mgOsMnuEHPra29pnHXKicyETctswSOdo
 NxW+sgLipSC8ja6njbSBKtBdsEXLwBqEEnPUwRHIesCUpAyQAygoDHblSCqTB3j5WntH
 lhM3wXGaYySVK1S1AaOACKf0yr5zrJokfu2RRr3JAdSZKi90fkDBLmFu21SpChr2ircw
 K3lXtMGox+tpOlsIqsnfZYyi4A3D3c3KCRFcubXNn7HlzWu0R1Ba0jACr9wZwFOyXXjO
 00cSccGsOY+5hiPR1HpIqI30NaRNSjeI82LC9XmJXaMoqsMTXlRyivZ+zfvX/DnZRfVM
 6ikA==
X-Gm-Message-State: AJcUukedSwk8fkm8dS/xZhTTz+F7mQv9weKbCSlAVrAPdtlMMCa9K+aJ
 vn9vb5VcpZoyswlVlKcdmTvlGsBpTM6wPyFouUnVK3HaM1s=
X-Google-Smtp-Source: ALg8bN7CLxRX9Q3f/+jihN/xzQLw402IsZDSX3bCOPhgDkqpe2v4E4qNcVUTgMFOf61ioDHp+AyuL8hIR/roLyYBO1U=
X-Received: by 2002:a24:4ac3:: with SMTP id k186mr134133itb.76.1546912040188; 
 Mon, 07 Jan 2019 17:47:20 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtniNa3XejKfasL-YwhVtu9siXLQk0b6hN71XzUbX7xDBQ@mail.gmail.com>
 <dbfffa82-52f3-b09f-a6a9-ac909a98c749@linux.intel.com>
In-Reply-To: <dbfffa82-52f3-b09f-a6a9-ac909a98c749@linux.intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 8 Jan 2019 09:47:07 +0800
Message-ID: <CAARXrtmDsBET8vRZ67bNO_si1NMCOn21Mz8ZcNi55EN-peFBRA@mail.gmail.com>
Subject: Re: About the usage of ipmi user management
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
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
X-List-Received-Date: Tue, 08 Jan 2019 01:47:23 -0000

On Tue, Jan 8, 2019 at 12:08 AM Thomaiyar, Richard Marian
<richard.marian.thomaiyar@linux.intel.com> wrote:
>
> Hi Lei Yu
>
> There was an issue, when libuser commands was decoupled (which was
> caused by another commit not merged). Same has been merged on Jan 5 US
> time https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/16934/
>
> Can you please confirm, whether you have tested it after this. When i
> tested the same is working fine. Please check.
>
> if your openbmc SHA is after 4b04e1fff12efc02ef234b37293958f7fc1c11f5
> then it should include the fix
> (https://github.com/openbmc/openbmc/commit/4b04e1fff12efc02ef234b37293958f7fc1c11f5)

I was on yesterday's openbmc master (dc21ed5), so it should already
have the patch.
