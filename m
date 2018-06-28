Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::232; helo=mail-qt0-x232.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nf/A81mj"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="cniQVoSJ"; 
 dkim-atps=neutral
Received: from mail-qt0-x232.google.com (mail-qt0-x232.google.com
 [IPv6:2607:f8b0:400d:c0d::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GRFb5fTVzF1Nj;
 Thu, 28 Jun 2018 14:12:35 +1000 (AEST)
Received: by mail-qt0-x232.google.com with SMTP id o9-v6so3627844qtp.3;
 Wed, 27 Jun 2018 21:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=FcyLcZW4/T6IGX7pMbswQ4WwGic9hwaq4a6s3YaMnv0=;
 b=nf/A81mjZjmFt9CN00EA8OC5rQ10q9meENrB92ieziMfmtCD6/yJ0RGOQ/7NtEEIXD
 w7wtywPdJhHtyJyGXHTo0jEUgw81TzfJs7PT/nrAzxzaZyjjGoqztUkBPNjgzplgxhee
 M91YG4fgd4onq6I238hmVfKsYFFdbHvBagPWJF74oTEK4RH9u2M2wN50y/tHZstoHAIw
 OUFGluDrXTGLGk7s8mmUVe+dKOO207VJpB/lN/eYiXLbFJp/IPOCTTO0A4h2uXBq01Aw
 zKKAVrvWr3OOeZyNR72z0JYfBI8TjIwVUgPu6y0kYlEY454WYwtllTFcWeAGAE+nmlTs
 UsJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=FcyLcZW4/T6IGX7pMbswQ4WwGic9hwaq4a6s3YaMnv0=;
 b=cniQVoSJwV1yuhBdmP8VySSdhsLCEfXmuF46NCZ/CJn5b58cHig4AxnQH0HTEHAagA
 42VzvDz2XsEUOTswxVKKuVdAqoCSflCR0x0+Cs5RFspgJQYR0VVrpgat3z7mDUnkC3/l
 Td6QM2osbUFe7s4+QZ1NCpIjo4wSX/ypJlYqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=FcyLcZW4/T6IGX7pMbswQ4WwGic9hwaq4a6s3YaMnv0=;
 b=fWyrgNymgG0dEivk1O1jb47i7orAQRJpLjL7wNW2TsPfGmvbBwjL8UKjwGcQsaU/Z3
 6VecUXN7KBuve266NiPavwRzNkrp3Zhmhsh8NtMWu8YHuaXv8A2xJ+4yy7dMg9RLygph
 xxIYu0ataY+kC/eqOPukTitOmyKiCLhqHaZh33M4xwzUF6TPcH/oR9uJFsHTdUWCIzh9
 6+laB+1FL8kwkH33JBQJ4MTgqI/0IwpRxw/OlrJCkMPuL1z8htQ6TuUAgQvIXQYR6Kpg
 JyC5lS0a5Z2ONSU7qe+8R/z68SJYnaaSztLXc5alx40gLvGkIYxwoTS9r6tyablkSRDz
 QICw==
X-Gm-Message-State: APt69E2SeCffflcqU7NtvpnivHpw8nP7y4kMbBbSfxAJ6tw3jNBxwmEF
 MC5tls4dQaDzVvwh4eisrJqQEs4+HdEnFrkve/E=
X-Google-Smtp-Source: AAOMgpe8BZ37LXT8LzMOtzBjrl+7sqAsgUZ7b2SBtzJbw5XIE2JoVEoVotbHbjVVfBUf2irQh3MRTBDlCDcPb6F94uk=
X-Received: by 2002:a0c:9b93:: with SMTP id
 o19-v6mr7873993qve.89.1530159153653; 
 Wed, 27 Jun 2018 21:12:33 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 21:12:13
 -0700 (PDT)
In-Reply-To: <20180626232605.13420-11-benh@kernel.crashing.org>
References: <20180626232605.13420-1-benh@kernel.crashing.org>
 <20180626232605.13420-11-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 13:42:13 +0930
X-Google-Sender-Auth: MekCtuqhv1P6kvLe-wfes2C_BKU
Message-ID: <CACPK8XeAg8v-9-PX0wxP7tK5Eb3JrgdPUYaOpRPnzEwtW0BfXA@mail.gmail.com>
Subject: Re: [PATCH 10/14] fsi: Move various master definitions to a common
 header
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Thu, 28 Jun 2018 04:12:36 -0000

On 27 June 2018 at 08:56, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> This moves the definitions for various protocol details
> (message & response codes, delays etc...) out of
> fsi-master-gpio.c to fsi-master.h in order to share them
> with other master implementations.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
