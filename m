Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::234; helo=mail-vk0-x234.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JxCI6LIm"; 
 dkim-atps=neutral
Received: from mail-vk0-x234.google.com (mail-vk0-x234.google.com
 [IPv6:2607:f8b0:400c:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 416l6N5H6GzF1nH
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jun 2018 01:39:39 +1000 (AEST)
Received: by mail-vk0-x234.google.com with SMTP id b77-v6so5913902vkb.5
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jun 2018 08:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=140EmElTuSc3S8GLdISj3JHdOTdYC8rtni/5Fld0lHM=;
 b=JxCI6LImYFciYTiJPDLmrUYm2m+B+M2ra8c3AUhDNmLPVchy1+GvxzCLatu6mHcjIa
 5fyziSg/5HghkQ0LghCrMcAyCfz5DdK7ZG+p0tlyT/7YFrKVfkz0ns9EU91GaZc0LkW2
 1PgxWncY+/vcaZw8XJ6ua+FbcwWt36WjwGwJMZEsS3WksWiTerCjbIhAtduqF1veucyP
 wEawMuZUhqgMLtDKOdCoikdO/gr0IgaTxzNbHXJ/TOkxxh8e/2rqCkVXrsgEeejPvqTl
 cl5bMrjm+YiigkeJ/DjMPL9MKFxFb1SlN6YWIfW53wG5CvgFr9CAcBpoVWTB+ysDKy93
 S+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=140EmElTuSc3S8GLdISj3JHdOTdYC8rtni/5Fld0lHM=;
 b=nt3iN3TRXZ7qr5VAIMt1VeS3wA0gjXkPiS+fjhy2r1DAOZ4erwDX/i9s6OPaf5/sTS
 T6MoPv4R+bMHLlOJ0AWxs4Q5qn1Yuyn0dikRvR23Q6eKq4hDQ1FpplBjGLIq7LTSL+LA
 Uyr6BDZt/11VYBUfDKF03UeuuEs/oK/KbgWAusritG7IDCT/DhU34TIxsIA/ee98j/uN
 ER4nuNUzEEOYHtXpIA8REDcbxAFD81QZuAeYMqj7IXNxLA13DcnXmpKmK299DMO+34mI
 orlwRsTZ2w7be3uXi5H0e9BzPLO/4Xec9C561IID6/ba19rBSIAg5PcJmf2FIlUNVJAx
 alWA==
X-Gm-Message-State: APt69E1EnoXVsZTpgGSxBeFhRaxIEkNsg1tutQKDTy20u+nqR93O2nXB
 0TuEcW7UDeofLJXp2ZWIb11UXuA1SqCWfF6jl9EYTA==
X-Google-Smtp-Source: ADUXVKJ25NnZCYaVHIresgQE92Pk20FrCbnpW+aNeqFxwL0ZhQmOnLayhbIvaGIQ0teiZL3CY6drjF4UMpHutWxdWEI=
X-Received: by 2002:a1f:6601:: with SMTP id a1-v6mr1284172vkc.73.1529077176577; 
 Fri, 15 Jun 2018 08:39:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:bd94:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 08:39:15
 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Fri, 15 Jun 2018 08:39:15 -0700
Message-ID: <CAO=notwpFu4WwDBKfSt7-C8VuP6CusZGg3hThsAcdRwSD0yXZQ@mail.gmail.com>
Subject: New Feature Request in phosphor-pid-control
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2018 15:39:41 -0000

The thermal pid controller object only supports one input.  The PID
parameters determine whether its goal is to increase or decrease the
fan speed given a set-point.  My primary usecase was to have the value
as a margin, if the sensor value is 15C, and the setpoint is 10C, then
we're fine because 15 > 10.  However, if it's an absolute temperature
your goal would be the opposite, to speed the fans up until 15 went
down to 10.  Because of these opposite use-cases it wasn't clear what
behavior would be taken with multiple inputs.  We have another program
take dozens of inputs and make one margin value given a configuration,
and that's what is passed down to phosphor-pid-control.

My proposal is to support multiple inputs to the thermal controller
and there will be a new field in the configuration "min" "max" that
will decide the behavior.

Patrick
