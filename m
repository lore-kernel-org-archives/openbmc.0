Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x22a.google.com (mail-ua0-x22a.google.com
 [IPv6:2607:f8b0:400c:c08::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssjvQ4J9hzDrL1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 12:58:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ZNKjSG/N; 
 dkim-atps=neutral
Received: by mail-ua0-x22a.google.com with SMTP id p102so78710507uap.0
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 18:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+hNs5JShR184N1KZH5vGJjAV1c+AjXwgrWtmhuXAxNg=;
 b=ZNKjSG/NFjeo1kgwJhgfVHIH1wE+JL/vYqnhnFLkT/r5Ki4mAyT2aHsnyv7GO4Cj01
 XATF2+WvOvVibjfxSd0m/z3mDzp1eI7Z3HqtlSdJnyqJxaHMhWPTJhLJQVEzvauusG7Q
 ugPqHDDPc06IXiqNZwraJhamu7bkca+XbsOjJRMUHrvAFm3EN1qFyLEOmXEqcxEtg2fH
 CFY3VZLVP+Hxdnz9lev4ekkaIgaDy5zt/FYbHNs8govj/j+RxnqEcDZF/odBf4WQxB4b
 GT6dgO7zMlAwlHiFFViZ6bA4t8gUyT3DMcld4bEH/SYlBkzxNjcz6hp5bIFCSzwpep49
 wYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+hNs5JShR184N1KZH5vGJjAV1c+AjXwgrWtmhuXAxNg=;
 b=EOo3waMGGS7AzJVjX0P2vPv/v8VoAW+7ViCnqSVDyP/himsxcxJlueVVxl8Cmy+I9Y
 HPwvoEqg3Pf7dUT4TTp0PM2h4Ewhvmm/r7amz9VKCWkkKCIDXogrXe80w00GllAhGv2T
 C3GbrC8SrMPhZQQhntThcvfAH2KmFh5VquTGE/nJ024NFqlTghwrZeGd97mNHdP6Uz2c
 1KeY7xv0Urx8PHatMvxDH94rBkTJjSDDa6KT1Q0nCAMSED48TMh94eazY+3wn45VTQ5H
 bWUJN2dA3JfnTpKoOlBMnpwMtdxrwg6MCQs9eNpseNo3I18e2h3znk2uuUywAb47CFKO
 KmxA==
X-Gm-Message-State: AA6/9RnvfPZnk/GPSbVr90YAjegkPfTBEN5HrXs3WU2A8eRPldUNFfphj8OrORsgPa8aGxV/a4kvLsLHRBo/9w==
X-Received: by 10.159.38.133 with SMTP id 5mr9433084uay.31.1476064688212; Sun,
 09 Oct 2016 18:58:08 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 18:57:47 -0700 (PDT)
In-Reply-To: <20161007015152.GA17914@heinlein.lan>
References: <b659d152-5481-193e-ce1b-520d3de7d2ba@linux.vnet.ibm.com>
 <CACPK8XdPfy7jN6ejsN=w_4wejy2zxBpwb8M3+b0GoLaW=0cKMw@mail.gmail.com>
 <20161007015152.GA17914@heinlein.lan>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 12:57:47 +1100
X-Google-Sender-Auth: FDOlM7Pgxa_jqP_mXW9iErxLuAM
Message-ID: <CACPK8Xfwj82abqJS_j20WZFzwwPZke2y1FCHk3eoMTwJopxDpw@mail.gmail.com>
Subject: Re: I2C device driver names
To: Patrick Williams <patrick@stwcx.xyz>,
 Timothy Pearson <tpearson@raptorengineering.com>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 10 Oct 2016 01:58:11 -0000

On Fri, Oct 7, 2016 at 12:51 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
> On Fri, Oct 07, 2016 at 10:42:24AM +1100, Joel Stanley wrote:
>> > PMBus Power supplies:   ?
>> >
>> > MAX31785 fan controller:  max,max31785
>>
>> Doesn't appear to be an upstream driver. Please open a ticket.
>
> Timothy @ Raptor wrote a driver for this recently, didn't he?  Joel, I
> thought you were going to merge it in for the time being.  Timothy

Yeah. I did ask that he spit out the maintainers part of that patch
before we applied it.

Timothy, are you able to make that change?


> mentioned that there was some upstream work going on in that subsystem
> that was preventing it from be merged in the current state but that the
> subsystem owner was likely going to take it on.

Timothy, do you have any update on the rewrite?

Cheers,

Joel

>
> https://patchwork.ozlabs.org/patch/672045/
>
> --
> Patrick Williams
