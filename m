Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::231; helo=mail-qk0-x231.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FCC5QVJT"; 
 dkim-atps=neutral
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhjW771pJzF1Ft
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 15:10:59 +1100 (AEDT)
Received: by mail-qk0-x231.google.com with SMTP id l23so5643268qkk.11
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 20:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=KsnX9dykbhRdpiZAFPcgYX33c6oFNHKgkci/FbDsT4g=;
 b=FCC5QVJT7LhezaVK9CgUYJ//0TW5HLHVh058sRqsB1ibryzYdOBSzljKsXam8My8fU
 EEvOAkVYk/m+G40QfPEw04CzR8xcwIMV3jqxOA/f10EIKrcoR6liY/vM119av/w5cGUX
 BobdBv5Ikjj0U6OTINmBqtR3yQozjezINvLbVCJdnCs8MvA7KmmIdVoxd+Y35fDjeZvo
 KokjdISfjJCJO9Zu02cxtQII408LY64vePN2StFwBgg/FLInj04D6H1u/0ec/s9AtBJ2
 PSDzyIic8vCVSMcMMytovV+YZbJX3z1qv1Wp992vS8GjQ4/ohA3Sugjy94e3mfO15vnL
 K/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=KsnX9dykbhRdpiZAFPcgYX33c6oFNHKgkci/FbDsT4g=;
 b=F1mL4wjWoe5aJnnUYnDKaYdsKxYJfKiqwfmpgEsGsM46mk5w6v2ksDsPaOvWuUYg3V
 kjW0aMaqvNCuTUIQVGGub0uls/8LmhhgTjsdDiRViSGeHBIKUccyx6fxEU62tsqSuHwI
 AyLCCF8q2ubb9KvAJud9Ii2ScBpwvcFk9+6VzD8zdlbJWjqgxDvAMizOJhM4iC6OuJuV
 WynmE0KOQZWK1cea+w8V6cr4z1nQZZ1W5aTHreUTpNjEJp87okwbg/39JU3NhHCG8ckP
 0NrfhUblCVW0DN9xCxT12s/lhnwNjoK5dGriMQTKB3w6IwaloCebmBbGpf07OYDhFm9P
 quog==
X-Gm-Message-State: APf1xPBh93004hfcEgUnw0n8ESC2PSojGilr7AKHGBC3bOIkzOBPvv2r
 2/tQyon0xjAxJ2IGoMARbHHeZU38bLNvastmHF73okkh
X-Google-Smtp-Source: AH8x227ENnI45ol9qKZi1rFA8vd+ojhS1nTLn/k9soaDoGZBtWMYhiH59iNhU3NZFtdIXL7Hov3HXqKO1nWnfYf7x7g=
X-Received: by 10.55.73.7 with SMTP id w7mr1972598qka.317.1518667857421; Wed,
 14 Feb 2018 20:10:57 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Wed, 14 Feb 2018 20:10:37 -0800 (PST)
In-Reply-To: <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
 <1517207425.21006.27.camel@aj.id.au>
 <87shaoymux.fsf@linux.vnet.ibm.com>
 <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
 <87lggezywe.fsf@linux.vnet.ibm.com>
 <3d38bc878a5b36f9091588d1fb842c1e@linux.vnet.ibm.com>
 <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Feb 2018 14:40:37 +1030
X-Google-Sender-Auth: UANSzPAfLMF3rbuGvz-L-TO-Jj8
Message-ID: <CACPK8XeoJUqeHotqArbzrKdhtq=f6H-VmSuCyMSep1AA2V7WrQ@mail.gmail.com>
Subject: Re: BMC Image Signing Proposal
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>, Nancy Yuen <yuenn@google.com>
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
X-List-Received-Date: Thu, 15 Feb 2018 04:11:00 -0000

On Fri, Feb 9, 2018 at 6:57 AM, Adriana Kobylak <anoo@linux.vnet.ibm.com> wrote:
> Here are some charts with the image signing flow for comment:
>
> https://drive.google.com/file/d/1IxfMYRttN8RbhRY7PwBmXsqCBvtv_yLJ/view?usp=sharing
>

Nancy, does anyone from your team want to have input on this?
