Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::244; helo=mail-lf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sks9qGSf"; 
 dkim-atps=neutral
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yS9JP3vbKzDqlM
 for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2017 14:17:57 +1100 (AEDT)
Received: by mail-lf0-x244.google.com with SMTP id 90so4725107lfs.13
 for <openbmc@lists.ozlabs.org>; Wed, 01 Nov 2017 20:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=cDWN/cq0Nq8dr9sF5oPROxIzMjfoAnC6Y97HPBTCa8k=;
 b=Sks9qGSf59dO8CzJIA5CtnB1SkjdffSuseQaeOpBX5sA4x5xw1J0qjvptsqoMLFzYi
 238YSwkSG944SbqmuRtaRJAnZUnfVG8GMZbbzXFzgRd04BJCv4/9qG+gBq6ju8v9XfRk
 g5H00JO8f7/uTqteyqojWSBgG5Ol69dkDuRFJQXS6GljnfhIRhau89/144LMZn6W9E1G
 S7cVsg0yUTMrkCZQp852AG+xbtqIBfblRPlOsA7BldAFlM/ArZQmZz78U7xvioAqPu+f
 aUw47RSTHSrcyZXCTanSbwb4Kr7pq10ZYtPgtsOTmSf2/xnML8LQTFhCSXf6sw+p9+vl
 ulqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=cDWN/cq0Nq8dr9sF5oPROxIzMjfoAnC6Y97HPBTCa8k=;
 b=HtjZ6jkatRxQ0PCyMCqCFE4Hm/6D6qMkbH4Kbaeiv+OqnNCc1Fm2/Ab6YpUVoSA2Pf
 VyIG9o+GXzoRpCy3DWm1KjUJN4BcDLucH4Jh/ChlGIilXHY7/az0dYmZyYfbRAl0WDM6
 MYih6x5km2zZEysL2t9lScRfUW1OtTE3HVOWIOXeZshCFh1ryHwmELKjznxbS2lAQSjb
 HVBAhLw0WhSOsZOmmL3XiV2+NZz1x29GkThNA65VFKicIlYFZiUTc1REN30Ndufr7wou
 QlZ8y5to3SV56HnowCgLn8K3F111luLmGtIZDhdMgcIsT6d5dt9RHZzmPbKfd06yiQG+
 Uf1Q==
X-Gm-Message-State: AJaThX4kD+wDkcZVz2aGhKQgL8pIm4U/Uy7Jd8y1F221SQfOynKpvCNK
 MvvCVBfUfevOrHltgWH6rFF5Xsgs15o9qYU7g2k=
X-Google-Smtp-Source: ABhQp+RCvoZLkM61DN3/IvKdrcjreCg55jV/Y1KKqrDbA0LHzLxRNu3RP3Sq0FOUGO+w+r0sZ86Wq4sNJ7ni4HR5Pg0=
X-Received: by 10.25.99.216 with SMTP id v85mr610383lfi.257.1509592674646;
 Wed, 01 Nov 2017 20:17:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.6 with HTTP; Wed, 1 Nov 2017 20:17:34 -0700 (PDT)
In-Reply-To: <1509589519-26697-2-git-send-email-mine260309@gmail.com>
References: <1509589519-26697-1-git-send-email-mine260309@gmail.com>
 <1509589519-26697-2-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Nov 2017 13:47:34 +1030
X-Google-Sender-Auth: hYlm8_Bn_-wQ0DeuM3_5fmpZ9K0
Message-ID: <CACPK8XcQfgYZVjaKg2fEb6k6YN9Hy1j67oMAasuxw0mUo1+f2g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 3/3] ARM: aspeed: romulus: Add w83773g temp
 sensor
To: Lei YU <mine260309@gmail.com>
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
X-List-Received-Date: Thu, 02 Nov 2017 03:17:58 -0000

On Thu, Nov 2, 2017 at 12:55 PM, Lei YU <mine260309@gmail.com> wrote:
> Signed-off-by: Lei YU <mine260309@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

When you send v2, you can add my reviewed-by tag to the commit message
for this commit.

Cheers,

Joel
