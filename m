Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFZb872CPzDqR7
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 13:37:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=l/A5sypM; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id yl2so7362714pac.1
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 20:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wms5LFTG75ux2SWfZYyRcGWx9KXFB1u3b8nsD/Xw+bA=;
 b=l/A5sypMxHto4C3SAWOHbUwbzNOlJHlWy3RJ+7XXTur1W4YtX0naRYL79k5VdT+x39
 v+H80V6o3Ti/iq3mIegbPSIt6u0jMLoysaBpIvLSMTcRkO0fttsnkBfu9R136FhTwcj6
 jidy16ZQJ0yGc2gN7w7pVsE6SSvvmwIiMxCuUGLGidKKebFc5kOczqH3B0ihwBMM1TxU
 uS20rZxC7+QBZYYNzSf7RyRqNRPQTYCy/WGwcMo5Pb41IgW5387pVKha3F/VXOf/As8o
 //p+Zh+96Zw98tDAsFMKb+2kFj9gTx+Zx5edOcPf5vqStUS681mGLDLRfrZlSZhxOn2K
 MiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wms5LFTG75ux2SWfZYyRcGWx9KXFB1u3b8nsD/Xw+bA=;
 b=NWE5gMzRGFTJ+AKS9Lgid9YFDtxKhnnTVA+EkMyEyXQtqCDJmjAFiHdFpyre0NwUZG
 RI1abL2dj+pkwM5+9Cyl6YVchAgfyo3a4wVugOUE8a60TSQVhqP/0w4J2gOd+drB4Jac
 abv5BDPVN3Je/WirpeM49Hh1DHzKNLKwAullhOh9NdwqQxjxzWL/qzoyA1VAUzVENJbd
 Jwi0AtSn+7rUZ/c0J9b6/KeZXifdy/VjsO2Q33n5mir4H6lkaZA3XJ22e5sMjFVcbGxx
 omIF2UE3w9386AF3yRYopeKFWDCVgk13yIFaMeEvlJYnhiIhIB02yJ9W95Voc+3nfqAP
 U8wA==
X-Gm-Message-State: ALyK8tIhtE4L7vOHPaVdvm5ruiI6WjCBNKPLK/XyGDXzVvXWaYfDo4kKzTWJw92fZ7qxKg==
X-Received: by 10.66.228.201 with SMTP id sk9mr10878329pac.5.1464233842934;
 Wed, 25 May 2016 20:37:22 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id xn3sm16005387pab.32.2016.05.25.20.37.20
 (version=TLSv1/SSLv3 cipher=OTHER);
 Wed, 25 May 2016 20:37:22 -0700 (PDT)
Date: Thu, 26 May 2016 13:37:14 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: Nan Li <bjlinan@cn.ibm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openpower-host-ipmi-oem v2] Fix endianness issue5
Message-ID: <20160526133714.7dcb60cf@camb691>
In-Reply-To: <57465E9E.2000502@ozlabs.org>
References: <20160526020044.1213-1-openbmc-patches@stwcx.xyz>
 <20160526020044.1213-2-openbmc-patches@stwcx.xyz>
 <57465E9E.2000502@ozlabs.org>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 26 May 2016 03:37:26 -0000

On Thu, 26 May 2016 10:25:34 +0800
Jeremy Kerr <jk@ozlabs.org> wrote:

> Hi Nan,
> 

Hi Nan,

I responded to v1 of your patch. You have sent exactly the same code as v2. 

One of two things has happened:
One you accidentally triggered github to send a v2 (which admittedly is easy to
do), please try to be more careful in future, this creates a lot of pointless
noise on the list and leads to double reviews, Jeremy has made the same point
I previously have.
Two you're ignoring reviews to your patches and sending subsequent versions...
why do you do this?

> You seem to have a minor typo in the commit title there.
> 
> > -	// TODO: Issue 5: This is not endian-safe.
> > -	short *recid  =  (short*) &reqptr->selrecordls;
> > -	short *offset =  (short*) &reqptr->offsetls;
> > +
> > +	unsigned short recid  =  ((unsigned short) reqptr->selrecordms) << 8 + reqptr->selrecordls;
> > +	unsigned short offset =  ((unsigned short) reqptr->offsetms) << 8 + reqptr->offsetls;  
> 
> That won't do the endian conversion correctly. Can you use one of the
> existing endian conversion functions?
> 
> The le16toh() function is probably what you want here, from endian.h.
> 
> Also, be careful of the change from 'short' to 'unsigned short'.
> 
> Regards,
> 
> 
> Jeremy
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
