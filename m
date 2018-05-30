Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cs+B9oBD"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="XPAukQAv"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wt7W2bB8zDr69
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 00:21:27 +1000 (AEST)
Received: by mail-qk0-x244.google.com with SMTP id j12-v6so11123976qkk.4
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 07:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=0MWFD2tLgSKkX99zvUsqhxm93VSMYNEa5yKzuLSV+FU=;
 b=cs+B9oBDG5IERGdf1hdTkrmUpErYKjxYsKVSOkq+WFe7Q1OTYiyZn1Bj3/vlF+F9kM
 hmHWcbMv1hHetWHDiVakPsNG58zD4hTgKOAlpRohufh/l1YgKHjBFtaMn10XSEg4dtXR
 Mnus8o3y/QKRAh/eGmvwFmFbD1oTX2HbavEgZJk2iRE3keWZrp46MKsWaMQ+YADwLhVh
 DbYHvRRma7L2kQfAXQuGTcf0Kwl6rYGJoq2EMqSYC6uPNaEQjI23cWbKyB8WfiNk9m2q
 /zokWH2wGCReMpdgG+PE+1kU7DQU2MfPTuXGdhMzdd1WcYNoDWcDoElBiiJZzeDoKLoD
 asJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=0MWFD2tLgSKkX99zvUsqhxm93VSMYNEa5yKzuLSV+FU=;
 b=XPAukQAv0MS6bVybLNEex4iyCQrbKQtN2WfY5RHTuPfUYvUaKKY9pooArED0DmDK1g
 WwQdMg+iHGJD6pGpZSvFyHbFVeoW9wuhsEoSIhnjB5++muQdrOdqKaVv/jiCb9FCt+Ui
 LKem0IU5/9UaeV7eGWKWiS6+MlCHErQn+0D+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=0MWFD2tLgSKkX99zvUsqhxm93VSMYNEa5yKzuLSV+FU=;
 b=lITDN31NTUvacxrs4ZH5FR+5QjDz2i8n+7gLIb+ukgulZt7VSqVRm/+iTO00VyXk93
 R5xo2O4jSmqgPUxUcwikqCe4j346S6MEdfmObBKIfo3we0YJ0xeyRcsvp1kmowFUnpZZ
 CGzduKqyzgT3xmN1BfqMPLVxW7Xdla+zrWAlM+/hZC3vA1Tltf7arq+yigvZgsqfPakV
 hJxhES3Lafp4HTCjZXuidBalCIVwz3xxOzArLpoUHTmCa2h4mC4h2dK4GoaX5itkYZm8
 Nfw01nbUvyTUZuwhFoOCasGayfSd6aoSvIbwoft6wpJaMV52PgL/Kw/ojpOTyfDSS54V
 Ea1Q==
X-Gm-Message-State: APt69E0pfRmrBkp+LDm9P9LO2xu5/t5glaFTVADwhTn+83ZXYwIXSoHV
 b6cVY4Ilr8w13UsdCihOlu2twzbFGyByXBTtY9g=
X-Google-Smtp-Source: ADUXVKL8ljZMpC7ZAMDArUNhyRBZfU4tCuseO4WlOr2WsM7Vdj6UMAd2GlEVv/nkE7aCqEFIKDj7qpOLA/1IXLiFNRA=
X-Received: by 2002:a37:6983:: with SMTP id
 e125-v6mr2478704qkc.352.1527690084310; 
 Wed, 30 May 2018 07:21:24 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Wed, 30 May 2018 07:21:03
 -0700 (PDT)
In-Reply-To: <1527621398-26526-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1527621398-26526-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 30 May 2018 23:51:03 +0930
X-Google-Sender-Auth: hpzgOxdIwJLwmapLhRG2OVufwCE
Message-ID: <CACPK8Xfw_Ui+S8eqfk=R3_mDkJKuw=0F47Ebdn0XA_QZaxr4-A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 0/3] i2c: fsi: Fix locking and simplify the
 driver
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
X-List-Received-Date: Wed, 30 May 2018 14:21:28 -0000

On 30 May 2018 at 04:46, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> This series fixes up the FSI-based I2C driver. Thanks to Ben H for the first
> patch.

Thanks for the series. I noticed you got some comments on the version
you sent upstream, so I'll let you re-spin this series to match those
comments.

On Monday I'll apply the upstream series to the dev-4.17 tree.
However, it would be nice to get these fixes into the 4.13 branch
before we move on.

Cheers,

Joel
