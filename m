Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="IINbLWq5"; 
 dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42X16V6xlmzF3LT
 for <openbmc@lists.ozlabs.org>; Sat, 13 Oct 2018 08:23:46 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id n31-v6so6397374pgm.7
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 14:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PEgD9QSA5YQgaXhrNXZo9UaOWXli6UT8xzKszUQRyoQ=;
 b=IINbLWq5ksjHFlPln6HsAj37+IeNAxTqVKvcsnqPEzRrp4C0PBmjvFNbyXYeoJfKvW
 WEvN3fXwSE6yPbfO6sYk260M/DWTXSjHjQ2TjIo+u+k1Odes1oYNTB1SqSMFT1KlJdNz
 k9iEU79mw8luUPaSgTDD7nYEYKO5r7mkMRZGdEga6uHLaAC2hxypQyIeXxODo/h1urtP
 ldIsDPJl8qH7GreH6sW52K8rn+G00xC4W+DVkXYmlGqUdKumhhWyUzMTQ8WlpIKQRVuU
 CCe8cMqrkRTG3oZgF1Cyuf1km1WG7tI3I/Bk9wyQZGi8xT3An+CFVGQOFFWqtzgkWDcv
 8rZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PEgD9QSA5YQgaXhrNXZo9UaOWXli6UT8xzKszUQRyoQ=;
 b=FB/Sru0mPE9dpuJpA/4AaHRCxxRC+eNSJ1koszWHV85xDh4+qBkfxObBSeJ1TmZo8G
 qtKioa2kB9m0ffTzZMfHd+rfF/1xybJ6Pzn1pZiYCT+JZ1tEZs08pVnS3RryfT2eR4ar
 O7RTzjH8pifYDeo2bUrGSjY7iDhTVWT/2r6TJ5N1subq8KPOeKspCMNXWgy7Sl7eC2fO
 FoIjeqqwOaBe9vrotAqUtQA7YPrPL9LisdYk46AlMEbOuJ4I2TuPhgAq4zz90iK67blg
 iMWD3JX3hzsCfnWND5RelV27d5InCLyZYBc0fjVx6zhDY9OQrmQwucOkXTN4fT/EL1zj
 83CQ==
X-Gm-Message-State: ABuFfohu53ava+4Mst2uHRknAFSEcGS7BhacvYzs2VmMRPnxG6fira58
 1EgvOJZyEh3ozCqwvru3CaDLtSFDTfVxuabD10Krk0vY
X-Google-Smtp-Source: ACcGV616e/Fr/rvsgpbaljLrJ+OgKtbnu7HtnQDJIO1k/5rYVae1fI0VA2O4mjdYeQSJuR9B7zul5HYGDaqZjPIFlw0=
X-Received: by 2002:a63:9507:: with SMTP id
 p7-v6mr6993371pgd.449.1539379424124; 
 Fri, 12 Oct 2018 14:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz_KizBdONsKjtQ6U05r4hWQOuxa_cx9Cshps7V8=PRbw@mail.gmail.com>
 <3fc8bbb4-2db9-6df0-4fc3-1addf4b94ac3@linux.intel.com>
In-Reply-To: <3fc8bbb4-2db9-6df0-4fc3-1addf4b94ac3@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 12 Oct 2018 14:23:32 -0700
Message-ID: <CAO=notwOiB-v5LxZ=OagkGTzhM8dnt5kogO=eaTGEKGp7si14Q@mail.gmail.com>
Subject: Re: Notion of Flakiness in Sensor Readings
To: James Feist <james.feist@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 12 Oct 2018 21:23:48 -0000

On Fri, Oct 12, 2018 at 2:09 PM James Feist <james.feist@linux.intel.com> wrote:
>
> On 10/12/2018 01:53 PM, Patrick Venture wrote:
> > Currently, there are a few approaches in phosphor-hwmon on how to
> > handle sensors being present sometimes, or flaky on reads.  We've
> > talked in the past about how to handle a read failure that should be
> > ignored.  A real failure that is flaky or temporary.
> >
> > I was thinking of just adding a property to the Sensor.Value interface
> > to report information.  Basically, someone reading the value needs to
> > know if it's valid.  The idea of a range check for validity doesn't
> > work as cleanly for this specific purpose, in my opinion.  The min/max
> > can be used cleanly to determine the linearization though!
> >
> > I was thinking perhaps a boolean, that you can check to see if the
> > value should be used or trusted.  Then, I thought, perhaps, a enum
> > with a series of states, starting with the states of "Valid',
> > "Invalid."  Not being able to think of a third state, I fell back onto
> > a boolean.
>
> For Valid / Invalid we've produced nan on D-Bus to know that the sensor
> is in an invalid state (like power off for tach values). Although I'm
> not sure how this would be produced using the int64 interface, for the
> double std::nan will go over d-bus correctly.

So if i just wait until we're using double, the issue basically
resolves itself? :D :D

>
> >
> > Thoughts?
> >
> > Patrick
> >
