Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="A+P1ts74"; 
 dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Q1l21R7VzDqNF
 for <openbmc@lists.ozlabs.org>; Wed,  3 Oct 2018 13:31:09 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id f18-v6so2722132plr.1
 for <openbmc@lists.ozlabs.org>; Tue, 02 Oct 2018 20:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Fq7AvpWchMUFlO2vWisjHMHhvDLMzJu3L3HTcuULXA8=;
 b=A+P1ts74gBJksk3dcCxVMVWCttzWiJ+YrP+p055ETkvOWllOIzglDEjW7rKJHE/3GC
 IWIvUvmAQ3p52I3uYms1oIRQ58ANi5AZqrGqaocYINleSLCoRRUWiA/SZMQ6q8D2iZ+n
 ybLgYpYaHnmyvMqKreX6gU0iZoFL+x8G7QLS5LvA1jEgDkFw5+XSnbQ/0YOCrI9qeXpF
 Ybh7g5wRYBj5S5EwRPKiXKUglbTWTHZQMT4kbRujJfmCr3grpmWoOVWSmITUG0yMxvO5
 0TRw7ZcNc+qCK5SXP65rQebhuGzvNXaCufJXVESf9TpF9la4RLqeAB2k9/iJivnwixth
 6Ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Fq7AvpWchMUFlO2vWisjHMHhvDLMzJu3L3HTcuULXA8=;
 b=qeUYTtEBNpbU/Y5T/gS2zLbcm6DYUiTD6Xg3lB8xAr/5FD3BTOEf9zAs6oh20DGfP/
 GkG+y6kvWCUBgKg4JJDipY54BlsgTOjul8OWZ5soPAOxvQM5KCoJ17BX+rDTYpFpWLcV
 xI3O3dH0rjqed8rNEVgs26GAlcHgvMiA6u+84bbKVmSDFmYhILRnCgiRtWy8qnTbowIG
 D86Wk/rKW7wxbkdxWOsgdZl60CZwWcSrVfUBrjUKiUL5Bvm1syM2KqyxgCDO5VJOG4HQ
 2xH1pGRnC+3BlTSc0pTKllul3Qg2XvHLQSH1jSlw4DYjDGpzlcPY+hlmNA5teNtf7ANk
 N2Pg==
X-Gm-Message-State: ABuFfohhH0FhVH07SjhcBm0iTAgKfFSXnECCAyBH+PHJ+6ZtadjOnEp7
 qXGEb2ISZiDnG1PUWznsBCOvDS7jIwE1Eg66H2mA4w==
X-Google-Smtp-Source: ACcGV62n/WQ5mv8XdebbhX76o39dlNIR1RsvMyYWYXpZMBu1OpuG4XsWwXLwHNcRVW10oCPNMfeeKaMulGspUigWSHE=
X-Received: by 2002:a17:902:9a98:: with SMTP id
 w24-v6mr19855765plp.109.1538537467809; 
 Tue, 02 Oct 2018 20:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz0ibE=yZOtg4DE-onDDOWKHvPx_pRTp6OAH7JqRfH3dw@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E8216993458541EA@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E8216993458541EA@ORSMSX114.amr.corp.intel.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 2 Oct 2018 20:30:56 -0700
Message-ID: <CAO=notzzNBENF=Jk=dCA0xrX+oqGt886k6ir7d_EZhTBb6MwPg@mail.gmail.com>
Subject: Re: OEM i2c over IPMI
To: "Tanous, Ed" <ed.tanous@intel.com>, Peter Hanson <peterh@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 03 Oct 2018 03:31:11 -0000

+peterh@

I believe it was a more flexible approach.

Patrick
On Tue, Oct 2, 2018 at 3:39 PM Tanous, Ed <ed.tanous@intel.com> wrote:
>
> > -----Original Message-----
> > From: openbmc [mailto:openbmc-
> > bounces+ed.tanous=3Dintel.com@lists.ozlabs.org] On Behalf Of Patrick
> > Venture
> > Sent: Tuesday, October 2, 2018 1:00 PM
> > To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > Subject: OEM i2c over IPMI
> >
> > We have a linux kernel driver for i2c-via-ipmi that ties into
> > https://gerrit.openbmc-project.xyz/12604 - I'm putting this upstream bu=
t
> > since it's an IPMI OEM handler, it can nicely go into its own repositor=
y - I was
> > curious if there was any OpenBMC interest?  If so, we can aim for the
> > phosphor namespace, otherwise I'll just ask that it be pushed into a go=
ogle
> > repo.
> >
>
> What does this command do that the existing master write-read command (se=
ction 22.11 of the IPMI spec) doesn't?
>
> I know on past systems we've offered the OEM I2C command to get around th=
e 8 channel limit for the stock command.  I can't tell if that's the case w=
ith this one, but we should probably have a statement on exactly what we're=
 trying to solve compared to the IPMI master write read.
>
> It should also be noted that master write-read opens up some pretty scary=
 security scenarios, especially when done over IPMI.  We should probably ma=
ke sure it's isolated to its own library so the high security systems can o=
pt out of it if need be.
>
> -Ed
