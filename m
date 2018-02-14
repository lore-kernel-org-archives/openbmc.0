Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22f; helo=mail-vk0-x22f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ZCBphlbx"; 
 dkim-atps=neutral
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com
 [IPv6:2607:f8b0:400c:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhShT5gcdzF1F6
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 05:33:12 +1100 (AEDT)
Received: by mail-vk0-x22f.google.com with SMTP id g186so13458205vkd.8
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 10:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=AfCNg4hMYjghXKRcBZzBBeYYBjV5cH2EufrQbkzgtXc=;
 b=ZCBphlbxr1dhlXMoOigDQmaqDOcwo9IZ7ONsJkpg4AezvvHaV0WAFskLSprAo6H/94
 p4z6LGivylqOs2s4aTEuMpqXTH2q40MoCLxVHu95OrLcEIGr90Qq5447lZ/k8yi/xWOT
 jZs7qy54STj2VmLJTPp3KkVCGKNvVNab5HgBDDG/HkV0q+8EFoAv40rvHn9gJbYU2D3E
 s0ChHA5sXOhYhxzKGaSuF/QXQe0qaUXKuHaSL7g6u1xw9k8914YG/RS2ez0ICtnW+Z2F
 T1usX3W1UKrW3cvBIKzEps9N/GcBBBGl6khPD55WTt4D34VB2Iz+1S+hu2oYkEd6uXyc
 3pCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=AfCNg4hMYjghXKRcBZzBBeYYBjV5cH2EufrQbkzgtXc=;
 b=db63NSCQpQZ3/MkB6/cIoi29Nq2mjwuSXgbRjWdVf4VZUVlhrJl3HhH37EfsNlAfcL
 5piTeVEc+3tnTNBwbBJ4cS1MvVGpjif/hoeBD1f2nVA5TcXN9asoxkcbICqDK+as8S0s
 UTqcOt065pfd9re2uaKfntB389wlkMh770+zBa9eeUhp2x5eI1fmfutf55Sb4YIXalxi
 b0LIBiRkxt7rXAHNfmWMP9kz30eWjmfH/i7hC8W3B9UNAAA4bK8YuQrcJ4YvRfx+4YdT
 ZHN6wr2TpRP2iWY3k1WXyhXA7h5yLhUw+bp61CrABNle3hM+NbLEpA/Fv8tq+V4LmUQZ
 nuPA==
X-Gm-Message-State: APf1xPDzOCTunzzx8pFQZ24mGXKqRLGkJJEgI5aX/zzlQzGjl/FCFqcg
 38fO1giiefVeCsceJTRtBIvtDRgXBXRt+MomgGlza7zO
X-Google-Smtp-Source: AH8x224ttq+EV1/EUsxe0Fy54ZTp8Vh2ZCQJvdk6ZOw/yunOT1m++vSuMXQCIvLWOeL4tXOIxi0jMk4Wj8/h01jjRE0=
X-Received: by 10.31.108.147 with SMTP id j19mr158171vki.146.1518633189812;
 Wed, 14 Feb 2018 10:33:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.167.207 with HTTP; Wed, 14 Feb 2018 10:32:49 -0800 (PST)
In-Reply-To: <6de6bf00-ea77-a061-cd92-df255b2c0a7f@linux.intel.com>
References: <6de6bf00-ea77-a061-cd92-df255b2c0a7f@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 14 Feb 2018 10:32:49 -0800
Message-ID: <CAO=notyuHzYmwxDre9-kTgPeYNSSrut32wJeRo46VWzrW6Q=xQ@mail.gmail.com>
Subject: Re: IPMI Set LAN Configuration Parameters
To: Dave Cobbley <david.j.cobbley@linux.intel.com>
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
X-List-Received-Date: Wed, 14 Feb 2018 18:33:14 -0000

I personally have found this non-standard implementation a bit
unpleasant, as it requires using a different command to basically
flush it.  I am planning to implement it such that setting in progress
before and complete after is how it all gets flushed instead of a
timeout, since that approach reads more correct given the
specification.  And really it's just about literally calling a
subroutine to flush everything when the in_progress bit is set to
completed, and removing the code from "access on"

If you're interested to do what I've just described, I don't think
you'll get any push-back.

Patrick

On Wed, Feb 14, 2018 at 9:14 AM, Dave Cobbley
<david.j.cobbley@linux.intel.com> wrote:
> I noticed that when using ipmitool lan set <channel> <parameter>, the
> openbmc stack does not apply the settings. This seems like a non-standard
> implementation. While using ipmitool as the standard is not quite correct,
> customers do expect it to work.
>
> After sending any sort of lan set command with ipmitool, the changes don't
> appear to stick and this message shows up in the journal:
>     "Use Set Channel Access command to apply"
>
> I know IPMI 2.0 is a little ambiguous about implementation specifics, but I
> believe the intention was to utilize the "Set In Progress" bit (Parameter 0)
> while doing work, and use "Set Complete" when you are finished to flush the
> changes.
>
> To work around ipmitool constantly setting and unsetting the "Set In
> Progress" bit in between every parameter applied, some BMC stacks accumulate
> network changes over a period of time and apply after a timeout - this is
> also compatible with ipmitool's non-standard use of the "Set In Progress"
> bit.
>
>
> Is there a plan to circle back and change this functionality to work with
> ipmitool in the future?
>
> Thanks,
> -Dave Cobbley
>
