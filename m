Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22b; helo=mail-qk0-x22b.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gOv4927D"; 
 dkim-atps=neutral
Received: from mail-qk0-x22b.google.com (mail-qk0-x22b.google.com
 [IPv6:2607:f8b0:400d:c09::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhjRq5bGbzF1FR
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 15:08:07 +1100 (AEDT)
Received: by mail-qk0-x22b.google.com with SMTP id o7so15015325qkc.1
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 20:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=hkaV7T+PG+Lqa+IB6jnyzDAoIYPuYFmfqDRaJ8hoM7w=;
 b=gOv4927D6GTVu+pPF+Z8r7ZnDcyEZ2bRCGyrA6y1uVXP412z7nEe3AUE3g+Aw9QIfx
 XQTdhLSLR7rvGPnbUvhyUuu1Mt/BnWQkVbR45Fr2w/6DURHQMp9hQ/HMRdTAjkyB27tR
 3aRmd3RSEvVvAzG59XL8Mc9P0ZhHiwdT3cl10AAGRMbGpLW9V7u468MsnzcxyULw4ioC
 lJlKNcZbQDCC8/PHWai50LMZkr5SBXwu+AGdjWPLHguwvKZTIVoUapemxDbzlKQrO0Bz
 GyMtMHPY2Fq5SLBx6FLkmwdlIVkNVk+IT+JeVSHyV9l4Kzicz/uf9VBzT3bTH4TWsdJi
 wT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=hkaV7T+PG+Lqa+IB6jnyzDAoIYPuYFmfqDRaJ8hoM7w=;
 b=eA25g5xdlFDdMaL5iFQrMNtBpbzHOfp8AupqYSRL+QvZmslKOUdGPMBzlRhxF/Fl23
 voSSX64cvWh8RInC9cM/HVMAPT4e/FN03XHi55zPFFhPfC21J3pcDZeq+dSzaINtFMed
 MV3pol3BAETqGNcqNtMaALCc4vxtnBvD1OA2BlSGTixhvl7wn0zUJlPM5OunDWqjyOK0
 V1Jdh7CIqFTsTedlNSQm402TU+sQ9e83FlXlWPbhD+56Rgup0oLxSJzrdRJSiz3I5LhJ
 ovvSJl9wwGwIqD/3rk/55BnY4vxtMAJQktlLsBbCN4SOmJeoIdzJsNpqQ/aU5raJBU5M
 zQwA==
X-Gm-Message-State: APf1xPBWc++5M4jOqZAQt+Vzrgaupn1nBRIxYJcWzuKOXMlSghbjXA5a
 wV+AJgx9OTti2MIci54DjV5AHUaUYWeItOVtcto=
X-Google-Smtp-Source: AH8x22446WMvqB3Q8TjSsgQpvX+blJKG6heJiSlJsheN3AIqNC8EPKbKPKXyPjXSfKHq8947oJKpQiC/I3cnBUvu4OI=
X-Received: by 10.55.41.151 with SMTP id p23mr858990qkp.52.1518667684431; Wed,
 14 Feb 2018 20:08:04 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Wed, 14 Feb 2018 20:07:43 -0800 (PST)
In-Reply-To: <4a56656038f76ea3a40736f2f824d642@linux.vnet.ibm.com>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
 <1517207425.21006.27.camel@aj.id.au>
 <87shaoymux.fsf@linux.vnet.ibm.com>
 <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
 <87lggezywe.fsf@linux.vnet.ibm.com>
 <3d38bc878a5b36f9091588d1fb842c1e@linux.vnet.ibm.com>
 <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
 <MWHPR21MB086454F2C875043A3B7FCBF9D6F10@MWHPR21MB0864.namprd21.prod.outlook.com>
 <634e8e59f56c0f62e78ece56048c8059@linux.vnet.ibm.com>
 <4a56656038f76ea3a40736f2f824d642@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Feb 2018 14:37:43 +1030
X-Google-Sender-Auth: kJECzbA1NI_c0iNktMMNuoDG860
Message-ID: <CACPK8XfEw9aokeFW10yV=pTbKympFCPNRO9Am8mBQ2GF0NVZRA@mail.gmail.com>
Subject: Re: BMC Image Signing Proposal
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 15 Feb 2018 04:08:08 -0000

On Wed, Feb 14, 2018 at 9:04 AM, Adriana Kobylak
<anoo@linux.vnet.ibm.com> wrote:
> For the location of the public keys on the BMC, seems /etc/ would be an
> appropriate place as the keys are static and unshareable (reference:
> http://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s07.html).

What do you mean unsharable?

> Any thoughts on storing the public keys on /etc/ssh/ for example?

This is where ssh keys go :)

Storing them in /etc/ makes sense though.

Cheers,

Joel
