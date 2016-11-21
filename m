Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMg9j6g8pzDvPc
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:25:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LWiwRr2i"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id v84so20834032oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=QnbhJYUNtdE0GnZ+jndUxMyYkVvrQCaDvsBI5BdFMHc=;
 b=LWiwRr2iCNbVoEFvDE/PRWc7gr//tsnEzzk43xnKJpTialq9ma8XMhk4j5W/gLObc1
 CnDDvjocPL3OVBcQ+qgxf2InGhaSoXh7YN0ktlzqPEjF71o5U+q8bNmprC+ZO3IlJYTR
 Z+aSpAxUDgf7QjsgVZbR+757LSH/co8nyWF8NUIhThTNeLMuHNm3YbXyBedHpBZagho6
 JNDgl0ol8yWDXjIUxOrNTBPY0rrmmghMMgswj/7R4loRKMFf4QKZKK5TL3yzUpG4mKye
 dkjGBkmna+lC881jMUSQS5/LUck/h4js5cEKLfhgdmMw3rfvAgAlb8lXU80d0FairAx4
 MS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=QnbhJYUNtdE0GnZ+jndUxMyYkVvrQCaDvsBI5BdFMHc=;
 b=aNd4FLSQzbvFa/rb5cyLTKlckahORi4nYg+Bo6wDUQHKueDqb75Lz9hJ2WCFZx4jLa
 gSmcepspd1dW8ot7M1VKNUc26H/R2Xccgt24Wk/s4Ff/XHlV2CcXgfvdOM7uGqFMdw+E
 RXWG+WOwwrSQ4mQPJpkdfnoRBs8cFan1dPEnCIP4tEyy94gQVdw3ItyYrJy/CuBTd3kJ
 N57/T98Py3Uzfo66VR9ojp//a5EclrGXGULtqhmlI9ZXjHzqj7uRaye8jSpuEVkz6kRn
 1XpNSvk99oR5T5ey/nGJUNJlq3lIC8FjyYUn11LmxlOmpRSFPXh6FtC4MqxnOdWF4cpQ
 3KSA==
X-Gm-Message-State: AKaTC03pZvsVnM0Y2KJQXp5xZUFqUJDBSNiXS5tBsqfmSOwvXm2PFGUHu7v7vPRQpoiDm7fFIvSTzBcVyihkhg==
X-Received: by 10.157.36.36 with SMTP id p33mr8484213ota.8.1479713128122; Sun,
 20 Nov 2016 23:25:28 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:25:07 -0800 (PST)
In-Reply-To: <1479478938-13267-2-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-2-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:55:07 +1030
X-Google-Sender-Auth: KO07nQ9_HSvqZJegNQGnODvw2yM
Message-ID: <CACPK8XcEba=pf266c6yTsnAMPV_Z9YzCY02odT94VPrq5qEt=A@mail.gmail.com>
Subject: Re: [PATCH qemu 01/38] m25p80: add support for the mx66l1g45g
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Nov 2016 07:25:31 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/block/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
