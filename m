Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::135; helo=mail-it1-x135.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pn7PTCak"; 
 dkim-atps=neutral
Received: from mail-it1-x135.google.com (mail-it1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Kfs21lpjzF13y
 for <openbmc@lists.ozlabs.org>; Wed, 26 Sep 2018 11:06:13 +1000 (AEST)
Received: by mail-it1-x135.google.com with SMTP id j198-v6so8461469ita.0
 for <openbmc@lists.ozlabs.org>; Tue, 25 Sep 2018 18:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g+wzXtrEz8NKSnpyTaaZyt5gFAiTPr1vVbPwdRL+/bA=;
 b=pn7PTCakMGqBfnaqOKIoRHJePtlfNzKYknY/rHB2d3pR7PTfdraiYFJlVNTuJ9C1Kx
 R5CefaDsM7Nqj0ImvXMAcG5XNULm6IfOnSG6Mb2eWIRH36Fl2XE3mcCiNn9F0eAnGBDh
 ABqFvR+/lnJcXpI4t7G1/24Gs4NfweDGf81cfB94ohOHAsUAsJl+4vTfT+mINDHQgXN7
 pZAwpM6mPeHsS6cYmeV1PMge1sbcbk/9YvcH5ep9yfb8LTgqesBY4X97LbHSyNHsxN/N
 gsrTaFMSXJcwvn4RZOgPKQgnAsjq/yu8/7xeT4u+wxHCy4gRNWi4lf2MJYDMrZEolZqF
 Bcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g+wzXtrEz8NKSnpyTaaZyt5gFAiTPr1vVbPwdRL+/bA=;
 b=pxWGsiLeB9guxla2Rs3XJt5a9CnPLeOeVj2HB2vWqReC63YdeLkZhV3RzBF9ltBCjW
 U9W5Pddl1kkUrhCN8l3T8jC9RdCb/9uwPyhaoZzBAd11N7EeRpAVftB61EL1U6AcmUB+
 ER4L6tfFCoAjQT/HzKWylkUt9BrM2w/XRn6UChvoz7kFBm38LpmjTPBnJT8TGuygyxYh
 t3hHQyUTyKaCcVirzFvFweKdQR1Tq64fRcduY6xkMpVOuZt1TYJt5JV/aq/53ojLf8cc
 JeoEJDVnyQW+8zwwDaWHDSGsHGu8MJTmL4y2gEq+/F+7n6aOSfpX+yLsmvOgm/SM8iNT
 MY5g==
X-Gm-Message-State: ABuFfoibIcBSHsDyvcYWedCxcCZdcwtYVRS9UuLvvuTncR2+OJQ7QyDd
 8Yz+eARfbU/33n2dPSthat222Abpy5OrbHn7q6k=
X-Google-Smtp-Source: ACcGV62Kp+jnz3BB5/X9w1lEj3JayXPF0ayHuzVJExohChDYWgBdHBLX4n27iDnzz0vLxVLc7RI4mbD2SWAqZYKyQ58=
X-Received: by 2002:a24:14d8:: with SMTP id
 207-v6mr3089953itg.41.1537923971772; 
 Tue, 25 Sep 2018 18:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR01MB4038467F3EE3379826DE33E9CF170@AM6PR01MB4038.eurprd01.prod.exchangelabs.com>
In-Reply-To: <AM6PR01MB4038467F3EE3379826DE33E9CF170@AM6PR01MB4038.eurprd01.prod.exchangelabs.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 26 Sep 2018 09:05:58 +0800
Message-ID: <CAARXrtmUT33K67gCe_NNmo703FsRjDbyi=XjRi3JzLDLLDc6kQ@mail.gmail.com>
Subject: Re: Question on Flashing fw, bmc image and MQTT tool in openpower
 palmetto system
To: pietro.maltoni@studio.unibo.it
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, a.bartolini@unibo.it
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
X-List-Received-Date: Wed, 26 Sep 2018 01:06:15 -0000

On Wed, Sep 26, 2018 at 7:51 AM Pietro Maltoni
<pietro.maltoni@studio.unibo.it> wrote:
>
> Trying to set up a more efficient sensor monitoring for openpower sysem and after a look in the openbmc code and occ we found a probem.
>
> The problem that we were seeing was due to the fact that in the palmetto configuration for openbmc, the openpower oem recipes are not activated.

What problem is it? And could you kindly elaborate what is "openpower
oem recipes are not activated"?

> Furthermore on inserting MQTT support in the openbmc image, we saw that mosquitto is already included in openembedded but it does not build properly because it seems to have dependencies with openssl that it can't fix.
Do you mean you want to add MQTT (mosquitto) package from
meta-openembedded to palmetto build?
