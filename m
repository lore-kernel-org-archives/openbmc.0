Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="FIu9vURp"; 
 dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vFLx3J0RzF3LR
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 15:41:13 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id y16so17371028qki.7
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 20:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ASoZDrjGY1Clfa8vNBdNcRA8n6vYXDHqHWbh391MF20=;
 b=FIu9vURpF8op+1u67mCIwr9EVExIsqalGOWVmCJiWL7O7FthLgkAC9QjmnyBfKz6Jj
 o2EplqDxYnWYcXeT2aPZG2YB1/BJxG4F8eJvfGVmqSvr7SZbs+MVrl0e2ZOTaiE6yklM
 wMATdosh5DTCN3X89Lw0EgvEZ5LDrKui/+3z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ASoZDrjGY1Clfa8vNBdNcRA8n6vYXDHqHWbh391MF20=;
 b=m7VBvzO2voxQIr/uaeTNd1ugGUeDGFnBvCQAFMtfEykBzOQOQxsGgl3EfdlHIAKUiX
 ma3tEPNFEIy7L2KA2P24FmV+uFGjmQy2a3bU0yZxw/dp8Cqwlq999jjWFKvYvBR1ws4X
 eIL54+NX4abKRp1HP2touANf38Goz6aREbBOl9weQug8ylF5byMcg1xwJGRI1Nf86p4U
 2EsB9C8XI5Wp2b4jLiEN8L8e9Hsni6Km/OIGcC7t3H1WCMGYQ5pL3xZ+19c5czq3KN7K
 b2R2QPuAYvKEaEW1mhIGQTIqdgR87i8NtvvzOYZHFBnIyLCg0u79u4tKRn+MJna6cgGe
 2rXg==
X-Gm-Message-State: AGRZ1gI9fjIR8IjpPJX2Cex+5x12y9VLVLJQZzQJTkepXHja6qcofgNk
 HOY65NOA49aIRYOuVnScKbi2nYeL/G5WLuDauHk=
X-Google-Smtp-Source: AJdET5cqBz+HoFAbdzcBlPYKOPXLeV8fuVLoD8HaYMmxHHJ5/dQJ3L6/FsRqPF2cUErTr5107zwI5J/JuDyw2a4+m18=
X-Received: by 2002:ae9:eb96:: with SMTP id b144mr3467823qkg.127.1542084071082; 
 Mon, 12 Nov 2018 20:41:11 -0800 (PST)
MIME-Version: 1.0
References: <0000000000002cf60d057a7c257b@google.com>
In-Reply-To: <0000000000002cf60d057a7c257b@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Nov 2018 15:10:59 +1030
Message-ID: <CACPK8Xc7M0QLB4rp3xf6mWzq-cVKrEFCWm7vhNoORwv3Fzd2Hw@mail.gmail.com>
Subject: Re: OpenBMC Infrastructure Workgroup Meeting Time
To: Andrew Geissler <geissonator@gmail.com>
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
X-List-Received-Date: Tue, 13 Nov 2018 04:41:14 -0000

On Tue, 13 Nov 2018 at 05:18, <geissonator@gmail.com> wrote:
>
> Having trouble viewing or submitting this form?
> Fill out in Google Forms
> I've invited you to fill out a form:
> OpenBMC Infrastructure Workgroup Meeting Time
> Per mailing list email https://lists.ozlabs.org/pipermail/openbmc/2018-October/013867.html, I'd like to find an optimal time for people to attend the new OpenBMC Infrastructure workgroup.
>
> My thinking is it'll be every other week for 60 minutes.
>
> When would you like to meet for this meeting?
>
> The opposite week of the test workgroup, Thursday, 10-11am Central
> The opposite week of the release workgroup, Monday, 3-4pm Central

Do you mean Australian Central Standard Time?

Cheers,

Joel
