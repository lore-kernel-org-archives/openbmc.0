Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="KC9Rfw22"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Czsx58FhzDq5f
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 12:32:53 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id w4so7385324qtc.1
 for <openbmc@lists.ozlabs.org>; Mon, 04 Mar 2019 17:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WhNu0FWouAzHmVoJO4qVfpsXERW1kHg7M2yBo8EldgM=;
 b=KC9Rfw22eQqnpu761Jj/v27kkGpCP8ku2w6NiQxGbKndfFp+MYllNjY8UAMzcqL2b/
 VD2pSANmOPwWrqURkAfBka/pmoLXsrGhy9pOAV/0pYkSC67NugDAKJxGYngYPauUdGrA
 mXNqvRjRsKlxdRmwUAJWlNNNbJZxawaKKDjKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WhNu0FWouAzHmVoJO4qVfpsXERW1kHg7M2yBo8EldgM=;
 b=rXPccAa6Ecst5IYYGSreMVLDC9IhxP5dcwGTqT+i4PsBS09YZ9UCNuepvCQf/TbCAo
 P4JuPcZjIetdKvyGKuq7HLam/o+tVxWAmNHm8XROsvEBooS/vaVFh3XrrVaBNh89iPgG
 9AocNU+AdDb2aFUgjLXjpNzlFT/dkMOJaSZ/rluwF9tspHwCbsAjQo4dTpKSq9gq5DL4
 wk83nmx9Fum+DAVQjhSm+exhCO9I232hWku3v9pmHxJov29wDnGpo3g9YVapF4281+q+
 VQa6AYcrcY/RsROhr3cfsqmfOlKPDjdMoXwlBxHhRanf6vciDT65A7tc0SWzkEMLLuwJ
 Sk0g==
X-Gm-Message-State: APjAAAVxskXUSNdp9iSOcEN9OuSy+f+H6sXaQvraeNOZaHHP/pPCrUkR
 33JoqbYc7Uo5J2J6OuHLnm8oeqUy8a3BXF/Ssmg=
X-Google-Smtp-Source: APXvYqyXdXCM2oYtHNbz+QIqY4r+Y0jYP2aXZlTWzj7pFIiQHhfMGd4Cr7RaYwK4rtQilH0k4l/1U/Ld/ZzJx1pYGZ0=
X-Received: by 2002:a0c:928a:: with SMTP id b10mr233049qvb.89.1551749569188;
 Mon, 04 Mar 2019 17:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20190228094925.5419-1-fran.hsu@quantatw.com>
 <CACPK8XcDgnyYpg-QfZOGj5-xTScWUpyhEUigWadGzZQ8kkeH4A@mail.gmail.com>
 <6368ebf3122c4357ac469d4733c346ea@quantatw.com>
In-Reply-To: <6368ebf3122c4357ac469d4733c346ea@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 5 Mar 2019 12:02:37 +1030
Message-ID: <CACPK8Xc-dg+6cu82C1bO=5f4MdyMSANTmn4_MZa+d0KhJTGCKg@mail.gmail.com>
Subject: Re: [PATCH dev-4.19 v3] Add Quanta GSJ board device tree v2.
To: =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>
Cc: Benjamin Fair <benjaminfair@google.com>,
 Emily Shaffer <emilyshaffer@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 05 Mar 2019 01:32:55 -0000

On Tue, 5 Mar 2019 at 01:13, Fran Hsu (=E5=BE=90=E8=AA=8C=E8=AC=99) <Fran.H=
su@quantatw.com> wrote:
> Regarding the part of nuvoton-npcm730.dtsi.
> Please have a look at this link https://patchwork.ozlabs.org/patch/104589=
9/
> This patch was pushed by Nuvoton Inc and wait for the review.

Thanks for pointing that out. I didn't receive that email (a recurring
problem with Gmail and mailing lists).

That dtsi does not contain all of the SoC devices that yours does. You
will want to add the rest on top of that patch.

Cheers,

Joel
