Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbN0P4f1vzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 12:42:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=RpgRy7vo; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id j2so18957876qkf.1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 19:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Sw/UHbF55itIjyt6AQRRg43uBO8i6Evu8/nVpvJuOXo=;
 b=RpgRy7voFP3toCLSNsG2Be7UPPsbiRH6P9PZGE7c+DPLTEfyijwId/KYJ8l2Ak5TZI
 BXjWtTcIvvb8kCEy6Hz9Bx7a5ck9YZTlGAM3bB1dUThjjab5IyCUwNvTmZ6tu/TNXNN2
 K46VcfdqNOWSpWjUCCM5tiVBmXomlbfUuhRL4OFKVlazsrwmg6hBh8YFHlVxRsYHZCEP
 ybX1EFVSCfGpvE7EVOBlQkHtlqdmKRDQ/054O5iyrpKPe5PswdBAP1968/SHu0XGlQqD
 tO8aUucb1OnU19LUpZU3OVcA72ZEc7sqUYgbuOM/pZUU0n2ndlmX1o2FG8/NTU+lP+02
 jQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Sw/UHbF55itIjyt6AQRRg43uBO8i6Evu8/nVpvJuOXo=;
 b=GddGNhJT+TRvvDsHtqkBBCxwIAxBAXM9UmXIYO2GEca++axr17U3xSQykvwy/iJBwz
 yv8cZcmtexOIAbz3LK8PbbajKniQYdt3o3x2xlfq/7KWc4iCotNs4boR0xvX0hUgkbfi
 9IvUHMnQltZaBrvA9p1hDpQ6UmClWhc85aPjOQZNdm+FIeoE6k+7WSJA3M/Zqh3/fYZA
 KBtsW4aUFRKueE2Si5mRJwO5alFOBlN90GJEO3ubS4vxrIcGJImbiPZ1DuXcNlVrClQr
 BsxRjGZXDSguOdLYdYjxKE1+y2bFSqXlSLNgVRlLiL1t/l6owakjjM6anBDfgsRzqTKb
 oJwg==
X-Gm-Message-State: ALyK8tKjsfcNZX2rTZrOVM+lkwczS4cUdVLcbIwU1awy0VQckN0RBdWbny3HPlw+C24l0xtC1++O0CMffoXu4A==
X-Received: by 10.200.39.237 with SMTP id x42mr1894137qtx.75.1466736147808;
 Thu, 23 Jun 2016 19:42:27 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 23 Jun 2016 19:42:08 -0700 (PDT)
In-Reply-To: <CACPK8XfYmEOtb+PxiHi4VuH72hkNDRZheUO8BWRvC1N4-GNyQw@mail.gmail.com>
References: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
 <20160623204033.13165-10-openbmc-patches@stwcx.xyz>
 <CACPK8XfYmEOtb+PxiHi4VuH72hkNDRZheUO8BWRvC1N4-GNyQw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jun 2016 12:12:08 +0930
X-Google-Sender-Auth: rUR0WfICrjGWCH4ySiO66OFd8RY
Message-ID: <CACPK8XcRpMrryPuoRkPqFS-bXq13WFfFYi48+qo+2i1kKfn=Rg@mail.gmail.com>
Subject: Re: [PATCH openbmc v5 09/11] u-boot-fw-utils: Update to latest
 version.
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jun 2016 02:42:30 -0000

On Fri, Jun 24, 2016 at 12:10 PM, Joel Stanley <joel@jms.id.au> wrote:
>> diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
>> index bfbdcf6..a514cf2 100644
>> --- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
>> +++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
>
> Can we delete this recipe now we're using 2016.05?

Yes, you delete the file in the final commit. Perhaps you can drop
this commit from the series then?
