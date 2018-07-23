Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::233; helo=mail-vk0-x233.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MCaWBLLL"; 
 dkim-atps=neutral
Received: from mail-vk0-x233.google.com (mail-vk0-x233.google.com
 [IPv6:2607:f8b0:400c:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Z8lM4xKzzDrS7
 for <openbmc@lists.ozlabs.org>; Tue, 24 Jul 2018 04:14:23 +1000 (AEST)
Received: by mail-vk0-x233.google.com with SMTP id k82-v6so782055vkd.5
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jul 2018 11:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=H4U7VnFLlCGJomNm5elMfbX8h3kjQWT308aNxVPGdEk=;
 b=MCaWBLLLStWS3CalXuuFSyw53HYIK7h0PNnYr4Ik78Kin9iABkYmzmyT6RCyznYyg9
 RONu8H3Sj29vxhrOFyd8WdqB8BbjQ5arWkCszLb0stJwQDTzFba62/L5rs3cYmV5pZST
 CLT9cOHEilzf3zkxpT+1wi3W1kkm9MXlDq41RKGMEc/vECPUNDJKBGPd3w6qqjRQAQOO
 wt/iW5VcXUejo3wjxTbnoGZGKyS9y9ngnmp9QUxynrFxok8lXVd6eCFlQPALFR6wMtVA
 bDK8QA+qtD4IdPQm3IHvPa/eYbId/eIv09r/fyQTng5Umjxo/JFmuGf21nVpVNBG45aW
 FobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=H4U7VnFLlCGJomNm5elMfbX8h3kjQWT308aNxVPGdEk=;
 b=ecnwJfB0KGFcH/LOmQGoVjZq9IZl38t3WhMd+dT/2GASFM6uLM6H9LDzlOMAU2dDWY
 jWKlNrFnRHAjYMev9CWpHBOCkn8jN9WvVS61n7GqBXeY/W2rBGSFu7nHwNcnthIViW7q
 ZfgQ7EV1gB+n1ZctEyFvmnYiG5tDGpYgCzm8Xzvbk3s/6afMFL0QLsvDczmwnJjPO8ex
 zqor/78cUPdtTVerYQqwjHOdWV283JyF2LdmjaXIsIs+q21H/72mHIUpyHyf5H8/j6qV
 GS+3c+6owwWuMU9C6stgRdvI4b9R5kQbKEAGFxOl/GBDJgoeLlfJwEvSUkfzV5tCtsXN
 KacA==
X-Gm-Message-State: AOUpUlGoGFf93uh7RCVx9tX92Oe41AGdsqCbvVjtb6h0ECouDzG1GOoh
 mB9RtYbKWoMnzr9GvrXIjQQhfZY3kmTFJVzaIP2Hxiuv
X-Google-Smtp-Source: AAOMgpcqzZFP79v2PF8uWQTwOQWRHVJ4RmLcwt6rkMdUluISxmCiTHsmU0fvOf8XFxLsiVm0fC8R/fu790Bhv8xCbnQ=
X-Received: by 2002:a1f:d982:: with SMTP id
 q124-v6mr1909548vkg.166.1532369658918; 
 Mon, 23 Jul 2018 11:14:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9752:0:0:0:0:0 with HTTP; Mon, 23 Jul 2018 11:13:58
 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Mon, 23 Jul 2018 11:13:58 -0700
Message-ID: <CAO=notyCMVrJ9Ya+PaukB1k1M7KE07ZHnD5prt4CsA0gdfe+qw@mail.gmail.com>
Subject: In-Band Firmware Update
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 23 Jul 2018 18:14:25 -0000

I've started to implement the host-tool outside of google3, and
started splitting up the OEM handler that corresponds with it.
However, firstly, I've submitted the design for the protocol for
review, please let me know if you're interested and I'll add you to
the review.  IIRC, there was at least one interested party outside of
us.

Patrick
