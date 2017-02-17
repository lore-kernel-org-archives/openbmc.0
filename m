Return-Path: <cyrilbur@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPcvT6d4mzDqBW
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 13:50:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aDcEhe4I"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id y6so2466017pgy.2
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 18:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jp7PsGnvRXXFIESKutsWnvtso+M9gweGbKpZvYdfk74=;
 b=aDcEhe4IHuVY2VLu69zQmQdBvj+pdzYofJOAtEu/cLI2kgeCgm8vqAIt+0IFD7lZUQ
 e4C+TlQju/nIG8O8voEmh5uhZtOKftnDTJGyCXKe0jcb/Wn/mx+VwMC4h+V6bZp5NG6q
 N9VT0OhlvRZoUhQYszsnKjrygCZK9gYZN5jLjKS5Olw9s30MJuG1XQMCQagiBnJHH4nf
 A3p1c0hpy4o2OZrgttsoDZPcyyZu7EY45SLlbeCxjbnwaFzoZqSrBPBxbapuaTVuE8np
 KrQe1oiiR3nwt1MuVG1fDFFUqdfx3ErEjNZ01iErWZsizE9u1O8UWRbVx0iosHDoAwM3
 h1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jp7PsGnvRXXFIESKutsWnvtso+M9gweGbKpZvYdfk74=;
 b=Lgtaibim1lgueXvG4en4/jzp5yTWdwaCIZHjqgtpzvchhRioeZf9yogSlhhHn3eb/Y
 HJ2VtdkRmFx35yQ0+aM3kHMAyIhDLJq3UnT4nVRge0F/qpwiFnCv1bRGvM9c3iTVcimj
 OA9p+el1nHSY3aQe8dsdpizQN6hzu/R3oRut1L7xR0/TruZx/PoFtAva0/tOWTOZRFzp
 eA5wVYQZbCMjO88Ax1pICJnPiEXlC3SYxpTYtMJi7ijZSri6WsSgybNudOOD8i5qVGF0
 G5yYl8KCfJRk7zcINNFxUoO6Uadd9BxbKtuGKJsvJ5qfd4+UYZ3LO5UF7Y0DLfJXbX5/
 3E4g==
X-Gm-Message-State: AMke39nqAyh7Bd1Bh69Uasf76A+AgkoF9afXAQUjjevNfcLkUtb4cnkAkCJkX3ARoHBCpQ==
X-Received: by 10.99.131.74 with SMTP id h71mr2004579pge.226.1487299812294;
 Thu, 16 Feb 2017 18:50:12 -0800 (PST)
Received: from camb691.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id u82sm15975339pfd.7.2017.02.16.18.50.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 Feb 2017 18:50:11 -0800 (PST)
Message-ID: <1487299721.16373.2.camel@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Update reserved memory nodes for
 zaius and witherspoon
From: Cyril Bur <cyrilbur@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Date: Fri, 17 Feb 2017 13:48:41 +1100
In-Reply-To: <20170216140524.GA5077@heinlein.lan>
References: <20170216054922.19722-1-cyrilbur@gmail.com>
 <20170216140524.GA5077@heinlein.lan>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.5 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 17 Feb 2017 02:50:14 -0000

On Thu, 2017-02-16 at 08:05 -0600, Patrick Williams wrote:
> On Thu, Feb 16, 2017 at 04:49:22PM +1100, Cyril Bur wrote:
> > -		flash_memory: region@94000000 {
> > +		flash_memory: region@98000000 {
> >  			no-map;
> > -			reg = <0x94000000 0x04000000>; /* 64M */
> > +			reg = <0x98000000 0x04000000>; /* 64M */
> > +		};
> > +
> > +		vga_memory: framebuffer@9c000000 {
> > +			no-map;
> > +			reg = <0x9c000000 0x04000000>; /* 64MB */
> 
> Do we really have to allocate 64MB to a VGA framebuffer?  We can store a
> 4K resolution monitor with 32bit color in 32MB, so why is it required to
> reserve this much memory?  Between this and the PNOR memory region, now
> 1/4th of the BMCs memory is reserved.

The reservation of 64MB is because the hardware is capable of using
64MB, therefore the host can use that region of memory. We're playing
it safe here by ensuring the BMC doesn't use any of it to avoid any
possibility of the host corrupting BMC memory. This is the most generic
dts for the platform so we've gone with stability over performance.


Cyril

> 
