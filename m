Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::235; helo=mail-oi0-x235.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kqbKstbz"; 
 dkim-atps=neutral
Received: from mail-oi0-x235.google.com (mail-oi0-x235.google.com
 [IPv6:2607:f8b0:4003:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VK7K3pkZzF3Jf
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 22:18:21 +1000 (AEST)
Received: by mail-oi0-x235.google.com with SMTP id n84-v6so1567002oib.9
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 05:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yhvOwUjkuzjyJUoRJBUZjbqCGfUyuq7wGyYW4tqdZxk=;
 b=kqbKstbzwrMOj4XyxPdphK6rQGtqCrQz9De+a8b53jwiSKqJfdpXm+TSMfWA7AjnVt
 vjsa3tMog0cakON6Hre95GQ3YuOABDJULp+QyILM3+qAHe10IFp8B0OrogRwxCUw6YSK
 /fyOAXhFPKMijSe9KwhpmmmT/cQesg4Zt4hMgJ2v+EG30HwGyL8ZsqJ4XvpmKgONVNft
 xmb+U7XSbGbkeKRMHLI+FLc0tYrc/nrMEs4Fc1AYe32AteRw1KnvyvSTOIuAhGClrLAJ
 IwLSrJolXcaHrZsA3YcptkxpnlciZ8Nawoy0gVyCYOWMBTiaW5oZb+p12Ue1ay89QNR1
 BSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yhvOwUjkuzjyJUoRJBUZjbqCGfUyuq7wGyYW4tqdZxk=;
 b=ZaeujoD1ofZfgb5WwCFN6fNdwdbJKxIH4BwjVzO7aP8rWOVwx1TDAT4qnaYpjkGyn8
 OlfK+8qtsauSWg+tcMQdfspQxgSFgIYtsfIzMgDeCHHMbPvzgQq2tlntv++BqL4Liz2t
 GJ/JngspfqIKMiBQTiGyJAJ+EXcnEWLEXRyvB6tBNrn4p232Aa8sFNT0VAq+SXfrieir
 YtQ+ybdEMGrqCB3C5EQ2/tz5ETXE5nFG/h0/knDYhznaeW6SksevPGsA8kFkbwWt32ey
 b83JHI7hoiKtU35bSK3qjtEy+gEaj+TMfBw2buZLKJOEpLly1yw73Yu+PnYI/RhtLEa4
 Wjmw==
X-Gm-Message-State: AOUpUlGiWu+hsMmbM6KGUiPyKLdDNZa3GH3tGzjn1vtlU4kgPJ9EqSvu
 CRfks7camaKxL1/TZsQnStA7cwV2PQsLNPbrwk0=
X-Google-Smtp-Source: AAOMgpceWLEmLmStm8tfLTpFaOAK2CyQZdf09YCffx/q6hhdBLRPymy8Y+EUTExbrVzAPsMUhDGP1iHt3z88Uov8lYg=
X-Received: by 2002:aca:4ac6:: with SMTP id
 x189-v6mr1432344oia.211.1531829898952; 
 Tue, 17 Jul 2018 05:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <5D23E7CAADD3BE4A97642792FFC691C561C748CB@MBX215.d.ethz.ch>
In-Reply-To: <5D23E7CAADD3BE4A97642792FFC691C561C748CB@MBX215.d.ethz.ch>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 17 Jul 2018 07:17:58 -0500
Message-ID: <CALLMt=pwQV1PHyB_Ak8C_JORQm6PKE1iAm=XpnBFThg_Wp1ucw@mail.gmail.com>
Subject: Re: gerrit server update coming - 2.15.2
To: ahedges@student.ethz.ch
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 17 Jul 2018 12:18:22 -0000

On Tue, Jul 17, 2018 at 1:18 AM Hedges Alexander
<ahedges@student.ethz.ch> wrote:
>
> Hi,
>
> I'm having an issue with what appears to be the new version of Gerrit (2.=
15.2). I can't confirm my email address (I don't receive an email when I en=
ter my email at "Contact Information > Register New Email ..." and hit "Reg=
ister"). At first I thought the mail didn't make it through the spam filter=
 but it still didn't work even when whitelisting the whole domain.

May be best to work this out on IRC (AndrewG is my tag).  Was gerrit
working for you before?  I think gerrit pulls the emails from github
(since that's our sign in method).  I'm not sure if you can add a new
one directly in gerrit, you may need to add the email you want to your
github account first.

> Best regards,
> Alexander Hedges
